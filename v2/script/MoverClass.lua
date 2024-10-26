---@alias MoverUid number @ Equals to train.id
---@alias TrainType string @ Encoded train type. locomotive/cargo-wagon*2

---@shape MoverInfoFromSchedule
    ---@field depot string
    ---@field delivery DeliveryUid @nullable
    ---@field surface SurfaceIndex @nullable

---@class MoverClass
    ---@field uid MoverUid @unique id of TrainOb. Equals train.id
    ---@field train LuaTrain @nullable - if train is building
    ---@field net NetClass
    ---@field depot string @ Name of last depot
    ---@field comp TrainComposition
    ---@field trainType TrainType
    ---@field itemCapacity number @ stacks
    ---@field fluidCapacity number
    ---@field fluidWagons number[] @ capacity of each wagon
    ---@field delivery DeliveryClass @nullable
    ---@field disp DispClass @nullable
    ---@field isFree boolean @ Is train is available to use for deliveries
    ---@field isModifying boolean @ for example by SE space elevator
    ---@field depotNameText number

MoverClass = --[[---@type MoverClass]] createClass("Mover")

function MoverClass:restoreClass()
    if self.delivery then
        restoreClass(self.net)
        restoreClass(self.delivery)
        restoreClass(self.disp)
    end
end

---@param train LuaTrain
---@return MoverInfoFromSchedule @nullable
function MoverClass.getTrainInfoFromSchedule(train)
    if train.schedule then
        for _, rec in pairs(train.schedule.records) do
            if rec.station then
                local surface
                local delivery
                if rec.wait_conditions then
                    for _, cond in pairs(rec.wait_conditions) do
                        if cond.type == "circuit"
                                and cond.condition and cond.condition.first_signal and cond.condition.first_signal.type == "fluid"
                                and cond.condition.constant
                        then
                            if cond.condition.first_signal.name == "viirld2-delivery-signal" then
                                delivery = cond.condition.constant
                            elseif cond.condition.first_signal.name == "viirld2-surface-signal" then
                                surface = cond.condition.constant
                            end
                        end
                    end
                end
                if surface then
                    if surface and not game.surfaces[surface] then
                        surface = nil
                    end
                    storage.deliveries = storage.deliveries or {} -- todo remove
                    if delivery and not storage.deliveries[delivery] then
                        delivery = nil
                    end
                    return {
                        depot = rec.station,
                        delivery = delivery,
                        surface = surface or train.front_stock.surface.index,
                    }
                end
            end
        end
    end
    return nil
end

---@param train LuaTrain
---@param moverInfo MoverInfoFromSchedule
---@return MoverClass
function MoverClass.handleCreate(train, moverInfo)
    local net = globalGetOrAddNet(train.front_stock.force.index, moverInfo.surface)
    local mover = MoverClass:new(train, net)
    storage.movers[mover.uid] = mover
    net:addMover(mover, moverInfo)
    mover:updateLabel()
    return mover
end

---@param trainIndex MoverUid
function MoverClass.handleRemove(trainIndex)
    local mover = storage.movers[trainIndex]
    if mover then
        mover.net:removeMover(trainIndex)
        storage.movers[trainIndex] = nil
        mover:updateLabel()
    end
end

---@param train LuaTrain
function MoverClass.handleArrival(train)
    local mover = storage.movers[train.id]
    local disp = globalDispByEntity(train.station.unit_number)
    if not mover and not disp then
        -- not our train at not our station
        return
    end
    if not disp then
        -- todo May be Alert train at unknown station
        return
    end
    if not mover then
        if disp.mode == MODE_DEPOT then
            local net = disp.net
            mover = MoverClass:new(train, disp.net)
            local depot = disp.stopEntity.backer_name
            storage.movers[mover.uid] = mover
            net:addMover(mover, nil)
            mover.depot = depot
            mover:_restoreDepotSchedule()
            -- todo handle arrival
        else
            -- todo May be Alert about unknown train at out station
            return
        end
    end
    disp:moverArrived(mover)
    mover:updateLabel()
end

---@param train LuaTrain
function MoverClass.handleDeparture(train)
    local mover = storage.movers[train.id]
    local disp = mover and mover.disp
    if not mover or not disp then
        -- not our train or not our station
        return
    end
    disp:moverDeparted(mover)
    mover:updateLabel()
end

---@param train LuaTrain
function MoverClass.handleScheduleChanged(train)
    local moverInfo = MoverClass.getTrainInfoFromSchedule(train)
    local mover = storage.movers[train.id]
    if moverInfo and mover then
        if moverInfo.surface ~= mover.net.surface.index then
            MoverClass.handleRemove(train.id)
            mover = MoverClass.handleCreate(train, moverInfo)
        end
        if mover.depot ~= moverInfo.depot then
            mover.depot = moverInfo.depot
        end
    elseif moverInfo and not mover then
        mover = MoverClass.handleCreate(train, moverInfo)
    elseif not moverInfo and mover then
        MoverClass.handleRemove(train.id)
    else
        return
    end
    -- todo check delivery
    mover:updateLabel()
end

---@param train LuaTrain
---@param net NetClass
---@return MoverClass
function MoverClass:new(train, net)
    ---@type string[]
    local trainType = {}
    ---@type string[]
    local trainTypeH = {}
    ---@type number, number
    local itemCapacity, fluidCapacity = 0, 0
    ---@type number[]
    local fluidWagons = {}
    ---@type string, number
    local prevName, count
    for _, ca in pairs(train.carriages) do
        if not prevName or prevName ~= ca.name then
            prevName = ca.name
            count = 1
            trainType[#trainType + 1] = ca.name
            trainTypeH[#trainTypeH + 1] = '[img=entity/' .. ca.name .. ']'
        elseif prevName == ca.name then
            count = count + 1
            -- todo optimize for many wagons
            trainType[#trainType] = ca.name .. "*" .. tostring(count)
            trainTypeH[#trainTypeH] = tostring(count) .. '[img=entity/' .. ca.name .. ']'
        end
        local proto = game.entity_prototypes[ca.name]
        if ca.type == "cargo-wagon" then
            itemCapacity = itemCapacity + (proto.get_inventory_size(defines.inventory.cargo_wagon) or 0)
        elseif ca.type == "fluid-wagon" then
            fluidCapacity = fluidCapacity + proto.fluid_capacity
            fluidWagons[#fluidWagons + 1] = proto.fluid_capacity
        end
    end
    return instanceClass(self, {
        uid = train.id,
        train = train,
        net = net,
        comp = getTrainComposition(train),
        trainType = table.concat(trainType, '/'),
        trainTypeH = table.concat(trainTypeH, ' '),
        itemCapacity = itemCapacity,
        fluidCapacity = fluidCapacity,
        fluidWagons = fluidWagons,
    })
end

---@return boolean
function MoverClass:isEmpty()
    return self.train.get_item_count() < 0.000001 and self.train.get_fluid_count() < 0.000001
end

---@param dir LuaEntity[]
---@return boolean
local function _isEnoughFuelInDir(dir)
    local energy = 0
    local need = minEnergyUseTrain
    for _, loco in pairs(dir) do
        local burner = loco.burner
        if burner then
            if #burner.inventory == 0 then
                return true
            end
            energy = energy + burner.remaining_burning_fuel
            if energy >= need then
                return true
            end
            for name, count in pairs(burner.inventory.get_contents()) do
                energy = energy + game.item_prototypes[name].fuel_value * count
                if energy >= need then
                    return true
                end
            end
        end
    end
    return false
end

---@return boolean
function MoverClass:isEnoughFuel()
    for _, dir in pairs(self.train.locomotives) do
        if table_size(dir) > 0 and not _isEnoughFuelInDir(dir) then
            return false
        end
    end
    return true
end

function MoverClass:updateLabel()
    local valid = storage.movers[self.uid]
    if valid then
        ---@type string
        local text = self.net.title .. "/" .. tostring(self.depot)

        if self._label --[[and rendering.is_valid(self._label)]] then
            rendering.set_text(self._label, text)
        else
            self._label = rendering.draw_text({
                text = text,
                surface = self.train.front_stock.surface,
                forces = { self.net.force },
                alignment = "center",
                target = self.train.front_stock,
                color = { 1, 1, 1 },
                only_in_alt_mode = true,
                use_rich_text = true,
            })
        end

    else
        if self._label then
            rendering.destroy(self._label)
        end
    end

end

function MoverClass:_restoreDepotSchedule()
    ---@type TrainScheduleRecord[]
    local records = { }
    ---@type DispClass
    local disp = self.train.station and globalDispByEntity(self.train.station.unit_number)
    if disp then
        if disp.mode == MODE_CLEAN then
            self:_appendClean(records, false, disp)
        end
    end
    self:_appendDepot(records)
    self.train.schedule = { current = 1, records = records }
end

function MoverClass:goToHome()
    if self:isEmpty() then
        self:goToDepot()
    else
        self:goToClean()
    end
end

function MoverClass:depotArrived()
    self.net:updateMoverFree(self)
    if not self:isEmpty() then
        self:goToClean(true)
        return
    end
end

---@param disps table<DispUid, DispClass>
---@return DispClass @nullable
function MoverClass:_getBestDisp(disps)
    ---@type DispClass, number
    local bestDisp, bestDistance
    if disps and table_size(disps) > 0 then
        local trainPosition = --[[---@type _MapPosition1]]self.train.front_stock.position
        for _, disp in pairs(disps) do
            if disp.net == self.net and (disp.compFlags == nil or disp.compFlags[self.comp]) then
                local distance = comparableDistance(--[[---@type _MapPosition1]]disp.stopEntity.position, trainPosition)
                if not bestDistance or distance < bestDistance then
                    bestDistance = distance
                    bestDisp = disp
                end
            end
        end
    end
    return bestDisp
end


---@return string @nullable
function MoverClass:_findDepotNameInSchedule()
    local schedule = --[[---@type TrainSchedule]]self.train.schedule
    if schedule then
        for _, r in pairs(schedule.records) do
            if r.station and r.wait_conditions then
                for _, w in pairs(r.wait_conditions) do
                    if w.type == depotScheduleType and w.ticks == depotScheduleTime then
                        return r.station
                    end
                end
            end
        end
    end
    return nil
end

---@param records TrainScheduleRecord[]
---@return boolean
---@overload fun (records: TrainScheduleRecord[], warning: boolean): boolean
function MoverClass:_appendDepot(records)
    local conditions = {
        {
            type = "circuit",
            compare_type = "or",
            condition = {
                comparator = "=",
                first_signal = { type = "fluid", name = "viirld2-surface-signal" },
                constant = self.net.surface.index,
            }
        },
    }
    if self.delivery then
        conditions[#conditions + 1] = {
            type = "circuit",
            compare_type = "or",
            condition = {
                comparator = "=",
                first_signal = { type = "fluid", name = "viirld2-delivery-signal" },
                constant = self.delivery.uid,
            }
        }
    end

    records[#records + 1] = {
        station = self.depot,
        wait_conditions = conditions
    }
    return true
end

---@param records TrainScheduleRecord[]
---@param warning boolean @ warning if clean is not found
---@param forcedDisp? DispClass @nullable
function MoverClass:_appendClean(records, warning, forcedDisp)
    local bestDisp = forcedDisp or self:_getBestDisp(self.net.cleanDisps)
    if not bestDisp then
        if warning then
            self.train.front_stock.force.print({ "viirld.err-clean-not-found", self.train.id })
        end
        return false
    end
    --records[#records + 1] = {
    --    rail = bestStop.entity.connected_rail,
    --    rail_direction = bestStop.entity.connected_rail_direction,
    --    wait_conditions = { { type = "time", compare_type = "and", ticks = 0, condition = nil } },
    --}
    if bestDisp.disp.flagUseSignals then
        records[#records + 1] = {
            station = bestDisp.stopEntity.backer_name,
            wait_conditions = {
                {
                    type = "circuit",
                    condition = {
                        first_signal = { type = "virtual", name = "signal-green" },
                        comparator = ">",
                        constant = 0,
                    },
                    compare_type = "and"
                }
            }
        }
    else
        records[#records + 1] = {
            station = bestDisp.stopEntity.backer_name,
            wait_conditions = {
                { type = "empty", compare_type = "and" }
            }
        }
    end
    return true
end


function MoverClass:goToDepot()
    --local dest = self.train.path_end_stop
    --if dest then
    --    local stop = self.net:getOrAddStop(dest)
    --    if stop and stop.isDepot
    --            and isCompatibleNetworks(stop.disp.networks, self.networks)
    --            and (stop.compFlags == nil or stop.compFlags[self.comp]) then
    --        return -- already going to depot
    --    end
    --end
    ---@type TrainScheduleRecord[]
    local records = { }
    self:_appendDepot(records, true)
    self.train.schedule = { current = 1, records = records }
end

---@param stayIfNoClean boolean
---@overload fun()
function MoverClass:goToClean(stayIfNoClean)
    local dest = self.train.path_end_stop
    if dest then
        local disp = globalDispByEntity(dest.unit_number)
        if disp and disp.mode == MODE_CLEAN
                and disp.net == self.net
                and (disp.compFlags == nil or disp.compFlags[self.comp]) then
            return -- already going to clean station
        end
    end
    ---@type TrainScheduleRecord[]
    local records = { }
    if stayIfNoClean then
        if not self:_appendClean(records, false) then
            return
        end
    else
        self:_appendClean(records, true)
    end
    self:_appendDepot(records, false)
    self.train.schedule = { current = 1, records = records }
end

---@param delivery DeliveryClass
---@param isCorrection boolean
function MoverClass:gotoToDelivery(delivery, isCorrection)
    local current = isCorrection and self.train.schedule.current or 1
    delivery.mover = self
    self.delivery = delivery
    --alert("Поезд [train=" .. tostring(self.train.front_stock.unit_number) .. "] получил доставку " .. var_dump(self.delivery.uid))
    --log("mover.uid: "..var_dump(self.uid))
    --log("mover.train.id: "..var_dump(self.train.id))
    --log("mover.train.front_stock.unit_number: "..var_dump(self.train.front_stock.unit_number))
    --log("from storage by train_id: ".. var_dump_light(storage.movers[self.train.id]))
    --log("from storage by unit number: ".. var_dump_light(storage.movers[self.train.front_stock.unit_number]))
    ---@type TrainScheduleRecord[]
    local records = { }
    for p = 1, 2 do
        local disp = p == 1 and delivery.provider or delivery.requester
        ---@type WaitCondition[]
        local conditions = { }
        if disp.flagUseSignals then
            conditions[#conditions + 1] = {
                type = "circuit",
                condition = {
                    first_signal = { type = "virtual", name = "signal-green" },
                    comparator = ">",
                    constant = 0,
                },
                compare_type = "and",
            }
        else
            if p == 1 then
                for typeAndName, count in pairs(delivery.contents) do
                    local comparator = disp.flagUseEquals and "=" or ">="
                    local signal = typeAndNameToSignal(typeAndName)
                    if typeAndNameIsItem(signal.type) then
                        conditions[#conditions + 1] = {
                            type = "item_count",
                            condition = {
                                first_signal = signal,
                                comparator = comparator,
                                constant = count,
                            },
                            compare_type = "and",
                        }
                    else
                        conditions[#conditions + 1] = {
                            type = "fluid_count",
                            condition = {
                                first_signal = signal,
                                comparator = comparator,
                                constant = count,
                            },
                            compare_type = "and",
                        }
                    end
                end
            else
                conditions[#conditions + 1] = {
                    type = "empty", compare_type = "and", condition = nil,
                }
            end
        end
        records[#records + 1] = {
            rail = disp.stopEntity.connected_rail,
            rail_direction = disp.stopEntity.connected_rail_direction,
            wait_conditions = { { type = "time", compare_type = "and", ticks = 0, condition = nil } },
        }
        records[#records + 1] = {
            station = disp.stopEntity.backer_name,
            wait_conditions = conditions
        }
    end
    self:_appendDepot(records, false)
    --log("Sched " .. var_dump_light(records))
    self.train.schedule = { current = current, records = records }
end

---@param surUid NetUid
---@param trainId MoverUid
function MoverClass.handleRemoved(surUid, trainId)
    local net = NetClass.ofSurfaceIndex(surUid, true)
    if net then
        net:removeTrain(trainId)
    end
end

function MoverClass:deconstruct()
    for _, car in pairs(self.train.carriages) do
        car.order_deconstruction(car.force)
    end
end

---@param depotName string
---@param color Color
function MoverClass:_updateNameAndColor(depotName, color)
    if self.depotNameText then
        if rendering.is_valid(self.depotNameText) then
            rendering.destroy(self.depotNameText)
        end
        self.depotNameText = nil
    end
    --[[if not self.depotNameText or rendering.get_text(self.depotNameText) ~= depotName then
        if self.depotNameText then
            rendering.destroy(self.depotNameText)
        end
        local loco = self.train.front_stock
        self.depotNameText = rendering.draw_text({
            text = depotName,
            surface = loco.surface,
            forces = {loco.force},
            alignment = "center",
            target = loco,
            color = {1, 1, 1},
            only_in_alt_mode = true,
        })
    end]]
    for _, locDir in pairs(self.train.locomotives) do
        for _, loc in pairs(locDir) do
            loc.color = color
        end
    end
end

---@param trainType TrainType
---@return LocalisedString
function MoverClass.trainTypeToStr(trainType)
    -- locomotive/cargo-wagon*2
    local r = string.gsub(string.gsub(string.gsub(trainType, "[^/*]*[a-zA-Z][^/*]*", function(name)
        return "[entity=" .. name .. "]"
    end), "/", ""), "*", "×")
    return r
end
