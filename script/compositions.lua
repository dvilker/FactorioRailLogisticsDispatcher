-- Train compositions

---@alias TrainCompositions string @TrainComposition splitted by space
---@alias TrainComposition string @Combination of: < - Forward loco, > - Backward loco, C - cargo wagon, F - fluid wagon, A - artillery, _ - unknown wagon
---@alias TrainCompositionFlags table<TrainComposition, true>

---@param train LuaTrain
---@return TrainComposition
function getTrainComposition(train)
    ---@type string[]
    local comp = {}
    for _, ca in pairs(train.carriages) do
        if ca.type == 'locomotive' then
            -- todo detect direction
            for _, loc in pairs(train.locomotives.front_movers) do
                if loc.unit_number == ca.unit_number then
                   comp[#comp + 1] = '<'
                end
            end
            for _, loc in pairs(train.locomotives.back_movers) do
                if loc.unit_number == ca.unit_number then
                   comp[#comp + 1] = '>'
                end
            end
        elseif ca.type == 'cargo-wagon' then
            comp[#comp + 1] = 'C'
        elseif ca.type == 'fluid-wagon' then
            comp[#comp + 1] = 'F'
        elseif ca.type == 'artillery-wagon' then
            comp[#comp + 1] = 'A'
        else
            comp[#comp + 1] = '_'
        end
    end
    return table.concat(comp, '')
end

---@param compsStr string
---@return TrainComposition[] @nullable
function parseTrainCompositions(compsStr)
    if not compsStr then
        return --[[---@type TrainComposition[] ]] nil
    end
    ---@type TrainComposition[]
    local result
    for word in string.gmatch(compsStr, "[<>LCFAlcfa]+") do
        local comp = string.upper(--[[---@type string]]word)
        comp = string.gsub(comp, "L", "<")
        if string.match(comp, "[<>]") then
            if result then
                for _, c in pairs(result) do
                    if c == comp then
                        goto cont
                    end
                end
            end
            result = result or {}
            result[#result + 1] = comp
            :: cont ::
        end
    end
    ---@type TrainComposition[]
    return result
end

---@param comps TrainComposition[]
---@return TrainCompositionFlags @nullable
function compositionsToFlags(comps)
    if not comps or table_size(comps) == 0 then
        return nil
    end
    ---@type TrainCompositionFlags
    local flags = {}
    for _, c in pairs(comps) do
        flags[c] = true
    end
    return flags
end

---@param a TrainCompositionFlags
---@param b TrainCompositionFlags
---@return boolean
function isCompatibleTrainCompositions(a, b)
    if not a or not b or table_size(a) == 0 or table_size(b) == 0 then
        return true
    end
    for aa in pairs(a) do
        if b[aa] then
            return true
        end
    end
    return false
end
