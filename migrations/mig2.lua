---@param net NetClass
local function updateNet(net)
    net.title = net.surface.name
    -- from -@field provide table<TypeAndName, table<DispUid, DispClass>> @Current provides
    -- to -@field provide table<Network, table<TypeAndName, table<DispUid, DispClass>>> @Current provides
    if net.provide then
        local oldProvide = --[[---@type table<TypeAndName, table<DispUid, DispClass>>]] net.provide
        net.provide = {}
        for typeAndName, disps in pairs(oldProvide) do
            for uid, disp in pairs(disps) do
                net.provide[disp.network] = net.provide[disp.network] or {}
                net.provide[disp.network][typeAndName] = net.provide[disp.network][typeAndName] or {}
                net.provide[disp.network][typeAndName][uid] = disp
            end
        end
    end

    -- from -@field request table<TypeAndName, RequestQueue> @Current request order
    -- to -@field request table<Network, table<TypeAndName, RequestQueue>> @Current request order
    if net.request then
        local oldRequest = --[[---@type table<TypeAndName, RequestQueue>]] net.request
        net.request = {}
        for typeAndName, eq in pairs(oldRequest) do
            for uid, item in pairs(eq.items) do
                local disp = item.disp
                net.request[disp.network] = net.request[disp.network] or {}
                net.request[disp.network][typeAndName] = net.request[disp.network][typeAndName] or { items = {} }
                net.request[disp.network][typeAndName].items[uid] = item
            end
        end
    end
end


-- from -@field nets table<SurfaceIndex, table<ForceIndex, table<Network, NetClass>>>
-- to -@field nets table<ForceIndex, table<SurfaceIndex, NetClass>>

if storage.nets then
    local oldNets = --[[---@type table<SurfaceIndex, table<ForceIndex, table<Network, NetClass>>>]] storage.nets
    storage.nets = {}

    ---@param net NetClass
    local function migrateNet(net)
        log("MIGRATING NET si:" .. var_dump_light(net.surface.index) .. " fi:" .. var_dump_light(net.force.index) .. " network:" .. var_dump_light(net.network))
        storage.nets[net.force.index] = storage.nets[net.force.index] or {}
        if not storage.nets[net.force.index][net.surface.index] then
            storage.nets[net.force.index][net.surface.index] = net
        else
            local net0 = storage.nets[net.force.index][net.surface.index]
            for uid, disp in pairs(net.disps) do
                net0.disps[uid] = disp
                disp.net = net0
            end
            for uid, disp in pairs(net.depotDisps) do
                net0.depotDisps[uid] = disp
            end
            for uid, disp in pairs(net.cleanDisps) do
                net0.cleanDisps[uid] = disp
            end
            for uid, mover in pairs(net.movers) do
                net0.movers[uid] = mover
                mover.net = net
            end
            for uid, mover in pairs(net.freeMovers) do
                net0.freeMovers[uid] = mover
            end
            for uid, delivery in pairs(net.deliveries) do
                net0.deliveries[uid] = delivery
            end
        end
        updateNet(net)
    end

    for si, s in pairs(oldNets) do
        for fi, f in pairs(s) do
            if f[0] then
                migrateNet(f[0])
            end
            for network, net in pairs(f) do
                if network ~= 0 then
                    migrateNet(net)
                end
            end
        end
    end
end
