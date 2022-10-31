---@shape StopSignalState: DispSignal
    ---@field state ST_STATE
    ---@field dynamic boolean @nullable Added by signal to input combinator
    ---@field _min number @ Result of minimum
    ---@field _provide number @ Simple provide value. >=0
    ---@field _request number @ Simple request value. >=0
    ---@field _used boolean @nullable

---@alias StopUid number

---@class StopClass
    ---@field uid StopUid @unique id of StopOb. Equals entity.unit_number
    ---@field valid boolean
    ---@field disp DispClass @ dispatcher
    ---@field stopEntity LuaEntity @ train stop entity
    ---@field sur SurClass @ surface of stop
    ---@field prevMode ST_MODE @ for mode change detection
    ---@field state ST_STATE @ current simple state (deprecated?)
    ---@field message string|nil @ message for state (deprecated?)
    ---@field signalStates table<string, StopSignalState> @ cargo signals with state (item/fluid name -> StopSignalState)
    ---@field isBidi true|nil @ is stop uses for cargo exchange
    ---@field isDepot true|nil @ is stop is depot
    ---@field isClean true|nil @ is stop is clean stations
    ---@field turnedInserters table<number, LuaEntity> @nullable saved turned inserters
    ---@field deliveries table<DeliveryUid, DeliveryClass> @ active deliveries with this station
    ---@field deliveryChanges table<string, number> @ Expected changes due to deliveries
    ---@field delivery DeliveryClass @nullable current delivery if train at stop
    ---@field deliveryPoint DeliveryPoint @nullable current delivery point if train at stop
    ---@field train TrainClass @nullable train at stop
    ---@field provide table<string, StopSignalState> @nullable
    ---@field request table<string, StopSignalState> @nullable
    ---@field lastTickMap table<string, number> @ tick of last delivery for each item or fluid
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
        state = ST_STATE_OFF,
        signalStates = { },
        deliveries = { },
        lastTickMap = { },
    })
    stop:settingsUpdated()
    rendering.draw_line {
        color = { 1, 1, 0},
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
        for _, point in pairs(delivery.points) do
            if point.stop == self and (not point.passed or (delivery == self.delivery and point.exchangeMul == 1)) then
                for name, ex in pairs(point.exchange) do
                    changes[name] = (changes[name] or 0) - ex * point.exchangeMul
                end
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
end

function StopClass:_updateBidi()
    local signals = self.disp.input.get_merged_signals(defines.circuit_connector_id.constant_combinator)
    local signalStates = self.signalStates
    for _, signal in pairs(signalStates) do
        signal._request = 0
        signal._provide = 0
    end
    if signals then
        local trainContents = self.train and self.train.train.get_contents()
        local trainFluidContents = self.train and self.train.train.get_fluid_contents()
        local bothWires = true
        for _, sig in pairs(signals) do
            local ss = signalStates[sig.signal.name]
            if not ss then
                if sig.signal.type == "item" and self.disp.otherCargoMin ~= nil
                        or sig.signal.type == "fluid" and self.disp.otherFluidMin ~= nil
                then
                    ss = {
                        type = sig.signal.type,
                        name = sig.signal.name,
                        request = nil, -- only by signal
                        min = nil, -- fills later
                        state = ST_STATE_DELIVERY_NO,
                        dynamic = true,
                        _used = true,
                        _min = 0, -- fills later
                        _request = 0, -- fills later
                        _provide = 0, -- fills later
                    }
                    signalStates[sig.signal.name] = ss
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
                self.deliveryChanges = self.deliveryChanges or {} -- todo remove line
                sig.count = sig.count + (self.deliveryChanges[ss.name] or 0) -- correct by already delivering
                if trainContents then
                    sig.count = sig.count + (trainContents[ss.name] or 0)
                end
                if trainFluidContents then
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
    ---@type table<string, StopSignalState>
    local provide, request
    for k, signal in pairs(signalStates) do
        if signal.dynamic and not signal._used then
            signalStates[k] = nil
        else
            signal._used = nil
            if signal._provide > 0 then
                provide = provide or {}
                provide[signal.name] = signal
            elseif signal._request > 0 then
                request = request or {}
                request[signal.name] = signal
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

function StopClass:update()
    if self._settingsUpdated then
        -- TODO REMOVE WITH FLOAT.LUA REMOVED
        self._settingsUpdated = nil
        self:settingsUpdated()
    end
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
            if not self.train.isFree and self.train:isEnoughFuel(true) then
                self.sur:setTrainFree(self.train, true)
            end
        end
    elseif mode == ST_MODE_CLEAN then
    end
    self.sur:updateStop(self)
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
    train.manual_mode = true
    local turnedInserters = self.turnedInserters
    for _, car in pairs(train.carriages) do
        local inserters = car.surface.find_entities_filtered({
            type = "inserter",
            position = car.position,
            radius = 7,
        })
        for _, ins in pairs(inserters) do
            if ins.valid then
                ins.drop_target = car -- invalidate ins.drop_target
                if ins.drop_target == car and ins.held_stack.count > 0 then
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
    train.manual_mode = false
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
            end
        end
        if table_size(self.turnedInserters) == 0 then
            self.turnedInserters = nil
        end
    end
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
        --if self.disp.flagDestroy then
        --    self.sur:removeTrain(trainEntity.id)
        --    train:deconstruct()
        --else
        --    train:goToDepotOrClean()
        --end
    elseif self.isBidi then
        self:_restoreInserters(true)
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
                ---@type DeliveryPoint
                local point
                for _, p in pairs(delivery.points) do
                    if not p.passed then
                        point = p
                        break
                    end
                end
                if point and point.stop == self then
                    point.passed = true
                    self.deliveryPoint = point
                    self.delivery = delivery
                    self.train = train
                    train.stop = self
                    self:_updateDeliveryChanges()
                    local out = --[[---@type ConstantCombinatorParameters[] ]] {}
                    out[#out + 1] = { index = #out + 1, count = 1, signal = { type = "virtual", name = "signal-green" } }
                    if not self.disp.outMode or self.disp.outMode == ST_OUT_NEED_CONTENTS_NEG or self.disp.outMode == ST_OUT_NEED_CONTENTS_POS then
                        --local totalNeedCargo = 0
                        --local totalNeedFluid = 0
                        if point.needContent then
                            for name, count in pairs(point.needContent) do
                                ---@type string
                                local type
                                if game.item_prototypes[name] then
                                    type = "item"
                                    --totalNeedCargo = totalNeedCargo + count
                                else
                                    type = "fluid"
                                    --totalNeedFluid = totalNeedFluid + count
                                end
                                out[#out + 1] = { index = #out + 1, count = count * (self.disp.outMode ~= ST_OUT_NEED_CONTENTS_POS and -1 or 1), signal = { type = type, name = name } }
                            end
                        end
                        --out[#out + 1] = { index = #out + 1, count = totalNeedCargo + totalNeedFluid, signal = { type = "virtual", name = "signal-A" } }
                        --out[#out + 1] = { index = #out + 1, count = totalNeedCargo, signal = { type = "virtual", name = "signal-C" } }
                        --out[#out + 1] = { index = #out + 1, count = totalNeedFluid, signal = { type = "virtual", name = "signal-F" } }
                    elseif self.disp.outMode == ST_OUT_EXCHANGE then
                        if point.exchange then
                            for name, count in pairs(point.exchange) do
                                ---@type string
                                local type
                                if game.item_prototypes[name] then
                                    type = "item"
                                else
                                    type = "fluid"
                                end
                                out[#out + 1] = { index = #out + 1, count = count * point.exchangeMul, signal = { type = type, name = name } }
                            end
                        end
                    end
                    local load = false
                    local unload = false
                    local fluid = false
                    if point.exchange then
                        for name, count in pairs(point.exchange) do
                            local sign = count * point.exchangeMul
                            if sign > 0 then
                                load = true
                            elseif sign < 0 then
                                unload = true
                            end
                            if game.fluid_prototypes[name] then
                                fluid = true
                            end
                        end
                    end
                    if load then
                        out[#out + 1] = { index = #out + 1, count = 1, signal = { type = "virtual", name = "signal-L" } }
                    end
                    if unload then
                        out[#out + 1] = { index = #out + 1, count = 1, signal = { type = "virtual", name = "signal-U" } }
                    end
                    if fluid then
                        out[#out + 1] = { index = #out + 1, count = 1, signal = { type = "virtual", name = "signal-F" } }
                    end
                    (--[[---@type LuaConstantCombinatorControlBehavior]] self.disp.output.get_control_behavior()).parameters = out
                else
                    self.stopEntity.force.print("Поезд приехал на станцию " .. self.stopEntity.backer_name .. " не по расписанию")
                end
            else
                self.stopEntity.force.print("Поезд с непонятно доставкой на станции " .. self.stopEntity.backer_name)
            end
        else
            self.stopEntity.force.print("Непонятный поезд на станции " .. self.stopEntity.backer_name)
        end
    end
    self:updateVisual()
end

---@param trainEntity LuaTrain
function StopClass:trainDepart()
    if self.isBidi then
        if self.deliveryPoint and self.deliveryPoint.exchangeMul > 0 and self.disp.flagTurnInserters then
            self:_turnInserters()
        end
        local delivery = self.delivery
        local train = self.train
        -- check train contents with point and warning if needed
        self.deliveryPoint = nil
        self.delivery = nil
        self.train = nil
        train.stop = nil
        if delivery then
            self:removeDeliveryFromStop(delivery, true);
        end
        if self.disp.output.valid then
            (--[[---@type LuaConstantCombinatorControlBehavior]] self.disp.output.get_control_behavior()).parameters = --[[---@type]]nil
        end
        if delivery and (#delivery.points == 0 or delivery.points[#delivery.points].passed) and train then
            train:goToDepotOrClean()
        end
    elseif self.isClean then
        if self.train then
            self.train:goToDepotOrClean()
            self.train.stop = nil
            self.train = nil
        end
    elseif self.isDepot then
        if self.train then
            self.sur:setTrainFree(self.train, false)
            self.train.stop = nil
            self.train = nil
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
        for _, sig in pairs(self.disp.signals) do
            signalStates[sig.name] = --[[---@type StopSignalState]]{
                type = sig.type,
                name = sig.name,
                request = sig.request,
                min = sig.min,
                _min = unitCalc(sig.min, sig.name) or 0,
            }
        end
    end
    self.signalStates = signalStates
    self.compFlags = compositionsToFlags(parseTrainCompositions( self.disp.comps))
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
        railDirection  = defines.rail_direction.back
    else
        railDirection  = defines.rail_direction.front
    end

    local trailType = {
        "locomotive", "cargo-wagon", "cargo-wagon", "cargo-wagon", "cargo-wagon",
        "locomotive",  "cargo-wagon", "cargo-wagon", "cargo-wagon", "cargo-wagon",
        "locomotive",  "cargo-wagon", "cargo-wagon", "cargo-wagon", "cargo-wagon",
    }
    local railDirs  = {
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
                    railDirection  = defines.rail_direction.back
                else
                    railDirection  = defines.rail_direction.front
                end
                rendering.draw_text({
                    surface = r.surface,
                    text = tostring(index),
                    color = {1,0,0},
                    target = rail,
                    target_offset = { index / 16, index / 16}
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
