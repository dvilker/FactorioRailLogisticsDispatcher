---@alias SurUid number

---@class SurClass
    ---@field uid SurUid @unique id of SurOb. Equals surface.index
    ---@field valid boolean
    ---@field stops table<StopUid, StopClass> @All stops at surface
    ---@field bidiStops table<StopUid, StopClass> @Bidi stops at surface
    ---@field depotStops table<StopUid, StopClass> @Depot stops at surface
    ---@field cleanStops table<StopUid, StopClass> @Clean stops at surface
    ---@field fuelStops table<StopUid, StopClass> @Refueling stops at surface
    ---@field deliveries table<DeliveryUid, DeliveryClass> @All active deliveries on surface
    ---@field trains table<TrainUid, TrainClass> @All managed trains on surface
    ---@field freeTrains table<TrainType, table<TrainUid, TrainClass>> @Free managed trains on surface
    ---@field provide table<string, table<StopUid, StopClass>> @Current provides
    ---@field provideUpdate table<string, number> @Tick of last update for increase
SurClass = { }

---@param surfaceIndex number @surface.index
---@return SurClass
function SurClass:new(surfaceIndex)
    return instanceClass(self, {
        uid = surfaceIndex,
        valid = true,

        stops = {},

        bidiStops = {},
        depotStops = {},
        cleanStops = {},
        fuelStops = {},

        deliveries = {},
        trains = {},
        freeTrains = {},

        provide = {},
        provideUpdate = {},
    })
end

---@param index number
---@param doNotMakeNew boolean @or_nil
---@return SurClass @or_nil
---@overload fun(index: number): SurClass @or_nil
function SurClass.ofSurfaceIndex(index, doNotMakeNew)
    if not global.surObs then
        global.surObs = {}
    end
    local surOb = global.surObs[index]
    if not surOb and not doNotMakeNew then
        surOb = SurClass:new(index)
        global.surObs[index] = surOb
    end
    return surOb
end

---@param entity LuaEntity
---@param doNotMakeNew boolean @or_nil
---@return SurClass @or_nil
---@overload fun(entity: LuaEntity): SurClass @or_nil
function SurClass.ofEntity(entity, doNotMakeNew)
    return SurClass.ofSurfaceIndex(entity.surface.index, doNotMakeNew)
end

---@param train LuaTrain
---@param doNotMakeNew boolean @or_nil
---@return SurClass @or_nil
---@overload fun(train: LuaTrain): SurClass @or_nil
function SurClass.ofTrain(train, doNotMakeNew)
    return SurClass.ofEntity(train.front_stock, doNotMakeNew)
end

---@param surObs table<SurUid, SurClass>
function SurClass.restoreMeta(surObs)
    for _, surOb in pairs(surObs) do
        restoreClass(SurClass, surOb)
        for _, stopOb in pairs(surOb.stops) do
            if type(stopOb) == "table" then
                restoreClass(StopClass, stopOb)
            end
        end
        for _, delivOb in pairs(surOb.deliveries) do
            if type(delivOb) == "table" then
                restoreClass(DeliveryClass, delivOb)
            end
        end
        for _, trainOb in pairs(surOb.trains) do
            if type(trainOb) == "table" then
                restoreClass(TrainClass, trainOb)
            end
        end
    end
end

function SurClass.tick()
    local i = math.max(math.min(table_size(global.activeStops), 1), 32)
    while i > 0 do
        i = i - 1
        global.stopKey = next(global.activeStops, global.stopKey and global.activeStops[global.stopKey] and global.stopKey)
        if global.stopKey then
            local stop = global.activeStops[global.stopKey]
            local j = 32
            while j > 0 do
                j = j - 1
                -- retry if delivery created
                if not stop:update() then
                    break
                end
            end
            if stop.isBidi then
                break
            end
        end
    end
end

function SurClass.updateTimer()
    script.on_nth_tick(5, (global.activeStops and table_size(global.activeStops) > 0 and SurClass.tick) or nil)
end

function SurClass:remove()
    global.surObs[self.uid] = nil
    for uid, _ in pairs(self.stops) do
        global.activeStops[uid] = nil
    end
    SurClass.updateTimer()
end

---@param requester StopClass
function SurClass:correctDeliveriesAtStop(requester)
    if requester.request then
        for _, delivery in pairs(requester.deliveries) do
            -- todo cache fully loaded delivery flag
            if delivery.requester == requester
                    and (not delivery.providerPassed or (correctScheduleAndAtProvider and delivery.provider.train))
                    and delivery.provider.provide then
                local train = delivery.train
                local prevContents = delivery.contents
                local newContents, _, _ = self:_getNeededExchange(delivery.provider, requester, true, prevContents)
                if newContents then
                    for name, oldCount in pairs(prevContents) do
                        local newCount = newContents[name]
                        if not newCount or newCount < oldCount then
                            newContents[name] = oldCount
                        end
                    end
                    if self:_newDelivery(delivery.provider, requester, train, newContents, delivery) then
                        newContents = delivery.contents
                        local changed = table_size(prevContents) == table_size(newContents)
                        if not changed then
                            for name, oldCount in pairs(prevContents) do
                                local newCount = newContents[name]
                                if oldCount ~= newCount then
                                    changed = true
                                    break
                                end
                            end
                        end
                        if not changed then
                            for name, newCount in pairs(newContents) do
                                local oldCount = prevContents[name]
                                if oldCount ~= newCount then
                                    changed = true
                                    break
                                end
                            end
                        end
                        if changed then
                            delivery.requester:_updateDeliveryChanges()
                            delivery.requester:update(true) --todo check to need this
                            delivery.provider:_updateDeliveryChanges()
                            delivery.provider:update(true) --todo check to need this
                            train:gotoToDelivery(delivery, true)
                            if delivery.provider.train then
                                delivery.provider:updateOutputPort()
                            end
                        end
                    end
                end
            end
        end
    end
end



---@param stop StopClass
---@param doNotMakeDeliveries boolean
---@return DeliveryClass @nullable New delivery
------@overload fun(stop: StopClass): DeliveryClass
function SurClass:updateStop(stop, doNotMakeDeliveries)
    local newDelivery
    local active = table_size(global.activeStops) > 0
    if stop.valid then
        global.activeStops[stop.uid] = (stop.disp.mode ~= ST_MODE_OFF) and stop or nil
        self.stops[stop.uid] = stop
        self.bidiStops[stop.uid] = stop.isBidi and stop or nil
        self.depotStops[stop.uid] = stop.isDepot and stop or nil
        self.cleanStops[stop.uid] = stop.isClean and stop or nil
        self.fuelStops[stop.uid] = stop.isFuel and stop or nil

        if stop.provide then
            for name, _ in pairs(stop.provide) do
                local provideStops = self.provide[name]
                if not provideStops then
                    provideStops = {}
                    self.provide[name] = provideStops
                end
                provideStops[stop.uid] = stop
            end
        end
        self.provide = self.provide or {} -- todo remove line
        for name, provideStops in pairs(self.provide) do
            if not stop.provide or not stop.provide[name] then
                provideStops[stop.uid] = nil
                if table_size(provideStops) == 0 then
                    self.provide[name] = nil
                end
            end
        end
        if not doNotMakeDeliveries then
            if correctScheduleBeforeProvider then
                self:correctDeliveriesAtStop(stop)
            end
            if stop.request then
                newDelivery = self:_tryToMakeDelivery(stop)
            end
        end
        if stop.errorMaskInvalid then
            stop.errorMaskInvalid = nil
            local errorMask
            if stop.request then
                for _, reqState in pairs(stop.request) do
                    if reqState.error then
                        errorMask = errorMask or 0
                        errorMask = bit32.bor(errorMask, bit32.lshift(1, reqState.index or 0))
                    end
                end
            end
            if stop.errorMask ~= errorMask then
                stop.errorMask = errorMask
                stop:updateOutputPort()
            end
        end
        stop:updateVisual()
    else
        global.activeStops[stop.uid] = nil
        self.stops[stop.uid] = nil
        self.bidiStops[stop.uid] = nil
        self.depotStops[stop.uid] = nil
        self.cleanStops[stop.uid] = nil
        self.fuelStops[stop.uid] = nil
        stop.provide = nil
        stop.request = nil
        for name, provideStops in pairs(self.provide) do
            provideStops[stop.uid] = nil
            if table_size(provideStops) == 0 then
                self.provide[name] = nil
            end
        end
        self:removeDeliveriesBy(stop)
        if table_size(self.stops) == 0 then
            -- drop surface
            self.valid = false
            global.surObs[self.uid] = nil
        end
    end
    if active ~= (table_size(global.activeStops) > 0) then
        SurClass.updateTimer()
    end
    return newDelivery
end

---@param requester StopClass
function SurClass:_tryToMakeDelivery(requester)
    if not requester:hasTrainSlot() then
        return nil
    end

    ---@type StopClass, TrainClass, number, number, table<string, number>, number
    local bestProvider, bestTrain, bestScore, bestDistance, bestContents, errorMask
    for reqName, reqState in pairs(requester.request) do
        ---@type LocalisedString
        local newError
        if reqState._request > 0 then
            local hasProvider, hasMinProvide, hasTrain
            local providers = self.provide[reqName]
            if providers then
                for _, provider in pairs(providers) do
                    if provider ~= requester
                            and provider.provide
                            and provider.provide[reqName] and provider.provide[reqName]._provide > 0
                            and provider:hasTrainSlot()
                            and isCompatibleNetworks(requester.disp.networks, provider.disp.networks)
                            and isCompatibleTrainCompositions(requester.compFlags, provider.compFlags)
                    then
                        hasProvider = true
                        local contents, c, f = self:_getNeededExchange(provider, requester, false, nil)
                        if contents then
                            hasMinProvide = true
                            local train, score, distance = self:_findBestTrainForExchange(provider, requester, contents, c, f)
                            if train then
                                hasTrain = true
                                if not bestScore or bestScore < score or (bestScore == score and distance < bestDistance) then
                                    bestProvider = provider
                                    bestTrain = train
                                    bestScore = score
                                    bestDistance = distance
                                    bestContents = contents
                                end
                            else
                            end
                        end
                    end
                end
            end
            if not hasProvider then
                newError = E_NO_PROVIDER
            elseif not hasMinProvide then
                newError = E_NO_MIN_PROVIDER
            elseif not hasTrain then
                newError = E_NO_TRAIN
            end
        end
        if newError then
            errorMask = errorMask or 0
            errorMask = bit32.bor(errorMask, bit32.lshift(1, reqState.index or 0))
        end
        if reqState.error ~= newError then
            reqState.error = newError
            reqState.errorTick = game.tick
        end
    end
    if requester.errorMask ~= errorMask then
        requester.errorMaskInvalid = nil
        requester.errorMask = errorMask
        requester:updateOutputPort()
    end

    if not bestProvider then
        --for _, reqState in pairs(requester.request) do
        --    reqState.state = reqState.state or ST_STATE_DELIVERY_NO_TRAIN
        --end
        return nil
    end

    local delivery = self:_newDelivery(bestProvider, requester, bestTrain, bestContents, nil)
    if delivery then
        self:addDelivery(delivery)
        self:setTrainFree(bestTrain, false)
        bestTrain:gotoToDelivery(delivery, false)
        bestProvider:update(true)
    end
    return delivery
end

---@param provider StopClass
---@param requester StopClass
---@param train TrainClass
---@param contents table<string, number>
---@param existsDelivery DeliveryClass
---@return DeliveryClass @nullable
function SurClass:_newDelivery(provider, requester, train, contents, existsDelivery)
    local availStacks = train.itemCapacity
    local availFluid = train.fluidCapacity
    requester.lastTickMap = requester.lastTickMap or {} -- todo remove
    ---@type table<string, number>
    local lastMap = requester.lastTickMap
    ---@type number
    local current = 0
    while current do
        ---@type number
        local next
        for name, count in pairs(contents) do
            local nameLastTick = table_size(contents) ~= 1 and lastMap[name] or 0
            if current == nameLastTick then
                local itemProto = game.item_prototypes[name]
                if itemProto then
                    local stacks = math.ceil(count / itemProto.stack_size)
                    if availStacks > stacks then
                        availStacks = availStacks - stacks
                    elseif availStacks > 0 then
                        contents[name] = availStacks * itemProto.stack_size
                        availStacks = 0
                    else
                        contents[name] = nil
                    end
                else
                    -- todo allow to combine fluids
                    if availFluid > 0 then
                        if availFluid < contents[name] then
                            contents[name] = availFluid
                        end
                        availFluid = 0
                    else
                        contents[name] = nil
                    end
                end
            elseif nameLastTick > current then
                if next == nil or nameLastTick < next then
                    next = nameLastTick
                end
            end
        end
        current = next
    end

    if table_size(contents) == 0 then
        return nil
    end

    local delivery = existsDelivery or DeliveryClass:new()
    delivery.train = train
    delivery.provider = provider
    delivery.requester = requester
    delivery.contents = contents
    for name, _ in pairs(contents) do
        requester.lastTickMap[name] = game.tick
    end
    return delivery
end

---@param provider StopClass
---@param requester StopClass
---@param ignoreMin boolean
---@param updatingContents table<string, number>
---@return table<string, number>, number, number @ contents, cargo stacks, fluids count
function SurClass:_getNeededExchange(provider, requester, ignoreMin, updatingContents)
    ---@type table<string, number>
    local contents
    local needCargoCells = 0
    local needFluids = 0
    if requester.request then
        for name, reqSig in pairs(requester.request) do
            if not updatingContents or updatingContents[name] then
                local provSig = provider.provide[name]
                if provSig then
                    local valid
                    if ignoreMin then
                        valid = reqSig._count < 0 and provSig._count > 0
                    else
                        local commonMin = math.max(reqSig._min, provSig._min)
                        valid = reqSig._request >= commonMin and provSig._provide >= commonMin
                    end
                    if valid then
                        contents = contents or {}
                        local count = ignoreMin and math.min(-reqSig._count, provSig._count) or math.min(reqSig._request, provSig._provide)
                        if updatingContents then
                            count = count + updatingContents[name]
                        end
                        contents[name] = count
                        if provSig.type == "item" then
                            needCargoCells = needCargoCells + math.ceil(count / game.item_prototypes[name].stack_size)
                        else
                            needFluids = needFluids + count
                        end
                    end
                end
            end
        end
    end
    return contents, needCargoCells, needFluids
end

---@param provider StopClass
---@param requester StopClass
---@param contents table<string, number>
---@param needCargoCells number
---@param needFluids number
---@return TrainClass, number, number @nullable train, score, distance
function SurClass:_findBestTrainForExchange(provider, requester, contents, needCargoCells, needFluids)
    ---@type TrainType, number
    local bestTrainType, bestScore
    for trainType, trains in pairs(self.freeTrains) do
        local trainExample = trains[next(trains)]
        if ((not provider.compFlags) or provider.compFlags[trainExample.comp])
                and ((not requester.compFlags) or requester.compFlags[trainExample.comp])
                and ((needCargoCells > 0 and trainExample.itemCapacity > 0) or (needFluids > 0 and #trainExample.fluidWagons > 0))
        -- todo filter by networks
        then
            local acceptedCells = math.min(needCargoCells, trainExample.itemCapacity)
            local acceptedFluid = math.min(needFluids, #trainExample.fluidWagons) -- todo enhance fluid formula
            local score = acceptedCells * 25000 + acceptedFluid * 40 -- todo  may enhance formula
            if bestScore == nil or score > bestScore then
                bestTrainType = trainType
                bestScore = score
            end
        end
    end
    if bestTrainType then
        ---@type number, TrainClass
        local bestDistance, bestTrain
        for _, train in pairs(self.freeTrains[bestTrainType]) do
            local distance = comparableDistance(--[[---@type _MapPosition1]]provider.stopEntity.position, --[[---@type _MapPosition1]]train.train.front_stock.position)
            if bestDistance == nil or distance < bestDistance then
                bestTrain = train
                bestDistance = distance
            end
        end
        if bestTrain then
            return bestTrain, bestScore, bestDistance
        end
    end
    return nil, nil, nil
end

--- - -@param provider StopClass
--- - -@param requester StopClass
--- - -@return TrainClass, number, number, table<string, number> @nullable train, score, distance, contents
--- - -@deprecated
--function SurClass:_checkDeliveryAndFindBestTrain(provider, requester)
--    if not provider.provide
--            or not isCompatibleNetworks(provider.disp.networks, requester.disp.networks)
--            or not isCompatibleTrainCompositions(provider.compFlags, requester.compFlags)
--    then
--        return nil, nil, nil, nil
--    end
--    ---@type table<string, number>
--    local contents
--    local needCargoCells = 0
--    local needFluidWagons = 0
--    for name, reqSig in pairs(requester.request) do
--        local provSig = provider.provide[name]
--        if provSig then
--            local commonMin = math.max(reqSig._min, provSig._min)
--            if reqSig._request >= commonMin and provSig._provide >= commonMin then
--                contents = contents or {}
--                local count = math.min(reqSig._request, provSig._provide)
--                contents[name] = count
--                if provSig.type == "item" then
--                    needCargoCells = needCargoCells + math.ceil(count / game.item_prototypes[name].stack_size)
--                else
--                    needFluidWagons = needFluidWagons + 1
--                end
--                if not provider.disp.flagAllowMulti or not requester.disp.flagAllowMulti then
--                    break
--                end
--            end
--        end
--    end
--    if not contents then
--        return nil, nil, nil, nil
--    end
--    ---@type TrainType, number
--    local bestTrainType, bestScore
--    for trainType, trains in pairs(self.freeTrains) do
--        local trainExample = trains[next(trains)]
--        if (not provider.compFlags or provider.compFlags[trainExample.comp])
--                and (not requester.compFlags or requester.compFlags[trainExample.comp])
--                and ((needCargoCells > 0 and trainExample.itemCapacity > 0) or (needFluidWagons > 0 and #trainExample.fluidWagons > 0))
--        then
--            local acceptedCells = math.min(needCargoCells, trainExample.itemCapacity)
--            local acceptedFluid = math.min(needFluidWagons, #trainExample.fluidWagons) -- todo enhance fluid formula
--            local score = acceptedCells + acceptedFluid * 40 -- todo  may enhance formula
--            if bestScore == nil or score > bestScore then
--                bestTrainType = trainType
--                bestScore = score
--            end
--        end
--    end
--    if bestTrainType then
--        ---@type number, TrainClass
--        local bestDistance, bestTrain
--        for _, train in pairs(self.freeTrains[bestTrainType]) do
--            local distance = comparableDistance(--[[---@type _MapPosition1]]provider.stopEntity.position, --[[---@type _MapPosition1]]train.train.front_stock.position)
--            if bestDistance == nil or distance < bestDistance then
--                bestTrain = train
--                bestDistance = distance
--            end
--        end
--        if bestTrain then
--            return bestTrain, bestScore, bestDistance, contents
--        end
--    end
--    return nil, nil, nil, nil
--end

---@param delivery DeliveryClass
function SurClass:addDelivery(delivery)
    self.deliveries[delivery.uid] = delivery
    delivery.provider:addDeliveryToStop(delivery)
    delivery.requester:addDeliveryToStop(delivery)
end

---@param trainOrStop TrainClass|StopClass
function SurClass:removeDeliveriesBy(trainOrStop)
    for _, delivery in pairs(self.deliveries) do
        if delivery:isRelated(trainOrStop) then
            self:removeDelivery(delivery)
            if delivery.train and delivery.train.valid then
                delivery.train:goToHome()
            end
        end
    end
end

---@param delivery DeliveryClass
function SurClass:removeDelivery(delivery)
    if delivery.train then
        delivery.train:removeDeliveryFromTrain(delivery)
    end
    self.deliveries[delivery.uid] = nil
    delivery.provider:removeDeliveryFromStop(delivery)
    delivery.requester:removeDeliveryFromStop(delivery)
end

---@param stopEntity LuaEntity
---@param disp DispClass
---@return StopClass
---@overload fun (stopEntity: LuaEntity): StopClass
function SurClass:getOrAddStop(stopEntity, disp)
    if self.stops[stopEntity.unit_number] then
        return self.stops[stopEntity.unit_number]
    end
    if not disp then
        return nil
    end
    local stop = StopClass:new(stopEntity, disp, self)
    disp.stop = stop
    self.stops[stop.uid] = stop
    stop:update()
    return stop
end

---@param uid StopUid
---@param withEntities boolean
function SurClass:removeStop(uid)
    local stop = self.stops[uid]
    if stop then
        stop.valid = false
        self.mode = ST_MODE_OFF
        self:updateStop(stop)
    end
end

---@param trainEntity LuaTrain
---@param doNotMakeNew boolean
---@return TrainClass @nullable
---@overload fun(trainEntity: LuaTrain): TrainClass @nullable
function SurClass:getOrAddTrain(trainEntity, doNotMakeNew)
    local train = self.trains[trainEntity.id]
    if train or doNotMakeNew then
        return train
    end
    train = TrainClass:new(trainEntity, self)
    self.freeTrains[train.trainType] = self.freeTrains[train.trainType] or {}
    self.freeTrains[train.trainType][train.uid] = train
    self.trains[train.uid] = train
    return train
end

---@param trainId TrainUid
function SurClass:removeTrain(trainId)
    local train = self.trains[trainId]
    if train then
        train.valid = false
        if train.stop then
            train.stop.train = nil
            train.stop:updateVisual()
            train.stop = nil
        end
        self:setTrainFree(train, false) -- remove from self.freeTrains
        self.trains[train.uid] = nil
        self:removeDeliveriesBy(train)
    end
end

---@param train TrainClass
---@param isFree boolean
function SurClass:setTrainFree(train, isFree)
    train.isFree = isFree
    if isFree then
        self.freeTrains[train.trainType] = self.freeTrains[train.trainType] or {}
        self.freeTrains[train.trainType][train.uid] = train
    else
        if self.freeTrains[train.trainType] then
            self.freeTrains[train.trainType][train.uid] = nil
            if table_size(self.freeTrains[train.trainType]) == 0 then
                self.freeTrains[train.trainType] = nil
            end
        end
    end
end

