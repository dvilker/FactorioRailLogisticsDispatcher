---@shape DispSignal
    ---@field index number @nullable - null if dynamic - added by signal to input combinator
    ---@field type string
    ---@field name string
    ---@field typeAndName TypeAndName
    ---@field request CountWithUnits @nullable if null or 0 - provide
    ---@field min CountWithUnits @nullable
    ---@field error LocalisedString @nullable
    ---@field errorTt LocalisedString @nullable
    ---@field errorTick number @nullable
    ---@field _min number @ Result of minimum
    ---@field _provide number @ Simple provide value. >=0. Zero if < _min
    ---@field _request number @ Simple request value. >=0. Zero if < _min
    ---@field _count number @ Simple signal value. No filtered by _min. For request < 0. For provide > 0
    ---@field _combinator number @ Value from combinator
    ---@field _noProvide boolean @nullable
    ---@field _used boolean @nullable


---@shape DispSettings
    ---@field mode MODE @ settings: stop mode
    ---@field out OUT @ variant of signals in output port
    ---@field flagUseSignals true|nil @ use signals in schedule for this stop
    ---@field flagUseEquals true|nil @ use strict equals in schedule for this stop
    ---@field flagTamp true|nil @ tamping while loading
    ---@field flagTurnInserters true|nil @ rotate inserters when train departures (for cleaning)
    ---@field flagCompounds true|nil @ allow compound deliveries
    ---@field flagLiquidation true|nil @ ignore minimals
    ---@field signals table<TypeAndName, DispSignal> @ cargo signals
    ---@field autoItemsMin CountWithUnits @nullable
    ---@field autoFluidMin CountWithUnits @nullable
    ---@field autoItemsNoProvide true|nil @
    ---@field autoFluidNoProvide true|nil @
    ---@field network Network @ not used for depo/clean/fueling
    ---@field comps TrainCompositions @nullable Allowed composition at station. Also build compositions
    ---@field priority number @Station priority

---@param ds DispSettings
local function clearDispSettings(ds)
    ds.mode = nil
    ds.out = nil
    ds.flagUseSignals = nil
    ds.flagUseEquals = nil
    ds.flagTamp = nil
    ds.flagTurnInserters = nil
    ds.flagCompounds = nil
    ds.flagLiquidation = nil
    ds.signals = nil
    ds.autoItemsMin = nil
    ds.autoFluidMin = nil
    ds.autoItemsNoProvide = nil
    ds.autoFluidNoProvide = nil
    ds.network = nil
    ds.comps = nil
    ds.priority = nil
end

---@alias DispUid number

---@class DispClass: DispSettings
    ---@field uid DispUid @unique id of StopOb. Equals entity.unit_number
    ---@field active boolean @ used in dispatcher
    ---@field net NetClass @ network
    ---@field entity LuaEntity @ dispatcher interface entity
    ---@field stopEntity LuaEntity @nullable Stop entity if present
    ---@field outputEntity LuaEntity @nullable output interface entity
    ---@field gui DispGui @nullable gui if opened
    ---@field turnedInserters table<number, LuaEntity> @nullable saved turned inserters
    ---@field inserters table<number, LuaEntity> @nullable inserters that load or unload cargo wagons
    ---@field deliveryChanges table<TypeAndName, number> @ Expected changes due to deliveries
    ---@field deliveries table<DeliveryUid, DeliveryClass> @ active deliveries with this station
    ---@field mover MoverClass @nullable train at stop
    ---@field trainItemContents table<string, number> @nullable contents of arrived train
    ---@field trainFluidContents table<string, number> @nullable contents of arrived train
    ---@field provide table<TypeAndName, DispSignal> @nullable
    ---@field request table<TypeAndName, DispSignal> @nullable
    ---@field stat table<TypeAndName, StopStatPerCargo> @nullable Statistics per cargo
    ---@field statTrains number @nullable Count of all trains (only registered)
    ---@field errorMask number @nullable any of request has error
    ---@field errorMaskInvalid boolean @nullable need to update error mask
    ---@field lastTickMap table<TypeAndName, number> @ tick of last delivery for each item or fluid
    ---@field compFlags TrainCompositionFlags @nullable Map of compatible traion compositions or nil if any
    ---@field mover MoverClass|nil @ train at stop
    ---@field lastUpdateTick number

DispClass = --[[---@type DispClass]] createClass("Disp")

local SIG_A = { type = "virtual", name = "signal-A" }
local SIG_ANY = { type = "virtual", name = "signal-green" }
local SIG_B = { type = "virtual", name = "signal-B" }
local SIG_ESC = { type = "virtual", name = "signal-Z" }

local SIG_SKIPPED = { type = "virtual", name = "viirld2-skip-update-signal" }

function DispClass:restoreClass()
    if self.deliveries then
        for _, delivery in pairs(self.deliveries) do
            restoreClass(delivery)
        end
    end
    if self.mover then
        restoreClass(self.mover)
    end
end

---@param dispEntity LuaEntity
---@return DispClass
function DispClass:new(dispEntity)
    ---@type DispClass
    local disp = instanceClass(self, {
        uid = dispEntity.unit_number,
        entity = dispEntity,
        deliveries = {},
        deliveryChanges = {},
        lastTickMap = {},
    })
    globalAddDisp(disp)
    disp:_loadSettings(dispEntity)
    disp:updateEntities()
    disp:update(false)
    return disp
end

---@param removedEntity LuaEntity
---@param updateIfChanged boolean
---@overload fun()
---@overload fun(removedEntity:LuaEntity)
function DispClass:updateEntities(removedEntity, updateIfChanged)
    --[[DEBUG]]log("BEGIN updateEntities")
    local fullyRemoved = self.entity == removedEntity or not self.entity.valid
    local changed = false
    if self.stopEntity and (self.stopEntity == removedEntity or not self.stopEntity.valid or fullyRemoved) then
        -- find io and remove it
        if self.outputEntity and self.outputEntity.name == 'viirld2-io' then
            globalUnLinkDispEntity(self, self.outputEntity.unit_number)
            self.outputEntity.destroy()
            self.outputEntity = nil
        end
        globalUnLinkDispEntity(self, self.stopEntity.unit_number)
        self.stopEntity = nil
        if self._stopEntityLine then
            rendering.destroy(self._stopEntityLine)
            self._stopEntityLine = --[[---@type uint64]] nil
        end
        changed = true
    end
    if not self.stopEntity and not fullyRemoved then
        local stops = self.entity.surface.find_entities_filtered({
            name = "train-stop",
            position = self.entity.position,
            radius = 2.5,
        })
        ---@type LuaEntity
        local foundStopEntity
        for _, e in pairs(stops) do
            if e.valid and e ~= removedEntity then
                if not globalDispByEntity(e.unit_number) then
                    if foundStopEntity then
                        foundStopEntity = nil
                        break
                    end
                    foundStopEntity = e
                    break
                end
            end
        end
        if foundStopEntity then
            self.stopEntity = foundStopEntity
            globalLinkDispEntity(self, self.stopEntity.unit_number)
            self._stopEntityLine = rendering.draw_line {
                color = { 1, 1, 0 },
                width = 2,
                from = self.entity,
                to = self.stopEntity,
                surface = self.entity.surface,
                only_in_alt_mode = true,
                draw_on_ground = true,
                forces = { self.entity.force },
            }
            changed = true
        end
    end

    if self.outputEntity and (self.outputEntity == removedEntity or not self.outputEntity.valid or fullyRemoved) then
        globalUnLinkDispEntity(self, self.outputEntity.unit_number)
        self.outputEntity = nil
        changed = true
    end

    if fullyRemoved then
        globalRemoveDisp(self)
        changed = true
    end
    self:updateActive()
    if updateIfChanged and changed then
        self:update(false)
    end
    --[[DEBUG]]log("END updateEntities")
end

function DispClass:_updateOutput()
    if self.out == OUT_OFF or not self.entity.valid or not self.stopEntity or not self.stopEntity.valid then
        if self.outputEntity and self.outputEntity.name == 'viirld2-io' then
            globalUnLinkDispEntity(self, self.outputEntity.unit_number)
            self.outputEntity.destroy()
            self.outputEntity = nil
        end
        return
    end
    if not self.outputEntity then
        local output = self.entity.surface.create_entity {
            name = "viirld2-io",
            position = self.stopEntity.position,
            force = self.stopEntity.force
        }
        output.connect_neighbour({ target_entity = self.stopEntity, wire = defines.wire_type.red, target_circuit_id = defines.circuit_connector_id.constant_combinator })
        output.connect_neighbour({ target_entity = self.stopEntity, wire = defines.wire_type.green, target_circuit_id = defines.circuit_connector_id.constant_combinator })
        ;
        self.outputEntity = output
        globalLinkDispEntity(self, self.outputEntity.unit_number)
    end
    -- TODO добавить какую-то быструю проверку на то, что на самом деле не нужно обновлять. Типа кеш
    ---@type ConstantCombinatorParameters[]
    local out = {}
    local mover = self.mover
    local delivery = mover and mover.delivery
    if self.mode == MODE_BIDI then
        if delivery then
            if self.out == OUT_NEED_CONTENTS_NEG or self.out == OUT_NEED_CONTENTS_POS then
                local sign = --[[---@type number]] self.out ~= OUT_NEED_CONTENTS_POS and -1 or 1
                if delivery.provider == self then
                    for typeAndName, count in pairs(delivery.contents) do
                        out[#out + 1] = { index = #out + 1, count = count * sign, signal = typeAndNameToSignal(typeAndName) }
                    end
                end
            elseif self.out == OUT_EXCHANGE then
                local sign = delivery.provider == self and 1 or -1
                for typeAndName, count in pairs(delivery.contents) do
                    out[#out + 1] = { index = #out + 1, count = count * sign, signal = typeAndNameToSignal(typeAndName) }
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
        if table_size(self.deliveries) > 0 then
            out[#out + 1] = { index = #out + 1, count = table_size(self.deliveries), signal = { type = "virtual", name = "signal-D" } }
        end
    end
    (--[[---@type LuaConstantCombinatorControlBehavior]] self.outputEntity.get_control_behavior()).parameters = out
end

---@param dispEntity LuaEntity
function DispClass:_loadSettings(dispEntity)
    local settings, err = DispClass.parametersToSettings(
            (--[[---@type LuaConstantCombinatorControlBehavior]] dispEntity.get_control_behavior()).get_section(1)
    )
    if err then
        (--[[---@type LuaPlayer]]self.entity.last_user).print("Read settings error: " .. err)
    end
    if not settings then
        settings = {
            mode = MODE_OFF,
            out = OUT_OFF,
            signals = {},
            network = 0,
            comps = nil,
            priority = 0,
            autoItemsMin = nil,
            autoFluidMin = nil,
        }
    end
    clearDispSettings(self)
    for k, v in pairs(settings) do
        self[k] = v
    end
    globalSetDispActive(
            self,
            self.stopEntity and (self.mode == MODE_BIDI or self.mode == MODE_DEPOT or self.mode == MODE_CLEAN)
    )

    local net = globalGetOrAddNet(dispEntity.force.index, dispEntity.surface.index)
    if self.net ~= net then
        local oldNet = self.net
        self.net = net
        if oldNet then
            oldNet:removeDisp(self)
        end
        net:addDisp(self)
    end
end

---@param sets DispSettings
---@return boolean
function DispClass:setSets(sets)
    local params = DispClass.settingsToParameters(sets)
    -- [[DEBUG]]log("setSets at " .. var_dump(game.tick) .. ": " .. var_dump(params))
    if not params then
        (--[[---@type LuaPlayer]]self.entity.last_user).print("Can not save settings.")
        return false
    end
    local beh = --[[---@type LuaConstantCombinatorControlBehavior]] self.entity.get_control_behavior()
    beh.parameters = params
    self:_loadSettings(self.entity)
    return true
end

---@return DispSettings
function DispClass:getSets()
    return {
        mode = self.mode,
        out = self.out,
        flagUseSignals = self.flagUseSignals,
        flagUseEquals = self.flagUseEquals,
        flagTamp = self.flagTamp,
        flagTurnInserters = self.flagTurnInserters,
        flagCompounds = self.flagCompounds,
        flagLiquidation = self.flagLiquidation,
        signals = util.copy(self.signals),
        autoItemsMin = util.copy(self.autoItemsMin),
        autoFluidMin = util.copy(self.autoFluidMin),
        autoItemsNoProvide = self.autoItemsNoProvide,
        autoFluidNoProvide = self.autoFluidNoProvide,
        network = self.network,
        comps = self.comps,
        priority = self.priority,
    }
end

function DispClass:_updateLight()
    local color
    local hasError
    if self.entity and self.entity.valid then
        if self.stopEntity then
            if self.mode == MODE_BIDI then
                if self:dispIsSkipped() then
                    color = COLOR_ORANGE
                elseif self.request and table_size(self.request) > 0 then
                    if table_size(self.deliveries) > 1 or table_size(self.deliveries) == 1 and not self.mover then
                        color = COLOR_LIGHT_RED
                    else
                        color = COLOR_RED
                    end
                elseif table_size(self.deliveries) > 1 or table_size(self.deliveries) == 1 and not self.mover then
                    color = COLOR_YELLOW
                elseif self.provide and table_size(self.provide) > 0 then
                    color = COLOR_GREEN
                else
                    color = COLOR_WHITE
                end
                hasError = self.errorMask
            elseif self.mode == MODE_OFF then
                color = COLOR_DARK_GREEN
            elseif self.mode == MODE_DEPOT then
                -- depot
                if self.mover then
                    if self.mover.isFree then
                        color = COLOR_GREEN
                    elseif self.mover:isEmpty() then
                        color = COLOR_YELLOW
                    else
                        color = COLOR_LIGHT_RED
                    end
                else
                    color = COLOR_WHITE
                end
            else
                -- clean
                if self.mover then
                    color = COLOR_AQUA
                else
                    color = COLOR_WHITE
                end
            end
        else
            color = COLOR_DARK_RED
        end

    else
        color = COLOR_OFF
    end

    if self._lightColor ~= color then
        self._lightColor = color
        if self._lightColor == COLOR_OFF then
            if self._lightId then
                rendering.destroy(self._lightId)
                self._lightId = --[[---@type number]] nil
            end
        else
            if self._lightId then
                rendering.set_color(self._lightId, self._lightColor)
            else
                self._lightId = rendering.draw_sprite {
                    sprite = "viirld2_light",
                    tint = self._lightColor,
                    render_layer = "light-effect",
                    target = self.entity,
                    surface = self.entity.surface,
                }
            end
        end
    end
    if hasError then
        if not self._hasErrorId then
            self._hasErrorId = rendering.draw_sprite {
                sprite = "utility/status_not_working",
                target = self.entity,
                surface = self.entity.surface,
                x_scale = .6,
                y_scale = .45,
                target_offset = { 0, -.3 },
                render_layer = "light-effect",
            }
        end
    elseif self._hasErrorId then
        rendering.destroy(self._hasErrorId)
        self._hasErrorId = nil
    end
end

---@param makeDeliveries boolean
---@return number @ count of created deliveries
function DispClass:update(makeDeliveries)
    if self.turnedInserters and table_size(self.turnedInserters) > 0 then
        self:_turnInserters(true)
    end
    self:updateActive()
    self.lastUpdateTick = game.tick
    local deliveryCount = 0
    if self.mode == MODE_BIDI then
        self:_updateSignals()
        if makeDeliveries and not self:dispIsSkipped() then
            while self.request and self:_makeDelivery() do
                deliveryCount = deliveryCount + 1
                self:_updateSignals()
            end
        end
        self:updateVisual()
    elseif self.mode == MODE_DEPOT then
        if self.mover then
            -- todo проверить сеть поезда
            self.net:updateMoverFree(self.mover)
        end
        self:updateVisual()
    end
    return deliveryCount
end

---@return boolean
function DispClass:dispIsSkipped()
    if self.dispIsSkipped_tick ~= game.tick then
        self.dispIsSkipped_value = self.entity.get_merged_signal(SIG_SKIPPED, defines.circuit_connector_id.constant_combinator) ~= 0
        self.dispIsSkipped_tick = game.tick
    end
    return self.dispIsSkipped_value
end

---@return boolean
function DispClass:hasTrainSlot()
    return self.stopEntity.trains_limit == nil or self.stopEntity.trains_limit > table_size(self.deliveries)
end

---@param provider DispClass
---@param requester DispClass
---@param notCompoundTypeAndName TypeAndName @nullable
---@param ignoreMin boolean
---@param updatingContents table<TypeAndName, number>
---@return table<TypeAndName, number>, number, number @ contents, cargo stacks, fluids count
function DispClass:_getNeededExchange(provider, requester, notCompoundTypeAndName, ignoreMin, updatingContents)
    ---@type table<string, number>
    local contents
    local needCargoCells = 0
    local needFluids = 0
    if requester.request then
        local processingRequest = notCompoundTypeAndName and { [notCompoundTypeAndName] = requester.request[notCompoundTypeAndName] } or requester.request
        for typeAndName, reqSig in pairs(processingRequest) do
        --for typeAndName, reqSig in pairs(requester.request) do
            if not updatingContents or updatingContents[typeAndName] then
                local provSig = provider.provide[typeAndName]
                if provSig then
                    local valid
                    if ignoreMin or provider.flagLiquidation then
                        valid = reqSig._count < 0 and provSig._count > 0
                    else
                        local commonMin = math.max(reqSig._min, provSig._min)
                        valid = reqSig._request >= commonMin and provSig._provide >= commonMin
                    end
                    if valid then
                        contents = contents or {}
                        ---@type number
                        local count
                        if ignoreMin then
                            count = math.min(-reqSig._count, provSig._count)
                        elseif provider.flagLiquidation then
                            count = math.min(reqSig._request, provSig._count)
                        else
                            count = math.min(reqSig._request, provSig._provide)
                        end
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

---@param provider DispClass
---@param requester DispClass
---@param contents table<TypeAndName, number>
---@param needCargoCells number
---@param needFluids number
---@return MoverClass, number, number @nullable train, score, distance
function DispClass:_findBestMoverForExchange(provider, requester, contents, needCargoCells, needFluids)
    local net = requester.net
    ---@type TrainType, number
    local bestTrainType, bestScore
    for trainType, movers in pairs(net.freeMovers) do
        local trainExample = movers[next(movers)]
        if ((not provider.compFlags) or provider.compFlags[trainExample.comp])
                and ((not requester.compFlags) or requester.compFlags[trainExample.comp])
                and ((needCargoCells > 0 and trainExample.itemCapacity > 0) or (needFluids > 0 and #trainExample.fluidWagons > 0))
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
        ---@type number, MoverClass
        local bestDistance, bestMover
        for _, mover in pairs(net.freeMovers[bestTrainType]) do
            local distance = comparableDistance(--[[---@type _MapPosition1]]provider.stopEntity.position, --[[---@type _MapPosition1]]mover.train.front_stock.position)
            if bestDistance == nil or distance < bestDistance then
                bestMover = mover
                bestDistance = distance
            end
        end
        if bestMover then
            return bestMover, bestScore, bestDistance
        end
    end
    return nil, nil, nil
end

---@return boolean
function DispClass:_makeDelivery()
    local net = self.net
    local hasTrainSlot = self:hasTrainSlot()
    local added = false
    ---@type number
    local errorMask
    for typeAndName, reqState in pairs(self.request) do
        ---@type LocalisedString, LocalisedString
        local newError, newErrorTt
        if reqState._request > 0 then
            if hasTrainSlot then
                local headQI = net:rqFindHead(self.network, typeAndName)
                local selfQI = net:rqFindInQueue(typeAndName, self)
                -- [[DEBUG]]log(typeAndName .. "  headQI:" .. var_dump(headQI and headQI.disp.uid) .. "  selfQI:" .. var_dump(selfQI and selfQI.disp.uid) .. "  eq:" .. var_dump(selfQI and headQI.disp == selfQI.disp))
                if not headQI or (selfQI and headQI.disp == selfQI.disp) or (not selfQI and self.priority > headQI.disp.priority) then
                    -- Нет очереди или наша очередь, пытаемся добавить доставку
                    ---@type DispClass, MoverClass, number, number, number, table<string, number>
                    local bestProvider, bestMover, bestPriority, bestScore, bestDistance, bestContents
                    local hasProvider, hasMinProvide, hasTrain
                    local providers = net.provide[self.network] and net.provide[self.network][typeAndName]
                    if providers and table_size(providers) > 0 then
                        for _, provider in pairs(providers) do
                            if provider ~= self
                                    and provider.provide
                                    and provider.provide[typeAndName] and provider.provide[typeAndName]._provide > 0
                                    and provider:hasTrainSlot()
                                    and isCompatibleTrainCompositions(self.compFlags, provider.compFlags)
                                    and not provider:dispIsSkipped()
                            then
                                if not bestPriority or bestPriority <= provider.priority then
                                    hasProvider = true
                                    ---@type TypeAndName @nillable
                                    local notCompoundTypeAndName = (not self.flagCompounds or not provider.flagCompounds) and typeAndName or nil
                                    local contents, c, f = self:_getNeededExchange(provider, self, notCompoundTypeAndName, false, nil)
                                    if contents then
                                        hasMinProvide = true
                                        local mover, score, distance = self:_findBestMoverForExchange(provider, self, contents, c, f)
                                        if mover then
                                            hasTrain = true
                                            if not bestScore or bestScore < score or (bestScore == score and distance < bestDistance) then
                                                bestProvider = provider
                                                bestMover = mover
                                                bestPriority = provider.priority
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
                    if bestProvider then
                        local delivery = DeliveryClass:new(bestProvider, self, bestMover, bestContents, nil)
                        if delivery then
                            self:addDelivery(delivery)
                            bestProvider:addDelivery(delivery)
                            net:addDelivery(delivery)
                            bestMover:gotoToDelivery(delivery, false)
                            net:updateMoverFree(bestMover)
                            bestProvider:update(false)
                            added = true
                        end
                        net:rqRemoveFromQueue(typeAndName, self)
                    else
                        net:rqAddToQueue(typeAndName, self)
                        if not hasProvider then
                            newError = E_NO_PROVIDER
                        elseif not hasMinProvide then
                            newError = E_NO_MIN_PROVIDER
                        elseif not hasTrain then
                            newError = E_NO_TRAIN
                        end
                    end
                else
                    if not selfQI then
                        -- Нас нет в очереди, встаем в очередь
                        net:rqAddToQueue(typeAndName, self)
                    end
                    if headQI.disp.priority > self.priority then
                        newError = E_LOW_PRIORITY
                        newErrorTt = { "viirld-gui.low-priority-tt", headQI.disp.stopEntity.backer_name }
                    else
                        newError = E_IN_QUEUE
                        newErrorTt = { "viirld-gui.in-queue", headQI.disp.stopEntity.backer_name }
                    end
                end
            else
                newError = E_NO_TRAIN_SLOTS
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
    if self.errorMask ~= errorMask then
        self.errorMaskInvalid = nil
        self.errorMask = errorMask
    end
    return added
end

---@param delivery DeliveryClass
function DispClass:addDelivery(delivery)
    self.deliveries[delivery.uid] = delivery
    self:updateDeliveryChanges()
    self:updateVisual()
end

---@param delivery DeliveryClass
function DispClass:removeDelivery(delivery)
    self.deliveries[delivery.uid] = nil
    self:updateDeliveryChanges()
end

function DispClass:_updateSignals()
    if not self.net then
        --todo remove
        return
    end
    local dispSignals = self.signals
    for _, sig in pairs(dispSignals) do
        sig._request = 0
        sig._provide = 0
        sig._count = 0
    end
    local isValid = self.active
    if isValid then
        -- [[DEBUG]]log("_updateSignals() BEGIN")
        local combinatorSignals = self.entity.get_merged_signals(defines.circuit_connector_id.constant_combinator)
        -- [[DEBUG]]log(var_dump(self.uid) .. " at " .. var_dump(game.tick)  ..": _updateSignals(): combinatorSignals: " .. var_dump(combinatorSignals))
        if combinatorSignals then
            -- [[DEBUG]]log("_updateSignals(): combinatorSignals: " .. var_dump(combinatorSignals))
            local trainItemContents = self.mover and self.mover.train.get_contents()
            if countingInsertersContent and self.mover and self.inserters then
                for _, ins in pairs(self.inserters) do
                    if ins.valid and ins.held_stack.count > 0 then
                        local name = ins.held_stack.name
                        trainItemContents[name] = (trainItemContents[name] or 0) + ins.held_stack.count
                    end
                end
            end
            local trainFluidContents = self.mover and self.mover.train.get_fluid_contents()
            local bothWires = self.entity.get_circuit_network(defines.wire_type.green) and self.entity.get_circuit_network(defines.wire_type.red) and true or false
            for _, sig in pairs(combinatorSignals) do
                local typeAndName = toTypeAndName(sig.signal)
                local ss = dispSignals[typeAndName]
                if not ss then
                    if sig.signal.type == "item" and self.autoItemsMin ~= nil
                            or sig.signal.type == "fluid" and self.autoFluidMin ~= nil
                    then
                        ss = {
                            index = nil,
                            type = sig.signal.type,
                            name = sig.signal.name,
                            typeAndName = typeAndName,
                            request = nil, -- only by signal
                            min = nil, -- fills later
                            error = nil,
                            errorTt = nil,
                            errorTick = nil,
                            _min = 0, -- fills later
                            _provide = 0, -- fills later
                            _request = 0, -- fills later
                            _count = 0, -- fills later
                            _combinator = nil,
                            _noProvide = nil,
                            _used = true,
                        }
                        dispSignals[typeAndName] = ss
                    end
                end
                if ss then
                    --[[DEBUG]] ss._sig_count = sig.count
                    --[[DEBUG]] ss._train_count = trainItemContents and trainItemContents[typeAndName]
                    if not ss.index --[[ dynamic ]] then
                        ss.min = sig.signal.type == "item" and self.autoItemsMin or self.autoFluidMin
                        ss._noProvide = sig.signal.type == "item" and self.autoItemsNoProvide or self.autoFluidNoProvide
                        ss._min = (not self.flagLiquidation) and unitCalc(ss.min, ss.name) or 0
                        ss._used = true
                    else
                        if bothWires then
                            sig.count = sig.count - ss._combinator -- get_merged_signals() returns x2 for signals of combinator, correct it
                        end
                    end
                    --[[DEBUG]] ss._sig_count_corrected = sig.count
                    sig.count = sig.count + (self.deliveryChanges[typeAndName] or 0) -- correct by already delivering
                    if trainItemContents and ss.type == 'item' then
                        sig.count = sig.count + (trainItemContents[ss.name] or 0)
                    end
                    if trainFluidContents and ss.type == 'fluid' then
                        sig.count = sig.count + (trainFluidContents[ss.name] or 0)
                    end
                    ss._count = sig.count
                    local sum = math.abs(ss._count) >= ss._min and ss._count or 0
                    if ss.index then
                        if sum > 0 and not ss.request then
                            ss._provide = sum
                        elseif sum < 0 and ss.request and not self.flagLiquidation then
                            ss._request = -sum
                        end
                    else
                        if sum > 0 and not ss._noProvide then
                            ss._provide = sum
                        elseif sum < 0 and not self.flagLiquidation then
                            ss._request = -sum
                        end
                    end
                end
            end
        end
    end
    -- [[DEBUG]]log("_updateSignals(): dispSignals pre after: " .. var_dump(dispSignals))

    ---@type table<string, DispSignal>
    local provide, request
    for typeAndName, sig in pairs(dispSignals) do
        if not sig.index and not sig._used then
            if sig.error then
                self.errorMaskInvalid = true
            end
            dispSignals[typeAndName] = nil
        else
            sig._used = nil
            if sig._provide > 0 then
                provide = provide or {}
                provide[typeAndName] = sig
                if sig.error then
                    sig.error = nil
                    self.errorMaskInvalid = true
                end
            end
            if sig._request > 0 then
                request = request or {}
                request[typeAndName] = sig
            end
        end
    end
    self.provide = provide -- table<string, DispSignal>
    self.request = request

    self:_updateNetProvide()
    -- [[DEBUG]]log("_updateSignals(): dispSignals after: " .. var_dump(dispSignals))
    -- [[DEBUG]]log("_updateSignals() END")
end

function DispClass:_updateNetProvide()
    local provide = self.active and self.provide or nil
    if self.uid == 745716 then
        log("_updateNetProvide active " .. (self.active and "true" or "false"))
        log("_updateNetProvide provide " .. (provide and "true" or "false"))
    end
    if provide then
        for typeAndName, _ in pairs(provide) do
            local provideDisps = self.net.provide[self.network] and self.net.provide[self.network][typeAndName]
            if not provideDisps then
                if not self.net.provide[self.network] then
                    self.net.provide[self.network] = {}
                end
                provideDisps = {}
                self.net.provide[self.network][typeAndName] = provideDisps
            end
            provideDisps[self.uid] = self
        end
    end
    if self.net.provide[self.network] then
        for typeAndName, provideDisps in pairs(self.net.provide[self.network]) do
            if not self.provide or not self.provide[typeAndName] then
                provideDisps[self.uid] = nil
                if table_size(provideDisps) == 0 then
                    self.net.provide[self.network][typeAndName] = nil
                end
            end
        end
        if table_size(self.net.provide[self.network]) == 0 then
            self.net.provide[self.network] = nil
        end
    end
end

---@param from ConstantCombinatorParameters[]
---@return DispSettings, string|nil
function DispClass.parametersToSettings(from)
    from = from.filters
    local to = --[[---@type DispSettings]] {}
    ---@type ConstantCombinatorParameters
    local current
    local pos = 0

    ---@return ConstantCombinatorParameters
    ---@overload fun(): ConstantCombinatorParameters
    local function nextParam(pick)
        pos = pos + 1
        local cur = from[pos]
        if isValidParam(cur, SIG_ESC) then
            local m1 = cur.count
            pos = pos + 1
            cur = from[pos]
            cur = { signal = cur.signal, count = unpackD(m1, cur.count), index = cur.index }
            if pick then
                pos = pos - 1
            end
        end
        if pick then
            pos = pos - 1
        end
        return cur
    end

    -- Material signals
    local paddings = {}
    local signals = --[[---@type DispSignal[] ]] {}
    while true do
        current = nextParam()
        if not current or current.signal.type == "virtual" or not current.signal.name then
            if current and current.signal.name == SIG_ANY.name then
                current = nextParam()
            end
            break
        end

        -- Padding compensation
        local pad
        for _, p in pairs(paddings) do
            if p.name == current.signal.name and p.type == current.signal.type then
                pad = p
                break
            end
        end
        if not pad then
            pad = { name = current.signal.name, type = current.signal.type, count = 0 }
            paddings[#paddings + 1] = pad
        end
        pad.count = pad.count - current.count

        local signal = --[[---@type DispSignal]]{
            type = current.signal.type,
            name = current.signal.name,
            typeAndName = toTypeAndName(current.signal),
            _combinator = current.count,
        }
        signals[#signals + 1] = signal
    end


    -- Version
    -- current = nextParam()
    if not isValidParam(current, SIG_A) then
        if not isValidParam(current) then
            return nil, nil
        end
        return nil, "Version parse error"
    end
    local version = current.count
    if version ~= 2000 then
        return nil, "Bad version " .. tostring(version)
    end

    -- Mode and flags
    current = nextParam()
    if not isValidParam(current, SIG_A) then
        return nil, "Mode and flags parse error"
    end
    local modeAndFlags = current.count
    if modeAndFlags < 0 then
        return nil, "Bad mode and flags " .. tostring(modeAndFlags)
    end
    to.mode = bit32.band(modeAndFlags, MODE_MASK)
    if not MODES[to.mode] then
        return nil, "Bad mode " .. tostring(to.mode)
    end
    to.out = bit32.band(modeAndFlags, OUT_MASK)
    if not OUTS[to.out] then
        return nil, "Bad out mode " .. tostring(to.mode)
    end
    to.flagUseSignals = bit32.band(modeAndFlags, FLAG_USE_SIGNALS) ~= 0 and true or nil
    to.flagUseEquals = bit32.band(modeAndFlags, FLAG_USE_EQUALS) ~= 0 and true or nil
    to.flagTamp = bit32.band(modeAndFlags, FLAG_TAMP) ~= 0 and true or nil
    to.flagTurnInserters = bit32.band(modeAndFlags, FLAG_TURN_INSERTERS) ~= 0 and true or nil
    to.flagCompounds = bit32.band(modeAndFlags, FLAG_COMPOUNDS) ~= 0 and true or nil
    to.flagLiquidation = bit32.band(modeAndFlags, FLAG_LIQUIDATION) ~= 0 and true or nil
    to.autoItemsNoProvide = bit32.band(modeAndFlags, FLAG_AUTO_ITEMS_NO_PROVIDE) ~= 0 and true or nil
    to.autoFluidNoProvide = bit32.band(modeAndFlags, FLAG_AUTO_FLUID_NO_PROVIDE) ~= 0 and true or nil

    -- Network
    current = nextParam()
    if not isValidParam(current, SIG_A) then
        return nil, "Network parse error"
    end
    to.network = current.count
    if to.network < 0 then
        return nil, "Bad network " .. tostring(to.network)
    end


    -- Allowed trains compositions
    current = nextParam(true)
    if isValidParam(current, SIG_B) then
        current = nextParam()
        local compCode = current.count
        local compCodeLen = 30
        local function next3bit(noStopAtZero)
            local r = bit32.band(compCode, 0x7)
            compCode = bit32.rshift(compCode, 3)
            compCodeLen = compCodeLen - 3
            if compCodeLen == 0 and (noStopAtZero or r ~= 0) then
                current = nextParam()
                if not isValidParam(current, SIG_B) then
                    return nil, "Bad train compositions signal at pos " .. tostring(pos)
                end
                compCode = current.count
                compCodeLen = 30
            end
            --[[DEBUG]]log("next3bit " .. var_dump(r))
            return r
        end
        ---@type table<number, string>
        local compMap = {
            [1] = "L",
            [2] = "C",
            [3] = "F",
            [4] = "A",
            --5 - умножить (следующие 3 бита (+4) - это множитель этого вагона)
            --6 - умножить (следующие 6 бит (+4) - это множитель этого вагона)
            [7] = " ",
        }
        ---@type string[]
        local comp = {}
        local factor = 1
        while true do
            local b = next3bit(false)
            if b == 0 then
                break
            end
            if b == 5 then
                factor = next3bit(true) + 4
            elseif b == 6 then
                factor = next3bit(true)
                factor = bit32.lshift(factor, 3) + next3bit(true) + 12
            else
                local char = compMap[b]
                for _ = 1, factor do
                    comp[#comp + 1] = char
                end
                factor = 1
            end
        end
        to.comps = normalizeCompositions(table.concat(comp, ""))
    end

    -- Priority
    current = nextParam()
    if not isValidParam(current, SIG_A) then
        return nil, "Priority parse error"
    end
    to.priority = current.count / 1000

    ---@param param ConstantCombinatorParameters
    ---@param index number
    ---@return CountWithUnits, string
    local function paramToCountWithUnits(param, index)
        if not param then
            return nil, "CountWithUnits parse error at pos " .. tostring(index) .. ": empty"
        end
        --if param.index ~= index then
        --    return nil, "CountWithUnits parse error at pos " .. tostring(index) .. ": bad index"
        --end
        if param.signal.name == "signal-A" and param.signal.type == "virtual" and param.count == -1 then
            return nil, nil
        end
        if param.count < 0 then
            return nil, "CountWithUnits parse error at pos " .. tostring(index) .. ": bad count: " .. tostring(param.count)
        end
        local unitCode = getUnitBySignal(param.signal)
        if unitCode == nil then
            -- TODO may be need fallback?
            return nil, "CountWithUnits parse error at pos " .. tostring(index) .. ": unknown unit"
        end
        return { count = param.count / 100, unit = unitCode }, nil
    end

    ---@type CountWithUnits
    local currentAsCWU
    ---@type string
    local err

    -- Auto Min Items
    currentAsCWU, err = paramToCountWithUnits(nextParam(), pos)
    if err ~= nil then
        return nil, err
    end
    to.autoItemsMin = currentAsCWU

    -- Auto Min Fluid
    currentAsCWU, err = paramToCountWithUnits(nextParam(), pos)
    if err ~= nil then
        return nil, err
    end
    to.autoFluidMin = currentAsCWU

    to.signals = {}
    local signalIndex = 1
    for _, signal in pairs(signals) do
        current = nextParam()

        if current.signal.name == "signal-A" and current.signal.type == "virtual" and current.count < -1 then
            signalIndex = signalIndex + (-current.count) - 1
            current = nextParam()
        end

        signal.request, err = paramToCountWithUnits(current, pos)
        if err ~= nil then
            return nil, err
        end

        signal.min, err = paramToCountWithUnits(nextParam(), pos)
        if err ~= nil then
            return nil, err
        end
        signal._min = unitCalc(signal.min, signal.name) or 0
        signal.index = signalIndex
        to.signals[signal.typeAndName] = signal
        signalIndex = signalIndex + 1
    end

    for _, sig in pairs(from) do
        if sig and sig.signal and sig.signal.type and sig.signal.name then
            local pad
            for _, p in pairs(paddings) do
                if p.name == sig.signal.name and p.type == sig.signal.type then
                    pad = p
                    break
                end
            end
            if not pad then
                pad = { name = sig.signal.name, type = sig.signal.type, count = 0 }
                paddings[#paddings + 1] = pad
            end
            pad.count = pad.count + sig.count
        end
    end

    for _, p in pairs(paddings) do
        if p.count ~= 0 then
            while p.count < -2147483648 do
                p.count = p.count + 4294967296
            end
            while p.count > 2147483647 do
                p.count = p.count - 4294967296
            end
            if p.count ~= 0 then
                --log("Padding of " .. var_dump(p) .. " is not zero: " .. tostring(p.count))
                return nil, "Padding of " .. var_dump(p) .. " is not zero: " .. tostring(p.count)
            end
        end
    end
    return to, nil
end

---@param from DispSettings
---@overload fun(from: DispSettings)
---@return ConstantCombinatorParameters[] | nil
function DispClass.settingsToParameters(from)
    ---@type ConstantCombinatorParameters[]
    local to = {}

    ---@alias ConstantCombinatorParametersWoIndex { signal: SignalID, count: number, index: number | nil }
    ---@param param ConstantCombinatorParametersWoIndex
    local function put(param)
        if isInt32(param.count) then
            param.index = #to + 1
            to[#to + 1] = --[[---@type ConstantCombinatorParameters]]param
        else
            local m1, m2 = packD(param.count)
            to[#to + 1] = { signal = SIG_ESC, count = m1, index = #to + 1 }
            param.index = #to + 1
            param.count = m2
            to[#to + 1] = --[[---@type ConstantCombinatorParameters]]param
        end
    end

    ---@type DispSignal[]
    local indexedSignals = {}
    for _, sig in pairs(from.signals) do
        if sig.index then
            indexedSignals[#indexedSignals + 1] = sig
        end
    end
    table.sort(indexedSignals, function(a, b)
        return a.index < b.index
    end)

    -- Signals first for better visual
    for _, sig in pairs(indexedSignals) do
        if sig.index then
            local count = -(unitCalc(sig.request, sig.name) or 0)
            if count < -2147483648 then
                count = -2147483648
            elseif count > 2147483647 then
                count = 2147483647
            end
            put { signal = sig, count = count, _noPad = true }
        end
    end

    -- Можно добавить, если найдется способ отсортировать исходящие сигналы в информации о диспетчере
    --if from.autoItemsMin or from.autoFluidMin then
    --    put { signal = SIG_ANY, count = 0 }
    --end

    -- Version
    put { signal = SIG_A, count = 2000 }

    -- Mode and flags
    put {
        signal = SIG_A,
        count = from.mode + from.out
                + (from.autoItemsMin and FLAG_AUTO_ITEMS or 0)
                + (from.autoFluidMin and FLAG_AUTO_FLUID or 0)
                + (from.autoItemsNoProvide and FLAG_AUTO_ITEMS_NO_PROVIDE or 0)
                + (from.autoFluidNoProvide and FLAG_AUTO_FLUID_NO_PROVIDE or 0)
                + (from.flagUseSignals and FLAG_USE_SIGNALS or 0)
                + (from.flagUseEquals and FLAG_USE_EQUALS or 0)
                + (from.flagTamp and FLAG_TAMP or 0)
                + (from.flagTurnInserters and FLAG_TURN_INSERTERS or 0)
                + (from.flagCompounds and FLAG_COMPOUNDS or 0)
                + (from.flagLiquidation and FLAG_LIQUIDATION or 0),
    }

    -- Network
    put { signal = SIG_A, count = from.network or 0 }

    -- Allowed trains compositions
    if from.comps and #from.comps > 0 then
        local compCode = 0
        local compCodeLen = 0
        local function compFlush()
            if compCodeLen > 0 then
                put { signal = SIG_B, count = compCode }
                compCode = 0
                compCodeLen = 0
            end
        end
        ---@overload fun (n: number)
        local function compPut(n, forceFlush)
            --[[DEBUG]]log("compPut " .. tostring(n))
            compCode = bit32.bor(compCode, bit32.lshift(n, compCodeLen))
            compCodeLen = compCodeLen + 3
            if compCodeLen >= 30 or forceFlush then
                compFlush()
            end
        end
        ---@type table<string, number>
        local compMap = {
            ["L"] = 1,
            ["C"] = 2,
            ["F"] = 3,
            ["A"] = 4,
            --5 - умножить (следующие 3 бита (+4) - это множитель сл вагона)
            --6 - умножить (следующие 6 бит (+12) - это множитель сл вагона)
            [" "] = 7,
        }
        local factor = 0
        for i = 1, #from.comps do
            local char = from.comps:sub(i, i)
            local digit = tonumber(char, 10)
            if digit then
                factor = factor * 10 + digit
            else
                if factor <= 1 then
                    compPut(compMap[char])
                else
                    while factor > 0 do
                        if factor >= 12 then
                            local packed
                            if factor > 12 + 63 then
                                packed = 12 + 63
                            else
                                packed = factor
                            end
                            factor = factor - packed
                            packed = packed - 12
                            compPut(6)
                            compPut(bit32.rshift(packed, 3))
                            compPut(bit32.band(packed, 0x7))
                            compPut(compMap[char])
                        elseif factor >= 4 then
                            local packed
                            if factor > 4 + 7 then
                                packed = 4 + 7
                            else
                                packed = factor
                            end
                            factor = factor - packed
                            compPut(5)
                            compPut(packed - 4)
                            compPut(compMap[char])
                        else
                            compPut(compMap[char])
                            factor = factor - 1
                        end
                    end

                end
                factor = 0
            end
        end
        compPut(0, true)
    end

    -- Priority
    put { signal = SIG_A, count = from.priority * 1000 }

    ---@param countWithUnits CountWithUnits
    ---@return ConstantCombinatorParametersWoIndex
    local function countWithUnitsToParam(countWithUnits)
        if countWithUnits == nil then
            return { signal = getUnitsSignal(nil), count = -1 }
        end
        return { signal = getUnitsSignal(countWithUnits.unit), count = countWithUnits.count * 100 }
    end

    -- Auto Min Items
    put(countWithUnitsToParam(from.autoItemsMin))

    -- Auto Min Fluid
    put(countWithUnitsToParam(from.autoFluidMin))

    -- Signals other data
    local index = 1
    for _, sig in pairs(indexedSignals) do
        if sig.index > index then
            put { signal = SIG_A, count = -1 - (sig.index - index) }
            index = sig.index
        end
        put(countWithUnitsToParam(sig.request))
        put(countWithUnitsToParam(sig.min))
        index = index + 1
    end

    local paddings = {}
    for _, sig in pairs(to) do
        if sig._noPad then
            sig._noPad = nil
        else
            local foundPad
            for _, pad in pairs(paddings) do
                if pad.signal.name == sig.signal.name and pad.signal.type == sig.signal.type then
                    foundPad = pad
                    break
                end
            end
            if foundPad then
                foundPad.count = foundPad.count - sig.count
            else
                foundPad = { signal = sig.signal, count = -sig.count }
                paddings[#paddings + 1] = foundPad
            end
            while foundPad.count < -2147483648 do
                foundPad.count = foundPad.count + 4294967296
            end
            while foundPad.count > 2147483647 do
                foundPad.count = foundPad.count - 4294967296
            end
        end
    end

    if #paddings > 0 and paddings[1].signal.type ~= "virtual" then
        to[#to + 1] = { signal = SIG_A, count = 0, index = #to + 1 }
    end
    for _, pad in pairs(paddings) do
        if pad.count ~= 0 then
            pad.index = #to + 1
            to[#to + 1] = pad
        end
    end
    for _, sig in pairs(to) do
        if sig.count < -2147483648 or sig.count > 2147483647 then
            return nil
        end
    end
    return to
end

---@param entity LuaEntity
function DispClass.handleBuilt(entity)
    if entity.name == "viirld2-dispatcher" then
        local disp = DispClass:new(entity)
    else
        -- stop built
        local disps = entity.surface.find_entities_filtered({
            name = "viirld2-dispatcher",
            position = entity.position,
            radius = 2,
        })
        for _, disp in pairs(disps) do
            globalDispByEntity(disp.unit_number):updateEntities(nil, true)
        end
    end
end

---@param entity LuaEntity
function DispClass.handleRemoved(entity)
    if entity.name == "viirld2-dispatcher" then
        local disp = globalDispByEntity(entity.unit_number)
        if disp then
            local stopEntity = disp.stopEntity
            disp:updateEntities(entity, true)
            if stopEntity then
                local disps = entity.surface.find_entities_filtered({
                    name = "viirld2-dispatcher",
                    position = stopEntity.position,
                    radius = 2.5,
                })
                for _, e in pairs(disps) do
                    local d = globalDispByEntity(e.unit_number)
                    if d then
                        d:updateEntities(entity, true)
                    end
                end
            end
        end
    else
        -- stop removed
        local linkedDisp = globalDispByEntity(entity.unit_number)
        if linkedDisp then
            linkedDisp:updateEntities(entity, true)
        end
    end
end

function DispClass:updateVisual()
    if self.gui then
        self.gui:updateDispInfo()
    end
    if not self.entity.valid then
        return
    end
    self:_updateLight()
    self:_updateOutput()
end

function DispClass:fetchInserters()
    --self:_fetchInserters(self.stopEntity.get_stopped_train())
    --storage.fetchInserters[self.uid] = self
end

function DispClass:_fetchInserters()
    if self._texts then
        for _, v in pairs(self._texts) do
            rendering.destroy(v)
        end
    end
    self._texts = {}
    local train = self.stopEntity.get_stopped_train()
    if not train then
        --log("DispClass:_fetchInserters: no train")
        --alert("[train-stop=" .. tostring(self.stopEntity.unit_number) .. "] no train")
        return
    end
    --log("DispClass:_fetchInserters")
    --local train = self.stopEntity.train
    ---@type table<number, LuaEntity>
    local foundInserters
    local testedInserters = {}
    if train then
        for _, car in pairs(train.cargo_wagons) do
            local insertersOfCar = car.surface.find_entities_filtered({
                type = "inserter",
                position = car.position,
                radius = 6,
            })
            car.update_connections()
            for _, ins in pairs(insertersOfCar) do
                if ins.valid then
                    if not ins.drop_target then
                        -- may affect miniloaders
                        ins.drop_target = car
                    end
                    --ins.update_connections()
                    --ins.drop_target = car
                    --ins.drop_target = ins.drop_target
                    --local a = ins.drop_target
                    --ins.drop_target = a
                    testedInserters[ins.unit_number] = ins
                    --  or car.surface.find_entities_filtered({name = car.name, position = ins.drop_position, radius = .5}) == car
                    if ins.drop_target == car --[[or car.surface.find_entity(car.name, ins.drop_position) == car]] then
                        foundInserters = foundInserters or {}
                        foundInserters[ins.unit_number] = ins
                        foundInserters[-ins.unit_number] = nil
                    end
                    if not foundInserters or not foundInserters[ins.unit_number] then
                        if not ins.pickup_target then
                            ins.pickup_target = car
                        end
                        if ins.pickup_target == car --[[or car.surface.find_entity(car.name, ins.pickup_position) == car]]
                        then
                            foundInserters = foundInserters or {}
                            foundInserters[-ins.unit_number] = ins
                        end
                    end
                end
            end
        end
    end
    local fsize = foundInserters and table_size(foundInserters) or 0
    if fsize ~= self._foundInserters then
        self._foundInserters = fsize
        --alert("new TS [train-stop=" .. self.stopEntity.unit_number .. "]: " .. tostring(self._foundInserters))
    end
    if foundInserters then
        for _, ins in pairs(foundInserters) do
            self._texts[#self._texts + 1] = rendering.draw_text {
                surface = ins.surface,
                text = 'V',
                color = { 1, 0, 0 },
                target = ins
            }
        end
    end
    for _, ins in pairs(testedInserters) do
        self._texts[#self._texts + 1] = rendering.draw_text {
            surface = ins.surface,
            text = 'T',
            color = { 1, 0, 0 },
            target = ins
        }
    end
    self.inserters = foundInserters
end

---@param doReturn? boolean
---@param forcedReturn? boolean
function DispClass:_turnInserters(doReturn, forcedReturn)
    if doReturn then
        if self.turnedInserters then
            for k, ins in pairs(self.turnedInserters) do
                if ins.valid then
                    if forcedReturn or ins.held_stack.count == 0 then
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
    else
        local turnedInserters = self.turnedInserters
        if self.inserters and table_size(self.inserters) > 0 then
            for i, ins in pairs(self.inserters) do
                if i > 0 --[[ to wagon ]] then
                    if ins.valid then
                        if ins.held_stack.count > 0 then
                            turnedInserters = turnedInserters or {}
                            if not turnedInserters[ins.unit_number] then
                                swapInserter(ins, false)
                                turnedInserters[ins.unit_number] = ins
                            end
                        end
                    end
                end
            end
        end
        self.turnedInserters = turnedInserters
    end
end

function DispClass:updateDeliveryChanges()
    ---@type table<string, number)
    local changes = {}
    local currentDelivery = self.mover and self.mover.delivery
    for _, delivery in pairs(self.deliveries) do
        local mul
        if delivery.provider == self then
            if not delivery.providerPassed or delivery == currentDelivery then
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

---@param mover MoverClass
function DispClass:moverArrived(mover)
    self.mover = mover
    mover.disp = self
    --storage.fetchInserters = sglobal.fetchInserters or {}
    --storage.fetchInserters[self.uid] = self
    if self.mode == MODE_DEPOT then
        ---@type boolean
        local restoreSchedule
        if mover.net ~= self.net then
            -- todo тут нужно проверить что поезд без доставки, а если с доставкой то надо придумать что делать. может просто удалить
            mover.net:removeMover(mover.uid)
            mover.net = self.net
            mover.net:addMover(mover, nil)
            restoreSchedule = true
        end
        if self.compFlags == nil or self.compFlags[mover.comp] then
            if mover.depot ~= self.stopEntity.backer_name then
                mover.depot = self.stopEntity.backer_name
                restoreSchedule = true
            end
        else
            local newDepot = mover.net:findDepotForMover(mover)
            if newDepot then
                mover.depot = newDepot
                restoreSchedule = true
            else
                -- todo Alert: compatible depot is not found instead assign current depot
                restoreSchedule = true
            end
        end
        if mover.delivery then
            self.net:removeDelivery(mover.delivery)
            mover.delivery = nil
            restoreSchedule = true
        end
        if restoreSchedule then
            mover:_restoreDepotSchedule()
        end
        self:update(false)
    elseif self.mode == MODE_BIDI then
        --self:_restoreInserters(true)
        self:_fetchInserters()
        -- log("MOVER DELIVERY AT ARRIVAL "..var_dump_light(mover.delivery))
        --log("MOVER AT ARRIVAL "..mover)
        local delivery = mover.delivery
        if not delivery then
            alert("Поезд [train=" .. tostring(mover.train.front_stock.unit_number) .. "] приехал на станцию bidi [train-stop=" .. tostring(self.stopEntity.unit_number) .. "] без доставки", self.net.force)
            return
        end
        if not self.deliveries[delivery.uid] then
            alert("Поезд [train=" .. tostring(mover.train.front_stock.unit_number) .. "] приехал на станцию bidi [train-stop=" .. tostring(self.stopEntity.unit_number) .. "] с непонятной доставкой", self.net.force)
            return
        end
        local isValidLocation = (delivery.provider == self and not delivery.providerPassed)
                or (delivery.requester == self and delivery.providerPassed and not delivery.requesterPassed)
        if not isValidLocation then
            alert("Поезд [train=" .. tostring(mover.train.front_stock.unit_number) .. "] приехал на станцию bidi [train-stop=" .. tostring(self.stopEntity.unit_number) .. "] не по расписанию", self.net.force)
            return
        end
        if delivery.provider == self then
            delivery.providerPassed = true
        else
            delivery.requesterPassed = true
        end
        self.trainItemContents = mover.train.get_contents()
        self.trainFluidContents = mover.train.get_fluid_contents()
        self:updateDeliveryChanges()
    elseif self.mode == MODE_CLEAN then

    end
    self:updateVisual()
end

---@param mover MoverClass
function DispClass:moverDeparted(mover)
    self:_turnInserters(true, true)
    if self.mover ~= mover then
        alert("Поезд [train=" .. tostring(mover.train.front_stock.unit_number) .. "] уехал со станции bidi [train-stop=" .. tostring(self.stopEntity.unit_number) .. "], но на станции был другой", self.net.force)
        return
    end
    if self.mode == MODE_BIDI then
        local delivery = mover.delivery
        if not delivery then
            alert("Поезд [train=" .. tostring(mover.train.front_stock.unit_number) .. "] отъехал со станции bidi [train-stop=" .. tostring(self.stopEntity.unit_number) .. "] без доставки", self.net.force)
            return
        end
        if not self.deliveries[delivery.uid] then
            alert("Поезд [train=" .. tostring(mover.train.front_stock.unit_number) .. "] отъехал со станции bidi [train-stop=" .. tostring(self.stopEntity.unit_number) .. "] с непонятной доставкой", self.net.force)
            return
        end
        if delivery.provider == self and self.flagTurnInserters then
            self:_turnInserters()
        end
        self:removeDelivery(delivery)
        self.mover = nil
        mover.disp = nil
        self:updateVisual()
        if delivery and delivery.requesterPassed then
            self.net:removeDelivery(delivery)
            mover.delivery = nil
            mover:goToHome()
            delivery.requester.net:updateMoverFree(mover)
        end
        for i = 1, 2 do
            local arrContents = i == 1 and self.trainItemContents or self.trainFluidContents
            local depContents = i == 1 and mover.train.get_contents() or mover.train.get_fluid_contents()
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
    elseif self.mode == MODE_DEPOT or self.mode == MODE_CLEAN then
        if self.mover then
            self.mover.net:updateMoverFree(self.mover)
            self.mover.disp = nil
            self.mover = nil
            self:updateVisual()
            self.statTrains = (self.statTrains or 0) + 1
        end
    end
end

---@param fromEntity LuaEntity
---@param toEntity LuaEntity
function DispClass.handlePaste(fromEntity, toEntity)
    if toEntity.name == "viirld2-dispatcher" then
        local to = globalDispByEntity(toEntity.unit_number)
        if fromEntity.name == "viirld2-dispatcher" then
            local from = globalDispByEntity(fromEntity.unit_number)
            to:setSets(from)
            to:update(false)
        else
            to:setSets(to)
        end
    end
end

function DispClass:updateActive()
    self.active = self.entity and self.entity.valid
            and self.stopEntity
            and self.stopEntity.valid
            and (self.mode == MODE_BIDI or self.mode == MODE_DEPOT or self.mode == MODE_CLEAN)
    globalSetDispActive(self, self.active)
    if not self.active or self:dispIsSkipped() then
        self:_updateNetProvide()
        self.net:rqRemoveFromAllQueues(self)
    end
end
