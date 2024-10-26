---@type fun()
nextTickCb = nil

require("__core__.lualib.util")
require "script.informatron"
require "script.utils"
require "script.units"
require "script.global"
require "script.compositions"
require "script.const"
require "script.config"
require "script.prefs"
require "script.gui"
require "script.DeliveryClass"
require "script.DispClass"
require "script.NetClass"
require "script.MoverClass"
require "script.DispGui"
require "script.NetsButtonGui"
require "script.NetsGui"

script.on_init(function()
    globalInit()
    configUpdate()
    globalUpdateTimer()
    netsGuiAddButtonToAllPlayers()
end)

script.on_configuration_changed(function()
    globalInit()
    configUpdate()
    netsGuiAddButtonToAllPlayers()
end)

script.on_load(function()
    globalRestoreClasses()
    configUpdate()
    globalUpdateTimer()
end)

script.on_event(defines.events.on_player_created, netsGuiAddButtonToAllPlayers)

script.on_event(defines.events.on_player_changed_surface, netsGuiSurfaceChanged)
script.on_event(defines.events.on_player_changed_force, netsGuiSurfaceChanged)
--
--script.on_event(
--        { defines.events.on_surface_cleared, defines.events.on_surface_deleted, },
--        ---@overload fun (event: EventData)
--        ---@param event OnSurfaceDeleted
--        function(event)
--            local sur = SurClass.ofSurfaceIndex(event.surface_index, true)
--            if sur then
--                sur:remove()
--
--            end
--        end
--)
--
--script.on_event(
--        defines.events.on_runtime_mod_setting_changed,
--        ---@overload fun (event: EventData)
--        ---@param event OnRuntimeModSettingChanged
--        function(event)
--            updateConfig()
--        end
--)
--
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

--script.on_event(
--        defines.events.on_gui_closed,
--        ---@overload fun (event: EventData)
--        ---@param event OnGuiClosed
--        function(event)
--            DispGui.handleGuiClosed(event)
--        end
--)

--script.on_event(
--        defines.events.on_gui_confirmed,
--        ---@overload fun (event: EventData)
--        ---@param event OnGuiConfirmed
--        function(event)
--            DispGui.handleGuiClosed(event)
--        end
--)

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
            if event.element.valid and event.element.tags[TAG] then
                DispGui.handleGuiEvent(event)
            end
        end
)

local function entityBuilt(event)
    local entity = event.created_entity or event.entity
    if entity and entity.valid then
        DispClass.handleBuilt(entity)
    end
end

local stopFilter = { { filter = "type", type = "train-stop" }, { filter = "name", name = "viirld2-dispatcher" } }

script.on_event(defines.events.on_built_entity, entityBuilt, --[[---@type ]]stopFilter)
script.on_event(defines.events.on_robot_built_entity, entityBuilt, --[[---@type ]]stopFilter)
script.on_event({ defines.events.script_raised_built, defines.events.script_raised_revive }, entityBuilt)

---@overload fun (event: EventData)
---@param event OnPlayerMinedEntity
local function entityRemoved(event)
    local entity = event.entity
    --[[DEBUG]] log("ViiRLD: entityRemoved: " .. var_dump(event) .. " entity valid: " .. var_dump(entity and entity.valid))
    if entity and entity.valid then
        if entity.name == "train-stop" or entity.name == "viirld2-dispatcher" then
            DispClass.handleRemoved(entity)
        elseif entity.train then
            if entity == entity.train.front_stock and entity == entity.train.back_stock then
                --[[DEBUG]]log("entityRemoved: Fully removed train " .. var_dump(entity.train.id))
                MoverClass.handleRemove(entity.train.id)
            end
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
            -- [[DEBUG]]log("on_train_changed_state: train " .. var_dump(event.train.id) .. ": " .. var_dump(event))
            local train = event.train
            if train.state == defines.train_state.wait_station and train.station then
                MoverClass.handleArrival(train)
            elseif event.old_state == defines.train_state.wait_station then
                MoverClass.handleDeparture(train)
            end
        end
)

script.on_event(
        defines.events.on_train_schedule_changed,
        ---@overload fun (event: EventData)
        ---@param event OnTrainScheduleChanged
        function(event)
            -- [[DEBUG]]log("on_train_schedule_changed: train " .. var_dump(event.train.id) .. ": " .. var_dump(event))
            -- [[DEBUG]]log("on_train_schedule_changed: schedule " .. var_dump(event.train.schedule))
            MoverClass.handleScheduleChanged(event.train)
            --local train = event.train
            --if train.state == defines.train_state.wait_station and train.station then
            --    MoverClass.handleArrival(train)
            --elseif event.old_state == defines.train_state.wait_station then
            --    MoverClass.handleDeparture(train)
            --end
        end
)

script.on_event(
        defines.events.on_train_created,
        ---@overload fun (event: EventData)
        ---@param event OnTrainCreated
        function(event)
            --[[DEBUG]]log("on_train_created: train " .. var_dump(event.train.id) .. ": " .. var_dump(event))
            local trainInfo = MoverClass.getTrainInfoFromSchedule(event.train)
            if trainInfo then
                MoverClass.handleCreate(event.train, trainInfo)
            end
            if event.old_train_id_1 then
                MoverClass.handleRemove(event.old_train_id_1)
            end
            if event.old_train_id_2 then
                MoverClass.handleRemove(event.old_train_id_2)
            end
            --event.old_train_id_1

            --local train = event.train
            --train.schedule = { current = 1, records = {
            --    {
            --        station = "Depot",
            --        wait_conditions = {
            --            {
            --                type = "circuit",
            --                compare_type = "or",
            --                condition = {
            --                    comparator = "≤",
            --                    first_signal = { type = "fluid", name = "viirld2-network-signal" },
            --                    constant = 441,
            --                }
            --
            --            },
            --            {
            --                type = "circuit",
            --                compare_type = "or",
            --                condition = {
            --                    comparator = "≤",
            --                    first_signal = { type = "fluid", name = "viirld2-delivery-signal" },
            --                    constant = 441,
            --                }
            --
            --            },
            --        }
            --    }
            --} }
            --if event.old_train_id_1 then
            --    MoverClass.handleRemoved(train.front_stock.surface.index, event.old_train_id_1)
            --end
            --if event.old_train_id_2 then
            --    MoverClass.handleRemoved(train.front_stock.surface.index, event.old_train_id_2)
            --end
        end
)
--
script.on_event(
        defines.events.on_entity_settings_pasted,
        ---@overload fun (event: EventData)
        ---@param event OnEntitySettingsPasted
        function(event)
            game.players[event.player_index].print("Pasted!" .. tostring(event.tick))
            DispClass.handlePaste(event.source, event.destination)
        end
)
--
--script.on_event(
--        defines.events.on_player_rotated_entity,
--        ---@overload fun (event: EventData)
--        ---@param event OnPlayerRotatedEntity
--        function(event)
--            if event.entity.valid and event.entity.name == 'viirld-dispatcher' then
--                if event.entity.direction == defines.direction.north then
--                    event.entity.direction = defines.direction.west
--                elseif event.entity.direction == defines.direction.south then
--                    event.entity.direction = defines.direction.east
--                elseif event.entity.direction == defines.direction.west then
--                    event.entity.direction = defines.direction.south
--                elseif event.entity.direction == defines.direction.east then
--                    event.entity.direction = defines.direction.north
--                end
--            end
--        end
--)
--
-----@param blueprint LuaItemStack
-----@param mapping table<uint, LuaEntity>
--local function dataToBlueprint(blueprint, mapping)
--    for i, entity in pairs(mapping) do
--        if entity.valid then
--            local disp = storage.disps[entity.unit_number]
--            if disp then
--                blueprint.set_blueprint_entity_tag(i, 'viirld', disp:getSettings())
--            end
--        end
--    end
--end
--
--script.on_event(
--        defines.events.on_player_setup_blueprint,
--        ---@overload fun (event: EventData)
--        ---@param event OnPlayerSetupBlueprint
--        function(event)
--            local player = game.players[event.player_index]
--            local cursor = player.cursor_stack
--            local mapping = event.mapping.get()
--            --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: opened: " .. var_dump(player.opened))
--            --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: mapping: " .. var_dump(mapping))
--            if cursor and cursor.valid_for_read and cursor.type == 'blueprint' and cursor.get_blueprint_entities() then
--                --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: entities: " .. var_dump(cursor.get_blueprint_entities()))
--                dataToBlueprint(cursor, mapping)
--                return
--            end
--            if storage.openedBlueprints and storage.openedBlueprints[event.player_index] and storage.openedBlueprints[event.player_index].valid then
--                --[[DEBUG]]log("ViiRLD: on_player_setup_blueprint: opened blueprint: " .. var_dump(storage.openedBlueprints[event.player_index]))
--                dataToBlueprint(storage.openedBlueprints[event.player_index], mapping)
--                return
--            end
--            storage.blueprintMappings = storage.blueprintMappings or {}
--            storage.blueprintMappings[player.index] = mapping
--        end
--)
--
---- saving to regular blueprint
--script.on_event(
--        defines.events.on_player_configured_blueprint,
--        ---@overload fun (event: EventData)
--        ---@param event OnPlayerConfiguredBlueprint
--        function(event)
--            if storage.blueprintMappings then
--                --[[DEBUG]]log("ViiRLD: on_player_configured_blueprint: blueprintMappings: " .. var_dump(storage.blueprintMappings))
--                local player = game.players[event.player_index]
--                local mapping = storage.blueprintMappings[player.index]
--                local cursor = player.cursor_stack
--
--                if cursor and cursor.valid_for_read and cursor.type == 'blueprint' and mapping and #mapping == cursor.get_blueprint_entity_count() then
--                    dataToBlueprint(cursor, mapping)
--                end
--                storage.blueprintMappings[player.index] = nil
--            end
--        end
--)
--
--remote.add_interface(
--        "viirld",
--            --[[---@type]]{
--            informatron_menu = function(data)
--                return informatronMenu(data.player_index)
--            end,
--            informatron_page_content = function(data)
--                return informatronPageContent(data.page_name, data.player_index, data.element)
--            end,
--        }
--)

guiSetup()
