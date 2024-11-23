--[[DEBUG_BEGIN]]
if script.active_mods["gvv"] then
    require("__gvv__.gvv")()
end
--[[DEBUG_END]]

require("__core__.lualib.util")
require "script.utils"
require "script.units"
require "script.storage"
require "script.const"
require "script.config"
require "script.org"
require "script.train"
require "script.entity"
require "script.gui"
require "script.gui_disp"

script.on_init(function()
    storageInit()
    configUpdate()
    globalUpdateTimer()
    --netsGuiAddButtonToAllPlayers()
end)

script.on_configuration_changed(function()
    storageInit()
    configUpdate()
    --netsGuiAddButtonToAllPlayers()
end)

script.on_load(function()
    configUpdate()
    globalUpdateTimer()
end)

---@param event OnRuntimeModSettingChanged
script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    configUpdate()
    globalUpdateTimer()
end)


--region Entity

---@param event OnPlayerRotatedEntity
script.on_event(defines.events.on_player_rotated_entity, function(event)
    --if event.entity.name == "decider-combinator" then
        --log("R "..var_dump(event.entity.get_or_create_control_behavior().parameters))
        --local params = event.entity.get_or_create_control_behavior().parameters
        --for k, v in pairs(params.outputs) do
        --    v.constant = -10
        --end
        --event.entity.get_or_create_control_behavior().parameters= table.deepcopy(params)
    --end
    if event.entity.name == "viirld-dispatcher" or (event.entity.type == "entity-ghost" and event.entity.ghost_name == "viirld-dispatcher") then
        if event.entity.direction == defines.direction.north then
            event.entity.direction = defines.direction.west
        elseif event.entity.direction == defines.direction.south then
            event.entity.direction = defines.direction.east
        elseif event.entity.direction == defines.direction.west then
            event.entity.direction = defines.direction.south
        elseif event.entity.direction == defines.direction.east then
            event.entity.direction = defines.direction.north
        end
    end
end)

---@param event OnEntitySettingsPasted
script.on_event(
        defines.events.on_entity_settings_pasted,
        function(event)
            ---@type DispSettings
            local source
            if event.source.name == "viirld-dispatcher" then
                local disp = storage.disps[event.source.unit_number]
                source = disp and disp.settings
            elseif event.source.type == "entity-ghost" and event.source.ghost_name == "viirld-dispatcher" then
                source = dispCombinatorToSettings(event.source)
            end
            if not source then
                if event.destination.name == "viirld-dispatcher" then
                    local destination = storage.disps[event.destination.unit_number]
                    if destination then
                        -- restore
                        dispSettingsToCombinator(destination.settings, destination.entity)
                    end
                end
                return
            end
            if event.destination.name == "viirld-dispatcher" then
                local destination = storage.disps[event.destination.unit_number]
                if destination then
                    dispSetSettings(destination, source)
                end
            elseif event.destination.type == "entity-ghost" and event.destination.ghost_name == "viirld-dispatcher" then
                dispSettingsToCombinator(source, event.destination)
            end
        end
)

---@param event OnBuiltEntity | OnRobotBuiltEntity | ScriptRaisedBuilt | ScriptRaisedRevive
local function onEntityBuilt(event)
    local entity = event.entity
    if entity and entity.valid and (entity.type == "train-stop" or entity.name == "viirld-dispatcher") then
        for _, model in pairs(storage.guiModels) do
            ---@type DispGui
            if model.self and (model.self.ghost and not model.self.ghost.valid or model.self.disp and not model.self.disp.entity.valid) then
                DispGuiLua.close(model.self, true)
            end
        end
        entityHandleBuilt(entity, event.tags)
        if entity.train then
            trainUpdateStation(entity.train)
        end
    end
end

local builtFilter = { { filter = "type", type = "train-stop" }, { filter = "name", name = "viirld-dispatcher" } }
script.on_event(defines.events.on_built_entity, onEntityBuilt, builtFilter)
script.on_event(defines.events.on_robot_built_entity, onEntityBuilt, builtFilter)
script.on_event({ defines.events.script_raised_built, defines.events.script_raised_revive }, onEntityBuilt)

---@param event OnPlayerMinedEntity|OnEntityDied|OnRobotMinedEntity|ScriptRaisedDestroy
script.on_event(
        {
            defines.events.on_player_mined_entity,
            defines.events.on_entity_died,
            defines.events.on_robot_mined_entity,
            defines.events.script_raised_destroy,
        },
        function(event)
            local entity = event.entity
            if entity and entity.valid then
                if entity.type == "train-stop" or entity.name == "viirld-dispatcher" then
                    entityHandleRemoved(entity)
                elseif entity.train then
                    trainUpdateStation(entity.train, true)
                    if entity == entity.train.front_stock and entity == entity.train.back_stock then
                        --[[DEBUG]]log("entityRemoved: Fully removed train " .. var_dump(entity.train.id))
                        --MoverClass.handleRemove(entity.train.id)
                    end
                elseif entity.type == "entity-ghost" and entity.ghost_name == "viirld-dispatcher" then
                    for _, model in pairs(storage.guiModels) do
                        ---@type DispGui
                        if model.self and (model.self.ghost and not model.self.ghost.valid or model.self.disp and not model.self.disp.entity.valid) then
                            DispGuiLua.close(model.self, true)
                        end
                    end
                end
            end
        end
)

---@param event OnPreSurfaceCleared|OnPreSurfaceDeleted
script.on_event(
        { defines.events.on_pre_surface_cleared, defines.events.on_pre_surface_deleted, },
        function(event)
            for _, forceOrg in pairs(storage.orgs) do
                local org = forceOrg[event.surface_index]
                if org then
                    forceOrg[event.surface_index] = nil
                    for _, disp in pairs(org.disps) do
                        storage.disps[disp.stopEntity and disp.stopEntity.valid and disp.stopEntity.unit_number or -1] = nil
                        storage.disps[disp.entity and disp.entity.valid and disp.entity.unit_number or -1] = nil
                        storage.disps[disp.uid] = nil
                        storage.activeDisps[disp.uid] = nil
                        for uid, d in pairs(storage.disps) do
                            if d == disp then
                                storage.disps[uid] = nil
                            end
                        end
                    end
                end
            end
            for k, delivery in pairs(storage.deliveries) do
                if delivery.provider and delivery.provider.org.surface.index == event.surface_index
                        or delivery.requester and delivery.requester.org.surface.index == event.surface_index
                then
                    storage.deliveries[k] = nil
                end
            end
        end
)

---@param event OnForceCreated
script.on_event(
        defines.events.on_force_created,
        function(event)
            if storage.scheduleHelperSurface then
                event.force.set_surface_hidden(storage.scheduleHelperSurface, true)
            end
        end
)


--endregion



--script.on_event(defines.events.on_player_created, netsGuiAddButtonToAllPlayers)
--
--script.on_event(defines.events.on_player_changed_surface, netsGuiSurfaceChanged)
--script.on_event(defines.events.on_player_changed_force, netsGuiSurfaceChanged)
----


--region Entity Gui

---@param event OnGuiOpened
script.on_event(
        defines.events.on_gui_opened,
        function(event)
            if event.gui_type == defines.gui_type.entity and event.entity then
                if event.entity.name == "viirld-dispatcher" or event.entity.type == "entity-ghost" and event.entity.ghost_name == "viirld-dispatcher" then
                    DispGuiLua.open(event)
                end
            end
        end
)

---@param event OnEntityRenamed
script.on_event(
        defines.events.on_entity_renamed,
        function(event)
            local disp = storage.disps[event.entity.unit_number]
            if disp then
                if disp.gui then
                    DispGuiLua.updateStationName(disp.gui)
                end
                dispUpdateStopName(disp)
            end
        end
)

guiSetup()
--endregion

---@param event OnTrainChangedState
script.on_event(
        defines.events.on_train_changed_state,
        function(event)
            --log(var_dump(game.tick) ..": on_train_changed_state: train " .. var_dump(event.train.id) .. " state " .. var_dump(train_state_string[event.old_state]) .. " -> " .. var_dump(train_state_string[event.train.state]) .. " at st " .. var_dump(event.train.station))
            local train = event.train
            trainUpdateStation(train)
            --if train.state == defines.train_state.wait_station and train.station then
            --    MoverClass.handleArrival(train)
            --elseif event.old_state == defines.train_state.wait_station then
            --    MoverClass.handleDeparture(train)
            --end
        end
)

---@param event OnTrainCreated
script.on_event(
        defines.events.on_train_created,
        function(event)
            local trainOnStation = (event.old_train_id_1 and storage.trainStation[event.old_train_id_1])
                    or (event.old_train_id_2 and storage.trainStation[event.old_train_id_2])
            if trainOnStation then
                if trainOnStation.station.valid then
                    local train = event.train
                    local disp = storage.disps[trainOnStation.station.unit_number]
                    if disp then
                        disp.stoppedTrain = train
                        disp.stoppedTrainType = getTrainType(train)
                    end
                    if event.old_train_id_1 then
                        storage.trainStation[event.old_train_id_1] = nil
                    end
                    if event.old_train_id_2 then
                        storage.trainStation[event.old_train_id_2] = nil
                    end
                    storage.trainStation[train.id] = trainOnStation
                    trainUpdateStation(train)
                else
                    if event.old_train_id_1 then
                        storage.trainStation[event.old_train_id_1] = nil
                    end
                    if event.old_train_id_2 then
                        storage.trainStation[event.old_train_id_2] = nil
                    end
                    trainUpdateStation(event.train, true)
                end
            end
        end
)
----
--script.on_event(
--        defines.events.on_entity_settings_pasted,
--        ---@overload fun (event: EventData)
--        ---@param event OnEntitySettingsPasted
--        function(event)
--            game.players[event.player_index].print("Pasted!" .. tostring(event.tick))
--            DispClass.handlePaste(event.source, event.destination)
--        end
--)
----
----script.on_event(
----        defines.events.on_player_rotated_entity,
----        ---@overload fun (event: EventData)
----        ---@param event OnPlayerRotatedEntity
----        function(event)
----            if event.entity.valid and event.entity.name == 'viirld-dispatcher' then
----                if event.entity.direction == defines.direction.north then
----                    event.entity.direction = defines.direction.west
----                elseif event.entity.direction == defines.direction.south then
----                    event.entity.direction = defines.direction.east
----                elseif event.entity.direction == defines.direction.west then
----                    event.entity.direction = defines.direction.south
----                elseif event.entity.direction == defines.direction.east then
----                    event.entity.direction = defines.direction.north
----                end
----            end
----        end
----)
----
-------@param blueprint LuaItemStack
-------@param mapping table<uint, LuaEntity>
----local function dataToBlueprint(blueprint, mapping)
----    for i, entity in pairs(mapping) do
----        if entity.valid then
----            local disp = storage.disps[entity.unit_number]
----            if disp then
----                blueprint.set_blueprint_entity_tag(i, 'viirld', disp:getSettings())
----            end
----        end
----    end
----end
----
----script.on_event(
----        defines.events.on_player_setup_blueprint,
----        ---@overload fun (event: EventData)
----        ---@param event OnPlayerSetupBlueprint
----        function(event)
----            local player = game.players[event.player_index]
----            local cursor = player.cursor_stack
----            local mapping = event.mapping.get()
----            --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: opened: " .. var_dump(player.opened))
----            --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: mapping: " .. var_dump(mapping))
----            if cursor and cursor.valid_for_read and cursor.type == 'blueprint' and cursor.get_blueprint_entities() then
----                --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: entities: " .. var_dump(cursor.get_blueprint_entities()))
----                dataToBlueprint(cursor, mapping)
----                return
----            end
----            if storage.openedBlueprints and storage.openedBlueprints[event.player_index] and storage.openedBlueprints[event.player_index].valid then
----                --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: opened blueprint: " .. var_dump(storage.openedBlueprints[event.player_index]))
----                dataToBlueprint(storage.openedBlueprints[event.player_index], mapping)
----                return
----            end
----            storage.blueprintMappings = storage.blueprintMappings or {}
----            storage.blueprintMappings[player.index] = mapping
----        end
----)
----
------ saving to regular blueprint
----script.on_event(
----        defines.events.on_player_configured_blueprint,
----        ---@overload fun (event: EventData)
----        ---@param event OnPlayerConfiguredBlueprint
----        function(event)
----            if storage.blueprintMappings then
----                --[[DEBUG]]log("ViiRLD: on_player_configured_blueprint: blueprintMappings: " .. var_dump(storage.blueprintMappings))
----                local player = game.players[event.player_index]
----                local mapping = storage.blueprintMappings[player.index]
----                local cursor = player.cursor_stack
----
----                if cursor and cursor.valid_for_read and cursor.type == 'blueprint' and mapping and #mapping == cursor.get_blueprint_entity_count() then
----                    dataToBlueprint(cursor, mapping)
----                end
----                storage.blueprintMappings[player.index] = nil
----            end
----        end
----)
----
----remote.add_interface(
----        "viirld",
----            --[[---@type]]{
----            informatron_menu = function(data)
----                return informatronMenu(data.player_index)
----            end,
----            informatron_page_content = function(data)
----                return informatronPageContent(data.page_name, data.player_index, data.element)
----            end,
----        }
----)
--
--guiSetup()

---@param event CustomInputEvent
script.on_event("viirld-pause-key", function(event)
    local player = game.players[event.player_index]
    local sel = player.selected
    if sel and sel.name == "viirld-dispatcher" then
        local disp = storage.disps[sel.unit_number]
        if disp then
            dispToggleUserPause(disp, player)
        end
    end
end)