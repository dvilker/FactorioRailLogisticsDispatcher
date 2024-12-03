---@param disp DispClass
---@param stopEntity LuaEntity
local function dispConnectStop(disp, stopEntity)
    if disp.stopEntity ~= stopEntity then
        disp.stopEntity = stopEntity
        disp.stopPosition = stopEntity.position -- todo update if train stop teleportation
        dispUpdateStopName(disp)
        disp.stopName = stopEntity.backer_name

        storage.disps[disp.stopEntity.unit_number] = disp
        _dispUpdateActive(disp)
        disp._stopEntityLine = rendering.draw_line {
            color = { 1, 1, 0 },
            width = 2,
            from = disp.entity,
            to = disp.stopEntity,
            surface = disp.entity.surface,
            only_in_alt_mode = true,
            draw_on_ground = true,
            forces = { disp.entity.force },
        }
    end
end

---@param disp DispClass
local function dispDisconnectStop(disp)
    storage.disps[disp.stopEntity.unit_number] = nil
    disp.stopEntity = nil
    disp.stopPosition = nil
    disp.stopName = nil
    _dispUpdateActive(disp)
    if disp._stopEntityLine then
        disp._stopEntityLine.destroy()
    end
end

---@param disp DispClass
---@param removingStop LuaEntity|nil
local function dispUpdateStop(disp, removingStop)
    local stops = disp.entity.surface.find_entities_filtered({
        type = "train-stop",
        position = disp.entity.position,
        radius = 2,
    })

    ---@type LuaEntity
    local foundStopEntity
    local foundCount = 0
    for _, e in pairs(stops) do
        if e.valid and e ~= removingStop then
            foundCount = foundCount + 1
            foundStopEntity = e
        end
    end
    if disp.stopEntity and (foundCount ~= 1 or disp.stopEntity ~= foundStopEntity) then
        dispDisconnectStop(disp)
    end
    if foundCount == 1 and disp.stopEntity ~= foundStopEntity then
        local anotherDisp = storage.disps[foundStopEntity.unit_number]
        if anotherDisp then
            dispDisconnectStop(anotherDisp)
        else
            dispConnectStop(disp, foundStopEntity)
            local stoppedTrain = disp.stopEntity and disp.stopEntity.get_stopped_train()
            if stoppedTrain then
                trainArrived(stoppedTrain)
            end
        end
    end
end

---@param settings DispSettings
---@param combinator LuaEntity
function dispSettingsToCombinator(settings, combinator)
    local conds = {}
    conds[#conds + 1] = {
        comparator = "=",
        compare_type = "and",
        constant = 2000,
    }
    local flags = 0
    flags = bit32.bor(flags, settings.modeEndpoint and bit32.lshift(1, 0) or 0)
    flags = bit32.bor(flags, settings.modeDepot and bit32.lshift(1, 1) or 0)
    flags = bit32.bor(flags, settings.outExchangeCounts and bit32.lshift(1, 2) or 0)
    flags = bit32.bor(flags, settings.outTargetCounts and bit32.lshift(1, 3) or 0)
    flags = bit32.bor(flags, settings.outNegate and bit32.lshift(1, 4) or 0)
    flags = bit32.bor(flags, settings.flagUseSignals and bit32.lshift(1, 5) or 0)
    flags = bit32.bor(flags, settings.flagUseEquals and bit32.lshift(1, 6) or 0)
    flags = bit32.bor(flags, settings.flagTurnInserters and bit32.lshift(1, 7) or 0)
    flags = bit32.bor(flags, settings.flagItemCompounds and bit32.lshift(1, 8) or 0)
    flags = bit32.bor(flags, settings.flagFluidCompounds and bit32.lshift(1, 9) or 0)
    flags = bit32.bor(flags, settings.flagLiquidation and bit32.lshift(1, 10) or 0)
    flags = bit32.bor(flags, settings.allowAnyItemProvide and bit32.lshift(1, 11) or 0)
    flags = bit32.bor(flags, settings.allowAnyItemRequest and bit32.lshift(1, 12) or 0)
    flags = bit32.bor(flags, settings.allowAnyFluidProvide and bit32.lshift(1, 13) or 0)
    flags = bit32.bor(flags, settings.allowAnyFluidRequest and bit32.lshift(1, 14) or 0)
    flags = bit32.bor(flags, settings.stationTemplate and settings.stationTemplate ~= "" and bit32.lshift(1, 15) or 0)

    conds[#conds + 1] = {
        comparator = "=",
        compare_type = "and",
        first_signal = {
            name = "signal-B",
            type = "virtual"
        },
        constant = flags,
    }

    setCombinatorDescription(combinator, settings.stationTemplate or "")

    if settings.minAnyItem then
        conds[#conds + 1] = {
            comparator = getUnitsCombinatorCode(settings.minAnyItem.unit),
            compare_type = "and",
            first_signal = {
                name = "signal-I",
                type = "virtual"
            },
            constant = math.floor(settings.minAnyItem.count * 100),
        }
    end

    if settings.minAnyFluid then
        conds[#conds + 1] = {
            comparator = getUnitsCombinatorCode(settings.minAnyFluid.unit),
            compare_type = "and",
            first_signal = {
                name = "signal-F",
                type = "virtual"
            },
            constant = math.floor(settings.minAnyFluid.count * 100),
        }
    end

    if settings.minTrainLength then
        conds[#conds + 1] = {
            comparator = ">",
            compare_type = "and",
            first_signal = {
                name = "signal-L",
                type = "virtual"
            },
            constant = settings.minTrainLength,
        }
    end

    if settings.maxTrainLength then
        conds[#conds + 1] = {
            comparator = "<",
            compare_type = "and",
            first_signal = {
                name = "signal-L",
                type = "virtual"
            },
            constant = settings.maxTrainLength,
        }
    end

    conds[#conds + 1] = {
        comparator = "=",
        compare_type = "and",
        first_signal = {
            name = "signal-N",
            type = "virtual"
        },
        constant = settings.network,
    }

    local itemsByIndex = {}
    for _, item in pairs(settings.items) do
        itemsByIndex[item.index] = item
    end

    ---@type table<string, CountWithUnits>
    local currentRequestMin = {}
    local expectedIndex = 1
    for _, item in pairs(itemsByIndex) do
        if item.index > expectedIndex then
            conds[#conds + 1] = {
                comparator = "=",
                compare_type = "and",
                first_signal = {
                    name = "signal-G",
                    type = "virtual"
                },
                constant = item.index - expectedIndex,
            }
            expectedIndex = item.index
        elseif item.index < expectedIndex then
            error("item.index < expectedIndex, items not sorted by index?")
        end
        expectedIndex = expectedIndex + 1
        if not equalCountWithUnits(currentRequestMin[item.type], item.requestMin) then
            currentRequestMin[item.type] = item.requestMin
            conds[#conds + 1] = {
                comparator = item.requestMin and getUnitsCombinatorCode(item.requestMin.unit) or "=",
                compare_type = "and",
                first_signal = {
                    name = "signal-M",
                    type = "virtual"
                },
                first_signal_networks = {
                    green = item.type == "item",
                    red = false,
                },
                constant = item.requestMin and math.floor(item.requestMin.count * 100) or nil,
                second_signal = (not item.requestMin) and {} or nil
            }
        end
        conds[#conds + 1] = {
            comparator = getUnitsCombinatorCode(item.request and item.request.unit or defaultUnit),
            compare_type = "and",
            first_signal = {
                name = item.name,
                type = item.type,
                quality = item.quality,
            },
            first_signal_networks = {
                green = item.allowProvide or false,
                red = item.allowRequest or false,
            },
            constant = item.request and math.floor(item.request.count * 100) or nil,
            second_signal = (not item.request) and {} or nil
        }
    end
    conds[#conds + 1] = {
        comparator = "≠",
        compare_type = "or",
        constant = -2000,
    }

    ---@type LuaDeciderCombinatorControlBehavior
    local b = combinator.get_or_create_control_behavior()
    b.parameters = {
        conditions = conds,
        outputs = {},
    }
end

---@param combinator LuaEntity
---@return DispSettings|nil, string, boolean
function dispCombinatorToSettings(combinator)
    ---@type LuaDeciderCombinatorControlBehavior
    local b = combinator.get_or_create_control_behavior()
    if not b or not b.parameters or not b.parameters.conditions or table_size(b.parameters.conditions) == 0 then
        return nil, "No conditions"
    end
    if table_size(b.parameters.conditions) == 1 then
        local cond = b.parameters.conditions[1]
        if cond.constant == 0 and not cond.first_signal then
            return nil, "Empty", true
        end
    end
    ---@type DispSettings
    local settings = {
        items = {}
    }
    local flagParsed = false
    local lastCondI = #b.parameters.conditions

    local currentItemIndex = 1
    ---@type table<string, CountWithUnits>
    local currentRequestMin = {}
    for i, cond in ipairs(b.parameters.conditions) do
        if cond.second_signal then
            return nil, "Has second signal"
        end
        if i == 1 then
            if not cond.constant or cond.constant ~= 2000 or cond.compare_type ~= "and" then
                return nil, "First cond is not 2000"
            end
        elseif i == lastCondI then
            if not cond.constant or cond.constant ~= -2000 or cond.first_signal or (cond.comparator ~= "=" and cond.comparator ~= "≠") then
                return nil, "Last cond is not empty=-2000 " .. cond.comparator
            end
        elseif cond.first_signal and cond.first_signal.type == "virtual" and cond.first_signal.name == "signal-B" then
            if flagParsed then
                return nil, "Flags defined twice"
            end
            if cond.comparator ~= "=" or not cond.constant and cond.constant <= 0 then
                return nil, "Flags comparator is not '=' or <= 0 or empty"
            end
            flagParsed = true
            local flags = cond.constant
            settings.modeEndpoint = bit32.band(flags, bit32.lshift(1, 0)) > 0 or nil
            settings.modeDepot = bit32.band(flags, bit32.lshift(1, 1)) > 0 or nil
            settings.outExchangeCounts = bit32.band(flags, bit32.lshift(1, 2)) > 0 or nil
            settings.outTargetCounts = bit32.band(flags, bit32.lshift(1, 3)) > 0 or nil
            settings.outNegate = bit32.band(flags, bit32.lshift(1, 4)) > 0 or nil
            settings.flagUseSignals = bit32.band(flags, bit32.lshift(1, 5)) > 0 or nil
            settings.flagUseEquals = bit32.band(flags, bit32.lshift(1, 6)) > 0 or nil
            settings.flagTurnInserters = bit32.band(flags, bit32.lshift(1, 7)) > 0 or nil
            settings.flagItemCompounds = bit32.band(flags, bit32.lshift(1, 8)) > 0 or nil
            settings.flagFluidCompounds = bit32.band(flags, bit32.lshift(1, 9)) > 0 or nil
            settings.flagLiquidation = bit32.band(flags, bit32.lshift(1, 10)) > 0 or nil
            settings.allowAnyItemProvide = bit32.band(flags, bit32.lshift(1, 11)) > 0 or nil
            settings.allowAnyItemRequest = bit32.band(flags, bit32.lshift(1, 12)) > 0 or nil
            settings.allowAnyFluidProvide = bit32.band(flags, bit32.lshift(1, 13)) > 0 or nil
            settings.allowAnyFluidRequest = bit32.band(flags, bit32.lshift(1, 14)) > 0 or nil
            local internalFlagHasStationTemplate = bit32.band(flags, bit32.lshift(1, 15)) > 0 or nil

            if internalFlagHasStationTemplate then
                settings.stationTemplate = getCombinatorDescription(combinator)
                if settings.stationTemplate == "" then
                    settings.stationTemplate = nil
                end
            else
                settings.stationTemplate = nil
            end
        elseif cond.first_signal and cond.first_signal.type == "virtual" and cond.first_signal.name == "signal-I" then
            if settings.minAnyItem then
                return nil, "Defined twice: minAnyItem"
            end
            local unit = getUnitByCombinatorCode(cond.comparator, "item")
            if not unit then
                return nil, "Unknown unit '" .. cond.comparator .. "' for signal-I"
            end
            if not cond.constant or cond.constant < 0 then
                return nil, "signal-I < 1 or empty"
            end
            settings.minAnyItem = {
                count = cond.constant / 100,
                unit = unit
            }
        elseif cond.first_signal and cond.first_signal.type == "virtual" and cond.first_signal.name == "signal-F" then
            if settings.minAnyFluid then
                return nil, "Defined twice: minAnyFluid"
            end
            local unit = getUnitByCombinatorCode(cond.comparator, "fluid")
            if not unit then
                return nil, "Unknown unit '" .. cond.comparator .. "' for signal-F"
            end
            if not cond.constant or cond.constant < 0 then
                return nil, "signal-F < 1 or empty"
            end
            settings.minAnyFluid = {
                count = cond.constant / 100,
                unit = unit
            }
        elseif cond.first_signal and cond.first_signal.type == "virtual" and cond.first_signal.name == "signal-N" then
            if settings.network ~= nil then
                return nil, "Network defined twice"
            end
            if cond.comparator ~= "=" or not cond.constant or cond.constant < 0 then
                return nil, "Network is not '=' or < 0 or empty"
            end
            networkParsed = true
            settings.network = cond.constant
        elseif cond.first_signal and cond.first_signal.type == "virtual" and cond.first_signal.name == "signal-L" then
            if not cond.constant or cond.constant <= 0 then
                return nil, "Train length <= 0 or empty"
            end
            if cond.comparator == ">" then
                if settings.minTrainLength ~= nil then
                    return nil, "Train length min defined twice"
                end
                settings.minTrainLength = cond.constant
            elseif cond.comparator == "<" then
                if settings.maxTrainLength ~= nil then
                    return nil, "Train length max defined twice"
                end
                settings.maxTrainLength = cond.constant
            else
                return nil, "Train length boundary '" .. cond.comparator .. "' is unknown"
            end
        elseif cond.first_signal and cond.first_signal.type == "virtual" and cond.first_signal.name == "signal-M" then
            local type = (cond.first_signal_networks and cond.first_signal_networks.green) and "item" or "fluid"
            if not cond.constant then
                currentRequestMin[type] = nil
            else
                local unit = getUnitByCombinatorCode(cond.comparator, type)
                if not unit then
                    return nil, "Unknown unit '" .. cond.comparator .. "' for signal-M"
                end
                if cond.constant < 1 then
                    return nil, "signal-M < 1"
                end
                currentRequestMin[type] = {
                    count = cond.constant / 100,
                    unit = unit,
                }
            end
        elseif cond.first_signal and cond.first_signal.type == "virtual" and cond.first_signal.name == "signal-G" then
            if not cond.constant or cond.constant < 1 then
                return nil, "signal-G < 1 or empty"
            end
            currentItemIndex = currentItemIndex + cond.constant
        elseif cond.first_signal and (not cond.first_signal.type or cond.first_signal.type == "item" or cond.first_signal.type == "fluid") then
            if not cond.first_signal.type then
                cond.first_signal.type = "item"
            end
            local tnq = toTypeNameQuality(cond.first_signal)
            if settings.items[tnq] then
                return nil, "Twice defined: " .. tnq
            end

            ---@type CountWithUnits
            local request
            if cond.constant then
                if cond.constant <= 0 then
                    return nil, "Request of " .. tnq .. " <= 0"
                end
                local unit = getUnitByCombinatorCode(cond.comparator, cond.first_signal.type)
                if not unit then
                    return nil, "Unknown unit '" .. cond.comparator .. "' for request " .. tnq
                end
                request = {
                    count = cond.constant / 100,
                    unit = unit,
                }
            end
            local item = {
                index = currentItemIndex,
                type = cond.first_signal.type,
                name = cond.first_signal.name,
                quality = cond.first_signal.quality,
                tnq = tnq,
                allowProvide = cond.first_signal_networks and cond.first_signal_networks.green or nil,
                allowRequest = cond.first_signal_networks and cond.first_signal_networks.red or nil,
                request = request,
                requestMin = copyCountWithUnits(currentRequestMin[cond.first_signal.type])
            }
            if item.allowProvide and item.allowRequest then
                return nil, "allowProvide & allowRequest in " .. tnq
            end
            if item.allowRequest and (not item.request or not item.requestMin) then
                return nil, "allowRequest but not request or requestMin " .. tnq
            end
            settings.items[tnq] = item
            currentItemIndex = currentItemIndex + 1
        else
            return nil, "Unknown cond: " .. var_dump(cond)
        end
    end
    if not flagParsed then
        return nil, "No flags"
    end
    if settings.network == nil then
        return nil, "No network"
    end
    return settings, nil
end

---@param disp DispClass
function _dispUpdateOutPort(disp)
    local outputs = {}

    local deli = disp.delivery

    if deli then
        if deli.provider == disp then
            outputs[#outputs + 1] = {
                signal = SIG_P,
                constant = 1,
                copy_count_from_input = false,
            }
        elseif deli.requester == disp then
            outputs[#outputs + 1] = {
                signal = SIG_R,
                constant = 1,
                copy_count_from_input = false,
            }
        end
    end

    if disp.errors then
        outputs[#outputs + 1] = { signal = SIG_E, constant = 1, copy_count_from_input = false, }
    end

    if table_size(disp.deliveries) > 0 then
        outputs[#outputs + 1] = { signal = SIG_D, constant = table_size(disp.deliveries), copy_count_from_input = false, }
    end

    outputs[#outputs + 1] = { copy_count_from_input = false, } -- hide another icons

    if disp.stoppedTrain and disp.stoppedTrainType then
        local tt = storage.trainTypes[disp.stoppedTrainType]
        outputs[#outputs + 1] = { signal = SIG_L, constant = tt.length, copy_count_from_input = false, }
        outputs[#outputs + 1] = { signal = SIG_C, constant = tt.itemWagonCount, copy_count_from_input = false, }
        outputs[#outputs + 1] = { signal = SIG_F, constant = table_size(tt.fluidCapacityPerWagons), copy_count_from_input = false, }
    end

    local mul
    if deli then
        if deli.provider == disp then
            mul = 1
        elseif deli.requester == disp then
            if disp.settings.outExchangeCounts then
                mul = -1
            end
        end
        if mul and disp.settings.outNegate then
            mul = -mul
        end
    end
    if mul then
        for tnq, count in pairs(deli.contents) do
            outputs[#outputs + 1] = {
                signal = parseTypeNameQuality(tnq),
                constant = count * mul,
                copy_count_from_input = false,
            }
        end
    end

    _dispUpdateLight(disp, outputs)
end

---@return DispSettings
function dispDefaultSettings()
    return {
        items = {},
        outTargetCounts = true,
        network = 1,
    }
end

---@param entity LuaEntity
---@param tags Tags
local function entityHandleBuiltDispatcher(entity, tags)
    local org = getOrCreateOrg(entity.force, entity.surface)

    local settings, err, isEmpty = dispCombinatorToSettings(entity)
    if err then
        if not isEmpty then
            entity.force.print({ "viirld.ERR-WRONG_SETTINGS", err })
        end
    else
        if tags then
            -- legacy. For exists blueprint compatibles
            local stationTemplate = tags["viidrld-stationTemplate"]
            if stationTemplate then
                settings.stationTemplate = stationTemplate
            end
        end
    end

    ---@type DispClass
    local disp = {
        uid = entity.unit_number,
        org = org,
        entity = entity,
        stopEntity = nil,
        settings = settings or dispDefaultSettings(),
        signals = {},
        transit = {},
        deliveries = {},
        _isPausedByUser = (settings and pauseNewDispatchers and settings.modeEndpoint) and true or nil,
    }

    storage.disps[entity.unit_number] = disp
    org.disps[disp.uid] = disp

    dispUpdateStop(disp)
    _dispUpdateActive(disp)
    _dispUpdateOutPort(disp)

    local stoppedTrain = disp.stopEntity and disp.stopEntity.get_stopped_train()
    if stoppedTrain then
        trainArrived(stoppedTrain)
    end
end

---@param disp DispClass
function removeDisp(disp)
    if disp.gui then
        DispGuiLua.close(disp.gui, true)
    end
    --todo may be calculate
    for k, d in pairs(storage.disps) do
        if d == disp then
            storage.disps[k] = nil
        end
    end
    storage.activeDisps[disp.uid] = nil
    disp.org.disps[disp.uid] = nil
    for _, disps in pairs(disp.org.depotReadyDisps) do
        disps[disp.uid] = nil
    end
    for _, network in pairs(disp.org.provide) do
        for _, disps in pairs(network) do
            disps[disp.uid] = nil
        end
    end
    rqRemoveFromAllQueues(disp)
    for _, deli in pairs(disp.deliveries) do
        if deli.provider then
            deli.provider.deliveries[deli.uid] = nil
        end
        if deli.requester then
            deli.requester.deliveries[deli.uid] = nil
        end
        storage.deliveries[deli.uid] = nil
        disp.org.force.print({ "viirld.ERR-DELETED_DELIVERY", deli.uid, deli.provider and deli.provider.stopEntity and deli.provider.stopEntity.unit_number or "?", deli.requester and deli.requester.stopEntity and deli.requester.stopEntity.unit_number or "?" })
    end

    if disp.stopEntity then
        dispDisconnectStop(disp)
    end
    local stops = disp.entity.surface.find_entities_filtered({
        type = "train-stop",
        position = disp.entity.position,
        radius = 2,
    })
    for _, stop in pairs(stops) do
        if stop.valid then
            local dispatchers = disp.entity.surface.find_entities_filtered({
                name = "viirld-dispatcher",
                position = stop.position,
                radius = 2,
            })
            for _, d in pairs(dispatchers) do
                if d.valid and d ~= disp.entity then
                    dispUpdateStop(storage.disps[d.unit_number])
                end
            end
        end
    end
end

---@param entity LuaEntity
local function entityHandleBuiltStop(entity)
    local dispatchers = entity.surface.find_entities_filtered({
        name = "viirld-dispatcher",
        position = entity.position,
        radius = 2,
    })
    for _, d in pairs(dispatchers) do
        if d.valid and d ~= entity then
            dispUpdateStop(storage.disps[d.unit_number])
        end
    end
end

---@param entity LuaEntity
local function entityHandleRemoveStop(entity)
    local disp = storage.disps[entity.unit_number]
    if disp then
        dispDisconnectStop(disp)
    end
    local dispatchers = entity.surface.find_entities_filtered({
        name = "viirld-dispatcher",
        position = entity.position,
        radius = 2,
    })
    for _, d in pairs(dispatchers) do
        if d.valid and d ~= entity then
            dispUpdateStop(storage.disps[d.unit_number], entity)
        end
    end
end

---@param entity LuaEntity
---@param tags Tags
function entityHandleBuilt(entity, tags)
    if entity.name == "viirld-dispatcher" then
        entityHandleBuiltDispatcher(entity, tags)
    elseif entity.type == "train-stop" then
        entityHandleBuiltStop(entity)
    end
end

function entityHandleRemoved(entity)
    if entity.name == "viirld-dispatcher" then
        ---@type DispClass
        local disp = storage.disps[entity.unit_number]
        if disp then
            removeDisp(disp)
        end
    elseif entity.type == "train-stop" then
        entityHandleRemoveStop(entity)
    end
end

---@param disp DispClass
---@param settings DispSettings
function dispSetSettings(disp, settings)
    local oldNetwork = disp.settings.network
    dispSettingsToCombinator(settings, disp.entity)

    local newSettings, err = dispCombinatorToSettings(disp.entity)
    if err then
        disp.entity.force.print({ "viirld.ERR-WRONG_SETTINGS", err })
        dispSettingsToCombinator(disp.settings, disp.entity)
        _dispUpdateOutPort(disp)
        return
    end

    disp.settings = newSettings
    if not disp.settings.modeEndpoint then
        disp._isPausedByUser = nil
    end

    if disp.settings.network ~= oldNetwork then
        local oldNetworkProvide = disp.org.provide[oldNetwork]
        if oldNetworkProvide then
            for _, disps in pairs(oldNetworkProvide) do
                disps[disp.uid] = nil
            end
        end
        rqRemoveFromAllQueues(disp)
    end

    dispUpdateStopName(disp)
    _dispUpdateActive(disp)
    dispUpdate(disp, false, false, true)
end

---@param disp DispClass
function dispUpdateStopName(disp)
    if not disp.stopEntity then
        return
    end
    if not disp.settings.stationTemplate or disp.settings.stationTemplate == "" then
        disp.stopName = disp.stopEntity.backer_name
        return
    end

    local newName
    if disp.settings.modeEndpoint then
        local allStops = disp.stopEntity.surface.find_entities_filtered {
            type = disp.stopEntity.type,
            force = disp.stopEntity.force,
        }
        local existsOtherNames = {}
        for _, stop in pairs(allStops) do
            if stop ~= disp.stopEntity then
                existsOtherNames[stop.backer_name] = true
            end
        end

        local template = disp.settings.stationTemplate
        local pos = disp.stopEntity.position
        template = template:gsub("%%x", pos.x)
        template = template:gsub("%%y", pos.y)
        template = template:gsub("%%u", disp.stopEntity.unit_number)
        local preReplacedTemplate = template
        template = escape_pattern(template)
        local template0 = template
        template = template:gsub("%%%%d", "%%d+")
        template = template:gsub("%%%%s", "%%s+")
        if template0 == template then
            template = template .. "%d+"
            preReplacedTemplate = preReplacedTemplate .. "%d"
        end
        template = "^" .. template .. "$"

        local currentName = disp.stopEntity.backer_name
        if currentName:match(template) and not existsOtherNames[currentName] then
            -- old name is ok
            return
        end

        local i = 1
        while true do
            newName = preReplacedTemplate:gsub("%%d", tostring(i))
            newName = newName:gsub("%%s", "blabla" .. tostring(i))
            i = i + 1
            if not existsOtherNames[newName] then
                break
            end
        end
    elseif disp.settings.modeDepot then
        newName = disp.settings.stationTemplate
    end
    if newName and disp.stopEntity.backer_name ~= newName then
        disp.stopEntity.backer_name = newName
        disp.stopName = disp.stopEntity.backer_name
        if disp.gui then
            DispGuiLua.updateStationName(disp.gui)
        end
        for _, player in pairs(disp.stopEntity.force.players) do
            player.create_local_flying_text {
                text = newName,
                position = disp.stopEntity.position,
                time_to_live = 180
            }
        end
    end
end

---@param disp DispClass
function _dispUpdateActive(disp)
    if (disp.settings.modeEndpoint or disp.settings.modeDepot) and disp.stopEntity then
        storage.activeDisps[disp.uid] = disp
    else
        dispTurnInserters(disp, true, true)
        storage.activeDisps[disp.uid] = nil
    end
    globalUpdateTimer()
end

---@param disp DispClass
---@param outputs DeciderCombinatorOutput[]|nil
function _dispUpdateLight(disp, outputs)
    local color = COMBINATOR_COLOR_OFF
    if not disp.stopEntity then
        color = COMBINATOR_COLOR_OFF
    else
        if disp.settings.modeEndpoint then
            if disp.errors then
                color = COMBINATOR_COLOR_RED
            elseif dispIsPaused(disp) then
                color = COMBINATOR_COLOR_YELLOW
            elseif table_size(disp.deliveries) > 0 then
                color = COMBINATOR_COLOR_AQUA
            elseif table_size(disp.signals) > 0 then
                color = COMBINATOR_COLOR_GREEN
            else
                color = COMBINATOR_COLOR_WHITE
            end
        elseif disp.settings.modeDepot then
            if disp.errors and disp.errors["-dirty"] then
                color = COMBINATOR_COLOR_RED
            elseif disp.errors and disp.errors["-no-fuel"] then
                color = COMBINATOR_COLOR_YELLOW
            elseif disp.stoppedTrain then
                color = COMBINATOR_COLOR_GREEN
            else
                color = COMBINATOR_COLOR_WHITE
            end
        else
            color = COMBINATOR_COLOR_OFF
        end
    end
    ---@type LuaDeciderCombinatorControlBehavior
    local b = disp.entity.get_or_create_control_behavior()
    local params = b.parameters
    local cond = params.conditions[1]
    if cond then
        cond.comparator = color
    end
    if outputs then
        local lastCondition = params.conditions[#params.conditions]
        if lastCondition then
            lastCondition.comparator = "≠"
            lastCondition.compare_type = "or"
        end
        params.outputs = outputs
    end
    b.parameters = table.deepcopy(params)
end

---@param disp DispClass
---@return boolean
function dispIsPaused(disp)
    if not disp.settings.modeEndpoint then
        return false
    end
    if disp._isPausedByUpdate or disp._isPausedByUser then
        return true
    end
    if disp._isPausedTick ~= game.tick then
        disp._isPaused = disp.entity.get_signal(SIG_DELIVERY_PAUSED, defines.wire_connector_id.combinator_input_green, defines.wire_connector_id.combinator_input_red) ~= 0
        disp._isPausedTick = game.tick
    end
    return disp._isPaused
end

---@param disp DispClass
---@param pausedByUpdate boolean
---@return boolean
function _dispSetIsPausedByUpdate(disp, pausedByUpdate)
    disp._isPausedByUpdate = pausedByUpdate
    disp._isPaused = disp._isPausedByUpdate or disp._isPausedByUser
    disp._isPausedTick = game.tick
    return disp._isPaused
end

---@param disp DispClass
---@param player LuaPlayer|nil
---@return boolean
function dispToggleUserPause(disp, player)
    if disp.settings.modeEndpoint then
        disp._isPausedByUser = (not disp._isPausedByUser) or nil
    else
        disp._isPausedByUser = nil
    end

    dispUpdate(disp, false, false, true)

    if player then
        disp.entity.surface.play_sound({ position = disp.entity.position, path = "utility/rotated_medium" })
        if disp._isPausedByUser then
            player.create_local_flying_text {
                text = { "viirld.paused" },
                create_at_cursor = true,
                time_to_live = 120
            }
        else
            if not disp.settings.modeEndpoint then
                player.create_local_flying_text {
                    text = { "viirld.pause_not_supported" },
                    create_at_cursor = true,
                    time_to_live = 120
                }
            elseif dispIsPaused(disp) then
                player.create_local_flying_text {
                    text = { "", { "viirld.unpaused" }, "\n", { "viirld.pause-by-signal" } },
                    create_at_cursor = true,
                    time_to_live = 120
                }
            else
                player.create_local_flying_text {
                    text = { "viirld.unpaused" },
                    create_at_cursor = true,
                    time_to_live = 120
                }
            end
        end
    end
end

---@param disp DispClass
---@param makeDeliveries boolean|nil
---@param updateTransit boolean|nil
---@param updatePort boolean|nil
---@return number @ made deliveries
function dispUpdate(disp, makeDeliveries, updateTransit, updatePort)
    if not disp.entity.valid then
        return 0
    end

    local madeDeliveries = 0
    local wasNotErrors = not disp.errors

    if disp.turnedInserters then
        dispTurnInserters(disp, true)
    end

    if disp.settings.modeDepot then
        local ready = true
        if disp.stoppedTrain then
            if not trainIsEmpty(disp.stoppedTrain) then
                disp.errors = errorsAdd(disp.errors, "-dirty", { "viirld.ERR--DIRTY" }, { "viirld.ERR--DIRTY-tt" })
                ready = false
            end
            if not trainIsEnoughFuel(disp.stoppedTrain) then
                disp.errors = errorsAdd(disp.errors, "-no-fuel", { "viirld.ERR--NO_FUEL" }, { "viirld.ERR--NO_FUEL-tt", minEnergyUseTrainMJ })
                ready = false
            end
        else
            ready = false
        end
        if not ready or (disp.readyTrainTypeDepot and disp.readyTrainTypeDepot ~= disp.stoppedTrainType) then
            if disp.readyTrainTypeDepot then
                local depots = disp.org.depotReadyDisps[disp.readyTrainTypeDepot]
                if depots then
                    depots[disp.uid] = nil
                end
            end
            disp.readyTrainTypeDepot = nil
        end
        if ready then
            local depots = disp.org.depotReadyDisps[disp.stoppedTrainType]
            if not depots then
                depots = {}
                disp.org.depotReadyDisps[disp.stoppedTrainType] = depots
            end
            depots[disp.uid] = disp
            disp.readyTrainTypeDepot = disp.stoppedTrainType
        end
    elseif disp.settings.modeEndpoint then
        local inputSignalsArray = disp.entity.get_signals(
                defines.wire_connector_id.combinator_input_green,
                defines.wire_connector_id.combinator_input_red
        )
        local notConnected = false
        if not inputSignalsArray or table_size(inputSignalsArray) == 0 then
            local connectionsCount = 0
            ---@type LuaWireConnector
            local connector
            connector = disp.entity.get_wire_connector(defines.wire_connector_id.combinator_input_green)
            if connector then
                connectionsCount = connectionsCount + connector.connection_count
            end
            if connectionsCount == 0 then
                connector = disp.entity.get_wire_connector(defines.wire_connector_id.combinator_input_red)
                if connector then
                    connectionsCount = connectionsCount + connector.connection_count
                end
            end
            if connectionsCount == 0 then
                disp.errors = errorsAdd(disp.errors, "-no-connection", { "viirld.ERR--NO_CONNECTION" }, { "viirld.ERR--NO_CONNECTION-tt" })
                notConnected = true
            end
        end

        local paused = false

        ---@type table<TypeNameQuality, Signal>
        local inputSignals = {}
        if inputSignalsArray then
            for _, signal in pairs(inputSignalsArray) do
                inputSignals[toTypeNameQuality(signal.signal)] = signal
                paused = paused or (signal.signal.type == SIG_DELIVERY_PAUSED.type and signal.signal.name == SIG_DELIVERY_PAUSED.name)
            end
        end

        paused = _dispSetIsPausedByUpdate(disp, paused)

        ---@type table<TypeNameQuality, number>
        local trainContents = {}
        local stoppedTrain = disp.stoppedTrain
        if stoppedTrain then
            for _, s in pairs(stoppedTrain.get_contents()) do
                trainContents[toTypeNameQuality2("item", s.name, s.quality)] = s.count
            end
            for name, count in pairs(stoppedTrain.get_fluid_contents()) do
                trainContents[toTypeNameQuality2("fluid", name)] = count
            end
        end

        if updateTransit then
            dispUpdateTransit(disp, false)
        end

        local inserterContents
        if countingInsertersContent and disp.stoppedTrain and disp.inserters then
            for _, ins in pairs(disp.inserters) do
                if ins.valid and ins.held_stack.count > 0 then
                    local name = ins.held_stack.name
                    inserterContents = inserterContents or {}
                    inserterContents[name] = (inserterContents[name] or 0) + ins.held_stack.count
                end
            end
        end

        ---@param tnq TypeNameQuality
        ---@param dispSignal DispSignal
        ---@param signalCount number
        ---@param dynamic boolean
        function commonProcess(dispSignal, signalCount, dynamic)
            dispSignal._used = true
            dispSignal.debugTransit = disp.transit[dispSignal.tnq] or 0
            dispSignal.debugInTrain = trainContents[dispSignal.tnq] or 0
            dispSignal.debugInInserters = inserterContents and inserterContents[dispSignal.name] or 0
            dispSignal.debugDynamic = dynamic

            dispSignal.circuitValue = signalCount

            signalCount = signalCount + (disp.transit[dispSignal.tnq] or 0)
            signalCount = signalCount + (trainContents[dispSignal.tnq] or 0)
            if dispSignal.type == "item" then
                signalCount = signalCount + (inserterContents and inserterContents[dispSignal.tnq] or 0)
            end

            if disp.delivery and disp == disp.delivery.provider then
                local deliveryCount = disp.delivery.contents[dispSignal.tnq]
                if deliveryCount then
                    signalCount = signalCount - deliveryCount
                end
            end
            dispSignal.balance = signalCount
            return signalCount
        end

        for tnq, item in pairs(disp.settings.items) do
            local dispSignal = disp.signals[tnq]
            if not dispSignal then
                dispSignal = {
                    type = item.type,
                    name = item.name,
                    quality = item.quality,
                    tnq = item.tnq,
                }
                disp.signals[tnq] = dispSignal
            end
            local signalCount = commonProcess(dispSignal, inputSignals[tnq] and inputSignals[tnq].count or 0, false)

            if item.allowProvide then
                dispSignal.provideCount = signalCount
                if dispSignal.provideCount < 0 then
                    dispSignal.provideCount = 0
                end
            else
                dispSignal.provideCount = nil
            end

            if item.allowRequest and not disp.settings.flagLiquidation then
                local request = unitCalc(item.request, dispSignal.name) or 0
                local min = unitCalc(item.requestMin, dispSignal.name) or 0
                dispSignal.balance = dispSignal.balance - request
                request = request - signalCount
                if request < min or request < 0 then
                    request = 0
                end
                dispSignal.requestCount = request
                dispSignal.requestMin = min
            else
                dispSignal.requestCount = nil
            end
        end

        if disp.settings.allowAnyItemProvide or disp.settings.allowAnyItemRequest
                or disp.settings.allowAnyFluidProvide or disp.settings.allowAnyFluidRequest then
            for tnq, inputSignal in pairs(inputSignals) do
                local dispSignal = disp.signals[tnq]
                if not dispSignal or not dispSignal._used then
                    if not dispSignal then
                        dispSignal = {
                            type = inputSignal.signal.type or "item",
                            name = inputSignal.signal.name,
                            quality = inputSignal.signal.quality,
                            tnq = tnq,
                        }
                        disp.signals[tnq] = dispSignal
                    end
                    inputSignal.count = commonProcess(dispSignal, inputSignal.count, true)
                    local allowProvide = inputSignal.count > 0 and (dispSignal.type == "item" and disp.settings.allowAnyItemProvide or disp.settings.allowAnyFluidProvide)
                    if allowProvide then
                        dispSignal.provideCount = inputSignal.count
                    else
                        dispSignal.provideCount = nil
                    end
                    local allowRequest = inputSignal.count < 0 and not disp.settings.flagLiquidation and (dispSignal.type == "item" and disp.settings.allowAnyItemRequest or disp.settings.allowAnyFluidRequest)
                    if allowRequest then
                        local min = unitCalc(
                                dispSignal.type == "item"
                                        and disp.settings.minAnyItem
                                        or disp.settings.minAnyFluid,
                                dispSignal.name
                        ) or 0
                        local request = -inputSignal.count
                        if request < min or request < 0 then
                            request = 0
                        end
                        dispSignal.requestCount = request
                        dispSignal.requestMin = min
                    else
                        dispSignal.requestCount = nil
                        dispSignal.requestMin = nil
                    end
                    if not (allowProvide or allowRequest or dispSignal.balance ~= 0) then
                        disp.signals[tnq] = nil
                    end
                end
            end
        end

        local requestTnqCount = 0
        for tnq, dispSignal in pairs(disp.signals) do
            if dispSignal._used then
                dispSignal._used = nil
                if dispSignal.requestCount and dispSignal.requestCount > 0 then
                    requestTnqCount = requestTnqCount + 1
                end
            else
                disp.signals[tnq] = nil
            end
        end

        -- register org provide
        local orgProvide = disp.org.provide[disp.settings.network]
        if orgProvide then
            for tnq, disps in pairs(orgProvide) do
                local dispSignal = (not paused and not notConnected) and disp.signals[tnq] or nil
                if dispSignal and dispSignal.provideCount and dispSignal.provideCount > 0 then
                    disps[disp.uid] = disp
                    dispSignal._used = true
                else
                    disps[disp.uid] = nil
                end
            end
        end
        if not paused and not notConnected then
            for tnq, dispSignal in pairs(disp.signals) do
                if dispSignal.provideCount and dispSignal.provideCount > 0 and not dispSignal._used then
                    if not orgProvide then
                        orgProvide = {}
                        disp.org.provide[disp.settings.network] = orgProvide
                    end
                    local disps = orgProvide[tnq]
                    if not disps then
                        disps = {}
                        orgProvide[tnq] = disps
                    end
                    disps[disp.uid] = disp
                else
                    dispSignal._used = nil
                end
            end
        end

        -- requests
        if makeDeliveries then
            ---@type table<TypeNameQuality, true>
            local requestingTnqs = {}
            if requestTnqCount > 0 and not paused and not notConnected then
                local dispLimited = dispIsLimited(disp)
                for tnq, dispSignal in pairs(disp.signals) do
                    repeat
                        if dispSignal.requestCount and dispSignal.requestCount > 0 then
                            if dispLimited then
                                disp.errors = errorsAdd(disp.errors, tnq, { "viirld.ERR-TNQ-LIMIT" }, { "viirld.ERR-TNQ-LIMIT-tt" })
                                break
                            end

                            requestingTnqs[dispSignal.tnq] = true

                            if rqAddToQueueIfNotFirst(disp, tnq) then
                                disp.errors = errorsAdd(
                                        disp.errors,
                                        tnq,
                                        { "viirld.ERR-TNQ-QUEUED" },
                                        rqFormatQueue(disp, tnq, { "", { "viirld.ERR-TNQ-QUEUED-tt", tnq, "" } })
                                )
                                break
                            end

                            -- todo: find in dirty depot trains

                            local orgProvideTnq = orgProvide and orgProvide[tnq]
                            if not orgProvideTnq or (table_size(orgProvideTnq) == 1 and next(orgProvideTnq) == disp.uid) then
                                disp.errors = errorsAdd(disp.errors, tnq, { "viirld.ERR-NO_PROVIDE" }, { "viirld.ERR-NO_PROVIDE-tt", tnq })
                                rqAddToQueue(disp, tnq)
                                break -- continue for
                            end

                            ---@type DispClass
                            local bestProviderDisp
                            ---@type TrainTypeInfo
                            local bestTrainTypeInfo
                            ---@type number[]
                            local bestProviderDispCmp
                            local hasCompatibleProvider = false
                            local hasCompatibleTrain = false

                            for _, providerDisp in pairs(orgProvideTnq) do
                                repeat
                                    if providerDisp.uid == disp.uid or dispIsPaused(providerDisp) or not providerDisp.stopEntity or not providerDisp.stopEntity.valid then
                                        break -- continue for
                                    end
                                    local providerDispSignal = providerDisp.signals[tnq]
                                    if not providerDispSignal.provideCount or providerDispSignal.provideCount == 0 then
                                        break -- continue for
                                    end
                                    if providerDispSignal.provideCount < dispSignal.requestMin and not providerDisp.settings.flagLiquidation then
                                        break -- continue for
                                    end
                                    if dispIsLimited(providerDisp) then
                                        break -- continue for
                                    end
                                    hasCompatibleProvider = true
                                    for trainType, depots in pairs(disp.org.depotReadyDisps) do
                                        repeat
                                            if table_size(depots) == 0 then
                                                break -- continue for
                                            end
                                            local trainTypeInfo = storage.trainTypes[trainType]
                                            if dispSignal.type == "item" and trainTypeInfo.itemCapacity == 0
                                                    or dispSignal.type == "fluid" and trainTypeInfo.fluidCapacity == 0 then
                                                break -- continue for
                                            end
                                            if not isTrainRightSize(providerDisp, trainTypeInfo) or not isTrainRightSize(disp, trainTypeInfo) then
                                                break -- continue for
                                            end
                                            hasCompatibleTrain = true
                                            ---@type number
                                            local travelCount = math.min(providerDispSignal.provideCount, dispSignal.requestCount)
                                            ---@type number
                                            local freeSpace = 0
                                            if dispSignal.type == "item" then
                                                local stackCount = prototypes.item[dispSignal.name].stack_size * trainTypeInfo.itemCapacity
                                                travelCount = math.min(travelCount, stackCount)
                                                freeSpace = stackCount - travelCount
                                            elseif dispSignal.type == "fluid" then
                                                travelCount = math.min(travelCount, trainTypeInfo.fluidCapacity)
                                                freeSpace = trainTypeInfo.fluidCapacity - travelCount
                                            end
                                            local cmp = {
                                                providerDisp.settings.modeDepot and 1 or 0, -- for dirty train in depot
                                                providerDisp.settings.flagLiquidation and 1 or 0,
                                                providerDisp.stopEntity.train_stop_priority or -1,
                                                travelCount,
                                                -freeSpace,
                                                sqr(disp.stopPosition.x - providerDisp.stopPosition.x) + sqr(disp.stopPosition.y - providerDisp.stopPosition.y)
                                            }
                                            if compareNumberTuples(cmp, bestProviderDispCmp) > 0 then
                                                bestProviderDisp = providerDisp
                                                bestTrainTypeInfo = trainTypeInfo
                                                bestProviderDispCmp = cmp
                                            end
                                        until true
                                    end
                                until true
                            end

                            if bestProviderDisp then
                                local _, err = dispMakeDelivery(tnq, disp, bestProviderDisp, bestTrainTypeInfo)
                                if err then
                                    disp.errors = errorsAdd(disp.errors, tnq, { "", err, "!" })
                                    break
                                end
                                rqRemoveFromQueue(disp, tnq)
                                madeDeliveries = madeDeliveries + 1
                                dispLimited = dispIsLimited(disp)
                                updatePort = true
                                if disp.errors and disp.errors[tnq] then
                                    disp.errors = errorsAdd(disp.errors, tnq, { "viirld.ERR-NEED_CHECK" }, { "viirld.ERR-NEED_CHECK-tt", tnq })
                                end
                            else
                                if not hasCompatibleProvider then
                                    disp.errors = errorsAdd(disp.errors, tnq, { "viirld.ERR-NO_PROVIDE" }, { "viirld.ERR-NO_PROVIDE-tt", tnq })
                                    rqAddToQueue(disp, tnq)
                                elseif not hasCompatibleTrain then
                                    disp.errors = errorsAdd(disp.errors, tnq, { "viirld.ERR-NO_TRAIN" }, { "viirld.ERR-NO_TRAIN-tt", tnq })
                                    rqAddToQueue(disp, tnq)
                                end
                                break -- continue for
                            end
                        end
                    until true
                end
            end
            rqRemoveFromQueueExcept(disp, requestingTnqs)
        else
            for tnq, dispSignal in pairs(disp.signals) do
                if dispSignal.requestCount and dispSignal.requestCount > 0 then
                    errorsSetUsedIfExists(disp.errors, tnq)
                end
            end
        end
    end
    disp.errors = errorsCommit(disp.errors)
    disp.lastUpdateTick = game.tick
    _dispUpdateLight(disp)
    if updatePort or (wasNotErrors ~= not disp.errors) then
        _dispUpdateOutPort(disp)
    end
    if disp.gui then
        DispGuiLua.updateDispInfo(disp.gui)
    end
    return madeDeliveries
end

---@param tnq TypeNameQuality
---@param requester DispClass
---@param provider DispClass
---@param trainTypeInfo TrainTypeInfo
---@return DeliveryClass, LocalisedString
function dispMakeDelivery(tnq, requester, provider, trainTypeInfo)
    ---@type DispSignal
    local requesterDispSignal = requester.signals[tnq]
    if not requesterDispSignal then
        return nil, { "viirld.ERR-NO_REQUEST" }
    end

    ---@type DispSignal
    local providerDispSignal = provider.signals[tnq]
    if not providerDispSignal then
        return nil, { "viirld.ERR-NO_PROVIDE" }
    end
    local travelCount = math.min(providerDispSignal.provideCount, requesterDispSignal.requestCount)
    if requesterDispSignal.type == "item" then
        travelCount = math.min(travelCount, prototypes.item[requesterDispSignal.name].stack_size * trainTypeInfo.itemCapacity)
    elseif requesterDispSignal.type == "fluid" then
        travelCount = math.min(travelCount, trainTypeInfo.fluidCapacity)
    else
        return nil, "Wrong type: " .. var_dump(requesterDispSignal.type)
    end

    local depots = requester.org.depotReadyDisps[trainTypeInfo.typeName]
    if not depots or table_size(depots) == 0 then
        return nil, { "viirld.ERR-NO_TRAIN" }
    end

    ---@type DispClass
    local bestDepot
    ---@type LuaTrain
    local bestTrain
    ---@type number
    local bestDepotCmp

    for _, depot in pairs(depots) do
        repeat
            local stopEntity = depot.stopEntity
            if not stopEntity or not stopEntity.valid then
                break
            end
            local train = stopEntity.get_stopped_train()
            if not train or not train.valid then
                break
            end
            local tt, ttInfo = getTrainType(train)
            if tt ~= trainTypeInfo.typeName then
                --[[DEBUG]] stopEntity.force.print("RLD Error: Wrong Train Type " .. var_dump(stopEntity))
                break
            end
            if not isTrainRightSize(provider, ttInfo) or not isTrainRightSize(requester, ttInfo) then
                break
            end
            local cmp = sqr(depot.stopPosition.x - provider.stopPosition.x) + sqr(depot.stopPosition.y - provider.stopPosition.y)
            if not bestDepotCmp or bestDepotCmp > cmp then
                bestDepot = depot
                bestTrain = train
                bestDepotCmp = cmp
            end
        until true
    end
    if not bestTrain then
        return nil, { "viirld.ERR-NO_TRAIN" }
    end

    storage.lastUid = storage.lastUid + 1
    ---@type DeliveryClass
    local delivery = {
        uid = storage.lastUid,
        requester = requester,
        provider = provider,
        requesterPassedTick = nil,
        providerPassedTick = nil,
        contents = {
            [tnq] = travelCount,
        },
        startTick = game.tick,
    }

    if requester.settings.flagItemCompounds and provider.settings.flagItemCompounds then
        -- todo
        -- todo and for fluids
    end

    storage.deliveries[delivery.uid] = delivery
    provider.deliveries[delivery.uid] = delivery
    requester.deliveries[delivery.uid] = delivery

    dispUpdateTransit(provider, true)
    dispUpdateTransit(requester, true)

    bestDepot.readyTrainTypeDepot = nil
    depots[bestDepot.uid] = nil

    trainUpdateSchedule(bestTrain, delivery, bestDepot.stopName)

    --local stats = provider.org.force.get_item_production_statistics(provider.org.surface)
    --stats.on_flow("viirld-delivery", 1)
end

---@param disp DispClass
---@param correctSignals boolean
function dispUpdateTransit(disp, correctSignals)
    local correction = correctSignals and disp.transit or nil
    local newTransit = {}
    for _, deli in pairs(disp.deliveries) do
        if disp == deli.provider and not deli.providerPassedTick then
            for tnq, count in pairs(deli.contents) do
                newTransit[tnq] = (newTransit[tnq] or 0) - count
                if correction then
                    correction[tnq] = (correction[tnq] or 0) + count
                end
            end
        end
        if disp == deli.requester and not deli.requesterPassedTick then
            for tnq, count in pairs(deli.contents) do
                newTransit[tnq] = (newTransit[tnq] or 0) + count
                if correction then
                    correction[tnq] = (correction[tnq] or 0) - count
                end
            end
        end
    end
    if correction then
        for tnq, dispSignal in pairs(disp.signals) do
            local correctionCount = correction[tnq]
            if correctionCount and correctionCount ~= 0 then
                if dispSignal.provideCount then
                    dispSignal.provideCount = math.max(0, dispSignal.provideCount - correctionCount)
                    --game.print("PROV CORR " .. var_dump(from) .. " -> " .. var_dump(dispSignal.provideCount) .. " (transit: " .. var_dump(newTransit[tnq]))
                end
                if dispSignal.requestCount then
                    --local from = dispSignal.requestCount
                    dispSignal.requestCount = math.max(0, dispSignal.requestCount + correctionCount)
                    if dispSignal.requestCount < dispSignal.requestMin then
                        dispSignal.requestCount = 0
                    end
                    --game.print("REQ CORR " .. var_dump(from) .. " -> " .. var_dump(dispSignal.requestCount) .. " (transit: " .. var_dump(newTransit[tnq]))
                end
                dispSignal.balance = (dispSignal.balance or 0) - correctionCount
            end
        end
    end
    disp.transit = newTransit
end

function globalTick()
    --[[DEBUG_BEGIN]]
    for _, disp in pairs(storage.disps) do
        if not disp.entity.valid then
            game.print("INVALID DISP " .. var_dump(disp.uid))
            helpers.write_file("invalid.disp." .. var_dump(disp.uid) .. ".lua", "disp=" .. var_dump(disp))
        end
    end
    --[[DEBUG_END]]

    local i = math.max(math.min(table_size(storage.activeDisps), 1), 32)
    local tick = game.tick
    while i > 0 do
        i = i - 1
        storage.dispKey = next(storage.activeDisps, storage.dispKey and storage.activeDisps[storage.dispKey] and storage.dispKey)
        if storage.dispKey then
            local disp = storage.activeDisps[storage.dispKey]
            if disp.entity.valid then
                if not disp.lastUpdateTick or tick - disp.lastUpdateTick > 60 then
                    i = i - dispUpdate(disp, true)
                    if disp.settings.modeEndpoint then
                        break
                    end
                end
            else
                log("ViiRLD: removed invalid disp " .. var_dump(disp.uid))
                removeDisp(disp)
            end
        end
    end
end

function globalUpdateTimer()
    script.on_nth_tick(nil)
    if storage.activeDisps and table_size(storage.activeDisps) > 0 then
        script.on_nth_tick(updateTicks, globalTick)
    end
end

---@param disp DispClass
function dispFindInserters(disp)
    disp.inserters = nil
    if disp._insertersDraw then
        for _, d in pairs(disp._insertersDraw) do
            d.destroy()
        end
        disp._insertersDraw = nil
    end

    local train = disp.stoppedTrain
    if not train or not disp.settings.modeEndpoint then
        return
    end

    ---@type table<EntityUnitNumber, LuaEntity>
    local foundInserters
    local testedInserters
    if train then
        for _, car in pairs(train.cargo_wagons) do
            local insertersOfCar = car.surface.find_entities_filtered({
                type = "inserter",
                position = car.position,
                radius = 7,
            })
            car.update_connections()
            for _, ins in pairs(insertersOfCar) do
                if ins.valid then
                    if not ins.drop_target then
                        ins.drop_target = car
                    end
                    testedInserters = testedInserters or {}
                    testedInserters[ins.unit_number] = ins
                    if ins.drop_target == car then
                        foundInserters = foundInserters or {}
                        foundInserters[ins.unit_number] = ins
                        foundInserters[-ins.unit_number] = nil
                    end
                    if not foundInserters or not foundInserters[ins.unit_number] then
                        if not ins.pickup_target then
                            ins.pickup_target = car
                        end
                        if ins.pickup_target == car then
                            foundInserters = foundInserters or {}
                            foundInserters[-ins.unit_number] = ins
                        end
                    end
                end
            end
        end
    end
    if debugMode then
        if foundInserters or testedInserters then
            disp._insertersDraw = disp._insertersDraw or {}
        end
        if foundInserters then
            for un, ins in pairs(foundInserters) do
                disp._insertersDraw[#disp._insertersDraw + 1] = rendering.draw_text {
                    surface = ins.surface,
                    text = un > 0 and 'L' or "U",
                    color = { 1, 0, 0 },
                    target = ins
                }
            end
        end
        if testedInserters then
            for _, ins in pairs(testedInserters) do
                disp._insertersDraw[#disp._insertersDraw + 1] = rendering.draw_text {
                    surface = ins.surface,
                    text = '_',
                    color = { 1, 0, 0 },
                    target = ins
                }
            end
        end
    end
    disp.inserters = foundInserters
end

---@param disp DispClass
---@param doReturn boolean
---@param forcedReturn boolean
function dispTurnInserters(disp, doReturn, forcedReturn)
    if doReturn then
        if disp.turnedInserters then
            for k, turnedIns in pairs(disp.turnedInserters) do
                if turnedIns.inserter.valid then
                    if forcedReturn or turnedIns.inserter.held_stack.count == 0 then
                        if turnedIns.pickup_position then
                            turnedIns.inserter.pickup_position = turnedIns.pickup_position
                        end
                        if turnedIns.drop_position then
                            turnedIns.inserter.drop_position = turnedIns.drop_position
                        end
                        if turnedIns.direction then
                            turnedIns.inserter.direction = turnedIns.direction
                        end
                        turnedIns.inserter.direction = turnedIns.inserter.direction
                        disp.turnedInserters[k] = nil
                    end
                else
                    disp.turnedInserters[k] = nil
                end
            end
            if table_size(disp.turnedInserters) == 0 then
                disp.turnedInserters = nil
            end
        end
    else
        local turnedInserters = disp.turnedInserters
        if disp.inserters and table_size(disp.inserters) > 0 then
            for i, ins in pairs(disp.inserters) do
                if ins.valid and i > 0 --[[ to wagon ]] then
                    if ins.held_stack.count > 0 then
                        turnedInserters = turnedInserters or {}
                        if not turnedInserters[ins.unit_number] then
                            ---@type DispTurnedInserter
                            local turnedIns
                            if prototypes.entity[ins.name].allow_custom_vectors then
                                turnedIns = {
                                    inserter = ins,
                                    pickup_position = ins.pickup_position,
                                    drop_position = ins.drop_position,
                                }
                                ins.pickup_position = turnedIns.drop_position
                                ins.drop_position = turnedIns.pickup_position
                                ins.direction = ins.direction
                            else
                                turnedIns = {
                                    inserter = ins,
                                    direction = ins.direction,
                                }
                                ins.direction = util.oppositedirection(ins.direction)
                            end
                            turnedInserters[ins.unit_number] = turnedIns
                        end
                    end
                end
            end
        end
        disp.turnedInserters = turnedInserters
    end
end

---@param disp DispClass
---@param atArrival boolean @ or atDeparture
function dispStatDelivery(disp, atArrival)
    if disp.delivery then
        disp.stat = disp.stat or {}
        if disp == disp.delivery.provider and not atArrival then
            for tnq, count in pairs(disp.delivery.contents) do
                local statTnq = disp.stat[tnq]
                if not statTnq then
                    statTnq = {
                        provided = 0,
                        received = 0,
                        deliveries = 0,
                    }
                    disp.stat[tnq] = statTnq
                end
                statTnq.provided = statTnq.provided + count
                statTnq.deliveries = statTnq.deliveries + 1
                statTnq.lastTick = game.tick
            end
        elseif disp == disp.delivery.requester and atArrival then
            for tnq, count in pairs(disp.delivery.contents) do
                local statTnq = disp.stat[tnq]
                if not statTnq then
                    statTnq = {
                        provided = 0,
                        received = 0,
                        deliveries = 0,
                    }
                    disp.stat[tnq] = statTnq
                end
                statTnq.received = statTnq.received + count
                statTnq.deliveries = statTnq.deliveries + 1
                statTnq.lastTick = game.tick
            end
        end
    end
end

---@param disp DispClass
---@return boolean
function dispIsLimited(disp)
    local limit = disp.stopEntity and disp.stopEntity.trains_limit or 1000000000
    return (table_size(disp.deliveries) >= limit) or ((disp.stopEntity and disp.stopEntity.trains_count) >= limit)
end