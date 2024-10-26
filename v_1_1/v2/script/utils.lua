function sqr(x)
    return x * x
end

function var_dump(var)
    if type(var) == "table" then
        local sb = { "{" }
        for k, v in pairs(var) do
            if #sb > 1 then
                sb[#sb + 1] = ", "
            end
            sb[#sb + 1] = var_dump(k)
            sb[#sb + 1] = ": "
            sb[#sb + 1] = var_dump(v)
        end
        sb[#sb + 1] = "}"
        return table.concat(sb)
    elseif type(var) == "string" then
        return '"' .. tostring(var) .. '"'
    else
        return tostring(var)
    end
end

---@overload fun(var: Any): string
function var_dump_light(var, level)
    level = level or 3
    if type(var) == "table" then
        if level >= 1 then
            local sb = { "{" }
            local meta = getmetatable(var)
            if meta then
                sb[#sb + 1] = "_meta_: "
                sb[#sb + 1] = var_dump_light(meta, level - 1)
            end
            for k, v in pairs(var) do
                if #sb > 1 then
                    sb[#sb + 1] = ", "
                end
                sb[#sb + 1] = var_dump_light(k, level - 1)
                if level >= 2 then
                    sb[#sb + 1] = ": "
                    sb[#sb + 1] = var_dump_light(v, level - 1)
                end
            end
            sb[#sb + 1] = "}"
            return table.concat(sb)
        else
            return "{?}"
        end
    elseif type(var) == "string" then
        return '"' .. tostring(var) .. '"'
    else
        return tostring(var)
    end
end

---@param msg LocalisedString
---@param force LuaForce
function alert(msg, force)
    if force then
        force.print({ "", "RLD Alert: ", msg })
    else
        game.print({ "", "RLD Alert: ", msg })
    end
end

---@type table<string, table>
local classes = {}

---@param classShortName string
---@return table
function createClass(classShortName)
    local class = {}
    class._meta_ = { __index = class, name = classShortName }
    if classes[classShortName] then
        error("Class " .. var_dump(classShortName) .. " already registered")
    end
    classes[classShortName] = class
    return class
end

---@overload fun(class)
function instanceClass(class, data)
    if not class._meta_ then
        class._meta_ = { __index = class }
    end
    data = data or {}
    setmetatable(data, class._meta_)
    data._cls_ = class._meta_.name
    return data
end

function restoreClass(data)
    if data and (data._cls_) and not data._meta_ then
        local class = classes[data._cls_]
        if not class then
            error("There is no class "..var_dump(data._cls_))
        end
        setmetatable(data, class._meta_)
        if data.restoreClass then
            data:restoreClass()
        end
    end
    return data
end

---@param str string
---@param def number @nullable
---@return number @nullable
---@overload fun (str: string): number @nullable
function toNotNegNumber(str, def)
    local num = tonumber(str) or def
    if num then
        if num < 0 then
            num = 0
        end
    end
    return num
end

---@param str string
---@param def number @nullable
---@return number @nullable
---@overload fun (str: string): number @nullable
function toPosNumber(str, def)
    local num = tonumber(str) or def
    if num then
        if num <= 0 then
            num = nil
        end
    end
    return num
end

---@type table<defines__direction, string>
directionNames = {
    [defines.direction.north] = "north",
    [defines.direction.south] = "south",
    [defines.direction.east] = "east",
    [defines.direction.west] = "west",
}

-----@type table<defines__train_state, string>
--trainStateNames = {
--    [defines.train_state.on_the_path] = "on_the_path",
--    [defines.train_state.path_lost] = "path_lost",
--    [defines.train_state.no_schedule] = "no_schedule",
--    [defines.train_state.no_path] = "no_path",
--    [defines.train_state.arrive_signal] = "arrive_signal",
--    [defines.train_state.wait_signal] = "wait_signal",
--    [defines.train_state.arrive_station] = "arrive_station",
--    [defines.train_state.wait_station] = "wait_station",
--    [defines.train_state.manual_control_stop] = "manual_control_stop",
--    [defines.train_state.manual_control] = "manual_control",
--    [defines.train_state.destination_full] = "destination_full",
--}

---@param inserter LuaEntity
---@param restore boolean | nil
---@overload fun(inserter: LuaEntity)
function swapInserter(inserter, restore)
    local swap = inserter.pickup_position
    inserter.pickup_position = inserter.drop_position
    inserter.drop_position = swap
    inserter.direction = inserter.direction
end

---@param from _MapPosition1
---@param to _MapPosition1
---@return number
function distance(from, to)
    return math.sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y))
end

---@param from _MapPosition1
---@param to _MapPosition1
---@return number
function comparableDistance(from, to)
    return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
end

---@alias TypeAndName string @ type .. "=" .. name

---@param type string
---@param name string
---@overload fun(table: { type: string, name: string}): TypeAndName
---@return TypeAndName
function toTypeAndName(type, name)
    return name and (type .. '=' .. name) or (type.type .. '=' .. type.name)
end

---@param typeAndName TypeAndName
---@return string, string
function fromTypeAndName(typeAndName)
    if string.byte(typeAndName) == 105 then
        return "item", string.sub(typeAndName, 6)
    else
        return "fluid", string.sub(typeAndName, 7)
    end
end

---@param typeAndName TypeAndName
---@return SignalID
function typeAndNameToSignal(typeAndName)
    if string.byte(typeAndName) == 105 --[[ i ]] then
        return { type = "item", name = string.sub(typeAndName, 6) }
    else
        return { type = "fluid", name = string.sub(typeAndName, 7) }
    end
end

---@param typeAndName TypeAndName
---@return LuaItemPrototype|LuaFluidPrototype
function fromTypeAndNameToProto(typeAndName)
    if string.byte(typeAndName) == 105 then
        return game.item_prototypes[string.sub(typeAndName, 6)]
    else
        return game.item_prototypes[string.sub(typeAndName, 7)]
    end
end

---@param typeAndNameOrJustType TypeAndName
---@return boolean
function typeAndNameIsItem(typeAndNameOrJustType)
    return string.byte(typeAndNameOrJustType) == 105 -- i
end

---@param param ConstantCombinatorParameters
---@param signal SignalID
---@overload fun(param: ConstantCombinatorParameters): boolean
---@return boolean
function isValidParam(param, signal)
    return not (
            not param or not param.signal or not param.signal.name or not param.signal.type
                    or signal and signal.type ~= param.signal.type
                    or signal and signal.name ~= param.signal.name
    )
end

function packD(d)
    local neg = d < 0
    d = math.abs(d)
    local m, e = math.frexp(d)
    if m < 0.1 then
        return 0, 0
    end
    m = m * 2 - 1
    m = math.ldexp(m, 52)
    local m1 = math.fmod(m, 4294967296)
    local m2 = (m - m1) / 4294967296
    m1 = m1 - 2147483648
    m2 = (m2 * 2048 + (e + 1022)) * 2 + (neg and 1 or 0) - 2147483648
    -- [[DEBUG]]log("PACK " .. tostring(d) .. " -> " .. tostring(m1) .. " " .. tostring(m2))
    return m1, m2
end

function unpackD(m1, m2)
    local m1o, m2o = m1, m2
    if m1 == 0 and m2 == 0 then
        return 0
    end
    m2 = m2 + 2147483648
    local neg = math.fmod(m2, 2)
    m2 = (m2 - neg) / 2
    local e = math.fmod(m2, 2048)
    m2 = (m2 - e) / 2048
    e = e - 1022
    local m, e52 = math.frexp(m2 * 4294967296 + m1 + 2147483648)
    while e52 < 52 do
        e52 = e52 + 1
        m = m / 2
    end
    m = (m + 1) / 2
    -- [[DEBUG]]log("UNPACK " .. tostring(m1o) .. " " .. tostring(m2o) .. " -> " .. tostring(neg == 0 and math.ldexp(m, e) or -math.ldexp(m, e)))
    return neg == 0 and math.ldexp(m, e) or -math.ldexp(m, e)
end

function isInt32(i)
    if i < -2147483648 or i > 2147483647 then
        return false
    end
    local _, b = math.modf(i)
    if math.abs(b) > 0.00000000000000000001 then
        return false
    end
    return true
end

function toInt32Range(i)
    if i then
        if i < -2147483648 then
            i = -2147483648
        elseif i > 2147483647 then
            i = 2147483647
        end
    end
    return i
end


