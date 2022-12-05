---@shape StopStatPerCargo
    ---@field provided number @nullable
    ---@field received number @nullable
    ---@field deliveries number @nullable
    ---@field lastTick number @nullable

---@shape StopSignalState: DispSignal
    ---@field index number
    ---@field error LocalisedString @nullable
    ---@field errorTt LocalisedString @nullable
    ---@field errorTick number @nullable
    ---@field dynamic boolean @nullable Added by signal to input combinator
    ---@field _min number @ Result of minimum
    ---@field _provide number @ Simple provide value. >=0. Zero if < _min
    ---@field _request number @ Simple request value. >=0. Zero if < _min
    ---@field _count number @ Simple signal value. No filtered by _min. For request < 0. For provide > 0
    ---@field _used boolean @nullable

---@alias StopUid number

---@class StopClass
    ---@field uid StopUid @unique id of StopOb. Equals entity.unit_number
    ---@field valid boolean
    ---@field disp DispClass @ dispatcher
    ---@field stopEntity LuaEntity @ train stop entity
    ---@field sur SurClass @ surface of stop
    ---@field prevMode ST_MODE @ for mode change detection
    ---@field signalStates table<TypeAndName, StopSignalState> @ cargo signals with state (item/fluid name -> StopSignalState)
    ---@field isBidi true|nil @ is stop uses for cargo exchange
    ---@field isDepot true|nil @ is stop is depot
    ---@field isClean true|nil @ is stop is clean station
    ---@field isFuel true|nil @ is stop is refueling station
    ---@field turnedInserters table<number, LuaEntity> @nullable saved turned inserters
    ---@field inserters table<number, LuaEntity> @nullable inserters thats load or unload cargo wagons
    ---@field deliveries table<DeliveryUid, DeliveryClass> @ active deliveries with this station
    ---@field deliveryChanges table<TypeAndName, number> @ Expected changes due to deliveries
    ---@field delivery DeliveryClass @nullable current delivery if train at stop
    ---@field train TrainClass @nullable train at stop
    ---@field trainItemContents table<string, number> @nullable contents of arrived train
    ---@field trainFluidContents table<string, number> @nullable contents of arrived train
    ---@field provide table<TypeAndName, StopSignalState> @nullable
    ---@field request table<TypeAndName, StopSignalState> @nullable
    ---@field stat table<TypeAndName, StopStatPerCargo> @nullable Statistics per cargo
    ---@field statTrains number @nullable Count of all trains (only registered)
    ---@field errorMask number @nullable any of request has error
    ---@field errorMaskInvalid boolean @nullable need to update error mask
    ---@field lastTickMap table<TypeAndName, number> @ tick of last delivery for each item or fluid
    ---@field compFlags TrainCompositionFlags @nullable Map of compatible traion compositions or nil if any
    ---@field train TrainClass|nil @ train at stop
    ---@field gui DispGui @nullable gui if opened
StopClass = { }

---@param stopEntity LuaEntity
---@param disp DispClass
---@param sur SurClass
---@return StopClass
function StopClass:new(stopEntity, disp, sur)
    ---@type StopClass
    local stop = instanceClass(self, {
        uid = stopEntity.unit_number,
        valid = true,
        disp = disp,
        stopEntity = stopEntity,
        sur = sur,
        signalStates = { },
        deliveries = { },
        lastTickMap = { },
    })
    stop:settingsUpdated()
    rendering.draw_line {
        color = { 1, 1, 0 },
        width = 2,
        from = disp.entity,
        to = stopEntity,
        surface = stopEntity.surface,
        only_in_alt_mode = true,
        draw_on_ground = true,
        forces = { stopEntity.force },
    }
    return stop
end

function StopClass:updateInputPort()
    local port = self.disp.input
    if port then
        ---@type ConstantCombinatorParameters[]
        local params = {}
        for _, state in pairs(self.signalStates) do
            if not state.dynamic and state.request then
                params[#params + 1] = {
                    signal = { type = state.type, name = state.name },
                    count = -unitCalc(state.request, state.name),
                    index = #params + 1
                }
            end
        end
        (--[[---@type LuaConstantCombinatorControlBehavior]] port.get_control_behavior()).parameters = params
    end
end

function StopClass:updateOutputPort()
    local out = --[[---@type ConstantCombinatorParameters[] ]] {}
    local delivery = self.delivery
    if delivery then
        if not self.disp.outMode or self.disp.outMode == ST_OUT_NEED_CONTENTS_NEG or self.disp.outMode == ST_OUT_NEED_CONTENTS_POS then
            local sign = --[[---@type number]] self.disp.outMode ~= ST_OUT_NEED_CONTENTS_POS and -1 or 1
            if delivery.provider == self then
                for typeAndName, count in pairs(delivery.contents) do
                    out[#out + 1] = { index = #out + 1, count = count * sign, signal = fromTypeAndNameToSignal(typeAndName) }
                end
            end
        elseif self.disp.outMode == ST_OUT_EXCHANGE then
            local sign = delivery.provider == self and 1 or -1
            for typeAndName, count in pairs(delivery.contents) do
                out[#out + 1] = { index = #out + 1, count = count * sign, signal = fromTypeAndNameToSignal(typeAndName) }
            end
        end
        if delivery.provider == self then
            out[#out + 1] = { index = #out + 1, count = 1, signal = { type = "virtual", name = "signal-L" } }
        end
        if delivery.requester == self then
            out[#out + 1] = { index = #out + 1, count = 1, signal = { type = "virtual", name = "signal-U" } }
        end
    end
    if self.errorMask then
        out[#out + 1] = { index = #out + 1, count = self.errorMask, signal = { type = "virtual", name = "signal-E" } }
    end
    (--[[---@type LuaConstantCombinatorControlBehavior]] self.disp.output.get_control_behavior()).parameters = out
end

function StopClass:addDeliveryToStop(delivery)
    self.deliveries[delivery.uid] = delivery
    self:_updateDeliveryChanges()
end

---@param delivery DeliveryClass
---@param doNotUpdateVisual boolean @nullable
---@overload fun(delivery: DeliveryClass)
function StopClass:removeDeliveryFromStop(delivery, doNotUpdateVisual)
    self.deliveries[delivery.uid] = nil
    if self.delivery == delivery then
        self.delivery = nil
    end
    self:_updateDeliveryChanges()
    if not doNotUpdateVisual then
        self:updateVisual()
    end
end

function StopClass:_updateDeliveryChanges()
    ---@type table<string, number)
    local changes = {}
    for _, delivery in pairs(self.deliveries) do
        local mul
        if delivery.provider == self then
            if not delivery.providerPassed or delivery == self.delivery then
                mul = 1
            end
        else
            if not delivery.requesterPassed then
                mul = -1
            end
        end
        if mul then
            for typeAndName, ex in pairs(delivery.contents) do
                changes[typeAndName] = (changes[typeAndName] or 0) - ex * mul
            end
        end
    end
    self.deliveryChanges = changes
end

function StopClass:_updateMode()
    if self.prevMode == ST_MODE_BIDI then
        self.sur:removeDeliveriesBy(self)
        self.provide = nil
        self.request = nil
    end
    local mode = self.disp.mode
    self.prevMode = mode
    self.isBidi = mode == ST_MODE_BIDI or nil
    self.isDepot = mode == ST_MODE_DEPOT or nil
    self.isClean = mode == ST_MODE_CLEAN or nil
    self.isFuel = mode == ST_MODE_FUEL or nil
end

function StopClass:_updateBidi()
    local signalStates = self.signalStates
    for _, signal in pairs(signalStates) do
        signal._request = 0
        signal._provide = 0
        signal._count = 0
    end
    local isValid = self:isValid()
    if isValid then
        local signals = self.disp.input.get_merged_signals(defines.circuit_connector_id.constant_combinator)
        if signals then
            local trainContents = self.train and self.train.train.get_contents()
            if countingInsertersContent and self.train and self.inserters then
                for _, ins in pairs(self.inserters) do
                    if ins.valid and ins.held_stack.count > 0 then
                        local name = ins.held_stack.name
                        trainContents[name] = (trainContents[name] or 0) + ins.held_stack.count
                    end
                end
            end
            local trainFluidContents = self.train and self.train.train.get_fluid_contents()
            local bothWires = true
            for _, sig in pairs(signals) do
                local typeAndName = toTypeAndName(sig.signal)
                local ss = signalStates[typeAndName]
                if not ss then
                    if sig.signal.type == "item" and self.disp.otherCargoMin ~= nil
                            or sig.signal.type == "fluid" and self.disp.otherFluidMin ~= nil
                    then
                        ss = {
                            type = sig.signal.type,
                            name = sig.signal.name,
                            index = 0,
                            request = nil, -- only by signal
                            min = nil, -- fills later
                            error = nil,
                            errorTick = nil,
                            errorTt = nil,
                            dynamic = true,
                            _used = true,
                            _min = 0, -- fills later
                            _request = 0, -- fills later
                            _provide = 0, -- fills later
                            _count = 0, -- fills later
                        }
                        signalStates[typeAndName] = ss
                    end
                end
                if ss then
                    if ss.dynamic then
                        ss.min = sig.signal.type == "item" and self.disp.otherCargoMin or self.disp.otherFluidMin
                        ss._min = unitCalc(ss.min, sig.signal.name) or 0
                        ss._used = true
                    else
                        if bothWires then
                            sig.count = sig.count + (unitCalc(ss.request, ss.name) or 0) -- get_merged_signals() returns x2 for signals of combinator, correct it
                        end
                    end
                    self.deliveryChanges = self.deliveryChanges or {}
                    --[[DEBUG]] ss._sig_count = sig.count
                    --[[DEBUG]] ss._train_count = trainContents and trainContents[toTypeAndName(ss)]
                    sig.count = sig.count + (self.deliveryChanges[typeAndName] or 0) -- correct by already delivering
                    if trainContents and ss.type == 'item' then
                        sig.count = sig.count + (trainContents[ss.name] or 0)
                    end
                    if trainFluidContents and ss.type == 'fluid' then
                        sig.count = sig.count + (trainFluidContents[ss.name] or 0)
                    end
                    ss._count = sig.count
                    local sum = math.abs(sig.count) >= ss._min and sig.count or 0
                    if ss.dynamic then
                        if sum > 0 then
                            ss._provide = sum
                        elseif sum < 0 then
                            ss._request = -sum
                        end
                    else
                        if sum > 0 and not ss.request then
                            ss._provide = sum
                        elseif sum < 0 and ss.request then
                            ss._request = -sum
                        end
                    end
                end
            end
        end
    end
    ---@type table<string, StopSignalState>
    local provide, request
    for typeAndName, signal in pairs(signalStates) do
        if signal.dynamic and not signal._used then
            if signal.error then
                self.errorMaskInvalid = true
            end
            signalStates[typeAndName] = nil
        else
            signal._used = nil
            if signal._count > 0 then
                provide = provide or {}
                provide[typeAndName] = signal
                if signal.error then
                    signal.error = nil
                    self.errorMaskInvalid = true
                end
            elseif signal._count < 0 then
                if signal._request > 0.000001 then
                    request = request or {}
                    request[typeAndName] = signal
                end
            end
        end
    end
    self.provide = provide
    self.request = request
end

---@return boolean
function StopClass:hasTrainSlot()
    return self.stopEntity.trains_limit == nil or self.stopEntity.trains_limit > table_size(self.deliveries)
end

---@return boolean
function StopClass:isValid()
    if not self.valid then
        return false
    end
    return self.valid
            and self.stopEntity.valid
            and self.disp.entity.valid
            and self.disp.input.valid
            and self.disp.output.valid
            and self.stopEntity.connected_rail
            and self.stopEntity.connected_rail.valid
end

---@param doNotMakeDeliveries boolean
---@return DeliveryClass @nullable New delivery
---@overload fun(): DeliveryClass
function StopClass:update(doNotMakeDeliveries)
    local mode = self.disp.mode
    if self.prevMode ~= mode then
        self:_updateMode()
    end
    self:_restoreInserters(false)
    if mode == ST_MODE_BIDI then
        self:_updateBidi()
        if self.disp.flagTamp and self.train then
            self:_tamp()
        end
    elseif mode == ST_MODE_DEPOT then
        if self.train then
            if not self.train.isFree and self.train:isEnoughFuel() and self.train:isEmpty() then
                self.sur:setTrainFree(self.train, true)
            end
        end
    elseif mode == ST_MODE_CLEAN then
    elseif mode == ST_MODE_FUEL then
    end
    return self.sur:updateStop(self, doNotMakeDeliveries)
end

function StopClass:_tamp()
    local cargoWagons = self.train.train.cargo_wagons
    if #cargoWagons > 1 then
        for i = 1, #cargoWagons - 1 do
            local w1 = cargoWagons[i]
            local inv1 = w1.get_inventory(defines.inventory.cargo_wagon)
            if inv1.count_empty_stacks() == 0 then
                inv1.sort_and_merge()
                if inv1.count_empty_stacks() == 0 then
                    for name, count in pairs(inv1.get_contents()) do
                        local stackSize = game.item_prototypes[name].stack_size
                        local rem1 = count % stackSize
                        if rem1 > 0 then
                            for j = i + 1, #cargoWagons do
                                local w2 = cargoWagons[j]
                                local inv2 = w2.get_inventory(defines.inventory.cargo_wagon)
                                if inv2.count_empty_stacks() == 0 then
                                    inv2.sort_and_merge()
                                    if inv2.count_empty_stacks() == 0 then
                                        local count2 = inv2.get_item_count(name)
                                        if count2 > 0 then
                                            local rem2 = count2 % stackSize
                                            if rem2 > 0 and rem1 + rem2 <= stackSize then
                                                ---@type ItemStackDefinition
                                                local items = { name = name, count = rem2 }
                                                if inv1.can_insert(items) then
                                                    inv1.insert(items)
                                                    inv2.remove(items)
                                                    inv1.sort_and_merge()
                                                    inv2.sort_and_merge()
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function StopClass:_turnInserters()
    local train = self.train.train
    --train.manual_mode = true
    local turnedInserters = self.turnedInserters
    for _, car in pairs(train.carriages) do
        local inserters = car.surface.find_entities_filtered({
            type = "inserter",
            position = car.position,
            radius = 7,
        })
        for _, ins in pairs(inserters) do
            if ins.valid then
                local entityAtPos = car.surface.find_entity(car.name, ins.drop_position)
                if entityAtPos == car and ins.held_stack.count > 0 then
                    turnedInserters = turnedInserters or {}
                    if not turnedInserters[ins.unit_number] then
                        swapInserter(ins, false)
                        turnedInserters[ins.unit_number] = ins
                    end
                end
            end
        end
    end
    self.turnedInserters = turnedInserters
    --train.manual_mode = false
end

---@param forced boolean
function StopClass:_restoreInserters(forced)
    if self.turnedInserters then
        for k, ins in pairs(self.turnedInserters) do
            if ins.valid then
                if forced or ins.held_stack.count == 0 then
                    swapInserter(ins, true)
                    self.turnedInserters[k] = nil
                end
            else
                self.turnedInserters[k] = nil
            end
        end
        if table_size(self.turnedInserters) == 0 then
            self.turnedInserters = nil
        end
    end
end

---@param train LuaTrain
function StopClass:_fetchInserters(train)
    local inserters
    --    train.manual_mode = true
    for _, car in pairs(train.cargo_wagons) do
        local inses = car.surface.find_entities_filtered({
            type = "inserter",
            position = car.position,
            radius = 7,
        })
        for _, ins in pairs(inses) do
            if ins.valid then
                if car.surface.find_entity(car.name, ins.drop_position) == car or car.surface.find_entity(car.name, ins.pickup_position) == car then
                    inserters = inserters or {}
                    inserters[ins.unit_number] = ins
                end
            end
        end
    end
    --    train.manual_mode = false
    self.inserters = inserters
end

---@param trainEntity LuaTrain
function StopClass:trainArrived(trainEntity)
    if self.isDepot then
        local train = self.sur:getOrAddTrain(trainEntity)
        train.stop = self
        self.train = train
        train:assignDepot()
        if train.delivery then
            self.sur:removeDelivery(train.delivery)
        end
        train:depotArrived()
        --if self.disp.flagDestroy then
        --    self.sur:removeTrain(trainEntity.id)
        --    train:deconstruct()
        --else
        --    train:goToDepotOrClean()
        --end
    elseif self.isFuel then
        local train = self.sur:getOrAddTrain(trainEntity)
        train.stop = self
        self.train = train
        train:fuelArrived()
    elseif self.isBidi then
        self:_restoreInserters(true)
        self:_fetchInserters(trainEntity)
        local train = self.sur:getOrAddTrain(trainEntity, true)
        if train and train.delivery then
            ---@type DeliveryClass
            local delivery
            for _, d in pairs(self.deliveries) do
                if train.delivery == d then
                    delivery = d
                    break
                end
            end
            if delivery then
                local validLocation = (delivery.provider == self and not delivery.providerPassed)
                        or (delivery.requester == self and delivery.providerPassed and not delivery.requesterPassed)
                if validLocation then
                    if delivery.provider == self then
                        delivery.providerPassed = true
                    else
                        delivery.requesterPassed = true
                    end
                    self.delivery = delivery
                    self.train = train
                    train.stop = self
                    self.trainItemContents = train.train.get_contents()
                    self.trainFluidContents = train.train.get_fluid_contents()
                    self:_updateDeliveryChanges()
                    self:updateOutputPort()
                else
                    self.stopEntity.force.print({ "viirld.err-train-not-by-schedule", trainEntity.front_stock.unit_number, self.stopEntity.unit_number })
                end
            else
                self.stopEntity.force.print({ "viirld.err-unknown-delivery", trainEntity.front_stock.unit_number, self.stopEntity.unit_number })
            end
        else
            self.stopEntity.force.print({ "viirld.err-unknown-train", trainEntity.front_stock.unit_number, self.stopEntity.unit_number })
        end
    end
    self:updateVisual()
end

---@param trainEntity LuaTrain
function StopClass:trainDepart()
    if self.isBidi then
        if self.delivery and self.delivery.provider == self and self.disp.flagTurnInserters then
            self:_turnInserters()
        end
        local delivery = self.delivery
        local train = self.train
        -- check train contents with point and warning if needed
        self.delivery = nil
        self.train = nil
        train.stop = nil
        if delivery then
            self:removeDeliveryFromStop(delivery, true);
        end
        if self.disp.output.valid then
            (--[[---@type LuaConstantCombinatorControlBehavior]] self.disp.output.get_control_behavior()).parameters = --[[---@type]]nil
        end
        for i = 1, 2 do
            local arrContents = i == 1 and self.trainItemContents or self.trainFluidContents
            local depContents = i == 1 and train.train.get_contents() or train.train.get_fluid_contents()
            if arrContents and table_size(arrContents) == 0 then
                arrContents = nil
            end
            if depContents and table_size(depContents) == 0 then
                depContents = nil
            end
            if arrContents and depContents then
                for name, depCount in pairs(depContents) do
                    arrContents[name] = (arrContents[name] or 0) - depCount
                end
            elseif depContents then
                arrContents = depContents
                for name, count in pairs(arrContents) do
                    arrContents[name] = -count
                end
            end
            if arrContents then
                local type = i == 1 and "item" or "fluid"
                self.stat = self.stat or {}
                for name, count in pairs(arrContents) do
                    local typeAndName = toTypeAndName(type, name)
                    self.stat[typeAndName] = self.stat[typeAndName] or {}
                    local stat = self.stat[typeAndName]
                    if count >= 0 then
                        stat.received = (stat.received or 0) + count
                    else
                        stat.provided = (stat.provided or 0) - count
                    end
                    stat.deliveries = (stat.deliveries or 0) + 1
                    stat.lastTick = game.tick
                end
            end
        end
        self.trainItemContents = nil
        self.trainFluidContents = nil
        self.statTrains = (self.statTrains or 0) + 1

        if delivery and delivery.requesterPassed and train then
            train:goToHome()
        end
    elseif self.isClean then
        if self.train then
            if self.train:isEmpty() then
                self.train:goToHome()
            end
            self.train.stop = nil
            self.train = nil
            self.statTrains = (self.statTrains or 0) + 1
        end
    elseif self.isFuel then
        if self.train then
            if self.train:isEnoughFuel() then
                self.train:goToHome()
            end
            self.train.stop = nil
            self.train = nil
            self.statTrains = (self.statTrains or 0) + 1
        end
    elseif self.isDepot then
        if self.train then
            self.sur:setTrainFree(self.train, false)
            self.train.stop = nil
            self.train = nil
            self.statTrains = (self.statTrains or 0) + 1
        end
    end
    self:updateVisual()
end

function StopClass:updateVisual()
    self.disp:updateVisual()
end

function StopClass:settingsUpdated()
    ---@type table<string, StopSignalState>
    local signalStates = {}
    if self.disp.signals then
        for index, sig in pairs(self.disp.signals) do
            signalStates[toTypeAndName(sig)] = --[[---@type StopSignalState]]{
                type = sig.type,
                name = sig.name,
                index = index,
                request = sig.request,
                min = sig.min,
                _min = unitCalc(sig.min, sig.name) or 0,
            }
        end
    end
    self.signalStates = signalStates
    self.compFlags = compositionsToFlags(parseTrainCompositions(self.disp.comps))
    self:updateInputPort()

    --if self.disp.flagBuild then -- debug
    --    self:buildTrain()
    --end

    self:update()
end

function StopClass:buildTrain()
    local rail = self.stopEntity.connected_rail
    local prevRail = nil

    ---@type defines__rail_direction
    local railDirection = self.stopEntity.connected_rail_direction
    if railDirection == defines.rail_direction.front then
        railDirection = defines.rail_direction.back
    else
        railDirection = defines.rail_direction.front
    end

    local trailType = {
        "locomotive", "cargo-wagon", "cargo-wagon", "cargo-wagon", "cargo-wagon",
        "locomotive", "cargo-wagon", "cargo-wagon", "cargo-wagon", "cargo-wagon",
        "locomotive", "cargo-wagon", "cargo-wagon", "cargo-wagon", "cargo-wagon",
    }
    local railDirs = {
        defines.rail_connection_direction.straight,
        defines.rail_connection_direction.left,
        defines.rail_connection_direction.right,
    }

    local index = 1

    local function nextRail()
        for _, dir in ipairs(railDirs) do
            local r, newRailDirection = rail.get_connected_rail {
                rail_direction = railDirection,
                rail_connection_direction = dir
            }
            if r then
                railDirection = newRailDirection
                if railDirection == defines.rail_direction.front then
                    railDirection = defines.rail_direction.back
                else
                    railDirection = defines.rail_direction.front
                end
                rendering.draw_text({
                    surface = r.surface,
                    text = tostring(index),
                    color = { 1, 0, 0 },
                    target = rail,
                    target_offset = { index / 16, index / 16 }
                })
                index = index + 1
                rail = r
                return r
            end
        end
        return nil
    end

    nextRail()
    ---@type MapPosition
    local prevPos
    for _, wagonName in pairs(trailType) do
        if prevPos then
            while true do
                nextRail()
                if not rail then
                    break
                end
                local pos = rail.position
                if math.sqrt(sqr(prevPos.x - pos.x) + sqr(prevPos.y - pos.y)) >= 5 then
                    break
                end
            end
            if not rail then
                break
            end
            prevPos = rail.position
        else
            nextRail()
            if not rail then
                break
            end
            prevPos = rail.position
        end
        local wagonDirection = rail.direction
        if railDirection == defines.rail_direction.front then
            wagonDirection = util.oppositedirection(wagonDirection)
        end
        local created = self.stopEntity.surface.create_entity {
            name = "entity-ghost",
            inner_name = wagonName,
            position = rail.position,
            direction = wagonDirection,
            target = rail,
            force = self.stopEntity.force,
        }
    end


end
