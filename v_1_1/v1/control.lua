require("__core__.lualib.util")
require "script.informatron"
require "script.utils"
require "script.units"
require "script.networks"
require "script.compositions"
require "script.const"
require "script.config"
require "script.gui"
require "script.DeliveryClass"
require "script.DispClass"
require "script.StopClass"
require "script.SurClass"
require "script.TrainClass"
require "script.DispGui"

script.on_init(function()
    global.surObs = global.surObs or {}
    global.activeStops = global.activeStops or {}
    global.disps = global.disps or {}
    global.guis = global.guis or {}
    global.removedSettings = global.removedSettings or {}
    global.mem = global.mem or {}
    updateConfig()
    SurClass.updateTimer()
end)

script.on_configuration_changed(function()
    global.surObs = global.surObs or {}
    global.activeStops = global.activeStops or {}
    global.disps = global.disps or {}
    global.guis = global.guis or {}
    global.removedSettings = global.removedSettings or {}
    global.mem = global.mem or {}
    updateConfig()
end)

script.on_load(function()
    if global.disps then
        for _, disp in pairs(global.disps) do
            restoreClass(DispClass, disp)
        end
    end
    if global.guis then
        for _, gui in pairs(global.guis) do
            restoreClass(DispGui, gui)
        end
    end
    SurClass.restoreMeta(global.surObs)
    SurClass.updateTimer()
    updateConfig()
end)

script.on_event(
        { defines.events.on_surface_cleared, defines.events.on_surface_deleted, },
        ---@overload fun (event: EventData)
        ---@param event OnSurfaceDeleted
        function(event)
            local sur = SurClass.ofSurfaceIndex(event.surface_index, true)
            if sur then
                sur:remove()

            end
        end
)

script.on_event(
        defines.events.on_runtime_mod_setting_changed,
        ---@overload fun (event: EventData)
        ---@param event OnRuntimeModSettingChanged
        function(event)
            updateConfig()
        end
)

script.on_event(
        defines.events.on_gui_opened,
        ---@overload fun (event: EventData)
        ---@param event OnGuiOpened
        function(event)
            --[[DEBUG]]log("ViiRLD: on_gui_opened: " .. var_dump(event))
            if event.gui_type == defines.gui_type.entity and event.entity then
                DispGui.handleGuiOpened(event)
            end
            if event.item and event.item.is_blueprint then
                --[[DEBUG]]log("ViiRLD: on_gui_opened: open blueprint")
                global.openedBlueprints = global.openedBlueprints or {}
                global.openedBlueprints[event.player_index] = event.item
            end
        end
)

script.on_event(
        defines.events.on_gui_closed,
        ---@overload fun (event: EventData)
        ---@param event OnGuiClosed
        function(event)
            DispGui.handleGuiClosed(event)
        end
)

script.on_event(
        defines.events.on_gui_confirmed,
        ---@overload fun (event: EventData)
        ---@param event OnGuiConfirmed
        function(event)
            DispGui.handleGuiClosed(event)
        end
)

script.on_event(
        {
            defines.events.on_gui_text_changed,
            defines.events.on_gui_checked_state_changed,
            defines.events.on_gui_elem_changed,
            defines.events.on_gui_value_changed,
            defines.events.on_gui_click,
        },
        ---@overload fun (event: EventData)
        ---@param event OnGuiClick
        function(event)
            if event.element.valid and event.element.tags[ST_TAG] then
                DispGui.handleGuiEvent(event)
            end
        end
)

local function entityBuilt(event)
    local entity = event.created_entity or event.entity
    if entity and entity.valid then
        DispClass.handleBuilt(entity, event.tags and event.tags["viirld"])
    end
end

local stopFilter = { { filter = "name", name = "train-stop" }, { filter = "name", name = "viirld-dispatcher" } }

script.on_event(defines.events.on_built_entity, entityBuilt, --[[---@type ]]stopFilter)
script.on_event(defines.events.on_robot_built_entity, entityBuilt, --[[---@type ]]stopFilter)
script.on_event({ defines.events.script_raised_built, defines.events.script_raised_revive }, entityBuilt)

---@overload fun (event: EventData)
---@param event OnPlayerMinedEntity
local function entityRemoved(event)
    local entity = event.entity
    --[[DEBUG]] log("ViiRLD: entityRemoved: " .. var_dump(event) .. " entity valid: " .. var_dump(entity and entity.valid))
    if entity and entity.valid then
        if entity.name == "train-stop" or entity.name == "viirld-dispatcher" then
            DispClass.handleRemoved(entity)
        elseif entity.train then
            TrainClass.handleRemoved(entity.surface.index, entity.train.id)
        end
    end
end
script.on_event(defines.events.on_player_mined_entity, entityRemoved)
script.on_event(defines.events.on_entity_died, entityRemoved)
script.on_event(defines.events.on_robot_mined_entity, entityRemoved)
script.on_event(defines.events.script_raised_destroy, entityRemoved)

script.on_event(
        defines.events.on_train_changed_state,
        ---@overload fun (event: EventData)
        ---@param event OnTrainChangedState
        function(event)
            local train = event.train
            if train.state == defines.train_state.wait_station and train.station then
                TrainClass.handleArrival(train)
            elseif event.old_state == defines.train_state.wait_station then
                TrainClass.handleDeparture(train)
            end
        end
)

script.on_event(
        defines.events.on_train_created,
        ---@overload fun (event: EventData)
        ---@param event OnTrainCreated
        function(event)
            local train = event.train
            if event.old_train_id_1 then
                TrainClass.handleRemoved(train.front_stock.surface.index, event.old_train_id_1)
            end
            if event.old_train_id_2 then
                TrainClass.handleRemoved(train.front_stock.surface.index, event.old_train_id_2)
            end
        end
)

script.on_event(
        defines.events.on_entity_settings_pasted,
        ---@overload fun (event: EventData)
        ---@param event OnEntitySettingsPasted
        function(event)
            DispClass.handlePaste(event.source, event.destination)
        end
)

script.on_event(
        defines.events.on_player_rotated_entity,
        ---@overload fun (event: EventData)
        ---@param event OnPlayerRotatedEntity
        function(event)
            if event.entity.valid and event.entity.name == 'viirld-dispatcher' then
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
        end
)

---@param blueprint LuaItemStack
---@param mapping table<uint, LuaEntity>
local function dataToBlueprint(blueprint, mapping)
    for i, entity in pairs(mapping) do
        if entity.valid then
            local disp = global.disps[entity.unit_number]
            if disp then
                blueprint.set_blueprint_entity_tag(i, 'viirld', disp:getSettings())
            end
        end
    end
end

script.on_event(
        defines.events.on_player_setup_blueprint,
        ---@overload fun (event: EventData)
        ---@param event OnPlayerSetupBlueprint
        function(event)
            local player = game.players[event.player_index]
            local cursor = player.cursor_stack
            local mapping = event.mapping.get()
            --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: opened: " .. var_dump(player.opened))
            --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: mapping: " .. var_dump(mapping))
            if cursor and cursor.valid_for_read and cursor.type == 'blueprint' and cursor.get_blueprint_entities() then
                --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: entities: " .. var_dump(cursor.get_blueprint_entities()))
                dataToBlueprint(cursor, mapping)
                return
            end
            if global.openedBlueprints and global.openedBlueprints[event.player_index] and global.openedBlueprints[event.player_index].valid then
                --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: opened blueprint: " .. var_dump(global.openedBlueprints[event.player_index]))
                dataToBlueprint(global.openedBlueprints[event.player_index], mapping)
                return
            end
            global.blueprintMappings = global.blueprintMappings or {}
            global.blueprintMappings[player.index] = mapping
        end
)

-- saving to regular blueprint
script.on_event(
        defines.events.on_player_configured_blueprint,
        ---@overload fun (event: EventData)
        ---@param event OnPlayerConfiguredBlueprint
        function(event)
            if global.blueprintMappings then
                --[[DEBUG]]log("ViiRLD: on_player_configured_blueprint: blueprintMappings: " .. var_dump(global.blueprintMappings))
                local player = game.players[event.player_index]
                local mapping = global.blueprintMappings[player.index]
                local cursor = player.cursor_stack

                if cursor and cursor.valid_for_read and cursor.type == 'blueprint' and mapping and #mapping == cursor.get_blueprint_entity_count() then
                    dataToBlueprint(cursor, mapping)
                end
                global.blueprintMappings[player.index] = nil
            end
        end
)

remote.add_interface(
        "viirld",
            --[[---@type]]{
            informatron_menu = function(data)
                return informatronMenu(data.player_index)
            end,
            informatron_page_content = function(data)
                return informatronPageContent(data.page_name, data.player_index, data.element)
            end,
        }
)
