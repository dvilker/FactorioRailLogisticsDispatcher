-- Train compositions

---@alias TrainCompositions string @TrainComposition splitted by space
---@alias TrainComposition string @Combination of: L - loco, C - cargo wagon, F - fluid wagon, A - artillery, _ - unknown wagon
---@alias TrainCompositionFlags table<TrainComposition, true>

---@param train LuaTrain
---@return TrainComposition
function getTrainComposition(train)
    ---@type string[]
    local comp = {}
    ---@type table<number, true>
    local back_movers_map
    local back_movers = train.locomotives.back_movers
    if back_movers and #back_movers then
        back_movers_map = {}
        for _, loc in pairs(back_movers) do
            back_movers_map[loc.unit_number] = true
        end
    end
    for _, ca in pairs(train.carriages) do
        if ca.type == 'locomotive' then
            comp[#comp + 1] = 'L'
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

---@param comp TrainComposition
---@return TrainComposition
function normalizeComposition(comp)
    comp = string.upper(comp)
    comp = string.gsub(comp, "([0-9]+)([LCFA])", function (cnt, what)
        return string.rep(what, tonumber(cnt))
    end)
    local function repeatsToNumber(m)
        return #m >= 4 and tostring(math.min(#m, 100)) .. m:sub(1, 1) or m
    end
    comp = string.gsub(comp, "(L+)", repeatsToNumber)
    comp = string.gsub(comp, "(C+)", repeatsToNumber)
    comp = string.gsub(comp, "(F+)", repeatsToNumber)
    comp = string.gsub(comp, "(A+)", repeatsToNumber)
    comp = string.gsub(comp, "[0-9]+$","")
    return comp
end

---@param compsStr string
---@return TrainComposition[] @nullable
function parseTrainCompositions(compsStr)
    if not compsStr then
        return --[[---@type TrainComposition[] ]] nil
    end
    ---@type TrainComposition[]
    local result
    local factor = 0
    for word in string.gmatch(compsStr, "[LCFAlcfa0-9]+") do
        local comp = normalizeComposition(--[[---@type string]]word)
        if string.match(comp, "[L]") then
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

---@param TrainComposition[]
---@return TrainCompositions
function formatCompositions(comps)
    return table.concat(comps, " ")
end

---@param comp TrainCompositions
---@return TrainCompositions
function normalizeCompositions(comps)
    local parsed = parseTrainCompositions(comps)
    if parsed == nil or #parsed == 0 then
        return ""
    end
    return formatCompositions(parsed)
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
