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

---@overload fun(class)
function instanceClass(class, data)
    if not class._meta then
        class._meta = { __index = class }
    end
    data = data or {}
    setmetatable(data, class._meta)
    return data
end

function restoreClass(class, data)
    if not class._meta then
        class._meta = { __index = class }
    end
    setmetatable(data, class._meta)
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

---@type table<defines__train_state, string>
trainStateNames = {
    [defines.train_state.on_the_path] = "on_the_path",
    [defines.train_state.path_lost] = "path_lost",
    [defines.train_state.no_schedule] = "no_schedule",
    [defines.train_state.no_path] = "no_path",
    [defines.train_state.arrive_signal] = "arrive_signal",
    [defines.train_state.wait_signal] = "wait_signal",
    [defines.train_state.arrive_station] = "arrive_station",
    [defines.train_state.wait_station] = "wait_station",
    [defines.train_state.manual_control_stop] = "manual_control_stop",
    [defines.train_state.manual_control] = "manual_control",
    [defines.train_state.destination_full] = "destination_full",
}

---@param inserter LuaEntity
---@param restore boolean | nil
---@overload fun(inserter: LuaEntity)
function swapInserter(inserter, restore)
    --[[DEBUG]]log("Inside count " .. inserter.held_stack.count .. " restore " .. var_dump(restore))
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

