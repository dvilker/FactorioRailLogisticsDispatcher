---@alias TrainUid number
---@alias TrainType string @ Encoded train type. locomotive/cargo-wagon*2

---@class TrainClass
    ---@field uid TrainUid @unique id of TrainOb. Equals train.id
    ---@field valid boolean
    ---@field train LuaTrain @nullable - if train is building
    ---@field sur SurClass
    ---@field comp TrainComposition
    ---@field trainType TrainType
    ---@field delivery DeliveryClass|nil
    ---@field itemCapacity number @ stacks
    ---@field fluidCapacity number
    ---@field fluidWagons number[]
    ---@field stop StopClass @nullable
    ---@field networks Networks @ Networks of last depot
    ---@field isFree boolean @ Is train is available to use for deliveries
    ---@field depotNameText number
TrainClass = { }

---@param train LuaTrain
---@param sur SurClass
---@return TrainClass
function TrainClass:new(train, sur)
    ---@type string[]
    local trainType = {}
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
        elseif prevName == ca.name then
            count = count + 1
            trainType[#trainType] = ca.name .. "*" .. tostring(count)
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
        valid = true,
        train = train,
        sur = sur,
        comp = getTrainComposition(train),
        trainType = table.concat(trainType, '/'),
        itemCapacity = itemCapacity,
        fluidCapacity = fluidCapacity,
        fluidWagons = fluidWagons,
    })
end

---@param delivery DeliveryClass
function TrainClass:removeDeliveryFromTrain(delivery)
    if self.delivery == delivery then
        self.delivery = nil
    end
end

---@return boolean
function TrainClass:isEmpty()
    return self.train.get_item_count() < 0.000001 and self.train.get_fluid_count() < 0.000001
end

---@return boolean
---@overload fun():boolean
function TrainClass:isEnoughFuel()
    local energy = 0
    local need = minEnergyUseTrain
    for _, dir in pairs(self.train.locomotives) do
        for _, loco in pairs(dir) do
            local burner = loco.burner
            if burner then
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
    end
    return false
end


function TrainClass:depotArrived()
    local realFree = self:isEnoughFuel() and self:isEmpty()
    if self.isFree ~= realFree then
        self.sur:setTrainFree(self, realFree)
    end
    if not realFree then
        if not self:isEmpty() then
            self:goToClean(true)
        elseif not self:isEnoughFuel() then
            self:goToFuel(true)
        end
    end
end


function TrainClass:fuelArrived()
    if #self.train.schedule.records <= 1 then
        ---@type TrainScheduleRecord[]
        local records = { }
        self:_appendFuel(records, self.stop)
        self:_appendDepot(records, false)
        self.train.schedule = { current = 1, records = records }
    end
end

--- Train delivery ends
function TrainClass:goToHome()
    if self:isEmpty() then
        if self:isEnoughFuel() then
            self:goToDepot()
        else
            self:goToFuel()
        end
    else
        self:goToClean()
    end
end

---@param stops table<StopUid, StopClass>
---@return StopClass @nullable
function TrainClass:_getBestStop(stops)
    ---@type StopClass, number
    local bestStop, bestDistance
    if stops and table_size(stops) > 0 then
        local trainPosition = --[[---@type _MapPosition1]]self.train.front_stock.position
        for _, stop in pairs(stops) do
            if isCompatibleNetworks(stop.disp.networks, self.networks) and (stop.compFlags == nil or stop.compFlags[self.comp]) then
                local distance = comparableDistance(--[[---@type _MapPosition1]]stop.stopEntity.position, trainPosition)
                if not bestDistance or distance < bestDistance then
                    bestDistance = distance
                    bestStop = stop
                end
            end
        end
    end
    return bestStop
end

---@return string @nullable
function TrainClass:_findDepotNameInSchedule()
    local schedule = --[[---@type TrainSchedule]]self.train.schedule
    for _, r in pairs(schedule.records) do
        if r.station and r.wait_conditions then
            for _, w in pairs(r.wait_conditions) do
                if w.type == depotScheduleType and w.ticks == depotScheduleTime then
                    return r.station
                end
            end
        end
    end
    return nil
end

---@param records TrainScheduleRecord[]
---@param warning boolean @ warning if depot is not found
---@param forcedDepotName string
---@return boolean
---@overload fun (records: TrainScheduleRecord[], warning: boolean): boolean
function TrainClass:_appendDepot(records, warning, forcedDepotName)
    local depotName = forcedDepotName
    if not depotName then
        depotName = self:_findDepotNameInSchedule()
    end
    if not depotName then
        local bestStop = self:_getBestStop(self.sur.depotStops)
        if not bestStop then
            if warning then
                self.train.front_stock.force.print({"err-depot-not-found", self.train.id})
            end
            return false
        end
        depotName = bestStop.stopEntity.backer_name
    end
    --records[#records + 1] = {
    --    rail = bestStop.entity.connected_rail,
    --    rail_direction = bestStop.entity.connected_rail_direction,
    --    wait_conditions = { { type = "time", compare_type = "and", ticks = 0 } },
    --}
    records[#records + 1] = {
        station = depotName,
        wait_conditions = {
            { type = depotScheduleType, compare_type = "and", ticks = depotScheduleTime, }
        }
    }
    return true
end

---@param records TrainScheduleRecord[]
---@param warning boolean @ warning if clean is not found
function TrainClass:_appendClean(records, warning)
    local bestStop = self:_getBestStop(self.sur.cleanStops)
    if not bestStop then
        if warning then
            self.train.front_stock.force.print({"viirld.err-clean-not-found", self.train.id})
        end
        return false
    end
    --records[#records + 1] = {
    --    rail = bestStop.entity.connected_rail,
    --    rail_direction = bestStop.entity.connected_rail_direction,
    --    wait_conditions = { { type = "time", compare_type = "and", ticks = 0, condition = nil } },
    --}
    if bestStop.disp.flagUseSignals then
        records[#records + 1] = {
            station = bestStop.stopEntity.backer_name,
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
            station = bestStop.stopEntity.backer_name,
            wait_conditions = {
                { type = "empty", compare_type = "and" }
            }
        }
    end
    return true
end

---@param currentStop StopClass
---@param records TrainScheduleRecord[]
---@overload fun (records: TrainScheduleRecord[])
function TrainClass:_appendFuel(records, currentStop)
    local bestStop = currentStop or self:_getBestStop(self.sur.fuelStops)
    if not bestStop then
        return false
    end
    if not currentStop then
        records[#records + 1] = {
            rail = bestStop.stopEntity.connected_rail,
            rail_direction = bestStop.stopEntity.connected_rail_direction,
            wait_conditions = { { type = "time", compare_type = "and", ticks = 0, condition = nil } },
        }
    end
    if bestStop.disp.flagUseSignals then
        records[#records + 1] = {
            station = bestStop.stopEntity.backer_name,
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
            station = bestStop.stopEntity.backer_name,
            wait_conditions = {
                { type = "inactivity", ticks = fuelScheduleTime, compare_type = "and" }
            }
        }
    end
    return true
end

function TrainClass:goToDepot()
    self.sur:setTrainFree(self, self:isEnoughFuel() and self:isEmpty())
    --local dest = self.train.path_end_stop
    --if dest then
    --    local stop = self.sur:getOrAddStop(dest)
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
function TrainClass:goToClean(stayIfNoClean)
    self.sur:setTrainFree(self, false)
    local dest = self.train.path_end_stop
    if dest then
        local stop = self.sur:getOrAddStop(dest)
        if stop and stop.isClean
                and isCompatibleNetworks(stop.disp.networks, self.networks)
                and (stop.compFlags == nil or stop.compFlags[self.comp]) then
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

---@param stayIfNoClean boolean
---@overload fun()
function TrainClass:goToFuel(stayIfNoClean)
    self.sur:setTrainFree(self, false)
    local dest = self.train.path_end_stop
    if dest then
        local stop = self.sur:getOrAddStop(dest)
        if stop and stop.isFuel
                and isCompatibleNetworks(stop.disp.networks, self.networks)
                and (stop.compFlags == nil or stop.compFlags[self.comp]) then
            return -- already going to clean station
        end
    end
    ---@type TrainScheduleRecord[]
    local records = { }
    if stayIfNoClean then
        if not self:_appendFuel(records) then
            return
        end
    else
        self:_appendFuel(records)
    end
    self:_appendDepot(records, false)
    self.train.schedule = { current = 1, records = records }
end

---@param delivery DeliveryClass
---@param isCorrection boolean
function TrainClass:gotoToDelivery(delivery, isCorrection)
    local current = isCorrection and self.train.schedule.current or 1
    delivery.train = self
    self.delivery = delivery
    ---@type TrainScheduleRecord[]
    local records = { }
    for p = 1, 2 do
        local stop = p == 1 and delivery.provider or delivery.requester
        ---@type WaitCondition[]
        local conditions = { }
        if stop.disp.flagUseSignals then
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
                    local comparator = stop.disp.flagUseEquals and "=" or ">="
                    local signal = fromTypeAndNameToSignal(typeAndName)
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
                    type = "empty", compare_type = "and",
                }
            end
        end
        records[#records + 1] = {
            rail = stop.stopEntity.connected_rail,
            rail_direction = stop.stopEntity.connected_rail_direction,
            wait_conditions = { { type = "time", compare_type = "and", ticks = 0, condition = nil } },
        }
        records[#records + 1] = {
            station = stop.stopEntity.backer_name,
            wait_conditions = conditions
        }
    end
    self:_appendDepot(records, false)
    self.train.schedule = { current = current, records = records }
end

---@param surUid SurUid
---@param trainId TrainUid
function TrainClass.handleRemoved(surUid, trainId)
    local sur = SurClass.ofSurfaceIndex(surUid, true)
    if sur then
        sur:removeTrain(trainId)
    end
end

---@param train LuaTrain
function TrainClass.handleArrival(train)
    local sur = SurClass.ofSurfaceIndex(train.front_stock.surface.index, true)
    if sur then
        local stopEntity = train.station
        local stop = sur.stops[stopEntity.unit_number]
        if stop then
            stop:trainArrived(train)
        end
    end
end

---@param surUid SurUid
---@param trainEntity LuaTrain
function TrainClass.handleDeparture(trainEntity)
    local sur = SurClass.ofSurfaceIndex(trainEntity.front_stock.surface.index, true)
    if sur then
        local train = sur:getOrAddTrain(trainEntity, true)
        if train and train.stop then
            train.stop:trainDepart()
        end
    end
end

function TrainClass:deconstruct()
    for _, car in pairs(self.train.carriages) do
        car.order_deconstruction(car.force)
    end
end

---@param depotName string
---@param color Color
function TrainClass:_updateNameAndColor(depotName, color)
    if not self.depotNameText or rendering.get_text(self.depotNameText) ~= depotName then
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
    end
    for _, locDir in pairs(self.train.locomotives) do
        for _, loc in pairs(locDir) do
            loc.color = color
        end
    end
end


function TrainClass:assignDepot()
    self.networks = self.stop.disp.networks
    self:_updateNameAndColor(self.stop.stopEntity.backer_name, self.stop.stopEntity.color)
    ---@type TrainScheduleRecord[]
    local records = { }
    self:_appendDepot(records, false, self.stop.stopEntity.backer_name)
    self.train.schedule = { current = 1, records = records }
end

---@param trainType TrainType
---@return LocalisedString
function TrainClass.trainTypeToStr(trainType)
    -- locomotive/cargo-wagon*2
    local r = string.gsub(string.gsub(string.gsub(trainType, "[^/*]*[a-zA-Z][^/*]*", function(name)
        return "[entity=" .. name .. "]"
    end), "/", ""), "*", "×")
    return r
end
