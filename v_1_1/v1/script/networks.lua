
---@alias Networks number


---@param a Networks
---@param b Networks
---@return boolean
function isCompatibleNetworks(a, b)
    return a == nil or b == nil or bit32.band(a, b) ~= 0
end
