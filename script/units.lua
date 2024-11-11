

---@alias UnitCode number
---@alias UnitCombinatorCode ">" | "<" | "=" | "≥" | "≤" | "≠"

---@class CountUnit
---@field caption LocalisedString
---@field tooltip LocalisedString
---@field float boolean|nil
---@field calc fun (count: number, name: string): number
---@field reverseCalc fun (count: number, name: string): number
---@field toString fun (count: number): LocalisedString
---@field combinatorCode  UnitCombinatorCode

---@class CountWithUnits
    ---@field count number
    ---@field unit UnitCode

---@type table<UnitCode, CountUnit>
local countUnits0
local ITEM_INDEX_FROM = 10
local FLUID_INDEX_FROM = 20

---@type UnitCode
defaultUnit = 1

---@param type string
---@param currentCode UnitCode @nullable
---@return UnitCode @nullable
---@overload fun (type: string): UnitCode
function nextUnit(type, currentCode)
    if not currentCode then
        return defaultUnit
    end
    local units = getCountUnits()
    local maxCycles = table_size(units)
    local isItem = type == "item"
    local isFluid = type == "fluid"
    while maxCycles >= 0 do
        maxCycles = maxCycles - 1
        local k, _ = next(units, currentCode)
        if k and (k < ITEM_INDEX_FROM or (isItem and k >= ITEM_INDEX_FROM and k < FLUID_INDEX_FROM) or (isFluid and k >= FLUID_INDEX_FROM)) then
            return k
        end
        currentCode = k
    end
    return nil
end

---@param type string
---@param current CountWithUnits|nil
---@return CountWithUnits
function nextUnit2(type, current)
    if not current or not current.unit then
        return {
            count = nil,
            unit = nextUnit(type, defaultUnit)
        }
    end
    current.unit = nextUnit(type, current.unit)
    return current
end

---@param current CountWithUnits @nullable
---@param newCount number
---@return CountWithUnits
function setCount(current, newCount)
    local unit = current and current.unit
    current = validCountWithUnits(current)
    if not current then
        if unit and not getCountUnits()[unit] then
            unit = nil
        end
        return {
            count = newCount,
            unit = unit or defaultUnit
        }
    end
    current.count = newCount
    return current
end

---@param countWithUnits CountWithUnits|nil
---@param name string
---@return number|nil
function unitCalc(countWithUnits, name)
    return countWithUnits and getCountUnits()[countWithUnits.unit].calc(countWithUnits.count, name)
end

---@param any any
---@param normalize boolean|nil
---@return CountWithUnits|nil
function validCountWithUnits(any, normalize)
    if type(any) ~= "table"
            or type(any.count) ~= "number"
            or type(any.unit) ~= "number"
            or table_size(any) ~= 2
            or any.count < 0
            or not getCountUnits()[any.unit]
    then
        return nil
    end
    if normalize then
        local unit = getCountUnits()[any.unit]
        if unit.float then
            any.count = math.floor(any.count * 100) / 100
        else
            any.count = math.floor(any.count)
        end
        any.count = toInt32Range(any.count)
    end
    return any
end

---@param cwu CountWithUnits
---@return LocalisedString
function countWithUnitsToString(cwu)
    local unit = getCountUnits()[cwu.unit]
    return unit.toString(cwu.count)
end

---@param cwu CountWithUnits
---@return LocalisedString
function countWithUnitsToString2(cwu)
    if not cwu then
        return cwu
    end
    local count = cwu.count
    local unit = getCountUnits()[cwu.unit]
    if unit.float then
        count = math.floor(count * 100) / 100
    else
        count = math.floor(count)
    end
    return { "", formatNumber(cwu.count, false), " ", unit.caption }
end

---@return table<UnitCode, CountUnit>|nil
function getCountUnits()
    if countUnits0 == nil then
        local combinatorCodes = { ">", "<", "=", "≥", "≤", "≠" }

        countUnits0 = {}

        --- Common

        countUnits0[defaultUnit] = {
            caption = { "viirld-units.x1" },
            tooltip = { "viirld-units.x1-tt" },
            combinatorCode = combinatorCodes[1],
            calc = function(count)
                return count
            end,
            reverseCalc = function(count)
                return count
            end,
            toString = function(count)
                count = math.floor(count)
                return formatNumber(count, true)
            end
        }

        --- Cargo

        countUnits0[ITEM_INDEX_FROM] = {
            caption = { "viirld-units.x-stack" },
            tooltip = { "viirld-units.x-stack-tt" },
            float = true,
            combinatorCode = combinatorCodes[2],
            calc = function(count, name)
                return count * prototypes.item[name].stack_size
            end,
            reverseCalc = function(count, name)
                return count / prototypes.item[name].stack_size
            end,
            toString = function(count)
                count = math.floor(count)
                return { "viirld-units.x-stack-str", formatNumber(count, true) }
            end
        }

        -- todo add other wagons by settings
        if prototypes.entity["cargo-wagon"] and prototypes.entity["cargo-wagon"].type == "cargo-wagon" then
            local wagonStackCount = prototypes.entity["cargo-wagon"].get_inventory_size(defines.inventory.cargo_wagon)
            countUnits0[ITEM_INDEX_FROM + 1] = {
                caption = { "viirld-units.x-cargo-wagon", "cargo-wagon" },
                tooltip = { "viirld-units.x-cargo-wagon-tt", wagonStackCount },
                float = true,
                combinatorCode = combinatorCodes[3],
                calc = function(count, name)
                    return count * wagonStackCount * prototypes.item[name].stack_size
                end,
                reverseCalc = function(count, name)
                    return count / (wagonStackCount * prototypes.item[name].stack_size)
                end,
                toString = function(count)
                    count = math.floor(count * 100) / 100
                    return { "viirld-units.x-cargo-wagon-str", formatNumber(count, true) }
                end
            }
        end

        --- Fluid

        -- todo add other wagons by settings
        if prototypes.entity["fluid-wagon"] and prototypes.entity["fluid-wagon"].type == "fluid-wagon" then
            local wagonCapacity = prototypes.entity["fluid-wagon"].fluid_capacity
            countUnits0[FLUID_INDEX_FROM] = {
                caption = { "viirld-units.x-fluid-wagon", "fluid-wagon" },
                tooltip = { "viirld-units.x-fluid-wagon-tt", wagonCapacity },
                fluid = true,
                float = true,
                combinatorCode = combinatorCodes[2],
                calc = function(count, name)
                    return math.floor(count * wagonCapacity)
                end,
                reverseCalc = function(count, name)
                    return count / wagonCapacity
                end,
                toString = function(count)
                    count = math.floor(count * 100) / 100
                    return { "viirld-units.x-fluid-wagon-str", formatNumber(count, true) }
                end
            }
        end
    end
    return countUnits0
end

---@param countWithUnits CountWithUnits
---@return CountWithUnits
function copyCountWithUnits(countWithUnits)
    if not countWithUnits then
        return countWithUnits
    end
    return {
        count = countWithUnits.count or nil,
        unit = countWithUnits.unit or nil,
    }
end

---@param a CountWithUnits
---@param b CountWithUnits
---@return boolean
function equalCountWithUnits(a, b)
    return (not a and not b) or (a and b and a.count == b.count and a.unit == b.unit)
end

---@param unitCode UnitCode|nil
---@return UnitCombinatorCode
function getUnitsCombinatorCode(unitCode)
    if unitCode then
        local unit = getCountUnits()[unitCode]
        if unit then
            return unit.combinatorCode
        end
    end
    return ">"
end

---@param combinatorCode UnitCombinatorCode
---@param type "item"|"fluid"
---@return UnitCode|nil
function getUnitByCombinatorCode(combinatorCode, type)
    local units = getCountUnits()
    if type == "item" then
        for code, unit in pairs(units) do
            if code < FLUID_INDEX_FROM and unit.combinatorCode == combinatorCode then
                return code
            end
        end
    elseif type == "fluid" then
        for code, unit in pairs(units) do
            if (code < ITEM_INDEX_FROM or code >= FLUID_INDEX_FROM) and unit.combinatorCode == combinatorCode then
                return code
            end
        end
    end
    return nil
end


---@param count number
---@param type "item"|"fluid"
---@param name string
---@return LocalisedString
function getUnitReverseTooltip(count, type, name)
    local units = getCountUnits()
    local result = {""}
    if type == "item" then
        for code, unit in pairs(units) do
            if code < FLUID_INDEX_FROM then
                local cnt = math.floor(unit.reverseCalc(count, name) * 100) / 100
                result[#result + 1] = { "viirld-units.x-reverse-count-line", cnt, unit.caption }
                result[#result + 1] = "\n"
            end
        end
    elseif type == "fluid" then
        for code, unit in pairs(units) do
            if (code < ITEM_INDEX_FROM or code >= FLUID_INDEX_FROM) then
                local cnt = math.floor(unit.reverseCalc(count, name) * 100) / 100
                result[#result + 1] = { "viirld-units.x-reverse-count-line", cnt, unit.caption }
                result[#result + 1] = "\n"
            end
        end
    end
    if #result > 1 then
        result[#result] = nil
    end
    return result
end