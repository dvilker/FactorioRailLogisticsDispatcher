---@shape RequestQueue
    ---@field items table<DispUid, RequestQueueItem>
    ---@field next RequestQueueItem @nullable

---@shape RequestQueueItem
    ---@field disp DispClass
    ---@field tick number

---@class NetClass
    ---@field force LuaForce
    ---@field surface LuaSurface
    ---@field title string @ Nauvis
    ---@field disps table<DispUid, DispClass> @ All disps
    ---@field depotDisps table<DispUid, DispClass> @ Depots is common for all networks
    ---@field cleanDisps table<DispUid, DispClass> @ Cleans is common for all networks
    ---@field movers table<MoverUid, MoverClass> @All managed movers
    ---@field freeMovers table<TrainType, table<MoverUid, MoverClass>> @Free managed movers
    ---@field deliveries table<DeliveryUid, DeliveryClass> @ Active deliveries
    ---@field provide table<Network, table<TypeAndName, table<DispUid, DispClass>>> @Current provides
    ---@field request table<Network, table<TypeAndName, RequestQueue>> @Current request order


NetClass = --[[---@type NetClass]] createClass("Net")

function NetClass:restoreClass()
    for _, disp in pairs(self.disps) do
        restoreClass(disp)
    end
    for _, mover in pairs(self.movers) do
        restoreClass(mover)
    end
end

---@param force ForceIndex
---@param surface SurfaceIndex
---@return NetClass
function NetClass:new(force, surface)
    local title = game.surfaces[surface].name
    if remote.interfaces["space-exploration"] then
        local seZone = remote.call("space-exploration", "get_zone_from_surface_index", { surface_index = surface })
        if seZone and seZone.name then
            local seIcon = remote.call("space-exploration", "get_zone_icon", { zone_index = seZone.index })
            if seIcon then
                title = "[img=" .. seIcon .. "] " .. seZone.name
            else
                title = seZone.name
            end
        end
        log("SE ZONE " .. var_dump_light(seZone))

    end
    return instanceClass(self, {
        uid = globalGenUid(),
        surface = game.surfaces[surface],
        force = game.forces[force],
        title = title,

        disps = {},

        depotDisps = {},
        cleanDisps = {},

        movers = {},
        freeMovers = {},

        deliveries = {},

        provide = {},
        request = {},
    })
end

---@param mover MoverClass
---@param moverInfo MoverInfoFromSchedule @nullable
function NetClass:addMover(mover, moverInfo)
    if self.movers[mover.uid] then
        error("NetClass:addMover: mover " .. var_dump(mover.uid) .. " already added")
    end
    if mover.delivery then
        error("NetClass:addMover: mover.delivery is not nil")
    end

    self.movers[mover.uid] = mover

    local deliveryUid = moverInfo and moverInfo.delivery
    if deliveryUid then
        local delivery = self.deliveries[deliveryUid]
        if delivery then
            if not delivery.mover then
                delivery.mover = mover
                mover.delivery = delivery
            end
        end
    end

    self:updateMoverFree(mover)
end

---@param moverUid MoverUid
function NetClass:removeMover(moverUid)
    local mover = self.movers[moverUid]
    if not mover then
        error("NetClass:removeMover: there is no mover " .. var_dump(moverUid))
    end
    self:updateMoverFree(mover, true) -- remove from self.freeMovers
    self.movers[mover.uid] = nil
    if mover.delivery and mover.delivery.mover == mover then
        mover.delivery.mover = nil
    end
    if mover.disp then
        mover.disp.mover = nil
        mover.disp = nil
    end
end

---@param disp DispClass
function NetClass:addDisp(disp)
    if disp.net ~= self then
        error("Can not add disp in network: other disp.net")
    end
    self.disps[disp.uid] = disp

    self.depotDisps[disp.uid] = disp.mode == MODE_DEPOT and disp or nil
    self.cleanDisps[disp.uid] = disp.mode == MODE_CLEAN and disp or nil

    -- todo If has train, update train
    -- todo cleanup deliveries if neeeded
end

---@param disp DispClass
function NetClass:removeDisp(disp)
    if not self.disps[disp.uid] then
        error("Can not remove not added disp")
    end
    self.disps[disp.uid] = nil

    self.depotDisps[disp.uid] = nil
    self.cleanDisps[disp.uid] = nil

    for _, provByNet in pairs(self.provide) do
        for _, v in pairs(provByNet) do
            v[disp.uid] = nil
        end
    end
    for _, reqByNet in pairs(self.request) do
        for _, v in pairs(reqByNet) do
            -- TODO need completly remove
            v.items[disp.uid] = nil
        end
    end
end

---@param mover MoverClass
---@return string @nullable
function NetClass:findDepotForMover(mover)
    -- todo Можно ускорить если не искать ближайшую. В этом нет смысла в самом деле.
    ---@type DispClass, number
    local bestDisp, bestDistance
    if table_size(self.depotDisps) > 0 then
        local trainPosition = --[[---@type _MapPosition1]]mover.train.front_stock.position
        for _, disp in pairs(self.depotDisps) do
            if disp.compFlags == nil or disp.compFlags[mover.comp] then
                local distance = comparableDistance(--[[---@type _MapPosition1]]disp.stopEntity.position, trainPosition)
                if not bestDistance or distance < bestDistance then
                    bestDistance = distance
                    bestDisp = disp
                end
            end
        end
    end
    return bestDisp and bestDisp.stopEntity.backer_name or nil
end

---@param mover MoverClass
---@param forceNotFree? boolean
function NetClass:updateMoverFree(mover, forceNotFree)
    local isFree = not forceNotFree
            and not mover.delivery
            and mover.train.valid
            and mover.train.front_stock.surface.index == mover.net.surface.index
            and mover:isEmpty()
            and mover:isEnoughFuel()

    if mover.isFree ~= isFree then
        mover.isFree = isFree
        if mover.isFree then
            self.freeMovers[mover.trainType] = self.freeMovers[mover.trainType] or {}
            self.freeMovers[mover.trainType][mover.uid] = mover
        else
            if self.freeMovers[mover.trainType] then
                self.freeMovers[mover.trainType][mover.uid] = nil
                if table_size(self.freeMovers[mover.trainType]) == 0 then
                    self.freeMovers[mover.trainType] = nil
                end
            end
        end
    end
end

---@param delivery DeliveryClass
function NetClass:addDelivery(delivery)
    -- todo inline
    self.deliveries[delivery.uid] = delivery
end

---@param delivery DeliveryClass
function NetClass:removeDelivery(delivery)
    -- todo inline
    self.deliveries[delivery.uid] = nil
end

---@param network Network
---@param typeAndName TypeAndName
---@return RequestQueueItem @nullable
function NetClass:rqFindHead(network, typeAndName)
    ---@type RequestQueueItem
    local head
    local requestQueue = self.request and self.request[network] and self.request[network][typeAndName]
    if requestQueue then
        for _, rqi in pairs(requestQueue.items) do
            if not head or rqi.disp.priority > head.disp.priority or rqi.disp.priority == head.disp.priority and rqi.tick > head.tick then
                head = rqi
            end
        end
    end
    return head
end

---@param typeAndName TypeAndName
---@param disp DispClass
---@return RequestQueueItem @nullable
function NetClass:rqFindInQueue(typeAndName, disp)
    local rq = self.request and self.request[disp.network] and self.request[disp.network][typeAndName]
    return rq and rq.items[disp.uid]
end

---@param typeAndName TypeAndName
---@param disp DispClass
function NetClass:rqAddToQueue(typeAndName, disp)
    self.request = self.request or {}
    self.request[disp.network] = self.request[disp.network] or {}
    local rq = self.request[disp.network][typeAndName]
    if not rq then
        rq = {
            items = {},
            next = nil,
        }
        self.request[disp.network][typeAndName] = rq
    end
    rq.items[disp.uid] = {
        disp = disp,
        tick = game.tick,
    }
end

---@param typeAndName TypeAndName
---@param disp DispClass
function NetClass:rqRemoveFromQueue(typeAndName, disp)
    local rq = self.request and self.request[disp.network] and self.request[disp.network][typeAndName]
    if rq then
        rq.items[disp.uid] = nil
        if table_size(rq.items) == 0 then
            self.request[disp.network][typeAndName] = nil
            if table_size(self.request[disp.network]) == 0 then
                self.request[disp.network] = nil
            end
        end
    end
end

---@param typeAndName TypeAndName
---@param disp DispClass
function NetClass:rqRemoveFromAllQueues(disp)
    if self.request and self.request[disp.network] then
        for typeAndName, rq in pairs(self.request[disp.network]) do
            rq.items[disp.uid] = nil
            if table_size(rq.items) == 0 then
                self.request[disp.network][typeAndName] = nil
                if table_size(self.request[disp.network]) == 0 then
                    self.request[disp.network] = nil
                end
            end
        end
    end
end
