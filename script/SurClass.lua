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
    ---@field provide table<TypeAndName, table<StopUid, StopClass>> @Current provides
    ---@field request table<TypeAndName, table<StopUid, StopClass>> @Current requests -- for priority
    ---@field provideUpdate table<TypeAndName, number> @Tick of last update for increase
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
        request = {},
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
    script.on_nth_tick(nil)
    if global.activeStops and table_size(global.activeStops) > 0 then
        script.on_nth_tick(updateTicks, SurClass.tick)
    end
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
                    for typeAndName, oldCount in pairs(prevContents) do
                        local newCount = newContents[typeAndName]
                        if not newCount or newCount < oldCount then
                            newContents[typeAndName] = oldCount
                        end
                    end
                    if self:_newDelivery(delivery.provider, requester, train, newContents, delivery) then
                        newContents = delivery.contents
                        local changed = table_size(prevContents) == table_size(newContents)
                        if not changed then
                            for typeAndName, oldCount in pairs(prevContents) do
                                local newCount = newContents[typeAndName]
                                if oldCount ~= newCount then
                                    changed = true
                                    break
                                end
                            end
                        end
                        if not changed then
                            for typeAndName, newCount in pairs(newContents) do
                                local oldCount = prevContents[typeAndName]
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
            for typeAndName, _ in pairs(stop.provide) do
                local provideStops = self.provide[typeAndName]
                if not provideStops then
                    provideStops = {}
                    self.provide[typeAndName] = provideStops
                end
                provideStops[stop.uid] = stop
            end
        end
        for typeAndName, provideStops in pairs(self.provide) do
            if not stop.provide or not stop.provide[typeAndName] then
                provideStops[stop.uid] = nil
                if table_size(provideStops) == 0 then
                    self.provide[typeAndName] = nil
                end
            end
        end
        if stop.request then
            for typeAndName, _ in pairs(stop.request) do
                local requestStops = self.request[typeAndName]
                if not requestStops then
                    requestStops = {}
                    self.request[typeAndName] = requestStops
                end
                requestStops[stop.uid] = stop
            end
        end
        for typeAndName, requestStops in pairs(self.request) do
            if not stop.request or not stop.request[typeAndName] then
                requestStops[stop.uid] = nil
                if table_size(requestStops) == 0 then
                    self.request[typeAndName] = nil
                end
            end
        end
        if not doNotMakeDeliveries and stop:isValid() then
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
        for typeAndName, provideStops in pairs(self.provide) do
            provideStops[stop.uid] = nil
            if table_size(provideStops) == 0 then
                self.provide[typeAndName] = nil
            end
        end
        for typeAndName, requestStops in pairs(self.request) do
            requestStops[stop.uid] = nil
            if table_size(requestStops) == 0 then
                self.request[typeAndName] = nil
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

    ---@type StopClass, TrainClass, number, number, number, table<string, number>, number
    local bestProvider, bestTrain, bestPriority, bestScore, bestDistance, bestContents, errorMask
    for typeAndName, reqState in pairs(requester.request) do
        ---@type LocalisedString, LocalisedString
        local newError, newErrorTt
        if reqState._request > 0 then
            local hasProvider, hasMinProvide, hasTrain
            ---@type StopClass
            local hasMorePriority
            local otherRequest = self.request[typeAndName]
            if otherRequest then
                local reqPriority = requester.disp.priority
                for _, reqStop in pairs(otherRequest) do
                    local priority = reqStop.disp.priority
                    if math.abs(reqPriority - priority) > 0.000001 and priority > reqPriority then
                        hasMorePriority = reqStop
                        break
                    end
                end
            end
            if not hasMorePriority then
                local providers = self.provide[typeAndName]
                if providers then
                    for _, provider in pairs(providers) do
                        if provider ~= requester
                                and provider.provide
                                and provider.provide[typeAndName] and provider.provide[typeAndName]._provide > 0
                                and provider:hasTrainSlot()
                                and isCompatibleNetworks(requester.disp.networks, provider.disp.networks)
                                and isCompatibleTrainCompositions(requester.compFlags, provider.compFlags)
                        then
                            local priority = provider.disp.priority
                            if not bestPriority or bestPriority <= priority or math.abs(bestPriority - priority) < 0.000001 then
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
                                            bestPriority = priority
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
                end
            end
            if hasMorePriority then
                newError = E_LOW_PRIORITY
                newErrorTt = { "viirld-gui.low-priority-tt", hasMorePriority.stopEntity.backer_name }
            elseif not hasProvider then
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
            reqState.errorTt = newErrorTt
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
---@param contents table<TypeAndName, number>
---@param existsDelivery DeliveryClass
---@return DeliveryClass @nullable
function SurClass:_newDelivery(provider, requester, train, contents, existsDelivery)
    local availStacks = train.itemCapacity
    local availFluid = train.fluidCapacity
    ---@type table<string, number>
    local lastMap = requester.lastTickMap
    ---@type number
    local current = 0
    while current do
        ---@type number
        local next
        for typeAndName, count in pairs(contents) do
            local nameLastTick = table_size(contents) ~= 1 and lastMap[typeAndName] or 0
            if current == nameLastTick then
                if typeAndNameIsItem(typeAndName) then
                    local _, name = fromTypeAndName(typeAndName)
                    local itemProto = game.item_prototypes[name]
                    local stacks = math.ceil(count / itemProto.stack_size)
                    if availStacks > stacks then
                        availStacks = availStacks - stacks
                    elseif availStacks > 0 then
                        contents[typeAndName] = availStacks * itemProto.stack_size
                        availStacks = 0
                    else
                        contents[typeAndName] = nil
                    end
                else
                    -- todo allow to combine fluids
                    if availFluid > 0 then
                        if availFluid < contents[typeAndName] then
                            contents[typeAndName] = availFluid
                        end
                        availFluid = 0
                    else
                        contents[typeAndName] = nil
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
    for typeAndName, _ in pairs(contents) do
        requester.lastTickMap[typeAndName] = game.tick
    end
    return delivery
end

---@param provider StopClass
---@param requester StopClass
---@param ignoreMin boolean
---@param updatingContents table<TypeAndName, number>
---@return table<TypeAndName, number>, number, number @ contents, cargo stacks, fluids count
function SurClass:_getNeededExchange(provider, requester, ignoreMin, updatingContents)
    ---@type table<string, number>
    local contents
    local needCargoCells = 0
    local needFluids = 0
    if requester.request then
        for typeAndName, reqSig in pairs(requester.request) do
            if not updatingContents or updatingContents[typeAndName] then
                local provSig = provider.provide[typeAndName]
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
                            count = count + updatingContents[typeAndName]
                        end
                        contents[typeAndName] = count
                        if provSig.type == "item" then
                            needCargoCells = needCargoCells + math.ceil(count / fromTypeAndNameToProto(typeAndName).stack_size)
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
---@param contents table<TypeAndName, number>
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

