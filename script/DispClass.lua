---@shape DispSignal
    ---@field type string
    ---@field name string
    ---@field request CountWithUnits @nullable if null - provide
    ---@field min CountWithUnits @nullable

---@shape DispSettings
    ---@field mode ST_MODE @ settings: stop mode
    ---@field flagMute true|nil @ settings: no error alerts from this stop
    ---@field flagTamp true|nil @ settings: tamping while loading
    ---@field flagTurnInserters true|nil @ settings: rotate inserters when train departures (for cleaning)
    ---@field flagUseSignals true|nil @ settings: use signals in schedule for this stop
    ---@field flagUseEquals true|nil @ settings: use strict equals in schedule for this stop
    ---@field flagAllowMulti true|nil @ settings: allow compound deliveries
    ---@field flagReverseLocos true|nil @ settings: revers locomotives when train departures
    ---@field flagBuild true|nil @ settings:
    ---@field flagDestroy true|nil @ settings:
    ---@field outMode ST_OUT @ variant of signals in output port
    ---@field signals table<number, DispSignal> @ settings: cargo signals (index of button -> StopSignal)
    ---@field otherCargoMin CountWithUnits @nullable
    ---@field otherFluidMin CountWithUnits @nullable
    ---@field networks Networks @nullable
    ---@field comps TrainCompositions @nullable Allowed composition at station. Also build compositions


---@alias DispUid number

---@class DispClass: DispSettings
    ---@field uid DispUid @unique id of StopOb. Equals entity.unit_number
    ---@field stop StopClass @nullable
    ---@field entity LuaEntity @ input interface entity
    ---@field input LuaEntity @ input interface entity
    ---@field output LuaEntity @ output interface entity
    ---@field gui DispGui @nullable gui if opened
DispClass = { }

---@param dispEntity LuaEntity
---@return DispClass
function DispClass:new(dispEntity)
    ---@type DispClass
    local disp = instanceClass(self, {
        uid = dispEntity.unit_number,
        entity = dispEntity,
        mode = ST_MODE_OFF,
        networks = defaultNetworks,
        signals = { },
    })
    disp:_createIO()
    local beh = --[[---@type LuaArithmeticCombinatorControlBehavior]] dispEntity.get_control_behavior()
    local prevUid = beh.parameters.first_constant or 0
    if global.removedSettings[prevUid] then
        disp:setSettings(global.removedSettings[prevUid])
        global.removedSettings[prevUid] = nil
    end
    beh.parameters = { first_constant = --[[ for UNDO]] dispEntity.unit_number }
    disp:_findStop()
    return disp
end

function DispClass:_createIO()
    local entity = self.entity
    local input = entity.surface.create_entity {
        name = "viirld-io",
        position = entity.position,
        force = entity.force
    }
    local output = entity.surface.create_entity {
        name = "viirld-io",
        position = entity.position,
        force = entity.force
    }
    input.connect_neighbour({ target_entity = entity, wire = defines.wire_type.red, target_circuit_id = defines.circuit_connector_id.combinator_input })
    input.connect_neighbour({ target_entity = entity, wire = defines.wire_type.green, target_circuit_id = defines.circuit_connector_id.combinator_input })
    output.connect_neighbour({ target_entity = entity, wire = defines.wire_type.red, target_circuit_id = defines.circuit_connector_id.combinator_output })
    output.connect_neighbour({ target_entity = entity, wire = defines.wire_type.green, target_circuit_id = defines.circuit_connector_id.combinator_output })
    ---@type LuaConstantCombinatorControlBehavior
    local b = input.get_control_behavior()
    b.parameters = {
        {
            signal = { type = 'virtual', name = 'signal-I' },
            count = 1,
            index = 1
        }
    }
    b = output.get_control_behavior()
    b.parameters = {
        {
            signal = { type = 'virtual', name = 'signal-O' },
            count = 1,
            index = 1
        }
    }
    self.input = input
    self.output = output
end

function DispClass:_removeIO()
    local nearEntities = self.entity.surface.find_entities_filtered({ position = self.entity.position })
    for _, e in pairs(nearEntities) do
        if e.name == 'viirld-io' or (e.name == 'entity-ghost' and e.ghost_name == 'viirld-io') then
            e.destroy()
        end
    end
end

---@param entity LuaEntity
---@return DispClass @nullable
---@overload fun(entity: LuaEntity): DispClass @nullable
function DispClass.ofEntity(entity)
    local disp = global.disps[entity.unit_number]
    if not disp then
        disp = DispClass:new(entity)
        global.disps[entity.unit_number] = disp
    end
    return disp
end

---@param entity LuaEntity
---@param tags table
function DispClass.handleBuilt(entity, tags)
    if entity.name == "viirld-dispatcher" then
        local disp = DispClass.ofEntity(entity)
        if tags then
            disp:setSettings(tags)
        end
    else
        -- stop built
        local disps = entity.surface.find_entities_filtered({
            name = "viirld-dispatcher",
            position = entity.position,
            radius = 2,
        })
        for _, disp in pairs(disps) do
            global.disps[disp.unit_number]:_findStop()
        end
    end
end

---@param entity LuaEntity
function DispClass.handleRemoved(entity)
    if entity.name == "viirld-dispatcher" then
        local disp = global.disps[entity.unit_number]
        if disp then
            disp:_removeIO()
            global.disps[entity.unit_number] = nil

            -- save settings for restore if player uses UNDO
            local settings = --[[---@type RemovedSettings]] disp:getSettings()
            settings._tick = game.tick
            global.removedSettings[entity.unit_number] = settings
            DispClass.cleanupRemovedSettings()

            if disp.stop then
                disp.stop.sur:removeStop(disp.stop.uid)
            end
        end
    else
        -- stop removed
        local disps = entity.surface.find_entities_filtered({
            name = "viirld-dispatcher",
            position = entity.position,
            radius = 2,
        })
        for _, disp in pairs(disps) do
            global.disps[disp.unit_number]:_findStop(entity)
        end
    end
end

function DispClass.cleanupRemovedSettings()
    local STORE_TIME = 60 * 60 * 60 * 2 -- 2h
    if table_size(global.removedSettings) > 0 and (global.minRemovedSettingsTick or 0) < game.tick - STORE_TIME then
        local oldSize = table_size(global.removedSettings)
        ---@type number
        local minTick
        for k, s in pairs(global.removedSettings) do
            if s._tick < game.tick - STORE_TIME then
                global.removedSettings[k] = nil
            elseif minTick == nil or minTick > s._tick then
                minTick = s._tick
            end
        end
        global.minRemovedSettingsTick = minTick
    end
end

---@param excludedStop LuaEntity
---@overload fun()
function DispClass:_findStop(excludedStop)
    if self.stop then
        if self.stop.stopEntity.valid and self.stop.stopEntity ~= excludedStop then
            return
        else
            self.stop.sur:removeStop(self.stop.uid)
            self.stop = nil
        end
    end

    local sur = SurClass.ofEntity(self.entity, true)
    local stops = self.entity.surface.find_entities_filtered({
        name = "train-stop",
        position = self.entity.position,
        radius = 2,
    })
    for _, stopEntity in pairs(stops) do
        if stopEntity.valid and stopEntity ~= excludedStop then
            if not sur or not sur.stops[stopEntity.unit_number] then
                sur = sur or SurClass.ofEntity(self.entity)
                local stop = sur:getOrAddStop(stopEntity, self)
                stop:settingsUpdated()
                break
            end
        end
    end
    if not self.stop then
        self.entity.surface.create_entity {
            type = "flying-text",
            name = "tutorial-flying-text",
            position = self.entity.position,
            text = { "viirld.err-no-station" },
        }
    end
    self:updateVisual()
end

---@return DispSettings
function DispClass:getSettings()
    return {
        mode = self.mode,
        flagMute = self.flagMute,
        flagTamp = self.flagTamp,
        flagTurnInserters = self.flagTurnInserters,
        flagUseSignals = self.flagUseSignals,
        flagUseEquals = self.flagUseEquals,
        flagAllowMulti = self.flagAllowMulti,
        flagReverseLocos = self.flagReverseLocos,
        flagBuild = self.flagBuild,
        flagDestroy = self.flagDestroy,
        outMode = self.outMode,
        signals = util.copy(self.signals),
        otherCargoMin = util.copy(self.otherCargoMin),
        otherFluidMin = util.copy(self.otherFluidMin),
        networks = self.networks or defaultNetworks,
        comps = self.comps,
    }
end

---@return DispSettings
function DispClass.getEmptySettings()
    return --[[---@type DispSettings]] {
        mode = ST_MODE_OFF,
        signals = { },
        networks = defaultNetworks,
    }
end

---@param source DispSettings
function DispClass:setSettings(source)
    --[[DEBUG]]log("ViiRLD: DispClass:setSettings: "..var_dump(source))
    if source then
        local mode = source.mode
        if mode and ST_MODES[mode] then
            self.mode = mode
        end
        local outMode = source.outMode
        if outMode == nil or ST_OUTS[outMode] then
            self.outMode = outMode
        end
        if source.flagMute == nil or type(source.flagMute) == "boolean" then
            self.flagMute = source.flagMute or nil
        end
        if source.flagTamp == nil or type(source.flagTamp) == "boolean" then
            self.flagTamp = source.flagTamp or nil
        end
        if source.flagTurnInserters == nil or type(source.flagTurnInserters) == "boolean" then
            self.flagTurnInserters = source.flagTurnInserters or nil
        end
        if source.flagUseSignals == nil or type(source.flagUseSignals) == "boolean" then
            self.flagUseSignals = source.flagUseSignals or nil
        end
        if source.flagUseEquals == nil or type(source.flagUseEquals) == "boolean" then
            self.flagUseEquals = source.flagUseEquals or nil
        end
        if source.flagAllowMulti == nil or type(source.flagAllowMulti) == "boolean" then
            self.flagAllowMulti = source.flagAllowMulti or nil
        end
        if source.flagReverseLocos == nil or type(source.flagReverseLocos) == "boolean" then
            self.flagReverseLocos = source.flagReverseLocos or nil
        end
        if source.flagBuild == nil or type(source.flagBuild) == "boolean" then
            self.flagBuild = source.flagBuild or nil
        end
        if source.flagDestroy == nil or type(source.flagDestroy) == "boolean" then
            self.flagDestroy = source.flagDestroy or nil
        end
        if source.otherCargoMin == nil or validCountWithUnits(source.otherCargoMin) then
            self.otherCargoMin = source.otherCargoMin
        end
        if source.otherFluidMin == nil or validCountWithUnits(source.otherFluidMin) then
            self.otherFluidMin = source.otherFluidMin
        end
        if source.networks ~= nil and type(source.networks) == "number" and source.networks > 0 then
            self.networks = source.networks
            if self.mode == ST_MODE_DEPOT and self.stop and self.stop.train then
                self.stop.train.networks = self.networks
            end
        end
        if source.comps ~= nil then
            local comps = parseTrainCompositions(source.comps)
            self.comps = comps and table.concat(comps, " ")
        end
        ---@type table<string, true>
        local signalNames = {}
        local signals = source.signals
        if signals and type(signals) == "table" then
            ---@type table<number, DispSignal>
            local validSignals = {}
            for index, sig in pairs(signals) do
                if type(index) == "string" then
                    index = tonumber(index)
                end
                if signalNames[sig.name] or validSignals[index] then
                    goto nextSignal
                end
                if index < 1 or index > dispatcherSignalSlotCount then
                    goto nextSignal
                end
                if sig.type == "item" then
                    if not game.item_prototypes[sig.name] then
                        goto nextSignal
                    end
                elseif sig.type == "fluid" then
                    if not game.fluid_prototypes[sig.name] then
                        goto nextSignal
                    end
                else
                    goto nextSignal
                end
                local request = sig.request
                local min = sig.min
                if request and not validCountWithUnits(request) then
                    goto nextSignal
                end
                if min and not validCountWithUnits(min) then
                    goto nextSignal
                end
                validSignals[index] = sig
                signalNames[sig.name] = true
                :: nextSignal ::
            end
            self.signals = validSignals
        end
        if self.stop then
            self.stop:settingsUpdated()
        end
    end
end

function DispClass:updateVisual()
    if self.gui then
        self.gui:updateStopInfo()
    end
    if not self.entity.valid then
        return
    end
    ---@type string
    local color
    local notWorking
    if self.stop then
        if self.mode == ST_MODE_BIDI then
            if self.stop:isValid() then
                notWorking = self.stop.errorMask
                if self.stop.train then
                    color = DISP_COLOR_AQUA
                elseif table_size(self.stop.deliveries) > 0 then
                    color = DISP_COLOR_YELLOW
                else
                    color = DISP_COLOR_GREEN
                end
            else
                color = DISP_COLOR_LIGHT_RED
            end
        elseif self.mode == ST_MODE_OFF then
            color = DISP_COLOR_GREEN_DARK
        elseif self.mode == ST_MODE_DEPOT then
            -- depot
            if self.stop.train then
                if self.stop.train.isFree then
                    color = DISP_COLOR_AQUA
                else
                    color = DISP_COLOR_YELLOW
                end
            else
                color = DISP_COLOR_WHITE
            end
        else
            -- clean or fuel
            if self.stop.train then
                color = DISP_COLOR_AQUA
            else
                color = DISP_COLOR_WHITE
            end
        end
    else
        color = DISP_COLOR_OFF
    end
    local beh = (--[[---@type LuaArithmeticCombinatorControlBehavior]] self.entity.get_control_behavior())
    if color ~= beh.parameters.operation or self.uid ~= beh.parameters.first_constant then
        beh.parameters = { first_constant = self.uid, operation = color }
    end

    if notWorking then
        if not self._nws then
            self._nws = rendering.draw_sprite {
                sprite = "utility/status_not_working",
                target = self.entity,
                surface = self.entity.surface,
                x_scale = .6,
                y_scale = .45,
                target_offset = { 0, -.3 },
                render_layer = "light-effect",
            }
        end
    else
        if self._nws then
            rendering.destroy(self._nws)
            self._nws = nil
        end
    end


    --[[
    "*", "/", "+", "-", "%", "^", "<<", ">>", "AND", "OR", "XOR"
    entity.plus_symbol_sprites = colorLight { r = 1, g = 0, b = 0 }
    entity.minus_symbol_sprites = colorLight { r = 0, g = 1, b = 0 }
    entity.divide_symbol_sprites = colorLight { r = 0, g = 0, b = 1 }
    entity.modulo_symbol_sprites = colorLight { r = 1, g = 1, b = 0 }
    entity.power_symbol_sprites = colorLight { r = 1, g = 0, b = 1 }
    entity.left_shift_symbol_sprites = colorLight { r = 0, g = 1, b = 1 }
    entity.right_shift_symbol_sprites = colorLight { r = 1, g = 1, b = 1 }
    entity.and_symbol_sprites = colorLight { r = 0, g = .5, b = 0 }
    entity.or_symbol_sprites = colorLight {r = .5, g = .5, b = 0}
    ]]
end

---@param fromEntity LuaEntity
---@param toEntity LuaEntity
function DispClass.handlePaste(fromEntity, toEntity)
    if toEntity.name == "viirld-dispatcher" then
        local to = DispClass.ofEntity(toEntity)
        if fromEntity.name == "viirld-dispatcher" then
            local from = DispClass.ofEntity(fromEntity)
            to:setSettings(from:getSettings())
        end
        if to.stop then
            to.stop:update()
        else
            to:updateVisual()
        end
        local beh = (--[[---@type LuaArithmeticCombinatorControlBehavior]] toEntity.get_control_behavior())
        if toEntity.unit_number ~= beh.parameters.first_constant then
            beh.parameters = { first_constant = toEntity.unit_number, operation = beh.parameters.operation }
        end
    end
end
