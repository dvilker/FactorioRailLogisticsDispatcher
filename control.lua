if script.active_mods["gvv"] then
    require("__gvv__.gvv")()
end

require("__core__.lualib.util")
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
    SurClass.updateTimer()
end)

script.on_configuration_changed(function()
    global.surObs = global.surObs or {}
    global.activeStops = global.activeStops or {}
    global.disps = global.disps or {}
    global.guis = global.guis or {}
    global.removedSettings = global.removedSettings or {}
    global.mem = global.mem or {}
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
        defines.events.on_gui_opened,
        ---@overload fun (event: EventData)
        ---@param event OnGuiOpened
        function(event)
            if event.gui_type == defines.gui_type.entity and event.entity then
                DispGui.handleGuiOpened(event)
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
        DispClass.handleBuilt(entity, event.tags and event.tags["yatm"])
    end
end

local stopFilter = { { filter = "name", name = "train-stop" }, { filter = "name", name = "yatm-dispatcher" } }

script.on_event(defines.events.on_built_entity, entityBuilt, --[[---@type ]]stopFilter)
script.on_event(defines.events.on_robot_built_entity, entityBuilt, --[[---@type ]]stopFilter)
script.on_event({ defines.events.script_raised_built, defines.events.script_raised_revive }, entityBuilt)

---@overload fun (event: EventData)
---@param event OnPlayerMinedEntity
local function entityRemoved(event)
    local entity = event.entity
    if entity and entity.valid then
        if entity.name == "train-stop" or entity.name == "yatm-dispatcher" then
            DispClass.handleRemoved(entity)
        elseif entity.train then
            TrainClass.handleRemoved(entity.surface.index, entity.train.id)
        end
    end
end
script.on_event(defines.events.on_pre_player_mined_item, entityRemoved)
script.on_event(defines.events.on_entity_died, entityRemoved)
script.on_event(defines.events.on_robot_pre_mined, entityRemoved)
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
            if event.entity.valid and event.entity.name == 'yatm-dispatcher' then
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

lastBlue = nil

script.on_event(defines.events.on_player_setup_blueprint, function(event)
    local player = game.players[event.player_index]
    lastBlue = player.blueprint_to_setup
    lastBlueE = player.blueprint_to_setup.get_blueprint_entities()
end)



-----------


---@param blueprint LuaItemStack
---@param mapping table<uint, LuaEntity>
local function dataToBlueprint(blueprint, mapping)
    for i, entity in pairs(mapping) do
        if entity.valid then
            local disp = global.disps[entity.unit_number]
            if disp then
                blueprint.set_blueprint_entity_tag(i, 'yatm', disp:getSettings())
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
            if cursor and cursor.valid_for_read and cursor.type == 'blueprint' then
                dataToBlueprint(cursor, event.mapping.get())
            else
                global.blueprintMappings = global.blueprintMappings or {}
                global.blueprintMappings[player.index] = event.mapping.get()
            end
        end
)

-- saving to regular blueprint
script.on_event(
        defines.events.on_player_configured_blueprint,
        ---@overload fun (event: EventData)
        ---@param event OnPlayerConfiguredBlueprint
        function(event)
            if global.blueprintMappings then
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


