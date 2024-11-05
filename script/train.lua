---@param train LuaTrain
---@return string|nil, DeliveryUid|nil
function trainParseSchedule(train)
    local schedule = train.schedule
    if schedule then
        for _, rec in ipairs(schedule.records) do
            if rec.wait_conditions and table_size(rec.wait_conditions) == 1 and rec.station and rec.station ~= "" then
                local wc = rec.wait_conditions[1]
                if wc.type == "circuit" and wc.condition.comparator == "="
                        and wc.condition.first_signal.type == "virtual" and wc.condition.first_signal.name == "viirld-delivery"
                        and wc.condition.constant then
                    return rec.station, wc.condition.constant
                end
            end
        end
    end
end

---@param train LuaTrain
---@param delivery DeliveryClass
---@param depotName string|nil
function trainUpdateSchedule(train, delivery, depotName)
    if not depotName or not delivery then
        local foundDepotName, foundDeliveryUid = trainParseSchedule(train)
        if foundDepotName and not depotName then
            depotName = foundDepotName
        end
        if foundDeliveryUid and not delivery then
            delivery = storage.deliveries[foundDeliveryUid]
        end
    end

    ---@type ScheduleRecord[]
    local recs = {}

    if delivery and delivery.provider and not delivery.providerPassedTick then
        ---@type WaitCondition[]
        local wc = {}
        if delivery.provider.settings.flagUseSignals then
            wc[#wc + 1] = {
                type = "circuit",
                condition = {
                    first_signal = { type = "virtual", name = "signal-green" },
                    comparator = ">",
                    constant = 0,
                },
                compare_type = "and",
            }
            wc[#wc + 1] = {
                type = "circuit",
                condition = {
                    first_signal = { type = "virtual", name = "signal-red" },
                    comparator = "=",
                    constant = 0,
                },
                compare_type = "and",
            }
        else
            for tnq, count in pairs(delivery.contents) do
                local comparator = delivery.provider.settings.flagUseEquals and "=" or ">="
                local signal = parseTypeNameQuality(tnq)
                if signal.type == "item" then
                    wc[#wc + 1] = {
                        type = "item_count",
                        condition = {
                            first_signal = signal,
                            comparator = comparator,
                            constant = count,
                        },
                        compare_type = "and",
                    }
                elseif signal.type == "fluid" then
                    wc[#wc + 1] = {
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
        end
        recs[#recs + 1] = {
            station = delivery.provider.stopName,
            wait_conditions = wc,
            temporary = true,
        }
    end

    if delivery and delivery.requester and not delivery.requesterPassedTick then
        local wc = {}
        if delivery.provider.settings.flagUseSignals then
            wc[#wc + 1] = {
                type = "circuit",
                condition = {
                    first_signal = { type = "virtual", name = "signal-green" },
                    comparator = ">",
                    constant = 0,
                },
                compare_type = "and",
            }
            wc[#wc + 1] = {
                type = "circuit",
                condition = {
                    first_signal = { type = "virtual", name = "signal-red" },
                    comparator = "=",
                    constant = 0,
                },
                compare_type = "and",
            }
        else
            wc[#wc + 1] = {
                type = "empty",
                compare_type = "and",
            }
        end
        recs[#recs + 1] = {
            station = delivery.requester.stopName,
            wait_conditions = wc,
            temporary = true,
        }
    end

    recs[#recs + 1] = {
        station = depotName,
        wait_conditions = {
            {
                type = "circuit",
                compare_type = "and",
                condition = {
                    first_signal = { type = "virtual", name = "viirld-delivery" },
                    comparator = "=",
                    constant = delivery and delivery.uid or nil,
                    second_signal = (not delivery) and {} or nil,
                }
            }
        },
    }

    train.schedule = {
        current = 1,
        records = recs,
    }
end

---@param train LuaTrain
---@param forceRemove boolean|nil
function trainUpdateStation(train, forceRemove)
    local exists = storage.trainStation[train.id]

    if forceRemove or not train.station or (exists and train.station ~= exists.station) then
        if exists then
            exists.text.destroy()
            storage.trainStation[train.id] = nil
            trainDeparted(train, exists.station)
        end
    end

    if train.station and not forceRemove then
        storage.trainStation[train.id] = {
            station = train.station,
            text = rendering.draw_text {
                text = tostring(train.id),
                target = train.station,
                surface = train.front_stock.surface,
                color = { 255, 255, 255 },
            }
        }
        trainArrived(train)
    end
end

---@param train LuaTrain
function trainArrived(train)
    local disp = storage.disps[train.station.unit_number]
    if not disp then
        return
    end
    dispTurnInserters(disp, true, true)
    disp.stoppedTrain = train
    ---@type TrainTypeInfo
    local trainTypeInfo
    disp.stoppedTrainType, trainTypeInfo = getTrainType(train)

    disp.statTrains = (disp.statTrains or 0) + 1

    dispFindInserters(disp)

    ---@type DeliveryClass
    local deli

    local _, deliveryUid = trainParseSchedule(train)
    if deliveryUid then
        deli = disp.deliveries[deliveryUid]
        if deli then
            disp.delivery = deli
            dispStatDelivery(disp, true)
            if deli.provider == disp then
                if deli.providerPassedTick then
                    disp.entity.force.print({ "viirld.ERR_MSG-TRAIN_ARRIVED_PROVIDER_TWICE", disp.stopEntity.unit_number })
                end
                if correctScheduleAtProvider then
                    -- todo возможно перенести это в обновление станции
                    local corrected = false
                    for tnq, count in pairs(deli.contents) do
                        local requestBalance = 0
                        local requestDispSignal = deli.requester.signals[tnq]
                        if requestDispSignal then
                            requestBalance = requestDispSignal.balance
                        end
                        local provideBalance = 0
                        local provideDispSignal = deli.provider.signals[tnq]
                        if provideDispSignal then
                            provideBalance = provideDispSignal.balance
                        end
                        local signal = requestDispSignal or provideDispSignal or parseTypeNameQuality(tnq)
                        local newCount
                        if signal.type == "item" then
                            -- todo fix for compound deliveries
                            newCount = math.min(
                                    count - math.min(0, requestBalance),
                                    provideBalance + count,
                                    trainTypeInfo.itemCapacity * prototypes.item[signal.name].stack_size
                            )
                        elseif signal.type == "fluid" then
                            newCount = math.min(
                                    count - math.min(0, requestBalance),
                                    provideBalance + count,
                                    trainTypeInfo.fluidCapacity
                            )
                        end
                        if newCount and newCount ~= count then
                            deli.contents[tnq] = newCount
                            corrected = true
                        end
                    end
                    if corrected then
                        dispUpdateTransit(deli.requester, true)
                        trainUpdateSchedule(train, deli)
                    end
                end
                deli.providerPassedTick = game.tick
                disp.deliveries[deli.uid] = nil
            elseif deli.requester == disp then
                if not deli.providerPassedTick then
                    disp.entity.force.print( { "viirld.ERR_MSG-TRAIN_ARRIVED_REQUESTER_WO_PROVIDER", disp.stopEntity.unit_number })
                end
                if deli.requesterPassedTick then
                    disp.entity.force.print({ "viirld.ERR_MSG-TRAIN_ARRIVED_REQUESTER_TWICE", disp.stopEntity.unit_number })
                end
                deli.requesterPassedTick = game.tick
                disp.deliveries[deli.uid] = nil
                storage.deliveries[deli.uid] = nil
            end
        elseif disp.settings.modeEndpoint then
            disp.entity.force.print({ "viirld.ERR_MSG-UNKNOWN_DELIVERY" , deliveryUid, disp.stopEntity.unit_number })
        end
    end

    if disp.settings.modeDepot then
        if deli then
            disp.entity.force.print({ "viirld.ERR_MSG-UNEXPECTED_DEPOT", disp.stopEntity.unit_number })
        else
            train.schedule = {
                current = 1,
                records = {
                    {
                        station = disp.stopName,
                        wait_conditions = {
                            {
                                type = "circuit",
                                condition = {
                                    first_signal = { type = "virtual", name = "viirld-delivery" },
                                    second_signal = {},
                                    comparator = "=",
                                },
                                compare_type = "and",
                            },
                        },
                    }
                },
            }
        end
    end
    dispUpdate(disp, false, true, true)
end

---@param train LuaTrain
---@param fromStation LuaEntity
function trainDeparted(train, fromStation)
    if not fromStation.valid then
        return
    end
    local disp = storage.disps[fromStation.unit_number]
    if not disp then
        return
    end
    if disp.stoppedTrain ~= train then
        --[[DEBUG]] game.print("RLD Error: Mismatch train " .. var_dump(fromStation))
    end
    disp.stoppedTrain = nil
    disp.stoppedTrainType = nil
    if disp.delivery and disp == disp.delivery.provider then
        local newDeliveryContents = {}
        for _, tnqCount in pairs(train.get_contents()) do
            newDeliveryContents[toTypeNameQuality(tnqCount)] = tnqCount.count
        end
        for name, count in pairs(train.get_fluid_contents()) do
            newDeliveryContents[toTypeNameQuality({ type = "fluid", name = name })] = count
        end
        disp.delivery.contents = newDeliveryContents
        dispUpdateTransit(disp.delivery.requester, true)
        if disp.settings.flagTurnInserters and disp.inserters then
            dispTurnInserters(disp)
        end
    end
    dispStatDelivery(disp, false)
    disp.delivery = nil

    dispUpdate(disp, false, false, true)
end

---@param train LuaTrain
---@return boolean
function trainIsEmpty(train)
    return train.get_item_count() < 0.000001 and train.get_fluid_count() < 0.000001
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
            for _, i in pairs(burner.inventory.get_contents()) do
                energy = energy + prototypes.item[i.name].fuel_value * i.count
                if energy >= need then
                    return true
                end
            end
        end
    end
    return false
end

---@param train LuaTrain
---@return boolean
function trainIsEnoughFuel(train)
    for _, dir in pairs(train.locomotives) do
        if table_size(dir) > 0 and not _isEnoughFuelInDir(dir) then
            return false
        end
    end
    return true
end
