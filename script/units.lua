---@alias UnitCode number
---@shape CountUnit
    ---@field caption LocalisedString
    ---@field tooltip LocalisedString
    ---@field item boolean|nil
    ---@field fluid boolean|nil
    ---@field float boolean|nil
    ---@field calc fun (count: number, name: string): number
    ---@field toString fun (count: number): LocalisedString

---@shape CountWithUnits
    ---@field count number
    ---@field unit UnitCode

---@type table<UnitCode, CountUnit>
local countUnits0

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
    while maxCycles >= 0 do
        maxCycles = maxCycles - 1
        local k, v = next(units, currentCode)
        if k and (--[[---@type table]]v)[type] then
            return k
        end
        currentCode = k
    end
    return nil
end

---@param type string
---@param current CountWithUnits @nullable
---@return CountWithUnits
---@overload fun (type: string): CountWithUnits
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

---@param countWithUnits CountWithUnits @nullable
---@param name string
---@return number @nullable
function unitCalc(countWithUnits, name)
    return countWithUnits and getCountUnits()[countWithUnits.unit].calc(countWithUnits.count, name)
end

---@field type string
---@return UnitCode
function getWagonUnitCode(type)
    -- may be need to check exists
    if type == "fluid" then
        return 200
    else
        return 100
    end
end

---@param any any
---@param normalize boolean
---@return CountWithUnits @nullable
---@overload fun(any: any): CountWithUnits
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
    local count = cwu.count
    local unit = getCountUnits()[cwu.unit]
    if unit.float then
        count = math.floor(count * 100) / 100
    else
        count = math.floor(count)
    end
    return { "", util.format_number(cwu.count, false), " ", unit.caption }
end

---@return table<UnitCode, CountUnit>
function getCountUnits()
    if countUnits0 == nil then
        countUnits0 = {}

        countUnits0[1] = {
            caption = { "yatm-units.x1" },
            tooltip = { "yatm-units.x1-tt" },
            item = true,
            fluid = true,
            calc = function(count)
                return count
            end,
            toString = function(count)
                count = math.floor(count)
                return util.format_number(count, true)
            end
        }

        --- Cargo

        countUnits0[10] = {
            caption = { "yatm-units.x-stack" },
            tooltip = { "yatm-units.x-stack-tt" },
            item = true,
            calc = function(count, name)
                return count * game.item_prototypes[name].stack_size
            end,
            toString = function(count)
                count = math.floor(count)
                return { "yatm-units.x-stack-str", util.format_number(count, true) }
            end
        }

        if game.entity_prototypes["cargo-wagon"] and game.entity_prototypes["cargo-wagon"].type == "cargo-wagon" then
            local wagonStackCount = game.entity_prototypes["cargo-wagon"].get_inventory_size(defines.inventory.cargo_wagon)
            countUnits0[100] = {
                caption = { "yatm-units.x-cargo-wagon", "cargo-wagon" },
                tooltip = { "yatm-units.x-cargo-wagon-tt" },
                item = true,
                float = true,
                calc = function(count, name)
                    return math.floor(count * wagonStackCount * game.item_prototypes[name].stack_size)
                end,
                toString = function(count)
                    count = math.floor(count * 100) / 100
                    return { "yatm-units.x-cargo-wagon-str", util.format_number(count, true) }
                end
            }
        else
            for _, proto in pairs(game.entity_prototypes) do
                if proto.type == "cargo-wagon" then
                    local wagonStackCount = proto.get_inventory_size(defines.inventory.cargo_wagon)
                    countUnits0[100] = {
                        caption = { "yatm-units.x-cargo-wagon", proto.name },
                        tooltip = { "yatm-units.x-cargo-wagon-tt" },
                        item = true,
                        float = true,
                        calc = function(count, name)
                            return math.floor(count * wagonStackCount * game.item_prototypes[name].stack_size)
                        end,
                        toString = function(count)
                            count = math.floor(count * 100) / 100
                            return { "yatm-units.x-cargo-wagon-str", util.format_number(count, true) }
                        end
                    }
                    break
                end
            end
        end

        --- Fluid

        if game.entity_prototypes["fluid-wagon"] and game.entity_prototypes["fluid-wagon"].type == "fluid-wagon" then
            local wagonCapacity = game.entity_prototypes["fluid-wagon"].fluid_capacity
            countUnits0[200] = {
                caption = { "yatm-units.x-fluid-wagon", "fluid-wagon" },
                tooltip = { "yatm-units.x-fluid-wagon-tt" },
                fluid = true,
                float = true,
                calc = function(count, name)
                    return math.floor(count * wagonCapacity)
                end,
                toString = function(count)
                    count = math.floor(count * 100) / 100
                    return { "yatm-units.x-fluid-wagon-str", util.format_number(count, true) }
                end
            }
        else
            for _, proto in pairs(game.entity_prototypes) do
                if proto.type == "fluid-wagon" then
                    local wagonCapacity = proto.fluid_capacity
                    countUnits0[200] = {
                        caption = { "yatm-units.x-fluid-wagon", proto.name },
                        tooltip = { "yatm-units.x-fluid-wagon-tt" },
                        fluid = true,
                        float = true,
                        calc = function(count, name)
                            return math.floor(count * wagonCapacity)
                        end,
                        toString = function(count)
                            count = math.floor(count * 100) / 100
                            return { "yatm-units.x-fluid-wagon-str", util.format_number(count, true) }
                        end
                    }
                    break
                end
            end
        end
    end

    return countUnits0
end

---@param countWithUnits CountWithUnits
---@return CountWithUnits
function copyCountWithUnits(countWithUnits)
    return {
        count = countWithUnits and countWithUnits.count or nil,
        unit = countWithUnits and countWithUnits.unit or nil,
    }
end
