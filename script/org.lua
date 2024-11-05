---@param force LuaForce
---@param surface LuaSurface
---@return OrgClass
function getOrg(force, surface)
    local orgs = storage.orgs[force.index]
    return orgs and orgs[surface.index]
end

---@param force LuaForce
---@param surface LuaSurface
---@return OrgClass
function getOrCreateOrg(force, surface)
    local orgs = storage.orgs[force.index]
    if not orgs then
        orgs = {}
        storage.orgs[force.index] = orgs
    end
    local org = orgs[surface.index]
    if not org then
        org = {
            force = force,
            surface = surface,
            title = surface.localised_name,
            disps = {},
            depotDisps = {},
            cleanDisps = {},
            deliveries = {},
            provide = {},
            requestQueue = {},
            depotReadyDisps = {},
        }
        orgs[surface.index] = org
    end
    return org
end
