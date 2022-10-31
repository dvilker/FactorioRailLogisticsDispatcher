-- Generated lua defines of Factorio api
-- https://github.com/dvilker/factorio-api-lua-defs

--- builtin_types
---@alias LuaObject userdata
---@alias double number
---@alias float number
---@alias int number
---@alias int8 number
---@alias uint number
---@alias uint16 number
---@alias uint64 number
---@alias uint8 number


--- defines

---@class defines__alert_type: any
  ---@field custom defines__alert_type
  ---@field entity_destroyed defines__alert_type
  ---@field entity_under_attack defines__alert_type
  ---@field no_material_for_construction defines__alert_type
  ---@field no_storage defines__alert_type
  ---@field not_enough_construction_robots defines__alert_type
  ---@field not_enough_repair_packs defines__alert_type
  ---@field train_out_of_fuel defines__alert_type
  ---@field turret_fire defines__alert_type

---@class defines__behavior_result: any @AI command exit status. See [LuaEntity::set_command](LuaEntity::set_command)
  ---@field deleted defines__behavior_result
  ---@field fail defines__behavior_result
  ---@field in_progress defines__behavior_result
  ---@field success defines__behavior_result

---@class defines__build_check_type: any
  ---@field blueprint_ghost defines__build_check_type
  ---@field ghost_revive defines__build_check_type
  ---@field manual defines__build_check_type
  ---@field manual_ghost defines__build_check_type
  ---@field script defines__build_check_type
  ---@field script_ghost defines__build_check_type

---@class defines__chain_signal_state: any @State of a chain signal.
  ---@field all_open defines__chain_signal_state
  ---@field none defines__chain_signal_state
  ---@field none_open defines__chain_signal_state
  ---@field partially_open defines__chain_signal_state

---@class defines__chunk_generated_status: any
  ---@field basic_tiles defines__chunk_generated_status
  ---@field corrected_tiles defines__chunk_generated_status
  ---@field custom_tiles defines__chunk_generated_status
  ---@field entities defines__chunk_generated_status
  ---@field nothing defines__chunk_generated_status
  ---@field tiles defines__chunk_generated_status

---@class defines__circuit_condition_index: any
  ---@field arithmetic_combinator defines__circuit_condition_index
  ---@field constant_combinator defines__circuit_condition_index
  ---@field decider_combinator defines__circuit_condition_index
  ---@field inserter_circuit defines__circuit_condition_index
  ---@field inserter_logistic defines__circuit_condition_index
  ---@field lamp defines__circuit_condition_index
  ---@field offshore_pump defines__circuit_condition_index
  ---@field pump defines__circuit_condition_index

---@class defines__circuit_connector_id: any
  ---@field accumulator defines__circuit_connector_id
  ---@field combinator_input defines__circuit_connector_id
  ---@field combinator_output defines__circuit_connector_id
  ---@field constant_combinator defines__circuit_connector_id
  ---@field container defines__circuit_connector_id
  ---@field electric_pole defines__circuit_connector_id
  ---@field inserter defines__circuit_connector_id
  ---@field lamp defines__circuit_connector_id
  ---@field linked_container defines__circuit_connector_id
  ---@field offshore_pump defines__circuit_connector_id
  ---@field programmable_speaker defines__circuit_connector_id
  ---@field pump defines__circuit_connector_id
  ---@field rail_chain_signal defines__circuit_connector_id
  ---@field rail_signal defines__circuit_connector_id
  ---@field roboport defines__circuit_connector_id
  ---@field storage_tank defines__circuit_connector_id
  ---@field wall defines__circuit_connector_id

---@class defines__command: any @Command given to units describing what they should do.
  ---@field attack defines__command @Attack another entity.
  ---@field attack_area defines__command @Go to a place and attack what you see.
  ---@field build_base defines__command @Go to a position and build a base there.
  ---@field compound defines__command @Chain commands together, see [defines.compound_command](defines.compound_command).
  ---@field flee defines__command @Flee from another entity.
  ---@field go_to_location defines__command @Go to a specific position.
  ---@field group defines__command @Do what your group wants you to do.
  ---@field stop defines__command @Stop moving and stay where you are.
  ---@field wander defines__command @Chill.

---@class defines__compound_command: any @How commands are joined together in a compound command (see [defines.command.compound](defines.command.compound)).
  ---@field logical_and defines__compound_command @Fail on first failure. Only succeeds if all commands (executed one after another) succeed.
  ---@field logical_or defines__compound_command @Succeed on first success. Only fails if all commands (executed one after another) fail.
  ---@field return_last defines__compound_command @Execute all commands in sequence and fail or succeed depending on the return status of the last command.

---@class defines__control_behavior__inserter__circuit_mode_of_operation: any
  ---@field enable_disable defines__control_behavior__inserter__circuit_mode_of_operation
  ---@field none defines__control_behavior__inserter__circuit_mode_of_operation
  ---@field read_hand_contents defines__control_behavior__inserter__circuit_mode_of_operation
  ---@field set_filters defines__control_behavior__inserter__circuit_mode_of_operation
  ---@field set_stack_size defines__control_behavior__inserter__circuit_mode_of_operation

---@class defines__control_behavior__inserter__hand_read_mode: any
  ---@field hold defines__control_behavior__inserter__hand_read_mode
  ---@field pulse defines__control_behavior__inserter__hand_read_mode

---@class defines__control_behavior__inserter: any
  ---@field circuit_mode_of_operation defines__control_behavior__inserter__circuit_mode_of_operation
  ---@field hand_read_mode defines__control_behavior__inserter__hand_read_mode

---@class defines__control_behavior__lamp__circuit_mode_of_operation: any
  ---@field use_colors defines__control_behavior__lamp__circuit_mode_of_operation

---@class defines__control_behavior__lamp: any
  ---@field circuit_mode_of_operation defines__control_behavior__lamp__circuit_mode_of_operation

---@class defines__control_behavior__logistic_container__circuit_mode_of_operation: any
  ---@field send_contents defines__control_behavior__logistic_container__circuit_mode_of_operation
  ---@field set_requests defines__control_behavior__logistic_container__circuit_mode_of_operation

---@class defines__control_behavior__logistic_container: any
  ---@field circuit_mode_of_operation defines__control_behavior__logistic_container__circuit_mode_of_operation

---@class defines__control_behavior__mining_drill__resource_read_mode: any
  ---@field entire_patch defines__control_behavior__mining_drill__resource_read_mode
  ---@field this_miner defines__control_behavior__mining_drill__resource_read_mode

---@class defines__control_behavior__mining_drill: any
  ---@field resource_read_mode defines__control_behavior__mining_drill__resource_read_mode

---@class defines__control_behavior__transport_belt__content_read_mode: any
  ---@field hold defines__control_behavior__transport_belt__content_read_mode
  ---@field pulse defines__control_behavior__transport_belt__content_read_mode

---@class defines__control_behavior__transport_belt: any
  ---@field content_read_mode defines__control_behavior__transport_belt__content_read_mode

---@class defines__control_behavior__type: any
  ---@field accumulator defines__control_behavior__type @[LuaAccumulatorControlBehavior](LuaAccumulatorControlBehavior)
  ---@field arithmetic_combinator defines__control_behavior__type @[LuaArithmeticCombinatorControlBehavior](LuaArithmeticCombinatorControlBehavior)
  ---@field constant_combinator defines__control_behavior__type @[LuaConstantCombinatorControlBehavior](LuaConstantCombinatorControlBehavior)
  ---@field container defines__control_behavior__type @[LuaContainerControlBehavior](LuaContainerControlBehavior)
  ---@field decider_combinator defines__control_behavior__type @[LuaDeciderCombinatorControlBehavior](LuaDeciderCombinatorControlBehavior)
  ---@field generic_on_off defines__control_behavior__type @[LuaGenericOnOffControlBehavior](LuaGenericOnOffControlBehavior)
  ---@field inserter defines__control_behavior__type @[LuaInserterControlBehavior](LuaInserterControlBehavior)
  ---@field lamp defines__control_behavior__type @[LuaLampControlBehavior](LuaLampControlBehavior)
  ---@field logistic_container defines__control_behavior__type @[LuaLogisticContainerControlBehavior](LuaLogisticContainerControlBehavior)
  ---@field mining_drill defines__control_behavior__type @[LuaMiningDrillControlBehavior](LuaMiningDrillControlBehavior)
  ---@field programmable_speaker defines__control_behavior__type @[LuaProgrammableSpeakerControlBehavior](LuaProgrammableSpeakerControlBehavior)
  ---@field rail_chain_signal defines__control_behavior__type @[LuaRailChainSignalControlBehavior](LuaRailChainSignalControlBehavior)
  ---@field rail_signal defines__control_behavior__type @[LuaRailSignalControlBehavior](LuaRailSignalControlBehavior)
  ---@field roboport defines__control_behavior__type @[LuaRoboportControlBehavior](LuaRoboportControlBehavior)
  ---@field storage_tank defines__control_behavior__type @[LuaStorageTankControlBehavior](LuaStorageTankControlBehavior)
  ---@field train_stop defines__control_behavior__type @[LuaTrainStopControlBehavior](LuaTrainStopControlBehavior)
  ---@field transport_belt defines__control_behavior__type @[LuaTransportBeltControlBehavior](LuaTransportBeltControlBehavior)
  ---@field wall defines__control_behavior__type @[LuaWallControlBehavior](LuaWallControlBehavior)

---@class defines__control_behavior: any
  ---@field inserter defines__control_behavior__inserter
  ---@field lamp defines__control_behavior__lamp
  ---@field logistic_container defines__control_behavior__logistic_container
  ---@field mining_drill defines__control_behavior__mining_drill
  ---@field transport_belt defines__control_behavior__transport_belt
  ---@field type defines__control_behavior__type

---@class defines__controllers: any
  ---@field character defines__controllers @The controller controls a character. This is the default controller in freeplay.
  ---@field cutscene defines__controllers @The player can't interact with the world, and the camera pans around in a predefined manner.
  ---@field editor defines__controllers @The Editor Controller near ultimate power to do almost anything in the game.
  ---@field ghost defines__controllers @Can't interact with the world, can only observe. Used in the multiplayer waiting-to-respawn screen.
  ---@field god defines__controllers @The controller isn't tied to a character. This is the default controller in sandbox.
  ---@field spectator defines__controllers @Can't change anything in the world but can view anything.

---@class defines__deconstruction_item__entity_filter_mode: any
  ---@field blacklist defines__deconstruction_item__entity_filter_mode
  ---@field whitelist defines__deconstruction_item__entity_filter_mode

---@class defines__deconstruction_item__tile_filter_mode: any
  ---@field blacklist defines__deconstruction_item__tile_filter_mode
  ---@field whitelist defines__deconstruction_item__tile_filter_mode

---@class defines__deconstruction_item__tile_selection_mode: any
  ---@field always defines__deconstruction_item__tile_selection_mode
  ---@field never defines__deconstruction_item__tile_selection_mode
  ---@field normal defines__deconstruction_item__tile_selection_mode
  ---@field only defines__deconstruction_item__tile_selection_mode

---@class defines__deconstruction_item: any
  ---@field entity_filter_mode defines__deconstruction_item__entity_filter_mode
  ---@field tile_filter_mode defines__deconstruction_item__tile_filter_mode
  ---@field tile_selection_mode defines__deconstruction_item__tile_selection_mode

---@class defines__difficulty: any
  ---@field easy defines__difficulty
  ---@field hard defines__difficulty
  ---@field normal defines__difficulty

---@class defines__difficulty_settings__recipe_difficulty: any
  ---@field expensive defines__difficulty_settings__recipe_difficulty
  ---@field normal defines__difficulty_settings__recipe_difficulty

---@class defines__difficulty_settings__technology_difficulty: any
  ---@field expensive defines__difficulty_settings__technology_difficulty
  ---@field normal defines__difficulty_settings__technology_difficulty

---@class defines__difficulty_settings: any
  ---@field recipe_difficulty defines__difficulty_settings__recipe_difficulty
  ---@field technology_difficulty defines__difficulty_settings__technology_difficulty

---@class defines__direction: any
  ---@field east defines__direction
  ---@field north defines__direction
  ---@field northeast defines__direction
  ---@field northwest defines__direction
  ---@field south defines__direction
  ---@field southeast defines__direction
  ---@field southwest defines__direction
  ---@field west defines__direction

---@class defines__disconnect_reason: any
  ---@field afk defines__disconnect_reason
  ---@field banned defines__disconnect_reason
  ---@field cannot_keep_up defines__disconnect_reason
  ---@field desync_limit_reached defines__disconnect_reason
  ---@field dropped defines__disconnect_reason
  ---@field kicked defines__disconnect_reason
  ---@field kicked_and_deleted defines__disconnect_reason
  ---@field quit defines__disconnect_reason
  ---@field reconnect defines__disconnect_reason
  ---@field switching_servers defines__disconnect_reason
  ---@field wrong_input defines__disconnect_reason

---@class defines__distraction: any
  ---@field by_anything defines__distraction @Attack closer enemy entities, including entities "built" by player (belts, inserters, chests).
  ---@field by_damage defines__distraction @Attack when attacked.
  ---@field by_enemy defines__distraction @Attack closer enemy entities with force.
  ---@field none defines__distraction @Perform command even if someone attacks the unit.

---@class defines__entity_status: any
  ---@field cant_divide_segments defines__entity_status @Used by rail signals.
  ---@field charging defines__entity_status @Used by accumulators.
  ---@field closed_by_circuit_network defines__entity_status
  ---@field disabled defines__entity_status @Used by constant combinators: Combinator is turned off via switch in GUI.
  ---@field disabled_by_control_behavior defines__entity_status
  ---@field disabled_by_script defines__entity_status
  ---@field discharging defines__entity_status @Used by accumulators.
  ---@field fluid_ingredient_shortage defines__entity_status @Used by crafting machines.
  ---@field full_output defines__entity_status @Used by crafting machines, boilers, burner energy sources and reactors: Reactor/burner has full burnt result inventory, boiler has full output fluidbox.
  ---@field fully_charged defines__entity_status @Used by accumulators.
  ---@field item_ingredient_shortage defines__entity_status @Used by crafting machines.
  ---@field launching_rocket defines__entity_status @Used by the rocket silo.
  ---@field low_input_fluid defines__entity_status @Used by boilers and fluid turrets: Boiler still has some fluid but is about to run out.
  ---@field low_power defines__entity_status
  ---@field low_temperature defines__entity_status @Used by heat energy sources.
  ---@field marked_for_deconstruction defines__entity_status
  ---@field missing_required_fluid defines__entity_status @Used by mining drills when the mining fluid is missing.
  ---@field missing_science_packs defines__entity_status @Used by labs.
  ---@field networks_connected defines__entity_status @Used by power switches.
  ---@field networks_disconnected defines__entity_status @Used by power switches.
  ---@field no_ammo defines__entity_status @Used by ammo turrets.
  ---@field no_fuel defines__entity_status
  ---@field no_ingredients defines__entity_status @Used by furnaces.
  ---@field no_input_fluid defines__entity_status @Used by boilers, fluid turrets and fluid energy sources: Boiler has no fluid to work with.
  ---@field no_minable_resources defines__entity_status @Used by mining drills.
  ---@field no_modules_to_transmit defines__entity_status @Used by beacons.
  ---@field no_power defines__entity_status
  ---@field no_recipe defines__entity_status @Used by assembling machines.
  ---@field no_research_in_progress defines__entity_status @Used by labs.
  ---@field normal defines__entity_status
  ---@field not_connected_to_rail defines__entity_status @Used by rail signals.
  ---@field not_plugged_in_electric_network defines__entity_status @Used by generators and solar panels.
  ---@field opened_by_circuit_network defines__entity_status
  ---@field out_of_logistic_network defines__entity_status @Used by logistic containers.
  ---@field preparing_rocket_for_launch defines__entity_status @Used by the rocket silo.
  ---@field recharging_after_power_outage defines__entity_status @Used by roboports.
  ---@field turned_off_during_daytime defines__entity_status @Used by lamps.
  ---@field waiting_for_source_items defines__entity_status @Used by inserters.
  ---@field waiting_for_space_in_destination defines__entity_status @Used by inserters and mining drills.
  ---@field waiting_for_target_to_be_built defines__entity_status @Used by inserters targeting entity ghosts.
  ---@field waiting_for_train defines__entity_status @Used by inserters targeting rails.
  ---@field waiting_to_launch_rocket defines__entity_status @Used by the rocket silo.
  ---@field working defines__entity_status

---@class defines__events: any @See the [events page](events.html) for more info on what events contain and when they get raised.
  ---@field on_ai_command_completed defines__events
  ---@field on_area_cloned defines__events
  ---@field on_biter_base_built defines__events
  ---@field on_brush_cloned defines__events
  ---@field on_build_base_arrived defines__events
  ---@field on_built_entity defines__events
  ---@field on_cancelled_deconstruction defines__events
  ---@field on_cancelled_upgrade defines__events
  ---@field on_character_corpse_expired defines__events
  ---@field on_chart_tag_added defines__events
  ---@field on_chart_tag_modified defines__events
  ---@field on_chart_tag_removed defines__events
  ---@field on_chunk_charted defines__events
  ---@field on_chunk_deleted defines__events
  ---@field on_chunk_generated defines__events
  ---@field on_combat_robot_expired defines__events
  ---@field on_console_chat defines__events
  ---@field on_console_command defines__events
  ---@field on_cutscene_cancelled defines__events
  ---@field on_cutscene_waypoint_reached defines__events
  ---@field on_difficulty_settings_changed defines__events
  ---@field on_entity_cloned defines__events
  ---@field on_entity_damaged defines__events
  ---@field on_entity_destroyed defines__events
  ---@field on_entity_died defines__events
  ---@field on_entity_logistic_slot_changed defines__events
  ---@field on_entity_renamed defines__events
  ---@field on_entity_settings_pasted defines__events
  ---@field on_entity_spawned defines__events
  ---@field on_equipment_inserted defines__events
  ---@field on_equipment_removed defines__events
  ---@field on_force_cease_fire_changed defines__events
  ---@field on_force_created defines__events
  ---@field on_force_friends_changed defines__events
  ---@field on_force_reset defines__events
  ---@field on_forces_merged defines__events
  ---@field on_forces_merging defines__events
  ---@field on_game_created_from_scenario defines__events
  ---@field on_gui_checked_state_changed defines__events
  ---@field on_gui_click defines__events
  ---@field on_gui_closed defines__events
  ---@field on_gui_confirmed defines__events
  ---@field on_gui_elem_changed defines__events
  ---@field on_gui_location_changed defines__events
  ---@field on_gui_opened defines__events
  ---@field on_gui_selected_tab_changed defines__events
  ---@field on_gui_selection_state_changed defines__events
  ---@field on_gui_switch_state_changed defines__events
  ---@field on_gui_text_changed defines__events
  ---@field on_gui_value_changed defines__events
  ---@field on_land_mine_armed defines__events
  ---@field on_lua_shortcut defines__events
  ---@field on_marked_for_deconstruction defines__events
  ---@field on_marked_for_upgrade defines__events
  ---@field on_market_item_purchased defines__events
  ---@field on_mod_item_opened defines__events
  ---@field on_permission_group_added defines__events
  ---@field on_permission_group_deleted defines__events
  ---@field on_permission_group_edited defines__events
  ---@field on_permission_string_imported defines__events
  ---@field on_picked_up_item defines__events
  ---@field on_player_alt_selected_area defines__events
  ---@field on_player_ammo_inventory_changed defines__events
  ---@field on_player_armor_inventory_changed defines__events
  ---@field on_player_banned defines__events
  ---@field on_player_built_tile defines__events
  ---@field on_player_cancelled_crafting defines__events
  ---@field on_player_changed_force defines__events
  ---@field on_player_changed_position defines__events
  ---@field on_player_changed_surface defines__events
  ---@field on_player_cheat_mode_disabled defines__events
  ---@field on_player_cheat_mode_enabled defines__events
  ---@field on_player_clicked_gps_tag defines__events
  ---@field on_player_configured_blueprint defines__events
  ---@field on_player_configured_spider_remote defines__events
  ---@field on_player_crafted_item defines__events
  ---@field on_player_created defines__events
  ---@field on_player_cursor_stack_changed defines__events
  ---@field on_player_deconstructed_area defines__events
  ---@field on_player_demoted defines__events
  ---@field on_player_died defines__events
  ---@field on_player_display_resolution_changed defines__events
  ---@field on_player_display_scale_changed defines__events
  ---@field on_player_driving_changed_state defines__events
  ---@field on_player_dropped_item defines__events
  ---@field on_player_fast_transferred defines__events
  ---@field on_player_flushed_fluid defines__events
  ---@field on_player_gun_inventory_changed defines__events
  ---@field on_player_joined_game defines__events
  ---@field on_player_kicked defines__events
  ---@field on_player_left_game defines__events
  ---@field on_player_main_inventory_changed defines__events
  ---@field on_player_mined_entity defines__events
  ---@field on_player_mined_item defines__events
  ---@field on_player_mined_tile defines__events
  ---@field on_player_muted defines__events
  ---@field on_player_pipette defines__events
  ---@field on_player_placed_equipment defines__events
  ---@field on_player_promoted defines__events
  ---@field on_player_removed defines__events
  ---@field on_player_removed_equipment defines__events
  ---@field on_player_repaired_entity defines__events
  ---@field on_player_respawned defines__events
  ---@field on_player_reverse_selected_area defines__events
  ---@field on_player_rotated_entity defines__events
  ---@field on_player_selected_area defines__events
  ---@field on_player_set_quick_bar_slot defines__events
  ---@field on_player_setup_blueprint defines__events
  ---@field on_player_toggled_alt_mode defines__events
  ---@field on_player_toggled_map_editor defines__events
  ---@field on_player_trash_inventory_changed defines__events
  ---@field on_player_unbanned defines__events
  ---@field on_player_unmuted defines__events
  ---@field on_player_used_capsule defines__events
  ---@field on_player_used_spider_remote defines__events
  ---@field on_post_entity_died defines__events
  ---@field on_pre_build defines__events
  ---@field on_pre_chunk_deleted defines__events
  ---@field on_pre_entity_settings_pasted defines__events
  ---@field on_pre_ghost_deconstructed defines__events
  ---@field on_pre_ghost_upgraded defines__events
  ---@field on_pre_permission_group_deleted defines__events
  ---@field on_pre_permission_string_imported defines__events
  ---@field on_pre_player_crafted_item defines__events
  ---@field on_pre_player_died defines__events
  ---@field on_pre_player_left_game defines__events
  ---@field on_pre_player_mined_item defines__events
  ---@field on_pre_player_removed defines__events
  ---@field on_pre_player_toggled_map_editor defines__events
  ---@field on_pre_robot_exploded_cliff defines__events
  ---@field on_pre_script_inventory_resized defines__events
  ---@field on_pre_surface_cleared defines__events
  ---@field on_pre_surface_deleted defines__events
  ---@field on_research_cancelled defines__events
  ---@field on_research_finished defines__events
  ---@field on_research_reversed defines__events
  ---@field on_research_started defines__events
  ---@field on_resource_depleted defines__events
  ---@field on_robot_built_entity defines__events
  ---@field on_robot_built_tile defines__events
  ---@field on_robot_exploded_cliff defines__events
  ---@field on_robot_mined defines__events
  ---@field on_robot_mined_entity defines__events
  ---@field on_robot_mined_tile defines__events
  ---@field on_robot_pre_mined defines__events
  ---@field on_rocket_launch_ordered defines__events
  ---@field on_rocket_launched defines__events
  ---@field on_runtime_mod_setting_changed defines__events
  ---@field on_script_inventory_resized defines__events
  ---@field on_script_path_request_finished defines__events
  ---@field on_script_trigger_effect defines__events
  ---@field on_sector_scanned defines__events
  ---@field on_selected_entity_changed defines__events
  ---@field on_spider_command_completed defines__events
  ---@field on_string_translated defines__events
  ---@field on_surface_cleared defines__events
  ---@field on_surface_created defines__events
  ---@field on_surface_deleted defines__events
  ---@field on_surface_imported defines__events
  ---@field on_surface_renamed defines__events
  ---@field on_technology_effects_reset defines__events
  ---@field on_tick defines__events
  ---@field on_train_changed_state defines__events
  ---@field on_train_created defines__events
  ---@field on_train_schedule_changed defines__events
  ---@field on_trigger_created_entity defines__events
  ---@field on_trigger_fired_artillery defines__events
  ---@field on_unit_added_to_group defines__events
  ---@field on_unit_group_created defines__events
  ---@field on_unit_group_finished_gathering defines__events
  ---@field on_unit_removed_from_group defines__events
  ---@field on_worker_robot_expired defines__events
  ---@field script_raised_built defines__events
  ---@field script_raised_destroy defines__events
  ---@field script_raised_revive defines__events
  ---@field script_raised_set_tiles defines__events

---@class defines__flow_precision_index: any
  ---@field fifty_hours defines__flow_precision_index
  ---@field five_seconds defines__flow_precision_index
  ---@field one_hour defines__flow_precision_index
  ---@field one_minute defines__flow_precision_index
  ---@field one_thousand_hours defines__flow_precision_index
  ---@field ten_hours defines__flow_precision_index
  ---@field ten_minutes defines__flow_precision_index
  ---@field two_hundred_fifty_hours defines__flow_precision_index

---@class defines__group_state: any
  ---@field attacking_distraction defines__group_state
  ---@field attacking_target defines__group_state
  ---@field finished defines__group_state
  ---@field gathering defines__group_state
  ---@field moving defines__group_state
  ---@field pathfinding defines__group_state
  ---@field wander_in_group defines__group_state

---@class defines__gui_type: any
  ---@field achievement defines__gui_type
  ---@field blueprint_library defines__gui_type
  ---@field bonus defines__gui_type
  ---@field controller defines__gui_type
  ---@field custom defines__gui_type
  ---@field entity defines__gui_type
  ---@field equipment defines__gui_type
  ---@field item defines__gui_type
  ---@field logistic defines__gui_type
  ---@field none defines__gui_type
  ---@field other_player defines__gui_type
  ---@field permissions defines__gui_type
  ---@field player_management defines__gui_type
  ---@field production defines__gui_type
  ---@field research defines__gui_type
  ---@field script_inventory defines__gui_type
  ---@field server_management defines__gui_type
  ---@field tile defines__gui_type
  ---@field trains defines__gui_type
  ---@field tutorials defines__gui_type

---@class defines__input_action: any
  ---@field activate_copy defines__input_action
  ---@field activate_cut defines__input_action
  ---@field activate_paste defines__input_action
  ---@field add_permission_group defines__input_action
  ---@field add_train_station defines__input_action
  ---@field admin_action defines__input_action
  ---@field alt_select_area defines__input_action
  ---@field alt_select_blueprint_entities defines__input_action
  ---@field alternative_copy defines__input_action
  ---@field begin_mining defines__input_action
  ---@field begin_mining_terrain defines__input_action
  ---@field build defines__input_action
  ---@field build_rail defines__input_action
  ---@field build_terrain defines__input_action
  ---@field cancel_craft defines__input_action
  ---@field cancel_deconstruct defines__input_action
  ---@field cancel_new_blueprint defines__input_action
  ---@field cancel_research defines__input_action
  ---@field cancel_upgrade defines__input_action
  ---@field change_active_character_tab defines__input_action
  ---@field change_active_item_group_for_crafting defines__input_action
  ---@field change_active_item_group_for_filters defines__input_action
  ---@field change_active_quick_bar defines__input_action
  ---@field change_arithmetic_combinator_parameters defines__input_action
  ---@field change_decider_combinator_parameters defines__input_action
  ---@field change_entity_label defines__input_action
  ---@field change_item_description defines__input_action
  ---@field change_item_label defines__input_action
  ---@field change_multiplayer_config defines__input_action
  ---@field change_picking_state defines__input_action
  ---@field change_programmable_speaker_alert_parameters defines__input_action
  ---@field change_programmable_speaker_circuit_parameters defines__input_action
  ---@field change_programmable_speaker_parameters defines__input_action
  ---@field change_riding_state defines__input_action
  ---@field change_shooting_state defines__input_action
  ---@field change_train_stop_station defines__input_action
  ---@field change_train_wait_condition defines__input_action
  ---@field change_train_wait_condition_data defines__input_action
  ---@field clear_cursor defines__input_action
  ---@field connect_rolling_stock defines__input_action
  ---@field copy defines__input_action
  ---@field copy_entity_settings defines__input_action
  ---@field copy_opened_blueprint defines__input_action
  ---@field copy_opened_item defines__input_action
  ---@field craft defines__input_action
  ---@field cursor_split defines__input_action
  ---@field cursor_transfer defines__input_action
  ---@field custom_input defines__input_action
  ---@field cycle_blueprint_book_backwards defines__input_action
  ---@field cycle_blueprint_book_forwards defines__input_action
  ---@field deconstruct defines__input_action
  ---@field delete_blueprint_library defines__input_action
  ---@field delete_blueprint_record defines__input_action
  ---@field delete_custom_tag defines__input_action
  ---@field delete_permission_group defines__input_action
  ---@field destroy_item defines__input_action
  ---@field destroy_opened_item defines__input_action
  ---@field disconnect_rolling_stock defines__input_action
  ---@field drag_train_schedule defines__input_action
  ---@field drag_train_wait_condition defines__input_action
  ---@field drop_blueprint_record defines__input_action
  ---@field drop_item defines__input_action
  ---@field edit_blueprint_tool_preview defines__input_action
  ---@field edit_custom_tag defines__input_action
  ---@field edit_permission_group defines__input_action
  ---@field export_blueprint defines__input_action
  ---@field fast_entity_split defines__input_action
  ---@field fast_entity_transfer defines__input_action
  ---@field flush_opened_entity_fluid defines__input_action
  ---@field flush_opened_entity_specific_fluid defines__input_action
  ---@field go_to_train_station defines__input_action
  ---@field grab_blueprint_record defines__input_action
  ---@field gui_checked_state_changed defines__input_action
  ---@field gui_click defines__input_action
  ---@field gui_confirmed defines__input_action
  ---@field gui_elem_changed defines__input_action
  ---@field gui_location_changed defines__input_action
  ---@field gui_selected_tab_changed defines__input_action
  ---@field gui_selection_state_changed defines__input_action
  ---@field gui_switch_state_changed defines__input_action
  ---@field gui_text_changed defines__input_action
  ---@field gui_value_changed defines__input_action
  ---@field import_blueprint defines__input_action
  ---@field import_blueprint_string defines__input_action
  ---@field import_blueprints_filtered defines__input_action
  ---@field import_permissions_string defines__input_action
  ---@field inventory_split defines__input_action
  ---@field inventory_transfer defines__input_action
  ---@field launch_rocket defines__input_action
  ---@field lua_shortcut defines__input_action
  ---@field map_editor_action defines__input_action
  ---@field market_offer defines__input_action
  ---@field mod_settings_changed defines__input_action
  ---@field open_achievements_gui defines__input_action
  ---@field open_blueprint_library_gui defines__input_action
  ---@field open_blueprint_record defines__input_action
  ---@field open_bonus_gui defines__input_action
  ---@field open_character_gui defines__input_action
  ---@field open_current_vehicle_gui defines__input_action
  ---@field open_equipment defines__input_action
  ---@field open_gui defines__input_action
  ---@field open_item defines__input_action
  ---@field open_logistic_gui defines__input_action
  ---@field open_mod_item defines__input_action
  ---@field open_parent_of_opened_item defines__input_action
  ---@field open_production_gui defines__input_action
  ---@field open_technology_gui defines__input_action
  ---@field open_tips_and_tricks_gui defines__input_action
  ---@field open_train_gui defines__input_action
  ---@field open_train_station_gui defines__input_action
  ---@field open_trains_gui defines__input_action
  ---@field paste_entity_settings defines__input_action
  ---@field place_equipment defines__input_action
  ---@field quick_bar_pick_slot defines__input_action
  ---@field quick_bar_set_selected_page defines__input_action
  ---@field quick_bar_set_slot defines__input_action
  ---@field reassign_blueprint defines__input_action
  ---@field remove_cables defines__input_action
  ---@field remove_train_station defines__input_action
  ---@field reset_assembling_machine defines__input_action
  ---@field reset_item defines__input_action
  ---@field reverse_select_area defines__input_action
  ---@field rotate_entity defines__input_action
  ---@field select_area defines__input_action
  ---@field select_blueprint_entities defines__input_action
  ---@field select_entity_slot defines__input_action
  ---@field select_item defines__input_action
  ---@field select_mapper_slot defines__input_action
  ---@field select_next_valid_gun defines__input_action
  ---@field select_tile_slot defines__input_action
  ---@field send_spidertron defines__input_action
  ---@field set_auto_launch_rocket defines__input_action
  ---@field set_autosort_inventory defines__input_action
  ---@field set_behavior_mode defines__input_action
  ---@field set_car_weapons_control defines__input_action
  ---@field set_circuit_condition defines__input_action
  ---@field set_circuit_mode_of_operation defines__input_action
  ---@field set_controller_logistic_trash_filter_item defines__input_action
  ---@field set_deconstruction_item_tile_selection_mode defines__input_action
  ---@field set_deconstruction_item_trees_and_rocks_only defines__input_action
  ---@field set_entity_color defines__input_action
  ---@field set_entity_energy_property defines__input_action
  ---@field set_entity_logistic_trash_filter_item defines__input_action
  ---@field set_filter defines__input_action
  ---@field set_flat_controller_gui defines__input_action
  ---@field set_heat_interface_mode defines__input_action
  ---@field set_heat_interface_temperature defines__input_action
  ---@field set_infinity_container_filter_item defines__input_action
  ---@field set_infinity_container_remove_unfiltered_items defines__input_action
  ---@field set_infinity_pipe_filter defines__input_action
  ---@field set_inserter_max_stack_size defines__input_action
  ---@field set_inventory_bar defines__input_action
  ---@field set_linked_container_link_i_d defines__input_action
  ---@field set_logistic_filter_item defines__input_action
  ---@field set_logistic_filter_signal defines__input_action
  ---@field set_player_color defines__input_action
  ---@field set_recipe_notifications defines__input_action
  ---@field set_request_from_buffers defines__input_action
  ---@field set_research_finished_stops_game defines__input_action
  ---@field set_signal defines__input_action
  ---@field set_splitter_priority defines__input_action
  ---@field set_train_stopped defines__input_action
  ---@field set_trains_limit defines__input_action
  ---@field set_vehicle_automatic_targeting_parameters defines__input_action
  ---@field setup_assembling_machine defines__input_action
  ---@field setup_blueprint defines__input_action
  ---@field setup_single_blueprint_record defines__input_action
  ---@field smart_pipette defines__input_action
  ---@field spawn_item defines__input_action
  ---@field stack_split defines__input_action
  ---@field stack_transfer defines__input_action
  ---@field start_repair defines__input_action
  ---@field start_research defines__input_action
  ---@field start_walking defines__input_action
  ---@field stop_building_by_moving defines__input_action
  ---@field switch_connect_to_logistic_network defines__input_action
  ---@field switch_constant_combinator_state defines__input_action
  ---@field switch_inserter_filter_mode_state defines__input_action
  ---@field switch_power_switch_state defines__input_action
  ---@field switch_to_rename_stop_gui defines__input_action
  ---@field take_equipment defines__input_action
  ---@field toggle_deconstruction_item_entity_filter_mode defines__input_action
  ---@field toggle_deconstruction_item_tile_filter_mode defines__input_action
  ---@field toggle_driving defines__input_action
  ---@field toggle_enable_vehicle_logistics_while_moving defines__input_action
  ---@field toggle_entity_logistic_requests defines__input_action
  ---@field toggle_equipment_movement_bonus defines__input_action
  ---@field toggle_map_editor defines__input_action
  ---@field toggle_personal_logistic_requests defines__input_action
  ---@field toggle_personal_roboport defines__input_action
  ---@field toggle_show_entity_info defines__input_action
  ---@field translate_string defines__input_action
  ---@field undo defines__input_action
  ---@field upgrade defines__input_action
  ---@field upgrade_opened_blueprint_by_item defines__input_action
  ---@field upgrade_opened_blueprint_by_record defines__input_action
  ---@field use_artillery_remote defines__input_action
  ---@field use_item defines__input_action
  ---@field wire_dragging defines__input_action
  ---@field write_to_console defines__input_action

---@class defines__input_method: any
  ---@field game_controller defines__input_method
  ---@field keyboard_and_mouse defines__input_method

---@class defines__inventory: any
  ---@field artillery_turret_ammo defines__inventory
  ---@field artillery_wagon_ammo defines__inventory
  ---@field assembling_machine_input defines__inventory
  ---@field assembling_machine_modules defines__inventory
  ---@field assembling_machine_output defines__inventory
  ---@field beacon_modules defines__inventory
  ---@field burnt_result defines__inventory
  ---@field car_ammo defines__inventory
  ---@field car_trunk defines__inventory
  ---@field cargo_wagon defines__inventory
  ---@field character_ammo defines__inventory
  ---@field character_armor defines__inventory
  ---@field character_corpse defines__inventory
  ---@field character_guns defines__inventory
  ---@field character_main defines__inventory
  ---@field character_trash defines__inventory
  ---@field character_vehicle defines__inventory
  ---@field chest defines__inventory
  ---@field editor_ammo defines__inventory
  ---@field editor_armor defines__inventory
  ---@field editor_guns defines__inventory
  ---@field editor_main defines__inventory
  ---@field fuel defines__inventory
  ---@field furnace_modules defines__inventory
  ---@field furnace_result defines__inventory
  ---@field furnace_source defines__inventory
  ---@field god_main defines__inventory
  ---@field item_main defines__inventory
  ---@field lab_input defines__inventory
  ---@field lab_modules defines__inventory
  ---@field mining_drill_modules defines__inventory
  ---@field roboport_material defines__inventory
  ---@field roboport_robot defines__inventory
  ---@field robot_cargo defines__inventory
  ---@field robot_repair defines__inventory
  ---@field rocket defines__inventory
  ---@field rocket_silo_input defines__inventory
  ---@field rocket_silo_modules defines__inventory
  ---@field rocket_silo_output defines__inventory
  ---@field rocket_silo_result defines__inventory
  ---@field rocket_silo_rocket defines__inventory
  ---@field spider_ammo defines__inventory
  ---@field spider_trash defines__inventory
  ---@field spider_trunk defines__inventory
  ---@field turret_ammo defines__inventory

---@class defines__logistic_member_index: any
  ---@field character_provider defines__logistic_member_index
  ---@field character_requester defines__logistic_member_index
  ---@field character_storage defines__logistic_member_index
  ---@field generic_on_off_behavior defines__logistic_member_index
  ---@field logistic_container defines__logistic_member_index
  ---@field vehicle_storage defines__logistic_member_index

---@class defines__logistic_mode: any
  ---@field active_provider defines__logistic_mode
  ---@field buffer defines__logistic_mode
  ---@field none defines__logistic_mode
  ---@field passive_provider defines__logistic_mode
  ---@field requester defines__logistic_mode
  ---@field storage defines__logistic_mode

---@class defines__mouse_button_type: any
  ---@field left defines__mouse_button_type
  ---@field middle defines__mouse_button_type
  ---@field none defines__mouse_button_type
  ---@field right defines__mouse_button_type

---@class defines__rail_connection_direction: any
  ---@field left defines__rail_connection_direction
  ---@field none defines__rail_connection_direction
  ---@field right defines__rail_connection_direction
  ---@field straight defines__rail_connection_direction

---@class defines__rail_direction: any
  ---@field back defines__rail_direction
  ---@field front defines__rail_direction

---@class defines__relative_gui_position: any
  ---@field bottom defines__relative_gui_position
  ---@field left defines__relative_gui_position
  ---@field right defines__relative_gui_position
  ---@field top defines__relative_gui_position

---@class defines__relative_gui_type: any
  ---@field accumulator_gui defines__relative_gui_type
  ---@field achievement_gui defines__relative_gui_type
  ---@field additional_entity_info_gui defines__relative_gui_type
  ---@field admin_gui defines__relative_gui_type
  ---@field arithmetic_combinator_gui defines__relative_gui_type
  ---@field armor_gui defines__relative_gui_type
  ---@field assembling_machine_gui defines__relative_gui_type
  ---@field assembling_machine_select_recipe_gui defines__relative_gui_type
  ---@field beacon_gui defines__relative_gui_type
  ---@field blueprint_book_gui defines__relative_gui_type
  ---@field blueprint_library_gui defines__relative_gui_type
  ---@field blueprint_setup_gui defines__relative_gui_type
  ---@field bonus_gui defines__relative_gui_type
  ---@field burner_equipment_gui defines__relative_gui_type
  ---@field car_gui defines__relative_gui_type
  ---@field constant_combinator_gui defines__relative_gui_type
  ---@field container_gui defines__relative_gui_type
  ---@field controller_gui defines__relative_gui_type
  ---@field decider_combinator_gui defines__relative_gui_type
  ---@field deconstruction_item_gui defines__relative_gui_type
  ---@field electric_energy_interface_gui defines__relative_gui_type
  ---@field electric_network_gui defines__relative_gui_type
  ---@field entity_variations_gui defines__relative_gui_type
  ---@field entity_with_energy_source_gui defines__relative_gui_type
  ---@field equipment_grid_gui defines__relative_gui_type
  ---@field furnace_gui defines__relative_gui_type
  ---@field generic_on_off_entity_gui defines__relative_gui_type
  ---@field heat_interface_gui defines__relative_gui_type
  ---@field infinity_pipe_gui defines__relative_gui_type
  ---@field inserter_gui defines__relative_gui_type
  ---@field item_with_inventory_gui defines__relative_gui_type
  ---@field lab_gui defines__relative_gui_type
  ---@field lamp_gui defines__relative_gui_type
  ---@field linked_container_gui defines__relative_gui_type
  ---@field loader_gui defines__relative_gui_type
  ---@field logistic_gui defines__relative_gui_type
  ---@field market_gui defines__relative_gui_type
  ---@field mining_drill_gui defines__relative_gui_type
  ---@field other_player_gui defines__relative_gui_type
  ---@field permissions_gui defines__relative_gui_type
  ---@field pipe_gui defines__relative_gui_type
  ---@field power_switch_gui defines__relative_gui_type
  ---@field production_gui defines__relative_gui_type
  ---@field programmable_speaker_gui defines__relative_gui_type
  ---@field rail_chain_signal_gui defines__relative_gui_type
  ---@field rail_signal_gui defines__relative_gui_type
  ---@field reactor_gui defines__relative_gui_type
  ---@field rename_stop_gui defines__relative_gui_type
  ---@field resource_entity_gui defines__relative_gui_type
  ---@field roboport_gui defines__relative_gui_type
  ---@field rocket_silo_gui defines__relative_gui_type
  ---@field script_inventory_gui defines__relative_gui_type
  ---@field server_config_gui defines__relative_gui_type
  ---@field spider_vehicle_gui defines__relative_gui_type
  ---@field splitter_gui defines__relative_gui_type
  ---@field standalone_character_gui defines__relative_gui_type
  ---@field storage_tank_gui defines__relative_gui_type
  ---@field tile_variations_gui defines__relative_gui_type
  ---@field train_gui defines__relative_gui_type
  ---@field train_stop_gui defines__relative_gui_type
  ---@field trains_gui defines__relative_gui_type
  ---@field transport_belt_gui defines__relative_gui_type
  ---@field upgrade_item_gui defines__relative_gui_type
  ---@field wall_gui defines__relative_gui_type

---@class defines__render_mode: any
  ---@field chart defines__render_mode
  ---@field chart_zoomed_in defines__render_mode
  ---@field game defines__render_mode

---@class defines__rich_text_setting: any
  ---@field disabled defines__rich_text_setting
  ---@field enabled defines__rich_text_setting
  ---@field highlight defines__rich_text_setting

---@class defines__riding__acceleration: any
  ---@field accelerating defines__riding__acceleration
  ---@field braking defines__riding__acceleration
  ---@field nothing defines__riding__acceleration
  ---@field reversing defines__riding__acceleration

---@class defines__riding__direction: any
  ---@field left defines__riding__direction
  ---@field right defines__riding__direction
  ---@field straight defines__riding__direction

---@class defines__riding: any
  ---@field acceleration defines__riding__acceleration
  ---@field direction defines__riding__direction

---@class defines__rocket_silo_status: any
  ---@field arms_advance defines__rocket_silo_status
  ---@field arms_retract defines__rocket_silo_status
  ---@field building_rocket defines__rocket_silo_status
  ---@field create_rocket defines__rocket_silo_status
  ---@field doors_closing defines__rocket_silo_status
  ---@field doors_opened defines__rocket_silo_status
  ---@field doors_opening defines__rocket_silo_status
  ---@field engine_starting defines__rocket_silo_status
  ---@field launch_started defines__rocket_silo_status
  ---@field launch_starting defines__rocket_silo_status
  ---@field lights_blinking_close defines__rocket_silo_status
  ---@field lights_blinking_open defines__rocket_silo_status
  ---@field rocket_flying defines__rocket_silo_status
  ---@field rocket_ready defines__rocket_silo_status
  ---@field rocket_rising defines__rocket_silo_status

---@class defines__shooting: any
  ---@field not_shooting defines__shooting
  ---@field shooting_enemies defines__shooting
  ---@field shooting_selected defines__shooting

---@class defines__signal_state: any @State of an ordinary rail signal.
  ---@field closed defines__signal_state @Red.
  ---@field open defines__signal_state @Green.
  ---@field reserved defines__signal_state @Orange.
  ---@field reserved_by_circuit_network defines__signal_state @Red - From circuit network.

---@class defines__train_state: any
  ---@field arrive_signal defines__train_state @Braking before a rail signal.
  ---@field arrive_station defines__train_state @Braking before a station.
  ---@field destination_full defines__train_state @Same as no_path but all candidate train stops are full
  ---@field manual_control defines__train_state @Can move if user explicitly sits in and rides the train.
  ---@field manual_control_stop defines__train_state @Switched to manual control and has to stop.
  ---@field no_path defines__train_state @Has no path and is stopped.
  ---@field no_schedule defines__train_state @Doesn't have anywhere to go.
  ---@field on_the_path defines__train_state @Normal state -- following the path.
  ---@field path_lost defines__train_state @Had path and lost it -- must stop.
  ---@field wait_signal defines__train_state @Waiting at a signal.
  ---@field wait_station defines__train_state @Waiting at a station.

---@class defines__transport_line: any
  ---@field left_line defines__transport_line
  ---@field left_split_line defines__transport_line
  ---@field left_underground_line defines__transport_line
  ---@field right_line defines__transport_line
  ---@field right_split_line defines__transport_line
  ---@field right_underground_line defines__transport_line
  ---@field secondary_left_line defines__transport_line
  ---@field secondary_left_split_line defines__transport_line
  ---@field secondary_right_line defines__transport_line
  ---@field secondary_right_split_line defines__transport_line

---@class defines__wire_connection_id: any
  ---@field electric_pole defines__wire_connection_id
  ---@field power_switch_left defines__wire_connection_id
  ---@field power_switch_right defines__wire_connection_id

---@class defines__wire_type: any
  ---@field copper defines__wire_type
  ---@field green defines__wire_type
  ---@field red defines__wire_type

---@class defines: any
  ---@field alert_type defines__alert_type
  ---@field behavior_result defines__behavior_result @AI command exit status. See [LuaEntity::set_command](LuaEntity::set_command)
  ---@field build_check_type defines__build_check_type
  ---@field chain_signal_state defines__chain_signal_state @State of a chain signal.
  ---@field chunk_generated_status defines__chunk_generated_status
  ---@field circuit_condition_index defines__circuit_condition_index
  ---@field circuit_connector_id defines__circuit_connector_id
  ---@field command defines__command @Command given to units describing what they should do.
  ---@field compound_command defines__compound_command @How commands are joined together in a compound command (see [defines.command.compound](defines.command.compound)).
  ---@field control_behavior defines__control_behavior
  ---@field controllers defines__controllers
  ---@field deconstruction_item defines__deconstruction_item
  ---@field difficulty defines__difficulty
  ---@field difficulty_settings defines__difficulty_settings
  ---@field direction defines__direction
  ---@field disconnect_reason defines__disconnect_reason
  ---@field distraction defines__distraction
  ---@field entity_status defines__entity_status
  ---@field events defines__events @See the [events page](events.html) for more info on what events contain and when they get raised.
  ---@field flow_precision_index defines__flow_precision_index
  ---@field group_state defines__group_state
  ---@field gui_type defines__gui_type
  ---@field input_action defines__input_action
  ---@field input_method defines__input_method
  ---@field inventory defines__inventory
  ---@field logistic_member_index defines__logistic_member_index
  ---@field logistic_mode defines__logistic_mode
  ---@field mouse_button_type defines__mouse_button_type
  ---@field prototypes table @A dictionary mapping all top-level prototypes by name to a list of their associated subtypes. This list is organized as a lookup table, meaning it maps the sub-prototype names to `0`. As an example, `defines.prototypes['entity']` looks like this: `{furnace=0, inserter=0, container=0, ...}`.
  ---@field rail_connection_direction defines__rail_connection_direction
  ---@field rail_direction defines__rail_direction
  ---@field relative_gui_position defines__relative_gui_position
  ---@field relative_gui_type defines__relative_gui_type
  ---@field render_mode defines__render_mode
  ---@field rich_text_setting defines__rich_text_setting
  ---@field riding defines__riding
  ---@field rocket_silo_status defines__rocket_silo_status
  ---@field shooting defines__shooting
  ---@field signal_state defines__signal_state @State of an ordinary rail signal.
  ---@field train_state defines__train_state
  ---@field transport_line defines__transport_line
  ---@field wire_connection_id defines__wire_connection_id
  ---@field wire_type defines__wire_type

---@type defines
defines = defines


--- concepts
  ---@alias Alignment "top-left" | "middle-left" | "left" | "bottom-left" | "top-center" | "middle-center" | "center" | "bottom-center" | "top-right" | "right" | "bottom-right"
  ---@alias Any string | boolean | number | table | LuaObject
  ---@alias AnyBasic string | boolean | number | table
  ---@alias BoundingBox _BoundingBox1 | _BoundingBox2
  ---@alias ChunkPosition _ChunkPosition1 | _ChunkPosition2
  ---@alias CliffOrientation "west-to-east" | "north-to-south" | "east-to-west" | "south-to-north" | "west-to-north" | "north-to-east" | "east-to-south" | "south-to-west" | "west-to-south" | "north-to-west" | "east-to-north" | "south-to-east" | "west-to-none" | "none-to-east" | "east-to-none" | "none-to-west" | "north-to-none" | "none-to-south" | "south-to-none" | "none-to-north"
  ---@alias CollisionMask table<CollisionMaskLayer, true>
  ---@alias CollisionMaskLayer "ground-tile" | "water-tile" | "resource-layer" | "doodad-layer" | "floor-layer" | "item-layer" | "ghost-layer" | "object-layer" | "player-layer" | "train-layer" | "rail-layer" | "transport-belt-layer" | "not-setup"
  ---@alias CollisionMaskWithFlags table<CollisionMaskLayer | "not-colliding-with-itself" | "consider-tile-transitions" | "colliding-with-tiles-only", true>
  ---@alias Color _Color1 | _Color2
  ---@alias ColorModifier _ColorModifier1 | _ColorModifier2
  ---@alias ComparatorString "=" | (">") | ("<") | "≥" | (">=") | "≤" | ("<=") | "≠" | "!="
  ---@alias CursorBoxRenderType "entity" | "not-allowed" | "electricity" | "pair" | "copy" | "train-visualization" | "logistics" | "blueprint-snap-rectangle"
  ---@alias EntityPrototypeFlags table<"not-rotatable" | "placeable-neutral" | "placeable-player" | "placeable-enemy" | "placeable-off-grid" | "player-creation" | "building-direction-8-way" | "filter-directions" | "fast-replaceable-no-build-while-moving" | "breaths-air" | "not-repairable" | "not-on-map" | "not-deconstructable" | "not-blueprintable" | "hidden" | "hide-alt-info" | "fast-replaceable-no-cross-type-while-moving" | "no-gap-fill-while-building" | "not-flammable" | "no-automated-item-removal" | "no-automated-item-insertion" | "no-copy-paste" | "not-selectable-in-game" | "not-upgradable" | "not-in-kill-statistics" | "not-in-made-in", true>
  ---@alias EntityPrototypeIdentification LuaEntity | LuaEntityPrototype | string
  ---@alias EquipmentPosition _EquipmentPosition1 | _EquipmentPosition2
  ---@alias EventFilter (LuaEntityClonedEventFilter | LuaEntityDamagedEventFilter | LuaPlayerMinedEntityEventFilter | LuaPreRobotMinedEntityEventFilter | LuaRobotBuiltEntityEventFilter | LuaPostEntityDiedEventFilter | LuaEntityDiedEventFilter | LuaScriptRaisedReviveEventFilter | LuaPrePlayerMinedEntityEventFilter | LuaEntityMarkedForDeconstructionEventFilter | LuaPreGhostDeconstructedEventFilter | LuaPreGhostUpgradedEventFilter | LuaEntityDeconstructionCancelledEventFilter | LuaEntityMarkedForUpgradeEventFilter | LuaSectorScannedEventFilter | LuaRobotMinedEntityEventFilter | LuaScriptRaisedDestroyEventFilter | LuaUpgradeCancelledEventFilter | LuaScriptRaisedBuiltEventFilter | LuaPlayerBuiltEntityEventFilter | LuaPlayerRepairedEntityEventFilter)[]
  ---@alias FluidIdentification string | LuaFluidPrototype | Fluid
  ---@alias ForceCondition "all" | "enemy" | "ally" | "friend" | "not-friend" | "same" | "not-same"
  ---@alias ForceIdentification string | LuaForce
  ---@alias GuiLocation _GuiLocation1 | _GuiLocation2
  ---@alias ItemPrototypeFlags table<"draw-logistic-overlay" | "hidden" | "always-show" | "hide-from-bonus-gui" | "hide-from-fuel-tooltip" | "not-stackable" | "can-extend-inventory" | "primary-place-result" | "mod-openable" | "only-in-cursor" | "spawnable", true>
  ---@alias ItemPrototypeIdentification LuaItemStack | LuaItemPrototype | string
  ---@alias ItemStackIdentification SimpleItemStack | LuaItemStack
  ---@alias LocalisedString string | number | boolean | LuaObject | nil | ((string | LocalisedString)[])
  ---@alias MapGenSize float | "none" | "very-low" | "very-small" | "very-poor" | "low" | "small" | "poor" | "normal" | "medium" | "regular" | "high" | "big" | "good" | "very-high" | "very-big" | "very-good"
  ---@alias MapPosition _MapPosition1 | _MapPosition2
  ---@alias MouseButtonFlags table<"left" | "right" | "middle" | "button-4" | "button-5" | "button-6" | "button-7" | "button-8" | "button-9", true>
  ---@alias PlayerIdentification uint | string | LuaPlayer
  ---@alias PrototypeFilter (ItemPrototypeFilter | TilePrototypeFilter | EntityPrototypeFilter | FluidPrototypeFilter | RecipePrototypeFilter | DecorativePrototypeFilter | AchievementPrototypeFilter | EquipmentPrototypeFilter | TechnologyPrototypeFilter)[]
  ---@alias RealOrientation float
  ---@alias RenderLayer string | "water-tile" | "ground-tile" | "tile-transition" | "decals" | "lower-radius-visualization" | "radius-visualization" | "transport-belt-integration" | "resource" | "building-smoke" | "decorative" | "ground-patch" | "ground-patch-higher" | "ground-patch-higher2" | "remnants" | "floor" | "transport-belt" | "transport-belt-endings" | "floor-mechanics-under-corpse" | "corpse" | "floor-mechanics" | "item" | "lower-object" | "transport-belt-circuit-connector" | "lower-object-above-shadow" | "object" | "higher-object-under" | "higher-object-above" | "item-in-inserter-hand" | "wires" | "wires-above" | "entity-info-icon" | "entity-info-icon-above" | "explosion" | "projectile" | "smoke" | "air-object" | "air-entity-info-icon" | "light-effect" | "selection-box" | "higher-selection-box" | "collision-selection-box" | "arrow" | "cursor"
  ---@alias SelectionModeFlags table<"blueprint" | "deconstruct" | "cancel-deconstruct" | "items" | "trees" | "buildable-type" | "nothing" | "items-to-place" | "any-entity" | "any-tile" | "same-force" | "not-same-force" | "friend" | "enemy" | "upgrade" | "cancel-upgrade" | "downgrade" | "entity-with-health" | "entity-with-force" | "is-military-target" | "entity-with-owner" | "avoid-rolling-stock", true>
  ---@alias SimpleItemStack string | ItemStackDefinition
  ---@alias SoundPath string
  ---@alias SoundType "game-effect" | "gui-effect" | "ambient" | "environment" | "walking" | "alert" | "wind"
  ---@alias SpritePath string
  ---@alias SurfaceIdentification uint | string | LuaSurface
  ---@alias Tags table<string, AnyBasic>
  ---@alias TechnologyIdentification string | LuaTechnology | LuaTechnologyPrototype
  ---@alias TilePosition _TilePosition1 | _TilePosition2
  ---@alias TriggerTargetMask table<string, boolean>
  ---@alias Vector _Vector1 | _Vector2


--- classes 

---@class LuaAISettings: any @Collection of settings for overriding default ai behavior.
  ---@field allow_destroy_when_commands_fail boolean @RW; If enabled, units that repeatedly fail to succeed at commands will be destroyed.
  ---@field allow_try_return_to_spawner boolean @RW; If enabled, units that have nothing else to do will attempt to return to a spawner.
  ---@field do_separation boolean @RW; If enabled, units will try to separate themselves from nearby friendly units.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field path_resolution_modifier int8 @RW; The pathing resolution modifier, must be between -8 and 8.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAISettings = {}

--- All methods and properties that this object supports.
---@return string
function LuaAISettings.help() end

---@class LuaAccumulatorControlBehavior: LuaControlBehavior @Control behavior for accumulators.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field output_signal SignalID @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAccumulatorControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaAccumulatorControlBehavior.help() end

---@class LuaAchievementPrototype: any @Prototype of a achievement.
  ---@field allowed_without_fight boolean @RW
  ---@field hidden boolean @RW
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAchievementPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaAchievementPrototype.help() end

---@class LuaAmmoCategoryPrototype: any @Prototype of a ammo category.
  ---@field bonus_gui_order string @RW
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAmmoCategoryPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaAmmoCategoryPrototype.help() end

---@class LuaArithmeticCombinatorControlBehavior: LuaCombinatorControlBehavior @Control behavior for arithmetic combinators.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field parameters ArithmeticCombinatorParameters @RW; This arithmetic combinator's parameters.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaArithmeticCombinatorControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaArithmeticCombinatorControlBehavior.help() end

---@class LuaAutoplaceControlPrototype: any @Prototype of an autoplace control.
  ---@field can_be_disabled boolean @RW
  ---@field category string @RW; Category name of this prototype.
  ---@field control_order string @RW
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field richness boolean @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAutoplaceControlPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaAutoplaceControlPrototype.help() end

---@class LuaBootstrap: any @Entry point for registering event handlers. It is accessible through the global object named `script`.
  ---@field active_mods table<string, string> @RW; A dictionary listing the names of all currently active mods and mapping them to their version.
  ---@field level _table1 @RW; Information about the currently running scenario/campaign/tutorial.
  ---@field mod_name string @RW; The name of the mod from the environment this is used in.
  ---@field object_name string @RW; This object's name.
LuaBootstrap = {}

--- Generate a new, unique event ID that can be used to raise custom events with [LuaBootstrap::raise_event](LuaBootstrap::raise_event).
---@return uint @The newly generated event ID.
function LuaBootstrap.generate_event_name() end

--- Gets the filters for the given event.
---@param event uint @ID of the event to get.
---@return EventFilter @The filters or `nil` if none are defined.
function LuaBootstrap.get_event_filter(event) end

--- Find the event handler for an event.
---@param event uint @The event identifier to get a handler for.
---@return fun(p0: EventData) @Reference to the function currently registered as the handler, if it was found.
function LuaBootstrap.get_event_handler(event) end

--- Gets the mod event order as a string.
---@return string
function LuaBootstrap.get_event_order() end

--- Register a function to be run when mod configuration changes. This is called when the major game version or any mod version changed, when any mod was added or removed, when a startup setting has changed, or when any prototypes have been added or removed. It allows the mod to make any changes it deems appropriate to both the data structures in its [global](global) table or to the game state through [LuaGameScript](LuaGameScript).
---@param f (fun(p0: ConfigurationChangedData)) | nil @The handler for this event. Passing `nil` will unregister it.
function LuaBootstrap.on_configuration_changed(f) end

--- Register a handler to run on the specified event(s). Each mod can only register once for every event, as any additional registration will overwrite the previous one. This holds true even if different filters are used for subsequent registrations.
---@param event defines__events | defines__events[] | string @The event(s) or custom-input to invoke the handler on.
---@param f (fun(p0: EventData)) | nil @The handler for this event. Passing `nil` will unregister it.
---@param filters EventFilter|nil @The filters for this event. Can only be used when registering for individual events.
---@overload fun(event: defines__events | defines__events[] | string, f: (fun(p0: EventData)) | nil)
function LuaBootstrap.on_event(event, f, filters) end

--- Register a function to be run on mod initialization. This is only called when a new save game is created or when a save file is loaded that previously didn't contain the mod. During it, the mod gets the chance to set up initial values that it will use for its lifetime. It has full access to [LuaGameScript](LuaGameScript) and the [global](global) table and can change anything about them that it deems appropriate. No other events will be raised for the mod until it has finished this step.
---@param f (fun()) | nil @The handler for this event. Passing `nil` will unregister it.
function LuaBootstrap.on_init(f) end

--- Register a function to be run on save load. This is only called for mods that have been part of the save previously, or for players connecting to a running multiplayer session. It gives the mod the opportunity to do some very specific actions, should it need to. Doing anything other than these three will lead to desyncs, which breaks multiplayer and replay functionality. Access to [LuaGameScript](LuaGameScript) is not available. The [global](global) table can be accessed and is safe to read from, but not write to, as doing so will lead to an error.
--- The only legitimate uses of this event are the following:
--- - Re-setup [metatables](https://www.lua.org/pil/13.html) as they are not persisted through the save/load cycle.
--- - Re-setup conditional event handlers, meaning subscribing to an event only when some condition is met to save processing time.
--- - Create local references to data stored in the [global](global) table.
--- For all other purposes, [LuaBootstrap::on_init](LuaBootstrap::on_init), [LuaBootstrap::on_configuration_changed](LuaBootstrap::on_configuration_changed) or [migrations](migrations) should be used instead.
---@param f (fun()) | nil @The handler for this event. Passing `nil` will unregister it.
function LuaBootstrap.on_load(f) end

--- Register a handler to run every nth-tick(s). When the game is on tick 0 it will trigger all registered handlers.
---@param tick uint | uint[] | nil @The nth-tick(s) to invoke the handler on. Passing `nil` as the only parameter will unregister all nth-tick handlers.
---@param f (fun(p0: NthTickEventData)) | nil @The handler to run. Passing `nil` will unregister it for the provided nth-tick(s).
function LuaBootstrap.on_nth_tick(tick, f) end

---@shape LuaBootstrap_raise_biter_base_built_params
   ---@field entity LuaEntity @The entity that was built.

---@param p LuaBootstrap_raise_biter_base_built_params
function LuaBootstrap.raise_biter_base_built(p) end

---@shape LuaBootstrap_raise_console_chat_params
   ---@field player_index uint @The player doing the chatting.
   ---@field message string @The chat message to send.

---@param p LuaBootstrap_raise_console_chat_params
function LuaBootstrap.raise_console_chat(p) end

--- Raise an event. Only events generated with [LuaBootstrap::generate_event_name](LuaBootstrap::generate_event_name) and the following can be raised:
--- - [on_console_chat](on_console_chat)
--- - [on_player_crafted_item](on_player_crafted_item)
--- - [on_player_fast_transferred](on_player_fast_transferred)
--- - [on_biter_base_built](on_biter_base_built)
--- - [on_market_item_purchased](on_market_item_purchased)
--- - [script_raised_built](script_raised_built)
--- - [script_raised_destroy](script_raised_destroy)
--- - [script_raised_revive](script_raised_revive)
--- - [script_raised_set_tiles](script_raised_set_tiles)
---@param event uint @ID of the event to raise.
---@param data table @Table with extra data that will be passed to the event handler. Any invalid LuaObjects will silently stop the event from being raised.
function LuaBootstrap.raise_event(event, data) end

---@shape LuaBootstrap_raise_market_item_purchased_params
   ---@field player_index uint @The player who did the purchasing.
   ---@field market LuaEntity @The market entity.
   ---@field offer_index uint @The index of the offer purchased.
   ---@field count uint @The amount of offers purchased.

---@param p LuaBootstrap_raise_market_item_purchased_params
function LuaBootstrap.raise_market_item_purchased(p) end

---@shape LuaBootstrap_raise_player_crafted_item_params
   ---@field item_stack LuaItemStack @The item that has been crafted.
   ---@field player_index uint @The player doing the crafting.
   ---@field recipe LuaRecipe @The recipe used to craft this item.

---@param p LuaBootstrap_raise_player_crafted_item_params
function LuaBootstrap.raise_player_crafted_item(p) end

---@shape LuaBootstrap_raise_player_fast_transferred_params
   ---@field player_index uint @The player transferred from or to.
   ---@field entity LuaEntity @The entity transferred from or to.
   ---@field from_player boolean @Whether the transfer was from player to entity. If `false`, the transfer was from entity to player.

---@param p LuaBootstrap_raise_player_fast_transferred_params
function LuaBootstrap.raise_player_fast_transferred(p) end

---@shape LuaBootstrap_raise_script_built_params
   ---@field entity LuaEntity @The entity that has been built.

---@param p LuaBootstrap_raise_script_built_params
function LuaBootstrap.raise_script_built(p) end

---@shape LuaBootstrap_raise_script_destroy_params
   ---@field entity LuaEntity @The entity that was destroyed.

---@param p LuaBootstrap_raise_script_destroy_params
function LuaBootstrap.raise_script_destroy(p) end

---@shape LuaBootstrap_raise_script_revive_params
   ---@field entity LuaEntity @The entity that was revived.
   ---@field tags Tags|nil @The tags associated with this entity, if any.

---@param p LuaBootstrap_raise_script_revive_params
function LuaBootstrap.raise_script_revive(p) end

---@shape LuaBootstrap_raise_script_set_tiles_params
   ---@field surface_index uint @The surface whose tiles have been changed.
   ---@field tiles Tile[] @The tiles that have been changed.

---@param p LuaBootstrap_raise_script_set_tiles_params
function LuaBootstrap.raise_script_set_tiles(p) end

--- Register a metatable to have linkage recorded and restored when saving/loading. The metatable itself will not be saved. Instead, only the linkage to a registered metatable is saved, and the metatable registered under that name will be used when loading the table.
---@param name string @The name of this metatable. Names must be unique per mod.
---@param metatable table @The metatable to register.
function LuaBootstrap.register_metatable(name, metatable) end

--- Registers an entity so that after it's destroyed, [on_entity_destroyed](on_entity_destroyed) is called. Once an entity is registered, it stays registered until it is actually destroyed, even through save/load cycles. The registration is global across all mods, meaning once one mod registers an entity, all mods listening to [on_entity_destroyed](on_entity_destroyed) will receive the event when it is destroyed. Registering the same entity multiple times will still only fire the destruction event once, and will return the same registration number.
---@param entity LuaEntity @The entity to register.
---@return uint64 @The registration number. It is used to identify the entity in the [on_entity_destroyed](on_entity_destroyed) event.
function LuaBootstrap.register_on_entity_destroyed(entity) end

--- Sets the filters for the given event. The filters are only retained when set after the actual event registration, because registering for an event with different or no filters will overwrite previously set ones.
---@param event uint @ID of the event to filter.
---@param filters EventFilter|nil @The filters or `nil` to clear them.
---@overload fun(event: uint)
function LuaBootstrap.set_event_filter(event, filters) end

---@class LuaBurner: any @A reference to the burner energy source owned by a specific [LuaEntity](LuaEntity) or [LuaEquipment](LuaEquipment).
  ---@field burnt_result_inventory LuaInventory @RW; The burnt result inventory.
  ---@field currently_burning LuaItemPrototype @RW nilable; The currently burning item.
  ---@field fuel_categories table<string, boolean> @RW; The fuel categories this burner uses.
  ---@field heat double @RW; The current heat (energy) stored in this burner.
  ---@field heat_capacity double @RW; The maximum heat (maximum energy) that this burner can store.
  ---@field inventory LuaInventory @RW; The fuel inventory.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field owner LuaEntity | LuaEquipment @RW; The owner of this burner energy source
  ---@field remaining_burning_fuel double @RW; The amount of energy left in the currently-burning fuel item.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaBurner = {}

--- All methods and properties that this object supports.
---@return string
function LuaBurner.help() end

---@class LuaBurnerPrototype: any @Prototype of a burner energy source.
  ---@field burnt_inventory_size uint @RW
  ---@field effectivity double @RW
  ---@field emissions double @RW; The emissions of this energy source in `pollution/Joule`. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
  ---@field fuel_categories table<string, boolean> @RW
  ---@field fuel_inventory_size uint @RW
  ---@field light_flicker _table2 @RW nilable; The light flicker definition for this burner prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field render_no_network_icon boolean @RW
  ---@field render_no_power_icon boolean @RW
  ---@field smoke SmokeSource[] @RW nilable; The smoke sources for this burner prototype.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaBurnerPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaBurnerPrototype.help() end

---@class LuaChunkIterator: any @A chunk iterator can be used for iterating chunks coordinates of a surface. The returned type is a [ChunkPositionAndArea](ChunkPositionAndArea) containing the chunk coordinates and its area.
  ---@overload fun(): ChunkPositionAndArea|nil
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaChunkIterator = {}

--- All methods and properties that this object supports.
---@return string
function LuaChunkIterator.help() end

---@class LuaCircuitNetwork: any @A circuit network associated with a given entity, connector, and wire type.
  ---@field circuit_connector_id defines__circuit_connector_id @RW; The circuit connector ID on the associated entity this network was gotten from.
  ---@field connected_circuit_count uint @RW; The number of circuits connected to this network.
  ---@field entity LuaEntity @RW; The entity this circuit network reference is associated with.
  ---@field network_id uint @RW; The circuit networks ID.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field signals Signal[] @RW nilable; The circuit network signals last tick. `nil` if there were no signals last tick.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field wire_type defines__wire_type @RW; The wire type this network is associated with.
LuaCircuitNetwork = {}

---@param signal SignalID @The signal to read.
---@return int @The current value of the signal.
function LuaCircuitNetwork.get_signal(signal) end

--- All methods and properties that this object supports.
---@return string
function LuaCircuitNetwork.help() end

---@class LuaCombinatorControlBehavior: LuaControlBehavior
  ---@field signals_last_tick Signal[] @RW; The circuit network signals sent by this combinator last tick.
LuaCombinatorControlBehavior = {}

--- Gets the value of a specific signal sent by this combinator behavior last tick or `nil` if the signal didn't exist.
---@param signal SignalID @The signal to get
---@return int
function LuaCombinatorControlBehavior.get_signal_last_tick(signal) end

---@class LuaCommandProcessor: any @Allows for the registration of custom console commands. Similarly to [event subscriptions](LuaBootstrap::on_event), these don't persist through a save-and-load cycle.
  ---@field commands table<string, LocalisedString> @RW; Lists the custom commands registered by scripts through `LuaCommandProcessor`.
  ---@field game_commands table<string, LocalisedString> @RW; Lists the built-in commands of the core game. The [wiki](https://wiki.factorio.com/Console) has an overview of these.
  ---@field object_name string @RW; This object's name.
LuaCommandProcessor = {}

--- Add a custom console command.
---@param name string @The desired name of the command (case sensitive).
---@param help LocalisedString @The localised help message. It will be shown to players using the `/help` command.
---@param func fun(p0: CustomCommandData) @The function that will be called when this command is invoked.
function LuaCommandProcessor.add_command(name, help, func) end

--- Remove a custom console command.
---@param name string @The name of the command to remove (case sensitive).
---@return boolean @Whether the command was successfully removed. Returns `false` if the command didn't exist.
function LuaCommandProcessor.remove_command(name) end

---@class LuaConstantCombinatorControlBehavior: LuaControlBehavior @Control behavior for constant combinators.
  ---@field enabled boolean @RW; Turns this constant combinator on and off.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field parameters ConstantCombinatorParameters[] @RW nilable; This constant combinator's parameters. `nil` if the [item_slot_count](LuaEntityPrototype::item_slot_count) of the combinator's prototype is `0`. Writing `nil` clears the combinator's parameters.
  ---@field signals_count uint @RW; The number of signals this constant combinator supports
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaConstantCombinatorControlBehavior = {}

--- Gets the signal at the given index. Returned [Signal](Signal) will not contain signal if none is set for the index.
---@param index uint
---@return Signal
function LuaConstantCombinatorControlBehavior.get_signal(index) end

--- All methods and properties that this object supports.
---@return string
function LuaConstantCombinatorControlBehavior.help() end

--- Sets the signal at the given index
---@param index uint
---@param signal Signal
function LuaConstantCombinatorControlBehavior.set_signal(index, signal) end

---@class LuaContainerControlBehavior: LuaControlBehavior @Control behavior for container entities.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaContainerControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaContainerControlBehavior.help() end

---@class LuaControl: any @This is an abstract base class containing the common functionality between [LuaPlayer](LuaPlayer) and entities (see [LuaEntity](LuaEntity)). When accessing player-related functions through a [LuaEntity](LuaEntity), it must refer to a character entity.
  ---@field build_distance uint @RW; The build distance of this character or max uint when not a character or player connected to a character.
  ---@field character_additional_mining_categories string[] @RW
  ---@field character_build_distance_bonus uint @RW
  ---@field character_crafting_speed_modifier double @RW
  ---@field character_health_bonus float @RW
  ---@field character_inventory_slots_bonus uint @RW
  ---@field character_item_drop_distance_bonus uint @RW
  ---@field character_item_pickup_distance_bonus uint @RW
  ---@field character_loot_pickup_distance_bonus uint @RW
  ---@field character_maximum_following_robot_count_bonus uint @RW
  ---@field character_mining_progress double @RW; The current mining progress between 0 and 1 of this character, or 0 if they aren't mining.
  ---@field character_mining_speed_modifier double @RW
  ---@field character_personal_logistic_requests_enabled boolean @RW; If personal logistic requests are enabled for this character or players character.
  ---@field character_reach_distance_bonus uint @RW
  ---@field character_resource_reach_distance_bonus uint @RW
  ---@field character_running_speed double @RW; The current movement speed of this character, including effects from exoskeletons, tiles, stickers and shooting.
  ---@field character_running_speed_modifier double @RW; Modifies the running speed of this character by the given value as a percentage. Setting the running modifier to `0.5` makes the character run 50% faster. The minimum value of `-1` reduces the movement speed by 100%, resulting in a speed of `0`.
  ---@field character_trash_slot_count_bonus uint @RW
  ---@field cheat_mode boolean @RW; When `true` hand crafting is free and instant.
  ---@field crafting_queue CraftingQueueItem[] @RW; The current crafting queue items.
  ---@field crafting_queue_progress double @RW; The crafting queue progress in the range `[0-1]`. `0` when no recipe is being crafted.
  ---@field crafting_queue_size uint @RW; Size of the crafting queue.
  ---@field cursor_ghost ItemPrototypeIdentification @RW nilable; The ghost prototype in the player's cursor. When read, it will be a [LuaItemPrototype](LuaItemPrototype).
  ---@field cursor_stack LuaItemStack @RW nilable; The player's cursor stack. `nil` if the player controller is a spectator.
  ---@field driving boolean @RW; `true` if the player is in a vehicle. Writing to this attribute puts the player in or out of a vehicle.
  ---@field drop_item_distance uint @RW; The item drop distance of this character or max uint when not a character or player connected to a character.
  ---@field following_robots LuaEntity[] @RW; The current combat robots following the character.
  ---@field force ForceIdentification @RW; The force of this entity. Reading will always give a [LuaForce](LuaForce), but it is possible to assign either [string](string) or [LuaForce](LuaForce) to this attribute to change the force.
  ---@field in_combat boolean @RW; Whether this character entity is in combat.
  ---@field item_pickup_distance double @RW; The item pickup distance of this character or max double when not a character or player connected to a character.
  ---@field loot_pickup_distance double @RW; The loot pickup distance of this character or max double when not a character or player connected to a character.
  ---@field mining_state _table3 @RW; Current mining state.
  ---@field opened LuaEntity | LuaItemStack | LuaEquipment | LuaEquipmentGrid | LuaPlayer | LuaGuiElement | LuaInventory | LuaTechnology | defines__gui_type @RW nilable; The GUI the player currently has open. This is the GUI that will asked to close (by firing the [on_gui_closed](on_gui_closed) event) when the `Esc` or `E` keys are pressed. If this attribute is not `nil`, and a new GUI is written to it, the existing one will be asked to close.
  ---@field opened_gui_type defines__gui_type @RW nilable
  ---@field picking_state boolean @RW; Current item-picking state.
  ---@field position MapPosition @RW; The current position of the entity.
  ---@field reach_distance uint @RW; The reach distance of this character or max uint when not a character or player connected to a character.
  ---@field repair_state _table4 @RW; Current repair state.
  ---@field resource_reach_distance double @RW; The resource reach distance of this character or max double when not a character or player connected to a character.
  ---@field riding_state RidingState @RW; Current riding state of this car, or of the car this player is riding in.
  ---@field selected LuaEntity @RW nilable; The currently selected entity. Assigning an entity will select it if is selectable, otherwise the selection is cleared.
  ---@field shooting_state _table5 @RW; Current shooting state.
  ---@field surface LuaSurface @RW; The surface this entity is currently on.
  ---@field vehicle LuaEntity @RW nilable; The vehicle the player is currently sitting in.
  ---@field vehicle_logistic_requests_enabled boolean @RW; If personal logistic requests are enabled for this vehicle (spidertron).
  ---@field walking_state _table6 @RW; Current walking state.
LuaControl = {}

---@shape LuaControl_begin_crafting_params
   ---@field count uint @The count to craft.
   ---@field recipe string | LuaRecipe @The recipe to craft.
   ---@field silent boolean|nil @If false and the recipe can't be crafted the requested number of times printing the failure is skipped.

--- Begins crafting the given count of the given recipe.
---@param p LuaControl_begin_crafting_params
---@return uint @The count that was actually started crafting.
function LuaControl.begin_crafting(p) end

--- Can at least some items be inserted?
---@param items ItemStackIdentification @Items that would be inserted.
---@return boolean @`true` if at least a part of the given items could be inserted into this inventory.
function LuaControl.can_insert(items) end

--- Can a given entity be opened or accessed?
---@param entity LuaEntity
---@return boolean
function LuaControl.can_reach_entity(entity) end

---@shape LuaControl_cancel_crafting_params
   ---@field index uint @The crafting queue index.
   ---@field count uint @The count to cancel crafting.

--- Cancels crafting the given count of the given crafting queue index.
---@param p LuaControl_cancel_crafting_params
function LuaControl.cancel_crafting(p) end

--- Removes the arrow created by `set_gui_arrow`.
function LuaControl.clear_gui_arrow() end

--- Remove all items from this entity.
function LuaControl.clear_items_inside() end

---@param slot_index uint @The slot to clear.
function LuaControl.clear_personal_logistic_slot(slot_index) end

--- Unselect any selected entity.
function LuaControl.clear_selected_entity() end

---@param slot_index uint @The slot to clear.
function LuaControl.clear_vehicle_logistic_slot(slot_index) end

--- Disable the flashlight.
function LuaControl.disable_flashlight() end

--- Enable the flashlight.
function LuaControl.enable_flashlight() end

--- Gets the entities that are part of the currently selected blueprint, regardless of it being in a blueprint book or picked from the blueprint library.
---@return BlueprintEntity[] @Returns `nil` if there is no currently selected blueprint.
function LuaControl.get_blueprint_entities() end

--- Gets the count of the given recipe that can be crafted.
---@param recipe string | LuaRecipe @The recipe.
---@return uint @The count that can be crafted.
function LuaControl.get_craftable_count(recipe) end

--- Get an inventory belonging to this entity. This can be either the "main" inventory or some auxiliary one, like the module slots or logistic trash slots.
---@param inventory defines__inventory
---@return LuaInventory @The inventory or `nil` if none with the given index was found.
function LuaControl.get_inventory(inventory) end

--- Get the number of all or some items in this entity.
---@param item string|nil @Prototype name of the item to count. If not specified, count all items.
---@overload fun(): uint
---@return uint
function LuaControl.get_item_count(item) end

--- Gets the main inventory for this character or player if this is a character or player.
---@return LuaInventory @The inventory or `nil` if this entity is not a character or player.
function LuaControl.get_main_inventory() end

--- Gets the parameters of a personal logistic request and auto-trash slot.
---@param slot_index uint @The slot to get.
---@return LogisticParameters @The logistic parameters. If personal logistics are not researched yet, their `name` will be `nil`.
function LuaControl.get_personal_logistic_slot(slot_index) end

--- Gets the parameters of a vehicle logistic request and auto-trash slot. Only used on `spider-vehicle`.
---@param slot_index uint @The slot to get.
---@return LogisticParameters @The logistic parameters. If the vehicle does not use logistics, their `name` will be `nil`.
function LuaControl.get_vehicle_logistic_slot(slot_index) end

--- Does this entity have any item inside it?
---@return boolean
function LuaControl.has_items_inside() end

--- Insert items into this entity. This works the same way as inserters or shift-clicking: the "best" inventory is chosen automatically.
---@param items ItemStackIdentification @The items to insert.
---@return uint @The number of items that were actually inserted.
function LuaControl.insert(items) end

--- Returns whether the player is holding a blueprint. This takes both blueprint items as well as blueprint records from the blueprint library into account.
--- Note that both this method and [LuaControl::get_blueprint_entities](LuaControl::get_blueprint_entities) refer to the currently selected blueprint, meaning a blueprint book with a selected blueprint will return the information as well.
---@return boolean
function LuaControl.is_cursor_blueprint() end

--- Returns whether the player is holding something in the cursor. It takes into account items from the blueprint library, as well as items and ghost cursor.
---@return boolean
function LuaControl.is_cursor_empty() end

--- Is the flashlight enabled.
---@return boolean
function LuaControl.is_flashlight_enabled() end

--- When `true` control adapter is a LuaPlayer object, `false` for entities including characters with players.
---@return boolean
function LuaControl.is_player() end

--- Mines the given entity as if this player (or character) mined it.
---@param entity LuaEntity @The entity to mine
---@param force boolean|nil @Forces mining the entity even if the items can't fit in the player.
---@overload fun(entity: LuaEntity): boolean
---@return boolean @Whether the mining succeeded.
function LuaControl.mine_entity(entity, force) end

--- Mines the given tile as if this player (or character) mined it.
---@param tile LuaTile @The tile to mine.
---@return boolean @Whether the mining succeeded.
function LuaControl.mine_tile(tile) end

--- Open the technology GUI and select a given technology.
---@param technology TechnologyIdentification|nil @The technology to select after opening the GUI.
---@overload fun()
function LuaControl.open_technology_gui(technology) end

--- Remove items from this entity.
---@param items ItemStackIdentification @The items to remove.
---@return uint @The number of items that were actually removed.
function LuaControl.remove_item(items) end

---@shape LuaControl_set_gui_arrow_params
   ---@field type string @Where to point to. This field determines what other fields are mandatory. May be `"nowhere"`, `"goal"`, `"entity_info"`, `"active_window"`, `"entity"`, `"position"`, `"crafting_queue"`, or `"item_stack"`.

--- Create an arrow which points at this entity. This is used in the tutorial. For examples, see `control.lua` in the campaign missions.
---@param p LuaControl_set_gui_arrow_params
function LuaControl.set_gui_arrow(p) end

--- Sets a personal logistic request and auto-trash slot to the given value.
---@param slot_index uint @The slot to set.
---@param value LogisticParameters @The logistic request parameters.
---@return boolean @Whether the slot was set successfully. `false` if personal logistics are not researched yet.
function LuaControl.set_personal_logistic_slot(slot_index, value) end

--- Sets a vehicle logistic request and auto-trash slot to the given value. Only used on `spider-vehicle`.
---@param slot_index uint @The slot to set.
---@param value LogisticParameters @The logistic request parameters.
---@return boolean @Whether the slot was set successfully. `false` if the vehicle does not use logistics.
function LuaControl.set_vehicle_logistic_slot(slot_index, value) end

--- Teleport the entity to a given position, possibly on another surface.
---@param position MapPosition @Where to teleport to.
---@param surface SurfaceIdentification|nil @Surface to teleport to. If not given, will teleport to the entity's current surface. Only players, cars, and spidertrons can be teleported cross-surface.
---@overload fun(position: MapPosition): boolean
---@return boolean @`true` if the entity was successfully teleported.
function LuaControl.teleport(position, surface) end

--- Select an entity, as if by hovering the mouse above it.
---@param position MapPosition @Position of the entity to select.
function LuaControl.update_selected_entity(position) end

---@class LuaControlBehavior: any @The control behavior for an entity. Inserters have logistic network and circuit network behavior logic, lamps have circuit logic and so on. This is an abstract base class that concrete control behaviors inherit.
  ---@field entity LuaEntity @RW; The entity this control behavior belongs to.
  ---@field type defines__control_behavior__type @RW; The concrete type of this control behavior.
LuaControlBehavior = {}

---@param wire defines__wire_type @Wire color of the network connected to this entity.
---@param circuit_connector defines__circuit_connector_id|nil @The connector to get circuit network for. Must be specified for entities with more than one circuit network connector.
---@overload fun(wire: defines__wire_type): LuaCircuitNetwork
---@return LuaCircuitNetwork @The circuit network or nil.
function LuaControlBehavior.get_circuit_network(wire, circuit_connector) end

---@class LuaCustomChartTag: any @A custom tag that shows on the map view.
  ---@field force LuaForce @RW; The force this tag belongs to.
  ---@field icon SignalID @RW; This tag's icon, if it has one. Writing `nil` removes it.
  ---@field last_user LuaPlayer @RW nilable; The player who last edited this tag.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field position MapPosition @RW; The position of this tag.
  ---@field surface LuaSurface @RW; The surface this tag belongs to.
  ---@field tag_number uint @RW; The unique ID for this tag on this force.
  ---@field text string @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaCustomChartTag = {}

--- Destroys this tag.
function LuaCustomChartTag.destroy() end

--- All methods and properties that this object supports.
---@return string
function LuaCustomChartTag.help() end

---@class LuaCustomInputPrototype: any @Prototype of a custom input.
  ---@field action string @RW; The action that happens when this custom input is triggered.
  ---@field alternative_key_sequence string @RW nilable; The default alternative key sequence for this custom input, if any
  ---@field consuming string @RW; The consuming type: `"none"` or `"game-only"`.
  ---@field enabled boolean @RW; Whether this custom input is enabled. Disabled custom inputs exist but are not used by the game.
  ---@field enabled_while_in_cutscene boolean @RW; Whether this custom input is enabled while using the cutscene controller.
  ---@field enabled_while_spectating boolean @RW; Whether this custom input is enabled while using the spectator controller.
  ---@field include_selected_prototype boolean @RW; Whether this custom input will include the selected prototype (if any) when triggered.
  ---@field item_to_spawn LuaItemPrototype @RW nilable; The item that gets spawned when this custom input is fired, if any.
  ---@field key_sequence string @RW; The default key sequence for this custom input.
  ---@field linked_game_control string @RW nilable; The linked game control name, if any.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaCustomInputPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaCustomInputPrototype.help() end

---@class LuaCustomTable: any @Lazily evaluated table. For performance reasons, we sometimes return a custom table-like type instead of a native Lua table. This custom type lazily constructs the necessary Lua wrappers of the corresponding C++ objects, therefore preventing their unnecessary construction in some cases. There are some notable consequences to the usage of a custom table type rather than the native Lua table type: Iterating a custom table is only possible using the `pairs` Lua function; `ipairs` won't work. Another key difference is that custom tables cannot be serialised into a game save file -- if saving the game would require serialisation of a custom table, an error will be displayed and the game will not be saved.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaCustomTable = {}

--- All methods and properties that this object supports.
---@return string
function LuaCustomTable.help() end

---@class LuaDamagePrototype: any @Prototype of a damage.
  ---@field hidden boolean @RW; Whether this damage type is hidden from entity tooltips.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaDamagePrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaDamagePrototype.help() end

---@class LuaDeciderCombinatorControlBehavior: LuaCombinatorControlBehavior @Control behavior for decider combinators.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field parameters DeciderCombinatorParameters @RW; This decider combinator's parameters.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaDeciderCombinatorControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaDeciderCombinatorControlBehavior.help() end

---@class LuaDecorativePrototype: any @Prototype of an optimized decorative.
  ---@field autoplace_specification AutoplaceSpecification @RW nilable; Autoplace specification for this decorative prototype, if any.
  ---@field collision_box BoundingBox @RW; The bounding box used for collision checking.
  ---@field collision_mask CollisionMask @RW; The collision masks this decorative uses
  ---@field collision_mask_with_flags CollisionMaskWithFlags @RW
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaDecorativePrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaDecorativePrototype.help() end

---@class LuaElectricEnergySourcePrototype: any @Prototype of an electric energy source.
  ---@field buffer_capacity double @RW
  ---@field drain double @RW
  ---@field emissions double @RW; The emissions of this energy source in `pollution/Joule`. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
  ---@field input_flow_limit double @RW
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field output_flow_limit double @RW
  ---@field render_no_network_icon boolean @RW
  ---@field render_no_power_icon boolean @RW
  ---@field usage_priority string @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaElectricEnergySourcePrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaElectricEnergySourcePrototype.help() end

---@class LuaEntity: LuaControl @The primary interface for interacting with entities through the Lua API. Entities are everything that exists on the map except for tiles (see [LuaTile](LuaTile)). Most functions on LuaEntity also work when the entity is contained in a ghost.
  ---@field active boolean @RW; Deactivating an entity will stop all its operations (car will stop moving, inserters will stop working, fish will stop moving etc).
  ---@field ai_settings LuaAISettings @RW; The ai settings of this unit.
  ---@field alert_parameters ProgrammableSpeakerAlertParameters @RW
  ---@field allow_dispatching_robots boolean @RW; Whether this character's personal roboports are allowed to dispatch robots.
  ---@field amount uint @RW; Count of resource units contained.
  ---@field armed boolean @RW; Whether this land mine is armed.
  ---@field associated_player LuaPlayer | PlayerIdentification @RW nilable; The player this character is associated with, if any. Set to `nil` to clear. The player will be automatically disassociated when a controller is set on the character. Also, all characters associated to a player will be logged off when the player logs off in multiplayer. Reading this property will return a [LuaPlayer](LuaPlayer), while [PlayerIdentification](PlayerIdentification) can be used when writing.
  ---@field auto_launch boolean @RW; Whether this rocket silo automatically launches the rocket when cargo is inserted.
  ---@field autopilot_destination MapPosition @RW nilable; Destination of this spidertron's autopilot, if any.
  ---@field autopilot_destinations MapPosition[] @RW; The queued destination positions of spidertron's autopilot.
  ---@field backer_name string @RW nilable; The backer name assigned to this entity. Entities that support backer names are labs, locomotives, radars, roboports, and train stops. `nil` if this entity doesn't support backer names.
  ---@field belt_neighbours table<string, LuaEntity[]> @RW; The belt connectable neighbours of this belt connectable entity. Only entities that input to or are outputs of this entity. Does not contain the other end of an underground belt, see [LuaEntity::neighbours](LuaEntity::neighbours) for that. This is a dictionary with `"inputs"`, `"outputs"` entries that are arrays of transport belt connectable entities, or empty tables if no entities.
  ---@field belt_to_ground_type string @RW; `"input"` or `"output"`, depending on whether this underground belt goes down or up.
  ---@field bonus_mining_progress double @RW nilable; The bonus mining progress for this mining drill. Read yields a number in range [0, mining_target.prototype.mineable_properties.mining_time]. `nil` if this isn't a mining drill.
  ---@field bonus_progress double @RW; The current productivity bonus progress, as a number in range [0, 1].
  ---@field bounding_box BoundingBox @RW; [LuaEntityPrototype::collision_box](LuaEntityPrototype::collision_box) around entity's given position and respecting the current entity orientation.
  ---@field burner LuaBurner @RW nilable; The burner energy source for this entity, if any.
  ---@field chain_signal_state defines__chain_signal_state @RW; The state of this chain signal.
  ---@field character_corpse_death_cause LocalisedString @RW; The reason this character corpse character died. `""` if there is no reason.
  ---@field character_corpse_player_index uint @RW; The player index associated with this character corpse.
  ---@field character_corpse_tick_of_death uint @RW; The tick this character corpse died at.
  ---@field circuit_connected_entities _table7 @RW nilable; Entities that are directly connected to this entity via the circuit network. `nil` if this entity can't be connected to the circuit network.
  ---@field circuit_connection_definitions CircuitConnectionDefinition[] @RW nilable; The connection definition for entities that are directly connected to this entity via the circuit network. `nil` if this entity can't be connected to the circuit network.
  ---@field cliff_orientation CliffOrientation @RW; The orientation of this cliff.
  ---@field color Color @RW nilable; The color of this character, rolling stock, train stop, car, spider-vehicle, flying text, corpse or simple-entity-with-owner. `nil` if this entity doesn't use custom colors.
  ---@field combat_robot_owner LuaEntity @RW nilable; The owner of this combat robot, if any.
  ---@field command Command @RW nilable; The command given to this unit, if any.
  ---@field connected_rail LuaEntity @RW nilable; The rail entity this train stop is connected to, if any.
  ---@field connected_rail_direction defines__rail_direction @RW; Rail direction to which this train stop is binding. This returns a value even when no rails are present.
  ---@field consumption_bonus double @RW; The consumption bonus of this entity.
  ---@field consumption_modifier float @RW; Multiplies the energy consumption.
  ---@field corpse_expires boolean @RW; Whether this corpse will ever fade away.
  ---@field corpse_immune_to_entity_placement boolean @RW; If true, corpse won't be destroyed when entities are placed over it. If false, whether corpse will be removed or not depends on value of CorpsePrototype::remove_on_entity_placement.
  ---@field crafting_progress float @RW; The current crafting progress, as a number in range [0, 1].
  ---@field crafting_speed double @RW; The current crafting speed, including speed bonuses from modules and beacons.
  ---@field damage_dealt double @RW; The damage dealt by this turret, artillery turret, or artillery wagon.
  ---@field destructible boolean @RW; If set to `false`, this entity can't be damaged and won't be attacked automatically. It can however still be mined.
  ---@field direction defines__direction @RW; The current direction this entity is facing.
  ---@field distraction_command Command @RW nilable; The distraction command given to this unit, if any.
  ---@field driver_is_gunner boolean @RW nilable; Whether the driver of this car or spidertron is the gunner. If `false`, the passenger is the gunner. `nil` if this is neither a car or a spidertron.
  ---@field drop_position MapPosition @RW; Position where the entity puts its stuff.
  ---@field drop_target LuaEntity @RW nilable; The entity this entity is putting its items to. If there are multiple possible entities at the drop-off point, writing to this attribute allows a mod to choose which one to drop off items to. The entity needs to collide with the tile box under the drop-off position. `nil` if there is no entity to put items to, or if this is not an entity that puts items somewhere.
  ---@field effective_speed float @RW nilable; The current speed of this unit in tiles per tick, taking into account any walking speed modifier given by the tile the unit is standing on. `nil` if this is not a unit.
  ---@field effectivity_modifier float @RW; Multiplies the acceleration the vehicle can create for one unit of energy. Defaults to `1`.
  ---@field effects ModuleEffects @RW nilable; The effects being applied to this entity, if any. For beacons, this is the effect the beacon is broadcasting.
  ---@field electric_buffer_size double @RW nilable; The buffer size for the electric energy source. `nil` if the entity doesn't have an electric energy source.
  ---@field electric_drain double @RW nilable; The electric drain for the electric energy source. `nil` if the entity doesn't have an electric energy source.
  ---@field electric_emissions double @RW nilable; The emissions for the electric energy source. `nil` if the entity doesn't have an electric energy source.
  ---@field electric_input_flow_limit double @RW nilable; The input flow limit for the electric energy source. `nil` if the entity doesn't have an electric energy source.
  ---@field electric_network_id uint @RW nilable; Returns the id of the electric network that this entity is connected to, if any.
  ---@field electric_network_statistics LuaFlowStatistics @RW; The electric network statistics for this electric pole.
  ---@field electric_output_flow_limit double @RW nilable; The output flow limit for the electric energy source. `nil` if the entity doesn't have an electric energy source.
  ---@field enable_logistics_while_moving boolean @RW; Whether equipment grid logistics are enabled while this vehicle is moving.
  ---@field energy double @RW; Energy stored in the entity (heat in furnace, energy stored in electrical devices etc.). always 0 for entities that don't have the concept of energy stored inside.
  ---@field energy_generated_last_tick double @RW; How much energy this generator generated in the last tick.
  ---@field entity_label string @RW nilable; The label on this entity, if any. `nil` if this is not a spider-vehicule.
  ---@field filter_slot_count uint @RW; The number of filter slots this inserter, loader, or logistic storage container has. 0 if not one of those entities.
  ---@field fluidbox LuaFluidBox @RW; Fluidboxes of this entity.
  ---@field follow_offset Vector @RW nilable; The follow offset of this spidertron, if any entity is being followed. This is randomized each time the follow entity is set.
  ---@field follow_target LuaEntity @RW nilable; The follow target of this spidertron, if any.
  ---@field friction_modifier float @RW; Multiplies the car friction rate.
  ---@field ghost_localised_description LocalisedString @RW
  ---@field ghost_localised_name LocalisedString @RW; Localised name of the entity or tile contained in this ghost.
  ---@field ghost_name string @RW; Name of the entity or tile contained in this ghost
  ---@field ghost_prototype LuaEntityPrototype | LuaTilePrototype @RW; The prototype of the entity or tile contained in this ghost.
  ---@field ghost_type string @RW; The prototype type of the entity or tile contained in this ghost.
  ---@field ghost_unit_number uint @RW nilable; The [unit_number](LuaEntity::unit_number) of the entity contained in this ghost. It is the same as the unit number of the [EntityWithOwner](https://wiki.factorio.com/Prototype/EntityWithOwner) that was destroyed to create this ghost. If it was created by other means, or if the inner entity does not support unit numbers, this property is `nil`.
  ---@field graphics_variation uint8 @RW nilable; The graphics variation for this entity. `nil` if this entity doesn't use graphics variations.
  ---@field grid LuaEquipmentGrid @RW nilable; This entity's equipment grid, if any.
  ---@field health float @RW nilable; The current health of the entity, if any. Health is automatically clamped to be between `0` and max health (inclusive). Entities with a health of `0` can not be attacked.
  ---@field held_stack LuaItemStack @RW; The item stack currently held in an inserter's hand.
  ---@field held_stack_position MapPosition @RW; Current position of the inserter's "hand".
  ---@field highlight_box_blink_interval uint @RW; The blink interval of this highlight box entity. 0 indicates no blink.
  ---@field highlight_box_type string @RW; The hightlight box type of this highlight box entity.
  ---@field infinity_container_filters InfinityInventoryFilter[] @RW; The filters for this infinity container.
  ---@field initial_amount uint @RW nilable; Count of initial resource units contained. `nil` if this is not an infinite resource.
  ---@field inserter_filter_mode string @RW nilable; The filter mode for this filter inserter. Either `"whitelist"` or `"blacklist"`. `nil` if this inserter doesn't use filters.
  ---@field inserter_stack_size_override uint @RW; Sets the stack size limit on this inserter. If the stack size is > than the force stack size limit the value is ignored.
  ---@field is_entity_with_force boolean @RW; (deprecated by 1.1.51) If this entity is a MilitaryTarget. Returns same value as LuaEntity::is_military_target
  ---@field is_entity_with_health boolean @RW; If this entity is EntityWithHealth
  ---@field is_entity_with_owner boolean @RW; If this entity is EntityWithOwner
  ---@field is_military_target boolean @RW; Whether this entity is a MilitaryTarget. Can be written to if [LuaEntityPrototype::allow_run_time_change_of_is_military_target](LuaEntityPrototype::allow_run_time_change_of_is_military_target) returns `true`.
  ---@field item_requests table<string, uint> @RW; Items this ghost will request when revived or items this item request proxy is requesting. Result is a dictionary mapping each item prototype name to the required count.
  ---@field kills uint @RW; The number of units killed by this turret, artillery turret, or artillery wagon.
  ---@field last_user LuaPlayer | PlayerIdentification @RW nilable; The last player that changed any setting on this entity. This includes building the entity, changing its color, or configuring its circuit network. `nil` if the last user is not part of the save anymore. Reading this property will return a [LuaPlayer](LuaPlayer), while [PlayerIdentification](PlayerIdentification) can be used when writing.
  ---@field link_id uint @RW; The link ID this linked container is using.
  ---@field linked_belt_neighbour LuaEntity @RW nilable; Neighbour to which this linked belt is connected to, if any.
  ---@field linked_belt_type string @RW; Type of linked belt: it is either `"input"` or `"output"`. Changing type will also flip direction so the belt is out of the same side
  ---@field loader_container LuaEntity @RW nilable; The container entity this loader is pointing at/pulling from depending on the [LuaEntity::loader_type](LuaEntity::loader_type), if any.
  ---@field loader_type string @RW; `"input"` or `"output"`, depending on whether this loader puts to or gets from a container.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW; Localised name of the entity.
  ---@field logistic_cell LuaLogisticCell @RW; The logistic cell this entity is a part of. Will be `nil` if this entity is not a part of any logistic cell.
  ---@field logistic_network LuaLogisticNetwork @RW; The logistic network this entity is a part of, or `nil` if this entity is not a part of any logistic network.
  ---@field minable boolean @RW
  ---@field mining_progress double @RW nilable; The mining progress for this mining drill. Is a number in range [0, mining_target.prototype.mineable_properties.mining_time]. `nil` if this isn't a mining drill.
  ---@field mining_target LuaEntity @RW nilable; The mining target, if any.
  ---@field moving boolean @RW; Returns true if this unit is moving.
  ---@field name string @RW; Name of the entity prototype. E.g. "inserter" or "filter-inserter".
  ---@field neighbour_bonus double @RW; The current total neighbour bonus of this reactor.
  ---@field neighbours (table<string, LuaEntity[]>) | LuaEntity[][] | LuaEntity @RW; A list of neighbours for certain types of entities. Applies to electric poles, power switches, underground belts, walls, gates, reactors, cliffs, and pipe-connectable entities. - When called on an electric pole, this is a dictionary of all connections, indexed by the strings `"copper"`, `"red"`, and `"green"`. - When called on a pipe-connectable entity, this is an array of entity arrays of all entities a given fluidbox is connected to. - When called on an underground transport belt, this is the other end of the underground belt connection, or `nil` if none. - When called on a wall-connectable entity or reactor, this is a dictionary of all connections indexed by the connection direction "north", "south", "east", and "west". - When called on a cliff entity, this is a dictionary of all connections indexed by the connection direction "north", "south", "east", and "west".
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field operable boolean @RW; Player can't open gui of this entity and he can't quick insert/input stuff in to the entity when it is not operable.
  ---@field orientation RealOrientation @RW; The smooth orientation of this entity.
  ---@field parameters ProgrammableSpeakerParameters @RW
  ---@field pickup_position MapPosition @RW; Where the inserter will pick up items from.
  ---@field pickup_target LuaEntity @RW nilable; The entity this inserter will attempt to pick up items from. If there are multiple possible entities at the pick-up point, writing to this attribute allows a mod to choose which one to pick up items from. The entity needs to collide with the tile box under the pick-up position. `nil` if there is no entity to pull items from.
  ---@field player LuaPlayer @RW nilable; The player connected to this character, if any.
  ---@field pollution_bonus double @RW; The pollution bonus of this entity.
  ---@field power_production double @RW; The power production specific to the ElectricEnergyInterface entity type.
  ---@field power_switch_state boolean @RW; The state of this power switch.
  ---@field power_usage double @RW; The power usage specific to the ElectricEnergyInterface entity type.
  ---@field previous_recipe LuaRecipe @RW nilable; The previous recipe this furnace was using, if any.
  ---@field productivity_bonus double @RW; The productivity bonus of this entity.
  ---@field products_finished uint @RW; The number of products this machine finished crafting in its lifetime.
  ---@field prototype LuaEntityPrototype @RW; The entity prototype of this entity.
  ---@field proxy_target LuaEntity @RW nilable; The target entity for this item-request-proxy, if any.
  ---@field pump_rail_target LuaEntity @RW nilable; The rail target of this pump, if any.
  ---@field radar_scan_progress float @RW; The current radar scan progress, as a number in range [0, 1].
  ---@field recipe_locked boolean @RW; When locked; the recipe in this assembling machine can't be changed by the player.
  ---@field relative_turret_orientation RealOrientation @RW nilable; The relative orientation of the vehicle turret, artillery turret, artillery wagon. `nil` if this entity isn't a vehicle with a vehicle turret or artillery turret/wagon.
  ---@field remove_unfiltered_items boolean @RW; Whether items not included in this infinity container filters should be removed from the container.
  ---@field render_player LuaPlayer | PlayerIdentification @RW nilable; The player that this `simple-entity-with-owner`, `simple-entity-with-force`, `flying-text`, or `highlight-box` is visible to. `nil` when this entity is rendered for all players. Reading this property will return a [LuaPlayer](LuaPlayer), while [PlayerIdentification](PlayerIdentification) can be used when writing.
  ---@field render_to_forces ForceIdentification[] @RW nilable; The forces that this `simple-entity-with-owner`, `simple-entity-with-force`, or `flying-text` is visible to. `nil` or an empty array when this entity is rendered for all forces.
  ---@field request_from_buffers boolean @RW; Whether this requester chest is set to also request from buffer chests.
  ---@field request_slot_count uint @RW; The index of the configured request with the highest index for this entity. This means 0 if no requests are set and e.g. 20 if the 20th request slot is configured.
  ---@field rocket_parts uint @RW; Number of rocket parts in the silo.
  ---@field rocket_silo_status defines__rocket_silo_status @RW; The status of this rocket silo entity.
  ---@field rotatable boolean @RW; When entity is not to be rotatable (inserter, transport belt etc), it can't be rotated by player using the R key.
  ---@field secondary_bounding_box BoundingBox @RW nilable; The secondary bounding box of this entity or `nil` if it doesn't have one. This only exists for curved rails, and is automatically determined by the game.
  ---@field secondary_selection_box BoundingBox @RW nilable; The secondary selection box of this entity or `nil` if it doesn't have one. This only exists for curved rails, and is automatically determined by the game.
  ---@field selected_gun_index uint @RW nilable; Index of the currently selected weapon slot of this character, car, or spidertron. `nil` if this entity doesn't have guns.
  ---@field selection_box BoundingBox @RW; [LuaEntityPrototype::selection_box](LuaEntityPrototype::selection_box) around entity's given position and respecting the current entity orientation.
  ---@field shooting_target LuaEntity @RW nilable; The shooting target for this turret, if any. Can't be set to `nil` via script.
  ---@field signal_state defines__signal_state @RW; The state of this rail signal.
  ---@field spawner LuaEntity @RW nilable; The spawner associated with this unit entity, if any.
  ---@field speed float @RW nilable; The current speed if this is a car, rolling stock, projectile or spidertron, or the maximum speed if this is a unit. The speed is in tiles per tick. `nil` if this is not a car, rolling stock, unit, projectile or spidertron. Only the speed of units, cars, and projectiles are writable.
  ---@field speed_bonus double @RW; The speed bonus of this entity.
  ---@field splitter_filter LuaItemPrototype @RW nilable; The filter for this splitter, if any is set.
  ---@field splitter_input_priority string @RW; The input priority for this splitter. Either `"left"`, `"none"`, or `"right"`.
  ---@field splitter_output_priority string @RW; The output priority for this splitter. Either `"left"`, `"none"`, or `"right"`.
  ---@field stack LuaItemStack @RW
  ---@field status defines__entity_status @RW nilable; The status of this entity, if any.
  ---@field sticked_to LuaEntity @RW; The entity this sticker is sticked to.
  ---@field stickers LuaEntity[] @RW nilable; The sticker entities attached to this entity, if any.
  ---@field storage_filter LuaItemPrototype @RW; The storage filter for this logistic storage container.
  ---@field supports_direction boolean @RW; Whether the entity has direction. When it is false for this entity, it will always return north direction when asked for.
  ---@field tags Tags @RW nilable; The tags associated with this entity ghost. `nil` if this is not an entity ghost.
  ---@field temperature double @RW nilable; The temperature of this entity's heat energy source. `nil` if this entity does not use a heat energy source.
  ---@field text LocalisedString @RW; The text of this flying-text entity.
  ---@field tick_of_last_attack uint @RW; The last tick this character entity was attacked.
  ---@field tick_of_last_damage uint @RW; The last tick this character entity was damaged.
  ---@field tile_height uint @RW; Specifies the tiling size of the entity, is used to decide, if the center should be in the center of the tile (odd tile size dimension) or on the tile border (even tile size dimension). Uses the current direction of the entity.
  ---@field tile_width uint @RW; Specifies the tiling size of the entity, is used to decide, if the center should be in the center of the tile (odd tile size dimension) or on the tile border (even tile size dimension). Uses the current direction of the entity.
  ---@field time_to_live uint @RW; The ticks left before a ghost, combat robot, highlight box or smoke with trigger is destroyed. - for ghosts set to uint32 max (4,294,967,295) to never expire. - for ghosts Cannot be set higher than [LuaForce::ghost_time_to_live](LuaForce::ghost_time_to_live) of the entity's force.
  ---@field time_to_next_effect uint @RW; The ticks until the next trigger effect of this smoke-with-trigger.
  ---@field timeout uint @RW; The timeout that's left on this landmine in ticks. It describes the time between the landmine being placed and it being armed.
  ---@field to_be_looted boolean @RW; Will this entity be picked up automatically when the player walks over it?
  ---@field torso_orientation RealOrientation @RW; The torso orientation of this spider vehicle.
  ---@field train LuaTrain @RW nilable; The train this rolling stock belongs to, if any. `nil` if this is not a rolling stock.
  ---@field trains_count uint @RW; Amount of trains related to this particular train stop. Includes train stopped at this train stop (until it finds a path to next target) and trains having this train stop as goal or waypoint.
  ---@field trains_in_block uint @RW; The number of trains in this rail block for this rail entity.
  ---@field trains_limit uint @RW; Amount of trains above which no new trains will be sent to this train stop. Writing nil will disable the limit (will set a maximum possible value).
  ---@field tree_color_index uint8 @RW; Index of the tree color.
  ---@field tree_color_index_max uint8 @RW; Maximum index of the tree colors.
  ---@field tree_gray_stage_index uint8 @RW; Index of the tree gray stage
  ---@field tree_gray_stage_index_max uint8 @RW; Maximum index of the tree gray stages.
  ---@field tree_stage_index uint8 @RW; Index of the tree stage.
  ---@field tree_stage_index_max uint8 @RW; Maximum index of the tree stages.
  ---@field type string @RW; The entity prototype type of this entity.
  ---@field unit_group LuaUnitGroup @RW nilable; The unit group this unit is a member of, if any.
  ---@field unit_number uint @RW nilable; A universally unique number identifying this entity for the lifetime of the save. Only entities inheriting from [EntityWithOwner](https://wiki.factorio.com/Prototype/EntityWithOwner), as well as [ItemRequestProxy](https://wiki.factorio.com/Prototype/ItemRequestProxy) and [EntityGhost](https://wiki.factorio.com/Prototype/EntityGhost) are assigned a unit number. `nil` if this entity doesn't have a unit number.
  ---@field units LuaEntity[] @RW; The units associated with this spawner entity.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field vehicle_automatic_targeting_parameters VehicleAutomaticTargetingParameters @RW; Read when this spidertron auto-targets enemies
LuaEntity = {}

--- Adds the given position to this spidertron's autopilot's queue of destinations.
---@param position MapPosition @The position the spidertron should move to.
function LuaEntity.add_autopilot_destination(position) end

--- Offer a thing on the market.
---@param offer Offer
function LuaEntity.add_market_item(offer) end

--- Checks if the entity can be destroyed
---@return boolean @Whether the entity can be destroyed.
function LuaEntity.can_be_destroyed() end

--- Whether this character can shoot the given entity or position.
---@param target LuaEntity
---@param position MapPosition
---@return boolean
function LuaEntity.can_shoot(target, position) end

--- Can wires reach between these entities.
---@param entity LuaEntity
---@return boolean
function LuaEntity.can_wires_reach(entity) end

--- Cancels deconstruction if it is scheduled, does nothing otherwise.
---@param force ForceIdentification @The force who did the deconstruction order.
---@param player PlayerIdentification|nil @The player to set the `last_user` to if any.
---@overload fun(force: ForceIdentification)
function LuaEntity.cancel_deconstruction(force, player) end

--- Cancels upgrade if it is scheduled, does nothing otherwise.
---@param force ForceIdentification @The force who did the upgrade order.
---@param player PlayerIdentification|nil @The player to set the last_user to if any.
---@overload fun(force: ForceIdentification): boolean
---@return boolean @Whether the cancel was successful.
function LuaEntity.cancel_upgrade(force, player) end

--- Remove all fluids from this entity.
function LuaEntity.clear_fluid_inside() end

--- Removes all offers from a market.
function LuaEntity.clear_market_items() end

--- Clear a logistic requester slot.
---@param slot uint @The slot index.
function LuaEntity.clear_request_slot(slot) end

---@shape LuaEntity_clone_params
   ---@field position MapPosition @The destination position
   ---@field surface LuaSurface|nil @The destination surface
   ---@field force ForceIdentification|nil
   ---@field create_build_effect_smoke boolean|nil @If false, the building effect smoke will not be shown around the new entity.

--- Clones this entity.
---@param p LuaEntity_clone_params
---@return LuaEntity @The cloned entity or `nil` if this entity can't be cloned/can't be cloned to the given location.
function LuaEntity.clone(p) end

--- Connects current linked belt with another one.
--- Neighbours have to be of different type. If given linked belt is connected to something else it will be disconnected first. If provided neighbour is connected to something else it will also be disconnected first. Automatically updates neighbour to be connected back to this one.
---@param neighbour LuaEntity @Another linked belt or entity ghost containing linked belt to connect or nil to disconnect
function LuaEntity.connect_linked_belts(neighbour) end

--- Connect two devices with a circuit wire or copper cable. Depending on which type of connection should be made, there are different procedures:
--- - To connect two electric poles, `target` must be a [LuaEntity](LuaEntity) that specifies another electric pole. This will connect them with copper cable.
--- - To connect two devices with circuit wire, `target` must be a table of type [WireConnectionDefinition](WireConnectionDefinition).
---@param target LuaEntity | WireConnectionDefinition @The target with which to establish a connection.
---@return boolean @Whether the connection was successfully formed.
function LuaEntity.connect_neighbour(target) end

--- Connects the rolling stock in the given direction.
---@param direction defines__rail_direction
---@return boolean @Whether any connection was made
function LuaEntity.connect_rolling_stock(direction) end

--- Copies settings from the given entity onto this entity.
---@param entity LuaEntity
---@param by_player PlayerIdentification|nil @If provided, the copying is done 'as' this player and [on_entity_settings_pasted](on_entity_settings_pasted) is triggered.
---@overload fun(entity: LuaEntity): table<string, uint>
---@return table<string, uint> @Any items removed from this entity as a result of copying the settings.
function LuaEntity.copy_settings(entity, by_player) end

--- Creates the same smoke that is created when you place a building by hand. You can play the building sound to go with it by using [LuaSurface::play_sound](LuaSurface::play_sound), eg: entity.surface.play_sound{path="entity-build/"..entity.prototype.name, position=entity.position}
function LuaEntity.create_build_effect_smoke() end

--- Damages the entity.
---@param damage float @The amount of damage to be done.
---@param force ForceIdentification @The force that will be doing the damage.
---@param type string|nil @The type of damage to be done, defaults to "impact".
---@param dealer LuaEntity|nil @The entity to consider as the damage dealer. Needs to be on the same surface as the entity being damaged.
---@overload fun(damage: float, force: ForceIdentification, type: string|nil): float
---@overload fun(damage: float, force: ForceIdentification): float
---@return float @the total damage actually applied after resistances.
function LuaEntity.damage(damage, force, type, dealer) end

--- Depletes and destroys this resource entity.
function LuaEntity.deplete() end

---@shape LuaEntity_destroy_params
   ---@field do_cliff_correction boolean|nil @Whether neighbouring cliffs should be corrected. Defaults to `false`.
   ---@field raise_destroy boolean|nil @If `true`, [script_raised_destroy](script_raised_destroy) will be called. Defaults to `false`.

--- Destroys the entity.
---@param p LuaEntity_destroy_params
---@return boolean @Returns `false` if the entity was valid and destruction failed, `true` in all other cases.
---@overload fun(): boolean
function LuaEntity.destroy(p) end

--- Immediately kills the entity. Does nothing if the entity doesn't have health.
--- Unlike [LuaEntity::destroy](LuaEntity::destroy), `die` will trigger the [on_entity_died](on_entity_died) event and the entity will produce a corpse and drop loot if it has any.
---@param force ForceIdentification|nil @The force to attribute the kill to.
---@param cause LuaEntity|nil @The cause to attribute the kill to.
---@overload fun(force: ForceIdentification|nil): boolean
---@overload fun(): boolean
---@return boolean @Whether the entity was successfully killed.
function LuaEntity.die(force, cause) end

--- Disconnects linked belt from its neighbour.
function LuaEntity.disconnect_linked_belts() end

--- Disconnect circuit wires or copper cables between devices. Depending on which type of connection should be cut, there are different procedures:
--- - To remove all copper cables, leave the `target` parameter blank: `pole.disconnect_neighbour()`.
--- - To remove all wires of a specific color, set `target` to [defines.wire_type.red](defines.wire_type.red) or [defines.wire_type.green](defines.wire_type.green).
--- - To remove a specific copper cable between two electric poles, `target` must be a [LuaEntity](LuaEntity) that specifies the other pole: `pole1.disconnect_neighbour(pole2)`.
--- - To remove a specific circuit wire, `target` must be a table of type [WireConnectionDefinition](WireConnectionDefinition).
---@param target (defines__wire_type | LuaEntity | WireConnectionDefinition)|nil @The target with which to cut a connection.
---@overload fun()
function LuaEntity.disconnect_neighbour(target) end

--- Tries to disconnect this rolling stock in the given direction.
---@param direction defines__rail_direction
---@return boolean @If anything was disconnected
function LuaEntity.disconnect_rolling_stock(direction) end

--- Get the source of this beam.
---@return BeamTarget
function LuaEntity.get_beam_source() end

--- Get the target of this beam.
---@return BeamTarget
function LuaEntity.get_beam_target() end

--- The burnt result inventory for this entity or `nil` if this entity doesn't have a burnt result inventory.
---@return LuaInventory
function LuaEntity.get_burnt_result_inventory() end

--- Returns all child signals. Child signals can be either RailSignal or RailChainSignal. Child signals are signals which are checked by this signal to determine a chain state.
---@return LuaEntity[]
function LuaEntity.get_child_signals() end

---@param wire defines__wire_type @Wire color of the network connected to this entity.
---@param circuit_connector defines__circuit_connector_id|nil @The connector to get circuit network for. Must be specified for entities with more than one circuit network connector.
---@overload fun(wire: defines__wire_type): LuaCircuitNetwork
---@return LuaCircuitNetwork @The circuit network or nil.
function LuaEntity.get_circuit_network(wire, circuit_connector) end

---@shape LuaEntity_get_connected_rail_params
   ---@field rail_direction defines__rail_direction
   ---@field rail_connection_direction defines__rail_connection_direction

---@param p LuaEntity_get_connected_rail_params
---@return LuaEntity, defines__rail_direction, defines__rail_connection_direction @Rail connected in the specified manner to this one, `nil` if unsuccessful.; Rail direction of the returned rail which points to origin rail; Turn to be taken when going back from returned rail to origin rail
function LuaEntity.get_connected_rail(p) end

--- Get the rails that this signal is connected to.
---@return LuaEntity[]
function LuaEntity.get_connected_rails() end

--- Gets rolling stock connected to the given end of this stock.
---@param direction defines__rail_direction
---@return LuaEntity, defines__rail_direction @The rolling stock connected at the given end, `nil` if none is connected there.; The rail direction of the connected rolling stock if any.
function LuaEntity.get_connected_rolling_stock(direction) end

--- Gets the control behavior of the entity (if any).
---@return LuaControlBehavior @The control behavior or `nil`.
function LuaEntity.get_control_behavior() end

--- Returns the amount of damage to be taken by this entity.
---@return float @`nil` if this entity does not have health.
function LuaEntity.get_damage_to_be_taken() end

--- Gets the driver of this vehicle if any.
---@return LuaEntity | LuaPlayer @`nil` if the vehicle contains no driver. To check if there's a passenger see [LuaEntity::get_passenger](LuaEntity::get_passenger).
function LuaEntity.get_driver() end

--- Get the filter for a slot in an inserter, loader, or logistic storage container.
---@param slot_index uint @Index of the slot to get the filter for.
---@return string @Prototype name of the item being filtered. `nil` if the given slot has no filter.
function LuaEntity.get_filter(slot_index) end

--- Get amounts of all fluids in this entity.
---@return table<string, double> @The amounts, indexed by fluid names.
function LuaEntity.get_fluid_contents() end

--- Get the amount of all or some fluid in this entity.
---@param fluid string|nil @Prototype name of the fluid to count. If not specified, count all fluids.
---@overload fun(): double
---@return double
function LuaEntity.get_fluid_count(fluid) end

--- The fuel inventory for this entity or `nil` if this entity doesn't have a fuel inventory.
---@return LuaInventory
function LuaEntity.get_fuel_inventory() end

--- The health ratio of this entity between 1 and 0 (for full health and no health respectively).
---@return float @`nil` if this entity doesn't have health.
function LuaEntity.get_health_ratio() end

--- Gets the heat setting for this heat interface.
---@return HeatSetting
function LuaEntity.get_heat_setting() end

--- Returns all signals guarding entrance to a rail block this rail belongs to.
---@return LuaEntity[]
function LuaEntity.get_inbound_signals() end

--- Gets the filter for this infinity container at the given index, or `nil` if the filter index doesn't exist or is empty.
---@param index uint @The index to get.
---@return InfinityInventoryFilter
function LuaEntity.get_infinity_container_filter(index) end

--- Gets the filter for this infinity pipe, or `nil` if the filter is empty.
---@return InfinityPipeFilter
function LuaEntity.get_infinity_pipe_filter() end

--- Gets all the `LuaLogisticPoint`s that this entity owns. Optionally returns only the point specified by the index parameter.
---@param index defines__logistic_member_index|nil @If provided, only returns the `LuaLogisticPoint` specified by this index.
---@overload fun(): LuaLogisticPoint | LuaLogisticPoint[]
---@return LuaLogisticPoint | LuaLogisticPoint[]
function LuaEntity.get_logistic_point(index) end

--- Get all offers in a market as an array.
---@return Offer[]
function LuaEntity.get_market_items() end

--- Get the maximum transport line index of a belt or belt connectable entity.
---@return uint
function LuaEntity.get_max_transport_line_index() end

--- Read a single signal from the combined circuit networks.
---@param signal SignalID @The signal to read.
---@param circuit_connector defines__circuit_connector_id|nil @The connector to get signals for. Must be specified for entities with more than one circuit network connector.
---@overload fun(signal: SignalID): int
---@return int @The current value of the signal.
function LuaEntity.get_merged_signal(signal, circuit_connector) end

--- The merged circuit network signals or `nil` if there are no signals.
---@param circuit_connector defines__circuit_connector_id|nil @The connector to get signals for. Must be specified for entities with more than one circuit network connector.
---@overload fun(): Signal[]
---@return Signal[] @The sum of signals on both the red and green networks, or `nil` if it doesn't have a circuit connector.
function LuaEntity.get_merged_signals(circuit_connector) end

--- Inventory for storing modules of this entity; `nil` if this entity has no module inventory.
---@return LuaInventory
function LuaEntity.get_module_inventory() end

--- Gets (and or creates if needed) the control behavior of the entity.
---@return LuaControlBehavior @The control behavior or `nil`.
function LuaEntity.get_or_create_control_behavior() end

--- Returns all signals guarding exit from a rail block this rail belongs to.
---@return LuaEntity[]
function LuaEntity.get_outbound_signals() end

--- Gets the entity's output inventory if it has one.
---@return LuaInventory @A reference to the entity's output inventory.
function LuaEntity.get_output_inventory() end

--- Returns all parent signals. Parent signals are always RailChainSignal. Parent signals are those signals that are checking state of this signal to determine their own chain state.
---@return LuaEntity[]
function LuaEntity.get_parent_signals() end

--- Gets the passenger of this car or spidertron if any.
---@return LuaEntity | LuaPlayer @`nil` if the vehicle contains no passenger. To check if there's a driver see [LuaEntity::get_driver](LuaEntity::get_driver).
function LuaEntity.get_passenger() end

--- The radius of this entity.
---@return double
function LuaEntity.get_radius() end

--- Get the rail at the end of the rail segment this rail is in.
---@param direction defines__rail_direction
---@return LuaEntity, defines__rail_direction @The rail entity.; A rail direction pointing out of the rail segment from the end rail.
function LuaEntity.get_rail_segment_end(direction) end

--- Get the rail signal or train stop at the start/end of the rail segment this rail is in.
---@param direction defines__rail_direction @The direction of travel relative to this rail.
---@param in_else_out boolean @If true, gets the entity at the entrance of the rail segment, otherwise gets the entity at the exit of the rail segment.
---@return LuaEntity @`nil` if the rail segment doesn't start/end with a signal nor a train stop.
function LuaEntity.get_rail_segment_entity(direction, in_else_out) end

--- Get the length of the rail segment this rail is in.
---@return double
function LuaEntity.get_rail_segment_length() end

--- Get a rail from each rail segment that overlaps with this rail's rail segment.
---@return LuaEntity[]
function LuaEntity.get_rail_segment_overlaps() end

--- Get all rails of a rail segment this rail is in
---@param direction defines__rail_direction @Selects end of this rail that points to a rail segment end from which to start returning rails
---@return LuaEntity[] @Rails of this rail segment
function LuaEntity.get_rail_segment_rails(direction) end

--- Current recipe being assembled by this machine or `nil` if no recipe is set.
---@return LuaRecipe
function LuaEntity.get_recipe() end

--- Get a logistic requester slot.
---@param slot uint @The slot index.
---@return SimpleItemStack @Contents of the specified slot; `nil` if the given slot contains no request.
function LuaEntity.get_request_slot(slot) end

--- Gets legs of given SpiderVehicle.
---@return LuaEntity[]
function LuaEntity.get_spider_legs() end

--- The train currently stopped at this train stop, if any.
---@return LuaTrain
function LuaEntity.get_stopped_train() end

--- The trains scheduled to stop at this train stop.
---@return LuaTrain[]
function LuaEntity.get_train_stop_trains() end

--- Get a transport line of a belt or belt connectable entity.
---@param index uint @Index of the requested transport line. Transport lines are 1-indexed.
---@return LuaTransportLine
function LuaEntity.get_transport_line(index) end

--- Returns the new entity direction after upgrading.
---@return defines__direction @`nil` if this entity is not marked for upgrade.
function LuaEntity.get_upgrade_direction() end

--- Returns the new entity prototype.
---@return LuaEntityPrototype @`nil` if this entity is not marked for upgrade.
function LuaEntity.get_upgrade_target() end

--- Same as [LuaEntity::has_flag](LuaEntity::has_flag), but targets the inner entity on a entity ghost.
---@param flag string @The flag to test. See [EntityPrototypeFlags](EntityPrototypeFlags) for a list of flags.
---@return boolean @`true` if the entity has the given flag set.
function LuaEntity.ghost_has_flag(flag) end

--- Has this unit been assigned a command?
---@return boolean
function LuaEntity.has_command() end

--- Test whether this entity's prototype has a certain flag set.
---@param flag string @The flag to test. See [EntityPrototypeFlags](EntityPrototypeFlags) for a list of flags.
---@return boolean @`true` if this entity has the given flag set.
function LuaEntity.has_flag(flag) end

--- All methods and properties that this object supports.
---@return string
function LuaEntity.help() end

--- Insert fluid into this entity. Fluidbox is chosen automatically.
---@param fluid Fluid @Fluid to insert.
---@return double @Amount of fluid actually inserted.
function LuaEntity.insert_fluid(fluid) end

---@return boolean @`true` if this gate is currently closed.
function LuaEntity.is_closed() end

---@return boolean @`true` if this gate is currently closing
function LuaEntity.is_closing() end

--- Returns `true` if this entity produces or consumes electricity and is connected to an electric network that has at least one entity that can produce power.
---@return boolean
function LuaEntity.is_connected_to_electric_network() end

--- Returns whether a craft is currently in process. It does not indicate whether progress is currently being made, but whether a crafting process has been started in this machine.
---@return boolean
function LuaEntity.is_crafting() end

---@return boolean @`true` if this gate is currently opened.
function LuaEntity.is_opened() end

---@return boolean @`true` if this gate is currently opening.
function LuaEntity.is_opening() end

--- Checks if this rail and other rail both belong to the same rail block.
---@param other_rail LuaEntity
---@return boolean
function LuaEntity.is_rail_in_same_rail_block_as(other_rail) end

--- Checks if this rail and other rail both belong to the same rail segment.
---@param other_rail LuaEntity
---@return boolean
function LuaEntity.is_rail_in_same_rail_segment_as(other_rail) end

--- Is this entity or tile ghost or item request proxy registered for construction? If false, it means a construction robot has been dispatched to build the entity, or it is not an entity that can be constructed.
---@return boolean
function LuaEntity.is_registered_for_construction() end

--- Is this entity registered for deconstruction with this force? If false, it means a construction robot has been dispatched to deconstruct it, or it is not marked for deconstruction. The complexity is effectively O(1) - it depends on the number of objects targeting this entity which should be small enough.
---@param force ForceIdentification @The force construction manager to check.
---@return boolean
function LuaEntity.is_registered_for_deconstruction(force) end

--- Is this entity registered for repair? If false, it means a construction robot has been dispatched to upgrade it, or it is not damaged. This is worst-case O(N) complexity where N is the current number of things in the repair queue.
---@return boolean
function LuaEntity.is_registered_for_repair() end

--- Is this entity registered for upgrade? If false, it means a construction robot has been dispatched to upgrade it, or it is not marked for upgrade. This is worst-case O(N) complexity where N is the current number of things in the upgrade queue.
---@return boolean
function LuaEntity.is_registered_for_upgrade() end

---@return boolean @`true` if the rocket was successfully launched. Return value of `false` means the silo is not ready for launch.
function LuaEntity.launch_rocket() end

---@shape LuaEntity_mine_params
   ---@field inventory LuaInventory|nil @If provided the item(s) will be transferred into this inventory. If provided, this must be an inventory created with [LuaGameScript::create_inventory](LuaGameScript::create_inventory) or be a basic inventory owned by some entity.
   ---@field force boolean|nil @If true, when the item(s) don't fit into the given inventory the entity is force mined. If false, the mining operation fails when there isn't enough room to transfer all of the items into the inventory. Defaults to false. This is ignored and acts as `true` if no inventory is provided.
   ---@field raise_destroyed boolean|nil @If true, [script_raised_destroy](script_raised_destroy) will be raised. Defaults to `true`.
   ---@field ignore_minable boolean|nil @If true, the minable state of the entity is ignored. Defaults to `false`. If false, an entity that isn't minable (set as not-minable in the prototype or isn't minable for other reasons) will fail to be mined.

--- Mines this entity.
---@param p LuaEntity_mine_params
---@return boolean @Whether mining succeeded.
---@overload fun(): boolean
function LuaEntity.mine(p) end

--- Sets the entity to be deconstructed by construction robots.
---@param force ForceIdentification @The force whose robots are supposed to do the deconstruction.
---@param player PlayerIdentification|nil @The player to set the `last_user` to if any.
---@overload fun(force: ForceIdentification): boolean
---@return boolean @if the entity was marked for deconstruction.
function LuaEntity.order_deconstruction(force, player) end

---@shape LuaEntity_order_upgrade_params
   ---@field force ForceIdentification @The force whose robots are supposed to do the upgrade.
   ---@field target EntityPrototypeIdentification @The prototype of the entity to upgrade to.
   ---@field player PlayerIdentification|nil
   ---@field direction defines__direction|nil @The new direction if any.

--- Sets the entity to be upgraded by construction robots.
---@param p LuaEntity_order_upgrade_params
---@return boolean @Whether the entity was marked for upgrade.
function LuaEntity.order_upgrade(p) end

--- Plays a note with the given instrument and note.
---@param instrument uint
---@param note uint
---@return boolean @Whether the request is valid. The sound may or may not be played depending on polyphony settings.
function LuaEntity.play_note(instrument, note) end

--- Release the unit from the spawner which spawned it. This allows the spawner to continue spawning additional units.
function LuaEntity.release_from_spawner() end

---@shape LuaEntity_remove_fluid_params
   ---@field name string @Fluid prototype name.
   ---@field amount double @Amount to remove
   ---@field minimum_temperature double|nil
   ---@field maximum_temperature double|nil
   ---@field temperature double|nil

--- Remove fluid from this entity.
---@param p LuaEntity_remove_fluid_params
---@return double @Amount of fluid actually removed.
function LuaEntity.remove_fluid(p) end

--- Remove an offer from a market.
---@param offer uint @Index of offer to remove.
---@return boolean @`true` if the offer was successfully removed; `false` when the given index was not valid.
function LuaEntity.remove_market_item(offer) end

---@param force ForceIdentification @The force that requests the gate to be closed.
function LuaEntity.request_to_close(force) end

---@param force ForceIdentification @The force that requests the gate to be open.
---@param extra_time uint|nil @Extra ticks to stay open.
---@overload fun(force: ForceIdentification)
function LuaEntity.request_to_open(force, extra_time) end

---@shape LuaEntity_revive_params
   ---@field return_item_request_proxy boolean|nil @If `true` the function will return item request proxy as the third return value.
   ---@field raise_revive boolean|nil @If true, and an entity ghost; [script_raised_revive](script_raised_revive) will be called. Else if true, and a tile ghost; [script_raised_set_tiles](script_raised_set_tiles) will be called.

--- Revive a ghost. I.e. turn it from a ghost to a real entity or tile.
---@param p LuaEntity_revive_params
---@return table<string, uint>, LuaEntity, LuaEntity @Any items the new real entity collided with or `nil` if the ghost could not be revived.; The revived entity if an entity ghost was successfully revived.; The item request proxy if it was requested with `return_item_request_proxy`.
---@overload fun(): table<string, uint>, LuaEntity, LuaEntity
function LuaEntity.revive(p) end

---@shape LuaEntity_rotate_params
   ---@field reverse boolean|nil @If `true`, rotate the entity in the counter-clockwise direction.
   ---@field by_player PlayerIdentification|nil @If not specified, the [on_player_rotated_entity](on_player_rotated_entity) event will not be fired.
   ---@field spill_items boolean|nil @If the player is not given should extra items be spilled or returned as a second return value from this.
   ---@field enable_looted boolean|nil @When true, each spilled item will be flagged with the [LuaEntity::to_be_looted](LuaEntity::to_be_looted) flag.
   ---@field force (LuaForce | string)|nil @When provided the spilled items will be marked for deconstruction by this force.

--- Rotates this entity as if the player rotated it.
---@param p LuaEntity_rotate_params
---@return boolean, table<string, uint> @Whether the rotation was successful.; Count of spilled items indexed by their prototype names if `spill_items` was `true`.
---@overload fun(): boolean, table<string, uint>
function LuaEntity.rotate(p) end

--- Set the source of this beam.
---@param source LuaEntity | MapPosition
function LuaEntity.set_beam_source(source) end

--- Set the target of this beam.
---@param target LuaEntity | MapPosition
function LuaEntity.set_beam_target(target) end

--- Give the entity a command.
---@param command Command
function LuaEntity.set_command(command) end

--- Give the entity a distraction command.
---@param command Command
function LuaEntity.set_distraction_command(command) end

--- Sets the driver of this vehicle.
---@param driver LuaEntity | PlayerIdentification @The new driver or `nil` to eject the current driver if any.
function LuaEntity.set_driver(driver) end

--- Set the filter for a slot in an inserter, loader, or logistic storage container.
---@param slot_index uint @Index of the slot to set the filter for.
---@param item string | nil @Prototype name of the item to filter, or `nil` to clear the filter.
function LuaEntity.set_filter(slot_index, item) end

--- Sets the heat setting for this heat interface.
---@param filter HeatSetting @The new setting.
function LuaEntity.set_heat_setting(filter) end

--- Sets the filter for this infinity container at the given index.
---@param index uint @The index to set.
---@param filter InfinityInventoryFilter | nil @The new filter, or `nil` to clear the filter.
function LuaEntity.set_infinity_container_filter(index, filter) end

--- Sets the filter for this infinity pipe.
---@param filter InfinityPipeFilter | nil @The new filter, or `nil` to clear the filter.
function LuaEntity.set_infinity_pipe_filter(filter) end

--- Sets the passenger of this car or spidertron.
---@param passenger LuaEntity | PlayerIdentification
function LuaEntity.set_passenger(passenger) end

--- Sets the current recipe in this assembly machine.
---@param recipe string | LuaRecipe @The new recipe or `nil` to clear the recipe.
---@return table<string, uint> @Any items removed from this entity as a result of setting the recipe.
function LuaEntity.set_recipe(recipe) end

--- Set a logistic requester slot.
---@param request ItemStackIdentification @What to request.
---@param slot uint @The slot index.
---@return boolean @Whether the slot was set.
function LuaEntity.set_request_slot(request, slot) end

---@shape LuaEntity_silent_revive_params
   ---@field return_item_request_proxy boolean|nil @If `true` the function will return item request proxy as the third parameter.
   ---@field raise_revive boolean|nil @If true, and an entity ghost; [script_raised_revive](script_raised_revive) will be called. Else if true, and a tile ghost; [script_raised_set_tiles](script_raised_set_tiles) will be called.

--- Revives a ghost silently.
---@param p LuaEntity_silent_revive_params
---@return table<string, uint>, LuaEntity, LuaEntity @Any items the new real entity collided with or `nil` if the ghost could not be revived.; The revived entity if an entity ghost was successfully revived.; The item request proxy if it was requested with `return_item_request_proxy`.
---@overload fun(): table<string, uint>, LuaEntity, LuaEntity
function LuaEntity.silent_revive(p) end

--- Triggers spawn_decoration actions defined in the entity prototype or does nothing if entity is not "turret" or "unit-spawner".
function LuaEntity.spawn_decorations() end

--- Only works if the entity is a speech-bubble, with an "effect" defined in its wrapper_flow_style. Starts animating the opacity of the speech bubble towards zero, and destroys the entity when it hits zero.
function LuaEntity.start_fading_out() end

--- Sets the [speed](LuaEntity::speed) of the given SpiderVehicle to zero. Notably does not clear its [autopilot_destination](LuaEntity::autopilot_destination), which it will continue moving towards if set.
function LuaEntity.stop_spider() end

--- Whether this entity supports a backer name.
---@return boolean
function LuaEntity.supports_backer_name() end

--- Is this entity marked for deconstruction?
---@return boolean
function LuaEntity.to_be_deconstructed() end

--- Is this entity marked for upgrade?
---@return boolean
function LuaEntity.to_be_upgraded() end

--- Toggle this entity's equipment movement bonus. Does nothing if the entity does not have an equipment grid.
function LuaEntity.toggle_equipment_movement_bonus() end

--- Reconnect loader, beacon, cliff and mining drill connections to entities that might have been teleported out or in by the script. The game doesn't do this automatically as we don't want to loose performance by checking this in normal games.
function LuaEntity.update_connections() end

---@class LuaEntityPrototype: any @Prototype of an entity.
  ---@field active_energy_usage double @RW nilable; The active energy usage of this rocket silo or combinator prototype.
  ---@field additional_pastable_entities LuaEntityPrototype[] @RW; Entities this entity can be pasted onto in addition to the normal allowed ones.
  ---@field adjacent_tile_collision_box BoundingBox @RW nilable; The bounding box that specifies which tiles adjacent to the offshore pump should be checked.
  ---@field adjacent_tile_collision_mask CollisionMask @RW nilable; Tiles adjacent to the offshore pump must not collide with this collision mask.
  ---@field adjacent_tile_collision_test CollisionMask @RW nilable; If this mask is not empty, tiles adjacent to the offshore pump must not collide with this collision mask.
  ---@field affected_by_tiles boolean @RW nilable; Whether this unit prototype is affected by tile walking speed modifiers.
  ---@field air_resistance double @RW nilable; The air resistance of this rolling stock prototype.
  ---@field alert_icon_shift Vector @RW; The alert icon shift of this entity prototype.
  ---@field alert_when_attacking boolean @RW nilable; Whether this turret raises an alert when attacking
  ---@field alert_when_damaged boolean @RW nilable; Whether this entity raises an alert when damaged.
  ---@field allow_access_to_all_forces boolean @RW nilable; Whether this market allows access to all forces or just friendly ones.
  ---@field allow_burner_leech boolean @RW nilable; Whether this inserter allows burner leeching.
  ---@field allow_copy_paste boolean @RW; When false copy-paste is not allowed for this entity.
  ---@field allow_custom_vectors boolean @RW nilable; Whether this inserter allows custom pickup and drop vectors.
  ---@field allow_passengers boolean @RW nilable; Whether this vehicle allows passengers.
  ---@field allow_run_time_change_of_is_military_target boolean @RW nilable; True if this entity-with-owner's is_military_target can be changed run-time (on the entity, not on the prototype itself)
  ---@field allowed_effects table<string, boolean> @RW nilable; The allowed module effects for this entity, if any.
  ---@field always_on boolean @RW nilable; Whether the lamp is always on (except when out of power or turned off by the circuit network).
  ---@field ammo_category string @RW nilable; Name of the ammo category of this land mine.
  ---@field animation_speed_coefficient double @RW nilable; The animation speed coefficient of this belt connectable prototype.
  ---@field attack_parameters AttackParameters @RW nilable; The attack parameters for this entity, if any.
  ---@field attack_result TriggerItem[] @RW nilable; The attack result of this entity, if any.
  ---@field automated_ammo_count uint @RW nilable; The amount of ammo that inserters automatically insert into this ammo-turret or artillery-turret.
  ---@field automatic_weapon_cycling boolean @RW nilable; Whether this spider vehicle prototype automatically cycles weapons.
  ---@field autoplace_specification AutoplaceSpecification @RW nilable; Autoplace specification for this entity prototype, if any.
  ---@field base_productivity double @RW nilable; The base productivity of this crafting machine, lab, or mining drill.
  ---@field belt_distance double @RW nilable
  ---@field belt_length double @RW nilable
  ---@field belt_speed double @RW nilable; The speed of this transport belt.
  ---@field braking_force double @RW nilable; The braking force of this vehicle prototype.
  ---@field build_base_evolution_requirement double @RW; The evolution requirement to build this entity as a base when expanding enemy bases.
  ---@field build_distance uint @RW nilable
  ---@field building_grid_bit_shift uint @RW; The log2 of grid size of the building
  ---@field burner_prototype LuaBurnerPrototype @RW nilable; The burner energy source prototype this entity uses, if any.
  ---@field burns_fluid boolean @RW nilable; Whether this generator prototype burns fluid.
  ---@field call_for_help_radius double @RW nilable
  ---@field can_open_gates boolean @RW nilable; Whether this unit prototype can open gates.
  ---@field center_collision_mask CollisionMask @RW nilable; The collision mask used only for collision test with tile directly at offshore pump position.
  ---@field chain_shooting_cooldown_modifier double @RW nilable; The chain shooting cooldown modifier of this spider vehicle prototype.
  ---@field character_corpse LuaEntityPrototype @RW nilable
  ---@field chunk_exploration_radius double @RW nilable; The chunk exploration radius of this spider vehicle prototype.
  ---@field cliff_explosive_prototype string @RW nilable; The item prototype name used to destroy this cliff.
  ---@field collision_box BoundingBox @RW; The bounding box used for collision checking.
  ---@field collision_mask CollisionMask @RW; The collision masks this entity uses
  ---@field collision_mask_collides_with_self boolean @RW; Does this prototype collision mask collide with itself?
  ---@field collision_mask_collides_with_tiles_only boolean @RW; Does this prototype collision mask collide with tiles only?
  ---@field collision_mask_considers_tile_transitions boolean @RW; Does this prototype collision mask consider tile transitions?
  ---@field collision_mask_with_flags CollisionMaskWithFlags @RW
  ---@field color Color @RW nilable; The color of the prototype, if any.
  ---@field construction_radius double @RW nilable; The construction radius for this roboport prototype.
  ---@field consumption double @RW nilable; The energy consumption of this car prototype.
  ---@field container_distance double @RW nilable
  ---@field corpses table<string, LuaEntityPrototype> @RW nilable; Corpses used when this entity is destroyed. It is a dictionary indexed by the corpse's prototype name.
  ---@field count_as_rock_for_filtered_deconstruction boolean @RW nilable; If this simple-entity is counted as a rock for the deconstruction planner "trees and rocks only" filter.
  ---@field crafting_categories table<string, boolean> @RW nilable; The crafting categories this entity prototype supports.
  ---@field crafting_speed double @RW nilable; The crafting speed..
  ---@field create_ghost_on_death boolean @RW; If this prototype will attempt to create a ghost of itself on death.
  ---@field created_effect TriggerItem[] @RW nilable; The trigger to run when this entity is created, if any.
  ---@field created_smoke _table8 @RW nilable; The smoke trigger run when this entity is built, if any.
  ---@field damage_hit_tint Color @RW nilable
  ---@field darkness_for_all_lamps_off float @RW nilable; Value between 0 and 1 darkness where all lamps of this lamp prototype are off.
  ---@field darkness_for_all_lamps_on float @RW nilable; Value between 0 and 1 darkness where all lamps of this lamp prototype are on.
  ---@field default_collision_mask_with_flags CollisionMaskWithFlags @RW; The hardcoded default collision mask (with flags) for this entity prototype type.
  ---@field destroy_non_fuel_fluid boolean @RW nilable; Whether this generator prototype destroys non-fuel fluids.
  ---@field distraction_cooldown uint @RW nilable; The distraction cooldown of this unit prototype.
  ---@field distribution_effectivity double @RW nilable; The distribution effectivity for this beacon prototype.
  ---@field door_opening_speed double @RW nilable; The door opening speed for this rocket silo prototype.
  ---@field draw_cargo boolean @RW nilable; Whether this logistics or construction robot renders its cargo when flying.
  ---@field drawing_box BoundingBox @RW; The bounding box used for drawing the entity icon.
  ---@field drop_item_distance uint @RW nilable
  ---@field dying_speed float @RW nilable; The dying time of this corpse prototype.
  ---@field effectivity double @RW nilable; The effectivity of this car prototype, generator prototype.
  ---@field electric_energy_source_prototype LuaElectricEnergySourcePrototype @RW nilable; The electric energy source prototype this entity uses, if any.
  ---@field emissions_per_second double @RW; Amount of pollution emissions per second this entity will create.
  ---@field enemy_map_color Color @RW; The enemy map color used when charting this entity.
  ---@field energy_per_hit_point double @RW nilable; The energy used per hitpoint taken for this vehicle during collisions.
  ---@field energy_per_move double @RW nilable; The energy consumed per tile moved for this flying robot.
  ---@field energy_per_tick double @RW nilable; The energy consumed per tick for this flying robot.
  ---@field energy_usage double @RW nilable; The direct energy usage of this entity, if any.
  ---@field engine_starting_speed double @RW nilable; The engine starting speed for this rocket silo rocket prototype.
  ---@field enter_vehicle_distance double @RW nilable
  ---@field explosion_beam double @RW nilable; Whether this explosion has a beam.
  ---@field explosion_rotate double @RW nilable; Whether this explosion rotates.
  ---@field fast_replaceable_group string @RW nilable; The group of mutually fast-replaceable entities, if any.
  ---@field filter_count uint @RW nilable; The filter count of this inserter, loader, or logistic chest. For logistic containers, `nil` means no limit.
  ---@field final_attack_result TriggerItem[] @RW nilable; The final attack result for this projectile.
  ---@field fixed_recipe string @RW nilable; The fixed recipe name for this assembling machine prototype, if any.
  ---@field flags EntityPrototypeFlags @RW; The flags for this entity prototype.
  ---@field fluid LuaFluidPrototype @RW nilable; The fluid this offshore pump produces.
  ---@field fluid_capacity double @RW; The fluid capacity of this entity or 0 if this entity doesn't support fluids.
  ---@field fluid_energy_source_prototype LuaFluidEnergySourcePrototype @RW nilable; The fluid energy source prototype this entity uses, if any.
  ---@field fluid_usage_per_tick double @RW nilable; The fluid usage of this generator prototype.
  ---@field fluidbox_prototypes LuaFluidBoxPrototype[] @RW; The fluidbox prototypes for this entity.
  ---@field flying_acceleration double @RW nilable; The flying acceleration for this rocket silo rocket prototype.
  ---@field flying_speed double @RW nilable; The flying speed for this rocket silo rocket prototype.
  ---@field friction_force double @RW nilable; The friction of this vehicle prototype.
  ---@field friendly_map_color Color @RW; The friendly map color used when charting this entity.
  ---@field grid_prototype LuaEquipmentGridPrototype @RW nilable; The equipment grid prototype for this entity, if any.
  ---@field group LuaGroup @RW; Group of this entity.
  ---@field guns table<string, LuaItemPrototype> @RW nilable; A mapping of the gun name to the gun prototype this prototype uses. `nil` if this entity prototype doesn't use guns.
  ---@field has_belt_immunity boolean @RW nilable; Whether this unit, car, or character prototype has belt immunity.
  ---@field healing_per_tick float @RW nilable; Amount this entity can heal per tick, if any.
  ---@field heat_buffer_prototype LuaHeatBufferPrototype @RW nilable; The heat buffer prototype this entity uses, if any.
  ---@field heat_energy_source_prototype LuaHeatEnergySourcePrototype @RW nilable; The heat energy source prototype this entity uses, if any.
  ---@field height double @RW nilable; The height of this spider vehicle prototype.
  ---@field idle_energy_usage double @RW nilable; The idle energy usage of this rocket silo prototype.
  ---@field indexed_guns LuaItemPrototype[] @RW nilable; A vector of the gun prototypes of this car, spider vehicule, or artillery wagon or turret.
  ---@field infinite_depletion_resource_amount uint @RW nilable; Every time this infinite resource 'ticks' down, it is reduced by this amount. Meaningless if this isn't an infinite resource.
  ---@field infinite_resource boolean @RW nilable; Whether this resource is infinite.
  ---@field ingredient_count uint @RW nilable; The max number of ingredients this crafting machine prototype supports.
  ---@field inserter_chases_belt_items boolean @RW nilable; True if this inserter chases items on belts for pickup.
  ---@field inserter_drop_position Vector @RW nilable; The drop position for this inserter.
  ---@field inserter_extension_speed double @RW nilable; The extension speed of this inserter.
  ---@field inserter_pickup_position Vector @RW nilable; The pickup position for this inserter.
  ---@field inserter_rotation_speed double @RW nilable; The rotation speed of this inserter.
  ---@field inserter_stack_size_bonus double @RW nilable; The built-in stack size bonus of this inserter prototype.
  ---@field instruments ProgrammableSpeakerInstrument[] @RW nilable; The instruments for this programmable speaker.
  ---@field is_building boolean @RW; Everything in the following list is considered a building. - AccumulatorPrototype - ArtilleryTurretPrototype - BeaconPrototype - BoilerPrototype - BurnerGeneratorPrototype - CombinatorPrototype → ArithmeticCombinator, DeciderCombinator - ConstantCombinatorPrototype - ContainerPrototype → LogisticContainer, InfinityContainer - CraftingMachinePrototype → AssemblingMachine, RocketSilo, Furnace - ElectricEnergyInterfacePrototype - ElectricPolePrototype - EnemySpawnerPrototype - GatePrototype - GeneratorPrototype - HeatInterfacePrototype - HeatPipePrototype - InserterPrototype - LabPrototype - LampPrototype - LinkedContainerPrototype - MarketPrototype - MiningDrillPrototype - OffshorePumpPrototype - PipePrototype → InfinityPipe - PipeToGroundPrototype - PlayerPortPrototype - PowerSwitchPrototype - ProgrammableSpeakerPrototype - PumpPrototype - RadarPrototype - RailPrototype → CurvedRail, StraightRail - RailSignalBasePrototype → RailChainSignal, RailSignal - ReactorPrototype - RoboportPrototype - SimpleEntityPrototype - SimpleEntityWithOwnerPrototype → SimpleEntityWithForce - SolarPanelPrototype - StorageTankPrototype - TrainStopPrototype - TransportBeltConnectablePrototype → LinkedBelt, Loader1x1, Loader1x2, Splitter, TransportBelt, UndergroundBelt - TurretPrototype → AmmoTurret, ElectricTurret, FluidTurret - WallPrototype
  ---@field is_entity_with_owner boolean @RW; True if this is entity-with-owner
  ---@field is_military_target boolean @RW nilable; True if this entity-with-owner is military target
  ---@field item_pickup_distance double @RW nilable
  ---@field item_slot_count uint @RW nilable; The item slot count of this constant combinator prototype.
  ---@field items_to_place_this SimpleItemStack[] @RW nilable; Items that when placed will produce this entity, if any. Construction bots will always choose the first item in this list to build this entity.
  ---@field lab_inputs string[] @RW nilable; The item prototype names that are the inputs of this lab prototype.
  ---@field lamp_energy_usage double @RW nilable; The lamp energy usage of this rocket silo prototype.
  ---@field launch_wait_time uint8 @RW nilable; The rocket launch delay for this rocket silo prototype.
  ---@field light_blinking_speed double @RW nilable; The light blinking speed for this rocket silo prototype.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field logistic_mode string @RW nilable; The logistic mode of this logistic container. One of `"requester"`, `"active-provider"`, `"passive-provider"`, `"buffer"`, `"storage"`, `"none"`.
  ---@field logistic_parameters _table9 @RW nilable; The logistic parameters for this roboport.
  ---@field logistic_radius double @RW nilable; The logistic radius for this roboport prototype.
  ---@field loot Loot[] @RW nilable; Loot that will be dropped when this entity is killed, if any.
  ---@field loot_pickup_distance double @RW nilable
  ---@field manual_range_modifier double @RW nilable; The manual range modifier for this artillery turret or wagon prototype. subclass(ArtilleryWagon, ArtilleryTurret)
  ---@field map_color Color @RW nilable; The map color used when charting this entity if a friendly or enemy color isn't defined, if any.
  ---@field map_generator_bounding_box BoundingBox @RW; The bounding box used for map generator collision checking.
  ---@field max_circuit_wire_distance double @RW; The maximum circuit wire distance for this entity. 0 if the entity doesn't support circuit wires.
  ---@field max_count_of_owned_units double @RW nilable; Count of enemies this spawner can sustain.
  ---@field max_darkness_to_spawn float @RW nilable; The maximum darkness at which this unit spawner can spawn entities.
  ---@field max_distance_of_nearby_sector_revealed uint @RW nilable; The radius of the area constantly revealed by this radar, in chunks.
  ---@field max_distance_of_sector_revealed uint @RW nilable; The radius of the area this radar can chart, in chunks.
  ---@field max_energy double @RW nilable; The max energy for this flying robot.
  ---@field max_energy_production double @RW; The theoretical maximum energy production for this this entity.
  ---@field max_energy_usage double @RW; The theoretical maximum energy usage for this entity.
  ---@field max_friends_around_to_spawn double @RW nilable; How many friendly units are required within the spawning_radius of this spawner for it to stop producing more units.
  ---@field max_health float @RW; Max health of this entity. Will be `0` if this is not an entity with health.
  ---@field max_payload_size uint @RW nilable; The max payload size of this logistics or construction robot.
  ---@field max_polyphony uint @RW nilable; The maximum polyphony for this programmable speaker.
  ---@field max_power_output double @RW nilable; The default maximum power output of this generator prototype.
  ---@field max_pursue_distance double @RW nilable; The maximum pursue distance of this unit prototype.
  ---@field max_speed double @RW nilable; The max speed of this projectile or flying robot prototype.
  ---@field max_to_charge float @RW nilable; The maximum energy for this flying robot above which it won't try to recharge when stationing.
  ---@field max_underground_distance uint8 @RW nilable; The max underground distance for underground belts and underground pipes.
  ---@field max_wire_distance double @RW; The maximum wire distance for this entity. 0 if the entity doesn't support wires.
  ---@field maximum_corner_sliding_distance double @RW nilable
  ---@field maximum_temperature double @RW nilable; The maximum fluid temperature of this generator prototype.
  ---@field min_darkness_to_spawn float @RW nilable; The minimum darkness at which this unit spawner can spawn entities.
  ---@field min_pursue_time uint @RW nilable; The minimum pursue time of this unit prototype.
  ---@field min_to_charge float @RW nilable; The minimum energy for this flying robot before it tries to recharge.
  ---@field mineable_properties _table10 @RW; Whether this entity is minable and what can be obtained by mining it.
  ---@field minimum_resource_amount uint @RW nilable; Minimum amount of this resource.
  ---@field mining_drill_radius double @RW nilable; The mining radius of this mining drill prototype.
  ---@field mining_speed double @RW nilable; The mining speed of this mining drill/character prototype.
  ---@field module_inventory_size uint @RW nilable; The module inventory size. `nil` if this entity doesn't support modules.
  ---@field move_while_shooting boolean @RW nilable; Whether this unit prototype can move while shooting.
  ---@field name string @RW; Name of this prototype.
  ---@field neighbour_bonus double @RW nilable
  ---@field next_upgrade LuaEntityPrototype @RW nilable; The next upgrade for this entity, if any.
  ---@field normal_resource_amount uint @RW nilable; The normal amount for this resource.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field pollution_to_join_attack float @RW nilable; The amount of pollution that has to be absorbed by the unit's spawner before the unit will leave the spawner and attack the source of the pollution.
  ---@field protected_from_tile_building boolean @RW; True if this entity prototype should be included during tile collision checks with [LuaTilePrototype::check_collision_with_entities](LuaTilePrototype::check_collision_with_entities) enabled.
  ---@field pumping_speed double @RW nilable; The pumping speed of this offshore or normal pump.
  ---@field radar_range uint @RW nilable; The radar range of this unit prototype.
  ---@field radius double @RW; The radius of this entity prototype.
  ---@field reach_distance uint @RW nilable
  ---@field reach_resource_distance double @RW nilable
  ---@field related_underground_belt LuaEntityPrototype @RW nilable
  ---@field remains_when_mined LuaEntityPrototype[] @RW; The remains left behind when this entity is mined.
  ---@field remove_decoratives string @RW
  ---@field repair_speed_modifier uint @RW nilable; Repair-speed modifier for this entity, if any. Actual repair speed will be `tool_repair_speed * entity_repair_speed_modifier`.
  ---@field researching_speed double @RW nilable; The base researching speed of this lab prototype.
  ---@field resistances table<string, Resistance> @RW nilable; List of resistances towards each damage type. It is a dictionary indexed by damage type names (see `data/base/prototypes/damage-type.lua`).
  ---@field resource_categories table<string, boolean> @RW nilable; The resource categories this character or mining drill supports.
  ---@field resource_category string @RW nilable; Name of the category of this resource.
  ---@field respawn_time uint @RW nilable
  ---@field result_units UnitSpawnDefinition[] @RW nilable; The result units and spawn points with weight and evolution factor for a biter spawner entity.
  ---@field rising_speed double @RW nilable; The rising speed for this rocket silo rocket prototype.
  ---@field rocket_entity_prototype LuaEntityPrototype @RW nilable; The rocket entity prototype associated with this rocket silo prototype.
  ---@field rocket_parts_required uint @RW nilable; The rocket parts required for this rocket silo prototype.
  ---@field rocket_rising_delay uint8 @RW nilable; The rocket rising delay for this rocket silo prototype.
  ---@field rotation_speed double @RW nilable; The rotation speed of this car prototype.
  ---@field running_speed double @RW nilable; The current movement speed of this character, including effects from exoskeletons, tiles, stickers and shooting.
  ---@field scale_fluid_usage boolean @RW nilable; Whether this generator prototype scales fluid usage.
  ---@field secondary_collision_box BoundingBox @RW nilable; The secondary bounding box used for collision checking, if any. This is only used in rails and rail remnants.
  ---@field selectable_in_game boolean @RW; Is this entity selectable?
  ---@field selection_box BoundingBox @RW; The bounding box used for drawing selection.
  ---@field selection_priority uint @RW; The selection priority of this entity - a value between 0 and 255
  ---@field shooting_cursor_size double @RW; The cursor size used when shooting at this entity.
  ---@field spawn_cooldown _table11 @RW nilable; The spawning cooldown for this enemy spawner prototype.
  ---@field spawning_radius double @RW nilable; How far from the spawner can the units be spawned.
  ---@field spawning_spacing double @RW nilable; What spaces should be between the spawned units.
  ---@field spawning_time_modifier double @RW nilable; The spawning time modifier of this unit prototype.
  ---@field speed double @RW nilable; The default speed of this flying robot, rolling stock or unit. For rolling stocks, this is their `max_speed`.
  ---@field speed_multiplier_when_out_of_energy float @RW nilable; The speed multiplier when this flying robot is out of energy.
  ---@field stack boolean @RW nilable; Whether this inserter is a stack-type.
  ---@field sticker_box BoundingBox @RW; The bounding box used to attach sticker type entities.
  ---@field subgroup LuaGroup @RW; Subgroup of this entity.
  ---@field supply_area_distance double @RW nilable; The supply area of this electric pole or beacon prototype.
  ---@field supports_direction boolean @RW; Whether this entity prototype could possibly ever be rotated.
  ---@field tank_driving boolean @RW nilable; If this car prototype uses tank controls to drive.
  ---@field target_temperature double @RW nilable; The target temperature of this boiler prototype.
  ---@field terrain_friction_modifier float @RW nilable; The terrain friction modifier for this vehicle.
  ---@field ticks_to_keep_aiming_direction uint @RW nilable
  ---@field ticks_to_keep_gun uint @RW nilable
  ---@field ticks_to_stay_in_combat uint @RW nilable
  ---@field tile_height uint @RW; Specifies the tiling size of the entity, is used to decide, if the center should be in the center of the tile (odd tile size dimension) or on the tile border (even tile size dimension)
  ---@field tile_width uint @RW; Specifies the tiling size of the entity, is used to decide, if the center should be in the center of the tile (odd tile size dimension) or on the tile border (even tile size dimension)
  ---@field time_to_live uint @RW; The time to live for this prototype or `0` if prototype doesn't have time_to_live or time_before_removed.
  ---@field timeout uint @RW nilable; The time it takes this land mine to arm.
  ---@field torso_bob_speed double @RW nilable; The torso bob speed of this spider vehicle prototype.
  ---@field torso_rotation_speed double @RW nilable; The torso rotation speed of this spider vehicle prototype.
  ---@field tree_color_count uint8 @RW nilable; If it is a tree, return the number of colors it supports.
  ---@field trigger_collision_mask CollisionMaskWithFlags @RW nilable; The collision mask entities must collide with to make this landmine blow up.
  ---@field turret_range uint @RW nilable; The range of this turret.
  ---@field turret_rotation_speed double @RW nilable; The turret rotation speed of this car prototype.
  ---@field type string @RW; Type of this prototype.
  ---@field use_exact_mode boolean @RW nilable; Whether this logistic container prototype uses exact mode
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field vision_distance double @RW nilable; The vision distance of this unit prototype.
  ---@field void_energy_source_prototype LuaVoidEnergySourcePrototype @RW nilable; The void energy source prototype this entity uses, if any.
  ---@field weight double @RW nilable; The weight of this vehicle prototype.
LuaEntityPrototype = {}

--- Gets the base size of the given inventory on this entity or `nil` if the given inventory doesn't exist.
---@param index defines__inventory
---@return uint
function LuaEntityPrototype.get_inventory_size(index) end

--- Test whether this entity prototype has a certain flag set.
---@param flag string @The flag to test. See [EntityPrototypeFlags](EntityPrototypeFlags) for a list of flags.
---@return boolean @`true` if this prototype has the given flag set.
function LuaEntityPrototype.has_flag(flag) end

--- All methods and properties that this object supports.
---@return string
function LuaEntityPrototype.help() end

---@class LuaEquipment: any @An item in a [LuaEquipmentGrid](LuaEquipmentGrid), for example a fusion reactor placed in one's power armor. An equipment reference becomes invalid once the equipment is removed or the equipment grid it resides in is destroyed.
  ---@field burner LuaBurner @RW nilable; The burner energy source for this equipment, if any.
  ---@field energy double @RW; Current available energy.
  ---@field generator_power double @RW; Energy generated per tick.
  ---@field max_energy double @RW; Maximum amount of energy that can be stored in this equipment.
  ---@field max_shield double @RW; Maximum shield value.
  ---@field max_solar_power double @RW; Maximum solar power generated.
  ---@field movement_bonus double @RW; Movement speed bonus.
  ---@field name string @RW; Name of this equipment.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field position EquipmentPosition @RW; Position of this equipment in the equipment grid.
  ---@field prototype LuaEquipmentPrototype @RW
  ---@field shape _table12 @RW; Shape of this equipment.
  ---@field shield double @RW; Current shield value of the equipment.
  ---@field type string @RW; Type of this equipment.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaEquipment = {}

--- All methods and properties that this object supports.
---@return string
function LuaEquipment.help() end

---@class LuaEquipmentCategoryPrototype: any @Prototype of an equipment category.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaEquipmentCategoryPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaEquipmentCategoryPrototype.help() end

---@class LuaEquipmentGrid: any @An equipment grid is for example the inside of a power armor.
  ---@field available_in_batteries double @RW; The total energy stored in all batteries in the equipment grid.
  ---@field battery_capacity double @RW; Total energy storage capacity of all batteries in the equipment grid.
  ---@field equipment LuaEquipment[] @RW; All the equipment in this grid.
  ---@field generator_energy double @RW; Total energy per tick generated by the equipment inside this grid.
  ---@field height uint @RW; Height of the equipment grid.
  ---@field inhibit_movement_bonus boolean @RW; True if this movement bonus equipment is turned off, otherwise false.
  ---@field max_shield float @RW; The maximum amount of shields this equipment grid has.
  ---@field max_solar_energy double @RW; Maximum energy per tick that can be created by any solar panels in the equipment grid. Actual generated energy varies depending on the daylight levels.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field prototype LuaEquipmentGridPrototype @RW
  ---@field shield float @RW; The amount of shields this equipment grid has.
  ---@field unique_id uint @RW; Unique identifier of this equipment grid.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field width uint @RW; Width of the equipment grid.
LuaEquipmentGrid = {}

---@shape LuaEquipmentGrid_can_move_params
   ---@field equipment LuaEquipment @The equipment to move
   ---@field position EquipmentPosition @Where to put it

--- Check whether moving an equipment would succeed.
---@param p LuaEquipmentGrid_can_move_params
---@return boolean
function LuaEquipmentGrid.can_move(p) end

--- Clear all equipment from the grid, removing it without actually returning it.
---@param by_player PlayerIdentification|nil @If provided, the action is done 'as' this player and [on_player_removed_equipment](on_player_removed_equipment) is triggered.
---@overload fun()
function LuaEquipmentGrid.clear(by_player) end

--- Get the number of all or some equipment in this grid.
---@param equipment string|nil @Prototype name of the equipment to count. If not specified, count all equipment.
---@overload fun(): uint
---@return uint
function LuaEquipmentGrid.count(equipment) end

--- Find equipment by name.
---@param equipment string @Prototype name of the equipment to find.
---@return LuaEquipment @The first found equipment, or `nil` if equipment could not be found.
function LuaEquipmentGrid.find(equipment) end

--- Find equipment in the Equipment Grid based off a position.
---@param position EquipmentPosition @The position
---@return LuaEquipment @The found equipment, or `nil` if equipment could not be found at the given position.
function LuaEquipmentGrid.get(position) end

--- Get counts of all equipment in this grid.
---@return table<string, uint> @The counts, indexed by equipment names.
function LuaEquipmentGrid.get_contents() end

--- All methods and properties that this object supports.
---@return string
function LuaEquipmentGrid.help() end

---@shape LuaEquipmentGrid_move_params
   ---@field equipment LuaEquipment @The equipment to move
   ---@field position EquipmentPosition @Where to put it

--- Move an equipment within this grid.
---@param p LuaEquipmentGrid_move_params
---@return boolean @`true` if the equipment was successfully moved.
function LuaEquipmentGrid.move(p) end

---@shape LuaEquipmentGrid_put_params
   ---@field name string @Equipment prototype name
   ---@field position EquipmentPosition|nil @Grid position to put the equipment in.
   ---@field by_player PlayerIdentification|nil @If provided the action is done 'as' this player and [on_player_placed_equipment](on_player_placed_equipment) is triggered.

--- Insert an equipment into the grid.
---@param p LuaEquipmentGrid_put_params
---@return LuaEquipment @The newly-added equipment, or `nil` if the equipment could not be added.
function LuaEquipmentGrid.put(p) end

---@shape LuaEquipmentGrid_take_params
   ---@field position EquipmentPosition|nil @Take the equipment that contains this position in the grid.
   ---@field equipment LuaEquipment|nil @Take this exact equipment.
   ---@field by_player PlayerIdentification|nil @If provided the action is done 'as' this player and [on_player_removed_equipment](on_player_removed_equipment) is triggered.

--- Remove an equipment from the grid.
---@param p LuaEquipmentGrid_take_params
---@return SimpleItemStack @The removed equipment, or `nil` if no equipment was removed.
function LuaEquipmentGrid.take(p) end

--- Remove all equipment from the grid.
---@param by_player PlayerIdentification|nil @If provided, the action is done 'as' this player and [on_player_removed_equipment](on_player_removed_equipment) is triggered.
---@overload fun(): table<string, uint>
---@return table<string, uint> @Count of each removed equipment, indexed by their prototype names.
function LuaEquipmentGrid.take_all(by_player) end

---@class LuaEquipmentGridPrototype: any @Prototype of an equipment grid.
  ---@field equipment_categories string[] @RW; Equipment category names for the [categories](LuaEquipmentPrototype::equipment_categories) that may be inserted into this equipment grid. The grid will accept any equipment that has at least one category in this list.
  ---@field height uint @RW
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field locked boolean @RW; If the player can move equipment into or out of this grid.
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field width uint @RW
LuaEquipmentGridPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaEquipmentGridPrototype.help() end

---@class LuaEquipmentPrototype: any @Prototype of a modular equipment.
  ---@field attack_parameters AttackParameters @RW nilable; The equipment attack parameters.
  ---@field automatic boolean @RW; Whether this active defense equipment is automatic. Returns false if not active defense equipment.
  ---@field background_color Color @RW; The background color of this equipment prototype.
  ---@field burner_prototype LuaBurnerPrototype @RW nilable; The burner energy source prototype this equipment uses, if any.
  ---@field electric_energy_source_prototype LuaElectricEnergySourcePrototype @RW nilable; The electric energy source prototype this equipment uses, if any.
  ---@field energy_consumption double @RW
  ---@field energy_per_shield double @RW; The energy per shield point restored. 0 for non-shield equipment.
  ---@field energy_production double @RW; The max power generated by this equipment.
  ---@field energy_source LuaElectricEnergySourcePrototype @RW; The energy source prototype for the equipment.
  ---@field equipment_categories string[] @RW; Category names for this equipment. These [categories](LuaEquipmentGridPrototype::equipment_categories) will be used to determine whether this equipment is allowed in a particular equipment grid.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field logistic_parameters _table13 @RW nilable; The logistic parameters for this roboport equipment.
  ---@field movement_bonus float @RW nilable
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field shape _table14 @RW; Shape of this equipment prototype.
  ---@field shield float @RW; The shield value of this equipment. 0 for non-shield equipment.
  ---@field take_result LuaItemPrototype @RW nilable; The result item when taking this equipment out of an equipment grid, if any.
  ---@field type string @RW; Type of this equipment prototype.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaEquipmentPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaEquipmentPrototype.help() end

---@class LuaFlowStatistics: any @Encapsulates statistic data for different parts of the game. In the context of flow statistics, `input` and `output` describe on which side of the associated GUI the values are shown. Input values are shown on the left side, output values on the right side. Examples: - The item production GUI shows "consumption" on the right, thus `output` describes the item consumption numbers. The same goes for fluid consumption. - The kills GUI shows "losses" on the right, so `output` describes how many of the force's entities were killed by enemies. - The electric network GUI shows "power consumption" on the left side, so in this case `input` describes the power consumption numbers.
  ---@field force LuaForce @RW nilable; The force these statistics belong to. `nil` for pollution statistics.
  ---@field input_counts table<string, uint64 | double> @RW; List of input counts indexed by prototype name. Represents the data that is shown on the left side of the GUI for the given statistics.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field output_counts table<string, uint64 | double> @RW; List of output counts indexed by prototype name. Represents the data that is shown on the right side of the GUI for the given statistics.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFlowStatistics = {}

--- Reset all the statistics data to 0.
function LuaFlowStatistics.clear() end

---@shape LuaFlowStatistics_get_flow_count_params
   ---@field name string @The prototype name.
   ---@field input boolean @Read the input values or the output values
   ---@field precision_index defines__flow_precision_index @The precision range to read.
   ---@field sample_index uint16|nil @The sample index to read from within the precision range. If not provided, the entire precision range is read. Must be between 1 and 300 where 1 is the most recent sample and 300 is the oldest.
   ---@field count boolean|nil @If true, the count of items/fluids/entities is returned instead of the per-time-frame value.

--- Gets the flow count value for the given time frame. If `sample_index` is not provided, then the value returned is the average across the provided precision time period. These are the values shown in the bottom section of the statistics GUIs.
--- Use `sample_index` to access the data used to generate the statistics graphs. Each precision level contains 300 samples of data so at a precision of 1 minute, each sample contains data averaged across 60s / 300 = 0.2s = 12 ticks.
--- All return values are normalized to be per-tick for electric networks and per-minute for all other types.
---@param p LuaFlowStatistics_get_flow_count_params
---@return double
function LuaFlowStatistics.get_flow_count(p) end

--- Gets the total input count for a given prototype.
---@param name string @The prototype name.
---@return uint64 | double
function LuaFlowStatistics.get_input_count(name) end

--- Gets the total output count for a given prototype.
---@param name string @The prototype name.
---@return uint64 | double
function LuaFlowStatistics.get_output_count(name) end

--- All methods and properties that this object supports.
---@return string
function LuaFlowStatistics.help() end

--- Adds a value to this flow statistics.
---@param name string @The prototype name.
---@param count float @The count: positive or negative determines if the value goes in the input or output statistics.
function LuaFlowStatistics.on_flow(name, count) end

--- Sets the total input count for a given prototype.
---@param name string @The prototype name.
---@param count uint64 | double @The new count. The type depends on the instance of the statistics.
function LuaFlowStatistics.set_input_count(name, count) end

--- Sets the total output count for a given prototype.
---@param name string @The prototype name.
---@param count uint64 | double @The new count. The type depends on the instance of the statistics.
function LuaFlowStatistics.set_output_count(name, count) end

---@class LuaFluidBox: any @An array of fluid boxes of an entity. Entities may contain more than one fluid box, and some can change the number of fluid boxes -- for instance, an assembling machine will change its number of fluid boxes depending on its active recipe. See [Fluid](Fluid). Do note that reading from a [LuaFluidBox](LuaFluidBox) creates a new table and writing will copy the given fields from the table into the engine's own fluid box structure. Therefore, the correct way to update a fluidbox of an entity is to read it first, modify the table, then write the modified table back. Directly accessing the returned table's attributes won't have the desired effect.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field owner LuaEntity @RW; The entity that owns this fluidbox.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFluidBox = {}

--- Flushes all fluid from this fluidbox and its fluid system.
---@param index uint
---@param fluid FluidIdentification|nil @If provided, only this fluid is flushed.
---@overload fun(index: uint): table<string, float>
---@return table<string, float> @The removed fluid.
function LuaFluidBox.flush(index, fluid) end

--- The capacity of the given fluidbox index.
---@param index uint
---@return double
function LuaFluidBox.get_capacity(index) end

--- The fluidboxes to which the fluidbox at the given index is connected.
---@param index uint
---@return LuaFluidBox[]
function LuaFluidBox.get_connections(index) end

--- Get a fluid box filter
---@param index uint @The index of the filter to get.
---@return FluidBoxFilter @The filter at the requested index, or `nil` if there isn't one.
function LuaFluidBox.get_filter(index) end

--- Flow through the fluidbox in the last tick. It is the larger of in-flow and out-flow.
---@param index uint
---@return double
function LuaFluidBox.get_flow(index) end

--- Gets unique fluid system identifier of selected fluid box. May return nil for fluid wagon, fluid turret's internal buffer or a fluidbox which does not belong to a fluid system
---@param index uint
---@return uint
function LuaFluidBox.get_fluid_system_id(index) end

--- Returns the fluid the fluidbox is locked onto
---@param index uint
---@return string @`nil` if the fluidbox is not locked to any fluid.
function LuaFluidBox.get_locked_fluid(index) end

--- The prototype of this fluidbox index.
---@param index uint
---@return LuaFluidBoxPrototype
function LuaFluidBox.get_prototype(index) end

--- All methods and properties that this object supports.
---@return string
function LuaFluidBox.help() end

--- Set a fluid box filter.
---@param index uint @The index of the filter to set.
---@param filter FluidBoxFilterSpec | nil @The filter to set. Setting `nil` clears the filter.
---@return boolean @Whether the filter was set successfully.
function LuaFluidBox.set_filter(index, filter) end

---@class LuaFluidBoxPrototype: any @A prototype of a fluidbox owned by some [LuaEntityPrototype](LuaEntityPrototype).
  ---@field base_area double @RW
  ---@field base_level double @RW
  ---@field entity LuaEntityPrototype @RW; The entity that this belongs to.
  ---@field filter LuaFluidPrototype @RW nilable; The filter, if any is set.
  ---@field height double @RW
  ---@field index uint @RW; The index of this fluidbox prototype in the owning entity.
  ---@field maximum_temperature double @RW nilable; The maximum temperature, if any is set.
  ---@field minimum_temperature double @RW nilable; The minimum temperature, if any is set.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field pipe_connections FluidBoxConnection[] @RW; The pipe connection points.
  ---@field production_type string @RW; The production type. "input", "output", "input-output", or "none".
  ---@field render_layer string @RW; The render layer.
  ---@field secondary_draw_orders int[] @RW; The secondary draw orders for the 4 possible connection directions.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field volume double @RW
LuaFluidBoxPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaFluidBoxPrototype.help() end

---@class LuaFluidEnergySourcePrototype: any @Prototype of a fluid energy source.
  ---@field burns_fluid boolean @RW
  ---@field destroy_non_fuel_fluid boolean @RW
  ---@field effectivity double @RW
  ---@field emissions double @RW; The emissions of this energy source in `pollution/Joule`. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
  ---@field fluid_box LuaFluidBoxPrototype @RW; The fluid box for this energy source.
  ---@field fluid_usage_per_tick double @RW
  ---@field maximum_temperature double @RW
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field render_no_network_icon boolean @RW
  ---@field render_no_power_icon boolean @RW
  ---@field scale_fluid_usage boolean @RW
  ---@field smoke SmokeSource[] @RW; The smoke sources for this prototype, if any.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFluidEnergySourcePrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaFluidEnergySourcePrototype.help() end

---@class LuaFluidPrototype: any @Prototype of a fluid.
  ---@field base_color Color @RW
  ---@field default_temperature double @RW; Default temperature of this fluid.
  ---@field emissions_multiplier double @RW; A multiplier on the amount of emissions produced when this fluid is burnt in a generator. A value above `1.0` increases emissions and vice versa. The multiplier can't be negative.
  ---@field flow_color Color @RW
  ---@field fuel_value double @RW; The amount of energy in Joules one unit of this fluid will produce when burnt in a generator. A value of `0` means this fluid can't be used for energy generation. The value can't be negative.
  ---@field gas_temperature double @RW; The temperature above which this fluid will be shown as gaseous inside tanks and pipes.
  ---@field group LuaGroup @RW; Group of this prototype.
  ---@field heat_capacity double @RW; The amount of energy in Joules required to heat one unit of this fluid by 1°C.
  ---@field hidden boolean @RW; Whether this fluid is hidden from the fluid and signal selectors.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field max_temperature double @RW; Maximum temperature this fluid can reach.
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field subgroup LuaGroup @RW; Subgroup of this prototype.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFluidPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaFluidPrototype.help() end

---@class LuaFontPrototype: any @Prototype of a font.
  ---@field border boolean @RW
  ---@field border_color Color @RW nilable; The border color, if any.
  ---@field filtered boolean @RW
  ---@field from string @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field size int @RW
  ---@field spacing float @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFontPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaFontPrototype.help() end

---@class LuaForce: any @`LuaForce` encapsulates data local to each "force" or "faction" of the game. Default forces are player, enemy and neutral. Players and mods can create additional forces (up to 64 total).
  ---@field ai_controllable boolean @RW; Enables some higher-level AI behaviour for this force. When set to `true`, biters belonging to this force will automatically expand into new territories, build new spawners, and form unit groups. By default, this value is `true` for the enemy force and `false` for all others.
  ---@field artillery_range_modifier double @RW
  ---@field character_build_distance_bonus uint @RW
  ---@field character_health_bonus double @RW
  ---@field character_inventory_slots_bonus uint @RW; the number of additional inventory slots the character main inventory has.
  ---@field character_item_drop_distance_bonus uint @RW
  ---@field character_item_pickup_distance_bonus double @RW
  ---@field character_logistic_requests boolean @RW; `true` if character requester logistics is enabled.
  ---@field character_loot_pickup_distance_bonus double @RW
  ---@field character_reach_distance_bonus uint @RW
  ---@field character_resource_reach_distance_bonus double @RW
  ---@field character_running_speed_modifier double @RW; Modifies the running speed of all characters in this force by the given value as a percentage. Setting the running modifier to `0.5` makes the character run 50% faster. The minimum value of `-1` reduces the movement speed by 100%, resulting in a speed of `0`.
  ---@field character_trash_slot_count double @RW; Number of character trash slots.
  ---@field color Color @RW; Effective color of this force.
  ---@field connected_players LuaPlayer[] @RW; The connected players belonging to this force. This is primarily useful when you want to do some action against all online players of this force.
  ---@field current_research LuaTechnology @RW nilable; The currently ongoing technology research, if any.
  ---@field custom_color Color @RW nilable; Custom color for this force. If specified, will take priority over other sources of the force color. Writing nil clears custom color. Will return nil if it was not specified or if was set to {0,0,0,0}
  ---@field deconstruction_time_to_live uint @RW; The time, in ticks, before a deconstruction order is removed.
  ---@field entity_build_count_statistics LuaFlowStatistics @RW; The entity build statistics for this force (built and mined)
  ---@field evolution_factor double @RW; Evolution factor of this force.
  ---@field evolution_factor_by_killing_spawners double @RW
  ---@field evolution_factor_by_pollution double @RW
  ---@field evolution_factor_by_time double @RW
  ---@field fluid_production_statistics LuaFlowStatistics @RW; The fluid production statistics for this force.
  ---@field following_robots_lifetime_modifier double @RW; Additional lifetime for following robots.
  ---@field friendly_fire boolean @RW; If friendly fire is enabled for this force.
  ---@field ghost_time_to_live uint @RW; The time, in ticks, before a placed ghost disappears.
  ---@field index uint @RW; Unique ID associated with this force.
  ---@field inserter_stack_size_bonus double @RW; The inserter stack size bonus for non stack inserters
  ---@field item_production_statistics LuaFlowStatistics @RW; The item production statistics for this force.
  ---@field items_launched table<string, uint> @RW; All of the items that have been launched in rockets. The attribute is a dictionary mapping the item prototype names to the launched amounts.
  ---@field kill_count_statistics LuaFlowStatistics @RW; The kill counter statistics for this force.
  ---@field laboratory_productivity_bonus double @RW
  ---@field laboratory_speed_modifier double @RW
  ---@field logistic_networks table<string, LuaLogisticNetwork[]> @RW; List of logistic networks, grouped by surface.
  ---@field manual_crafting_speed_modifier double @RW; Multiplier of the manual crafting speed. Default value is `0`. The actual crafting speed will be multiplied by `1 + manual_crafting_speed_modifier`.
  ---@field manual_mining_speed_modifier double @RW; Multiplier of the manual mining speed. Default value is `0`. The actual mining speed will be multiplied by `1 + manual_mining_speed_modifier`.
  ---@field max_failed_attempts_per_tick_per_construction_queue uint @RW
  ---@field max_successful_attempts_per_tick_per_construction_queue uint @RW
  ---@field maximum_following_robot_count uint @RW; Maximum number of follower robots.
  ---@field mining_drill_productivity_bonus double @RW
  ---@field name string @RW; Name of the force.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field players LuaPlayer[] @RW; Players belonging to this force.
  ---@field previous_research LuaTechnology @RW nilable; The previous research, if any.
  ---@field recipes table<string, LuaRecipe> @RW; Recipes available to this force, indexed by `name`.
  ---@field research_enabled boolean @RW; Whether research is enabled for this force, see [LuaForce::enable_research](LuaForce::enable_research) and [LuaForce::disable_research](LuaForce::disable_research)
  ---@field research_progress double @RW; Progress of current research, as a number in range [0, 1].
  ---@field research_queue TechnologyIdentification[] @RW; The research queue of this force. The first technology in the array is the currently active one. Reading this attribute gives an array of [LuaTechnology](LuaTechnology). To write to this, the entire table must be written. Providing an empty table or `nil` will empty the research queue and cancel the current research. Writing to this when the research queue is disabled will simply set the last research in the table as the current research.
  ---@field research_queue_enabled boolean @RW; Whether the research queue is available for this force.
  ---@field rockets_launched uint @RW; The number of rockets launched.
  ---@field share_chart boolean @RW; If sharing chart data is enabled for this force.
  ---@field stack_inserter_capacity_bonus uint @RW; Number of items that can be transferred by stack inserters. When writing to this value, it must be >= 0 and <= 254.
  ---@field technologies table<string, LuaTechnology> @RW; Technologies owned by this force, indexed by `name`.
  ---@field train_braking_force_bonus double @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field worker_robots_battery_modifier double @RW
  ---@field worker_robots_speed_modifier double @RW
  ---@field worker_robots_storage_bonus double @RW
  ---@field zoom_to_world_blueprint_enabled boolean @RW; Ability to create new blueprints using empty blueprint item when using zoom-to-world.
  ---@field zoom_to_world_deconstruction_planner_enabled boolean @RW; Ability to use deconstruction planner when using zoom-to-world.
  ---@field zoom_to_world_enabled boolean @RW; Ability to use zoom-to-world on map.
  ---@field zoom_to_world_ghost_building_enabled boolean @RW; Ability to build ghosts through blueprint or direct ghost placement, or "mine" ghosts when using zoom-to-world.
  ---@field zoom_to_world_selection_tool_enabled boolean @RW; Ability to use custom selection tools when using zoom-to-world.
LuaForce = {}

--- Adds a custom chart tag to the given surface and returns the new tag or `nil` if the given position isn't valid for a chart tag.
---@param surface SurfaceIdentification @Which surface to add the tag to.
---@param tag ChartTagSpec @The tag to add.
---@return LuaCustomChartTag
function LuaForce.add_chart_tag(surface, tag) end

--- Add this technology to the back of the research queue if the queue is enabled. Otherwise, set this technology to be researched now.
---@param technology TechnologyIdentification
---@return boolean @Whether the technology was successfully added.
function LuaForce.add_research(technology) end

--- Cancels pending chart requests for the given surface or all surfaces.
---@param surface SurfaceIdentification|nil
---@overload fun()
function LuaForce.cancel_charting(surface) end

--- Stop the research currently in progress. This will remove any dependent technologies from the research queue.
function LuaForce.cancel_current_research() end

--- Chart a portion of the map. The chart for the given area is refreshed; it creates chart for any parts of the given area that haven't been charted yet.
---@param surface SurfaceIdentification
---@param area BoundingBox @The area on the given surface to chart.
function LuaForce.chart(surface, area) end

--- Chart all generated chunks.
---@param surface SurfaceIdentification|nil @Which surface to chart or all if not given.
---@overload fun()
function LuaForce.chart_all(surface) end

--- Erases chart data for this force.
---@param surface SurfaceIdentification|nil @Which surface to erase chart data for or if not provided all surfaces charts are erased.
---@overload fun()
function LuaForce.clear_chart(surface) end

--- Disable all recipes and technologies. Only recipes and technologies enabled explicitly will be useable from this point.
function LuaForce.disable_all_prototypes() end

--- Disable research for this force.
function LuaForce.disable_research() end

--- Enables all recipes and technologies. The opposite of [LuaForce::disable_all_prototypes](LuaForce::disable_all_prototypes)
function LuaForce.enable_all_prototypes() end

--- Unlock all recipes.
function LuaForce.enable_all_recipes() end

--- Unlock all technologies.
function LuaForce.enable_all_technologies() end

--- Enable research for this force.
function LuaForce.enable_research() end

--- Finds all custom chart tags within the given bounding box on the given surface.
---@param surface SurfaceIdentification
---@param area BoundingBox|nil
---@overload fun(surface: SurfaceIdentification): LuaCustomChartTag[]
---@return LuaCustomChartTag[]
function LuaForce.find_chart_tags(surface, area) end

---@param position MapPosition @Position to find a network for
---@param surface SurfaceIdentification @Surface to search on
---@return LuaLogisticNetwork @The found network or `nil`.
function LuaForce.find_logistic_network_by_position(position, surface) end

---@param ammo string @Ammo category
---@return double
function LuaForce.get_ammo_damage_modifier(ammo) end

--- Is `other` force in this force's cease fire list?
---@param other ForceIdentification
---@return boolean
function LuaForce.get_cease_fire(other) end

--- Count entities of given type.
---@param name string @Prototype name of the entity.
---@return uint @Number of entities of given prototype belonging to this force.
function LuaForce.get_entity_count(name) end

--- Is `other` force in this force's friends list.
---@param other ForceIdentification
---@return boolean
function LuaForce.get_friend(other) end

---@param ammo string @Ammo category
---@return double
function LuaForce.get_gun_speed_modifier(ammo) end

--- Gets if the given recipe is explicitly disabled from being hand crafted.
---@param recipe string | LuaRecipe
---@return boolean
function LuaForce.get_hand_crafting_disabled_for_recipe(recipe) end

--- Gets the count of a given item launched in rockets.
---@param item string @The item to get
---@return uint @The count of the item that has been launched.
function LuaForce.get_item_launched(item) end

--- Gets the linked inventory for the given prototype and link ID if it exists or `nil`.
---@param prototype EntityPrototypeIdentification
---@param link_id uint
---@return LuaInventory
function LuaForce.get_linked_inventory(prototype, link_id) end

--- Gets the saved progress for the given technology or `nil` if there is no saved progress.
---@param technology TechnologyIdentification @The technology
---@return double @The progress as a percent.
function LuaForce.get_saved_technology_progress(technology) end

---@param surface SurfaceIdentification
---@return MapPosition
function LuaForce.get_spawn_position(surface) end

---@shape LuaForce_get_train_stops_params
   ---@field name (string | string[])|nil @The name(s) of the train stops. Not providing names will match any stop.
   ---@field surface SurfaceIdentification|nil @The surface to search. Not providing a surface will match stops on any surface.

--- Gets train stops matching the given filters.
---@param p LuaForce_get_train_stops_params
---@return LuaEntity[]
---@overload fun(): LuaEntity[]
function LuaForce.get_train_stops(p) end

---@param surface SurfaceIdentification|nil @The surface to search. Not providing a surface will match trains on any surface.
---@overload fun(): LuaTrain[]
---@return LuaTrain[]
function LuaForce.get_trains(surface) end

---@param turret string @Turret prototype name
---@return double
function LuaForce.get_turret_attack_modifier(turret) end

--- All methods and properties that this object supports.
---@return string
function LuaForce.help() end

--- Has a chunk been charted?
---@param surface SurfaceIdentification
---@param position ChunkPosition @Position of the chunk.
---@return boolean
function LuaForce.is_chunk_charted(surface, position) end

--- Is the given chunk currently charted and visible (not covered by fog of war) on the map.
---@param surface SurfaceIdentification
---@param position ChunkPosition
---@return boolean
function LuaForce.is_chunk_visible(surface, position) end

--- Is this force an enemy? This differs from `get_cease_fire` in that it is always false for neutral force. This is equivalent to checking the `enemy` ForceCondition.
---@param other ForceIdentification
---@return boolean
function LuaForce.is_enemy(other) end

--- Is this force a friend? This differs from `get_friend` in that it is always true for neutral force. This is equivalent to checking the `friend` ForceCondition.
---@param other ForceIdentification
---@return boolean
function LuaForce.is_friend(other) end

--- Is pathfinder busy? When the pathfinder is busy, it won't accept any more pathfinding requests.
---@return boolean
function LuaForce.is_pathfinder_busy() end

--- Kill all units and flush the pathfinder.
function LuaForce.kill_all_units() end

---@shape LuaForce_play_sound_params
   ---@field path SoundPath @The sound to play.
   ---@field position MapPosition|nil @Where the sound should be played. If not given, it's played at the current position of each player.
   ---@field volume_modifier double|nil @The volume of the sound to play. Must be between 0 and 1 inclusive.
   ---@field override_sound_type SoundType|nil @The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.

--- Play a sound for every player in this force.
---@param p LuaForce_play_sound_params
function LuaForce.play_sound(p) end

--- Print text to the chat console of all players on this force.
---@param message LocalisedString
---@param color Color|nil
---@overload fun(message: LocalisedString)
function LuaForce.print(message, color) end

--- Force a rechart of the whole chart.
function LuaForce.rechart() end

--- Research all technologies.
---@param include_disabled_prototypes boolean|nil @Whether technologies that are explicitly disabled in the prototype should also be researched. Defaults to `false`.
---@overload fun()
function LuaForce.research_all_technologies(include_disabled_prototypes) end

--- Reset everything. All technologies are set to not researched, all modifiers are set to default values.
function LuaForce.reset() end

--- Resets evolution for this force to zero.
function LuaForce.reset_evolution() end

--- Load the original version of all recipes from the prototypes.
function LuaForce.reset_recipes() end

--- Load the original versions of technologies from prototypes. Preserves research state of technologies.
function LuaForce.reset_technologies() end

--- Reapplies all possible research effects, including unlocked recipes. Any custom changes are lost. Preserves research state of technologies.
function LuaForce.reset_technology_effects() end

---@param ammo string @Ammo category
---@param modifier double
function LuaForce.set_ammo_damage_modifier(ammo, modifier) end

--- Add `other` force to this force's cease fire list. Forces on the cease fire list won't be targeted for attack.
---@param other ForceIdentification
---@param cease_fire boolean
function LuaForce.set_cease_fire(other, cease_fire) end

--- Add `other` force to this force's friends list. Friends have unrestricted access to buildings and turrets won't fire at them.
---@param other ForceIdentification
---@param friend boolean
function LuaForce.set_friend(other, friend) end

---@param ammo string @Ammo category
---@param modifier double
function LuaForce.set_gun_speed_modifier(ammo, modifier) end

--- Sets if the given recipe can be hand-crafted. This is used to explicitly disable hand crafting a recipe - it won't allow hand-crafting otherwise not hand-craftable recipes.
---@param recipe string | LuaRecipe
---@param hand_crafting_disabled boolean
function LuaForce.set_hand_crafting_disabled_for_recipe(recipe, hand_crafting_disabled) end

--- Sets the count of a given item launched in rockets.
---@param item string @The item to set
---@param count uint @The count to set
function LuaForce.set_item_launched(item, count) end

--- Sets the saved progress for the given technology. The technology must not be in progress, must not be completed, and the new progress must be < 100%.
---@param technology TechnologyIdentification @The technology
---@param progress double @Progress as a percent. Set to `nil` to remove the saved progress.
function LuaForce.set_saved_technology_progress(technology, progress) end

---@param position MapPosition @The new position on the given surface.
---@param surface SurfaceIdentification @Surface to set the spawn position for.
function LuaForce.set_spawn_position(position, surface) end

---@param turret string @Turret prototype name
---@param modifier double
function LuaForce.set_turret_attack_modifier(turret, modifier) end

---@param position ChunkPosition @The chunk position to unchart.
---@param surface SurfaceIdentification @Surface to unchart on.
function LuaForce.unchart_chunk(position, surface) end

---@class LuaFuelCategoryPrototype: any @Prototype of a fuel category.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFuelCategoryPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaFuelCategoryPrototype.help() end

---@class LuaGameScript: any @Main toplevel type, provides access to most of the API though its members. An instance of LuaGameScript is available as the global object named `game`.
  ---@field achievement_prototypes table<string, LuaAchievementPrototype> @RW; A dictionary containing every LuaAchievementPrototype indexed by `name`.
  ---@field active_mods table<string, string> @RW; The active mods versions. The keys are mod names, the values are the versions.
  ---@field ammo_category_prototypes table<string, LuaAmmoCategoryPrototype> @RW; A dictionary containing every LuaAmmoCategoryPrototype indexed by `name`.
  ---@field autoplace_control_prototypes table<string, LuaAutoplaceControlPrototype> @RW; A dictionary containing every LuaAutoplaceControlPrototype indexed by `name`.
  ---@field autosave_enabled boolean @RW; True by default. Can be used to disable autosaving. Make sure to turn it back on soon after.
  ---@field backer_names table<uint, string> @RW; Array of the names of all the backers that supported the game development early on. These are used as names for labs, locomotives, radars, roboports, and train stops.
  ---@field connected_players LuaPlayer[] @RW; The players that are currently online. This is primarily useful when you want to do some action against all online players.
  ---@field custom_input_prototypes table<string, LuaCustomInputPrototype> @RW; A dictionary containing every LuaCustomInputPrototype indexed by `name`.
  ---@field damage_prototypes table<string, LuaDamagePrototype> @RW; A dictionary containing every LuaDamagePrototype indexed by `name`.
  ---@field decorative_prototypes table<string, LuaDecorativePrototype> @RW; A dictionary containing every LuaDecorativePrototype indexed by `name`.
  ---@field default_map_gen_settings MapGenSettings @RW; The default map gen settings for this save.
  ---@field difficulty defines__difficulty @RW; Current scenario difficulty.
  ---@field difficulty_settings DifficultySettings @RW; The currently active set of difficulty settings. Even though this property is marked as read-only, the members of the dictionary that is returned can be modified mid-game. This is however not recommended as different difficulties can have differing technology and recipe trees, which can cause problems for players.
  ---@field draw_resource_selection boolean @RW; True by default. Can be used to disable the highlighting of resource patches when they are hovered on the map.
  ---@field enemy_has_vision_on_land_mines boolean @RW; Determines if enemy land mines are completely invisible or not.
  ---@field entity_prototypes table<string, LuaEntityPrototype> @RW; A dictionary containing every LuaEntityPrototype indexed by `name`.
  ---@field equipment_category_prototypes table<string, LuaEquipmentCategoryPrototype> @RW; A dictionary containing every LuaEquipmentCategoryPrototype indexed by `name`.
  ---@field equipment_grid_prototypes table<string, LuaEquipmentGridPrototype> @RW; A dictionary containing every LuaEquipmentGridPrototype indexed by `name`.
  ---@field equipment_prototypes table<string, LuaEquipmentPrototype> @RW; A dictionary containing every LuaEquipmentPrototype indexed by `name`.
  ---@field finished boolean @RW; True while the victory screen is shown.
  ---@field finished_but_continuing boolean @RW; True after players finished the game and clicked "continue".
  ---@field fluid_prototypes table<string, LuaFluidPrototype> @RW; A dictionary containing every LuaFluidPrototype indexed by `name`.
  ---@field font_prototypes table<string, LuaFontPrototype> @RW; A dictionary containing every LuaFontPrototype indexed by `name`.
  ---@field forces table<uint | string, LuaForce> @RW; Get a table of all the forces that currently exist. This sparse table allows you to find forces by indexing it with either their `name` or `index`. Iterating this table with `pairs()` will only iterate the array part of the table. Iterating with `ipairs()` will not work at all.
  ---@field fuel_category_prototypes table<string, LuaFuelCategoryPrototype> @RW; A dictionary containing every LuaFuelCategoryPrototype indexed by `name`.
  ---@field item_group_prototypes table<string, LuaGroup> @RW; A dictionary containing every ItemGroup indexed by `name`.
  ---@field item_prototypes table<string, LuaItemPrototype> @RW; A dictionary containing every LuaItemPrototype indexed by `name`.
  ---@field item_subgroup_prototypes table<string, LuaGroup> @RW; A dictionary containing every ItemSubgroup indexed by `name`.
  ---@field map_gen_presets table<string, MapGenPreset> @RW; A dictionary containing every MapGenPreset indexed by `name`.
  ---@field map_settings MapSettings @RW; The currently active set of map settings. Even though this property is marked as read-only, the members of the dictionary that is returned can be modified mid-game.
  ---@field max_beacon_supply_area_distance double @RW
  ---@field max_electric_pole_connection_distance double @RW
  ---@field max_electric_pole_supply_area_distance float @RW
  ---@field max_force_distraction_chunk_distance uint @RW
  ---@field max_force_distraction_distance double @RW
  ---@field max_gate_activation_distance double @RW
  ---@field max_inserter_reach_distance double @RW
  ---@field max_pipe_to_ground_distance uint8 @RW
  ---@field max_underground_belt_distance uint8 @RW
  ---@field mod_setting_prototypes table<string, LuaModSettingPrototype> @RW; A dictionary containing every LuaModSettingPrototype indexed by `name`.
  ---@field module_category_prototypes table<string, LuaModuleCategoryPrototype> @RW; A dictionary containing every LuaModuleCategoryPrototype indexed by `name`.
  ---@field named_noise_expressions table<string, LuaNamedNoiseExpression> @RW; A dictionary containing every LuaNamedNoiseExpression indexed by `name`.
  ---@field noise_layer_prototypes table<string, LuaNoiseLayerPrototype> @RW; A dictionary containing every LuaNoiseLayerPrototype indexed by `name`.
  ---@field object_name string @RW; This object's name.
  ---@field particle_prototypes table<string, LuaParticlePrototype> @RW; A dictionary containing every LuaParticlePrototype indexed by `name`.
  ---@field permissions LuaPermissionGroups @RW
  ---@field player LuaPlayer @RW nilable; This property is only populated inside [custom command](LuaCommandProcessor) handlers and when writing [Lua console commands](https://wiki.factorio.com/Console#Scripting_and_cheat_commands). Returns the player that is typing the command, `nil` in all other instances. See [LuaGameScript::players](LuaGameScript::players) for accessing all players.
  ---@field players table<uint | string, LuaPlayer> @RW; Get a table of all the players that currently exist. This sparse table allows you to find players by indexing it with either their `name` or `index`. Iterating this table with `pairs()` will only iterate the array part of the table. Iterating with `ipairs()` will not work at all. If only a single player is required, [LuaGameScript::get_player](LuaGameScript::get_player) should be used instead, as it avoids the unnecessary overhead of passing the whole table to Lua.
  ---@field pollution_statistics LuaFlowStatistics @RW; The pollution statistics for this map.
  ---@field recipe_category_prototypes table<string, LuaRecipeCategoryPrototype> @RW; A dictionary containing every LuaRecipeCategoryPrototype indexed by `name`.
  ---@field recipe_prototypes table<string, LuaRecipePrototype> @RW; A dictionary containing every LuaRecipePrototype indexed by `name`.
  ---@field resource_category_prototypes table<string, LuaResourceCategoryPrototype> @RW; A dictionary containing every LuaResourceCategoryPrototype indexed by `name`.
  ---@field shortcut_prototypes table<string, LuaShortcutPrototype> @RW; A dictionary containing every LuaShortcutPrototype indexed by `name`.
  ---@field speed float @RW; Speed to update the map at. 1.0 is normal speed -- 60 UPS.
  ---@field styles table<string, string> @RW; The styles that [LuaGuiElement](LuaGuiElement) can use, indexed by `name`.
  ---@field surfaces table<uint | string, LuaSurface> @RW; Get a table of all the surfaces that currently exist. This sparse table allows you to find surfaces by indexing it with either their `name` or `index`. Iterating this table with `pairs()` will only iterate the array part of the table. Iterating with `ipairs()` will not work at all.
  ---@field technology_prototypes table<string, LuaTechnologyPrototype> @RW; A dictionary containing every [LuaTechnologyPrototype](LuaTechnologyPrototype) indexed by `name`.
  ---@field tick uint @RW; Current map tick.
  ---@field tick_paused boolean @RW; If the tick has been paused. This means that entity update has been paused.
  ---@field ticks_played uint @RW; The number of ticks since this game was 'created'. A game is 'created' either by using "new game" or "new game from scenario".
  ---@field ticks_to_run uint @RW; The number of ticks to be run while the tick is paused. When [LuaGameScript::tick_paused](LuaGameScript::tick_paused) is true, ticks_to_run behaves the following way: While this is > 0, the entity update is running normally and this value is decremented every tick. When this reaches 0, the game will pause again.
  ---@field tile_prototypes table<string, LuaTilePrototype> @RW; A dictionary containing every LuaTilePrototype indexed by `name`.
  ---@field trivial_smoke_prototypes table<string, LuaTrivialSmokePrototype> @RW; A dictionary containing every LuaTrivialSmokePrototype indexed by `name`.
  ---@field virtual_signal_prototypes table<string, LuaVirtualSignalPrototype> @RW; A dictionary containing every LuaVirtualSignalPrototype indexed by `name`.
LuaGameScript = {}

--- Instruct the game to perform an auto-save.
---@param name string|nil @The autosave name if any. Saves will be named _autosave-*name* when provided.
---@overload fun()
function LuaGameScript.auto_save(name) end

--- Bans the given player from this multiplayer game. Does nothing if this is a single player game of if the player running this isn't an admin.
---@param player PlayerIdentification @The player to ban.
---@param reason LocalisedString|nil @The reason given if any.
---@overload fun(player: PlayerIdentification)
function LuaGameScript.ban_player(player, reason) end

--- Run internal consistency checks. Allegedly prints any errors it finds.
function LuaGameScript.check_consistency() end

--- Goes over all items, entities, tiles, recipes, technologies among other things and logs if the locale is incorrect.
function LuaGameScript.check_prototype_translations() end

--- Counts how many distinct groups of pipes exist in the world.
function LuaGameScript.count_pipe_groups() end

--- Create a new force.
---@param force string @Name of the new force
---@return LuaForce @The force that was just created
function LuaGameScript.create_force(force) end

--- Creates an inventory that is not owned by any game object. It can be resized later with [LuaInventory::resize](LuaInventory::resize).
---@param size uint16 @The number of slots the inventory initially has.
---@return LuaInventory
function LuaGameScript.create_inventory(size) end

--- Creates a [LuaProfiler](LuaProfiler), which is used for measuring script performance.
---@param stopped boolean|nil @Create the timer stopped
---@overload fun(): LuaProfiler
---@return LuaProfiler
function LuaGameScript.create_profiler(stopped) end

--- Creates a deterministic standalone random generator with the given seed or if a seed is not provided the initial map seed is used.
---@param seed uint|nil
---@overload fun(): LuaRandomGenerator
---@return LuaRandomGenerator
function LuaGameScript.create_random_generator(seed) end

--- Create a new surface.
---@param name string @Name of the new surface.
---@param settings MapGenSettings|nil @Map generation settings.
---@overload fun(name: string): LuaSurface
---@return LuaSurface @The surface that was just created.
function LuaGameScript.create_surface(name, settings) end

--- Base64 decodes and inflates the given string.
---@param string string @The string to decode.
---@return string @The decoded string or `nil` if the decode failed.
function LuaGameScript.decode_string(string) end

--- Deletes the given surface and all entities on it.
---@param surface string | LuaSurface @The surface to be deleted. Currently the primary surface (1, 'nauvis') cannot be deleted.
function LuaGameScript.delete_surface(surface) end

--- Converts the given direction into the string version of the direction.
---@param direction defines__direction
function LuaGameScript.direction_to_string(direction) end

--- Disables replay saving for the current save file. Once done there's no way to re-enable replay saving for the save file without loading an old save.
function LuaGameScript.disable_replay() end

--- Disables tutorial triggers, that unlock new tutorials and show notices about unlocked tutorials.
function LuaGameScript.disable_tutorial_triggers() end

--- Deflates and base64 encodes the given string.
---@param string string @The string to encode.
---@return string @The encoded string or `nil` if the encode failed.
function LuaGameScript.encode_string(string) end

--- Evaluate an expression, substituting variables as provided. For details on the formula, see the relevant page on the [Factorio wiki](https://wiki.factorio.com/Prototype/Technology#unit).
---@param expression string @The expression to evaluate.
---@param variables (table<string, double>)|nil @Variables to be substituted.
---@overload fun(expression: string): double
---@return double
function LuaGameScript.evaluate_expression(expression, variables) end

--- Force a CRC check. Tells all peers to calculate their current map CRC; these CRC are then compared against each other. If a mismatch is detected, the game is desynced and some peers are forced to reconnect.
function LuaGameScript.force_crc() end

--- Gets the number of entities that are active (updated each tick).
---@param surface SurfaceIdentification|nil @If given, only the entities active on this surface are counted.
---@overload fun(): uint
---@return uint
function LuaGameScript.get_active_entities_count(surface) end

---@param tag string
---@return LuaEntity
function LuaGameScript.get_entity_by_tag(tag) end

--- Returns a dictionary of all LuaAchievementPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters AchievementPrototypeFilter[]
---@return table<string, LuaAchievementPrototype>
function LuaGameScript.get_filtered_achievement_prototypes(filters) end

--- Returns a dictionary of all LuaDecorativePrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters DecorativePrototypeFilter[]
---@return table<string, LuaDecorativePrototype>
function LuaGameScript.get_filtered_decorative_prototypes(filters) end

--- Returns a dictionary of all LuaEntityPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters EntityPrototypeFilter[]
---@return table<string, LuaEntityPrototype>
function LuaGameScript.get_filtered_entity_prototypes(filters) end

--- Returns a dictionary of all LuaEquipmentPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters EquipmentPrototypeFilter[]
---@return table<string, LuaEquipmentPrototype>
function LuaGameScript.get_filtered_equipment_prototypes(filters) end

--- Returns a dictionary of all LuaFluidPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters FluidPrototypeFilter[]
---@return table<string, LuaFluidPrototype>
function LuaGameScript.get_filtered_fluid_prototypes(filters) end

--- Returns a dictionary of all LuaItemPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters ItemPrototypeFilter[]
---@return table<string, LuaItemPrototype>
function LuaGameScript.get_filtered_item_prototypes(filters) end

--- Returns a dictionary of all LuaModSettingPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters ModSettingPrototypeFilter[]
---@return table<string, LuaModSettingPrototype>
function LuaGameScript.get_filtered_mod_setting_prototypes(filters) end

--- Returns a dictionary of all LuaRecipePrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters RecipePrototypeFilter[]
---@return table<string, LuaRecipePrototype>
function LuaGameScript.get_filtered_recipe_prototypes(filters) end

--- Returns a dictionary of all LuaTechnologyPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters TechnologyPrototypeFilter[]
---@return table<string, LuaTechnologyPrototype>
function LuaGameScript.get_filtered_technology_prototypes(filters) end

--- Returns a dictionary of all LuaTilePrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters TilePrototypeFilter[]
---@return table<string, LuaTilePrototype>
function LuaGameScript.get_filtered_tile_prototypes(filters) end

--- Gets the map exchange string for the map generation settings that were used to create this map.
---@return string
function LuaGameScript.get_map_exchange_string() end

--- Gets the given player or returns `nil` if no player is found.
---@param player uint | string @The player index or name.
---@return LuaPlayer
function LuaGameScript.get_player(player) end

--- Gets the inventories created through [LuaGameScript::create_inventory](LuaGameScript::create_inventory)
---@param mod string|nil @The mod who's inventories to get. If not provided all inventories are returned.
---@overload fun(): table<string, LuaInventory[]>
---@return table<string, LuaInventory[]> @A mapping of mod name to array of inventories owned by that mod.
function LuaGameScript.get_script_inventories(mod) end

--- Gets the given surface or returns `nil` if no surface is found.
---@param surface uint | string @The surface index or name.
---@return LuaSurface
function LuaGameScript.get_surface(surface) end

---@shape LuaGameScript_get_train_stops_params
   ---@field name (string | string[])|nil @The name(s) of the train stops. Not providing names will match any stop.
   ---@field surface SurfaceIdentification|nil @The surface to search. Not providing a surface will match stops on any surface.
   ---@field force ForceIdentification|nil @The force to search. Not providing a force will match stops in any force.

--- Gets train stops matching the given filters.
---@param p LuaGameScript_get_train_stops_params
---@return LuaEntity[]
---@overload fun(): LuaEntity[]
function LuaGameScript.get_train_stops(p) end

--- Is this the demo version of Factorio?
---@return boolean
function LuaGameScript.is_demo() end

--- Is the map loaded is multiplayer?
---@return boolean
function LuaGameScript.is_multiplayer() end

--- Checks if the given SoundPath is valid.
---@param sound_path SoundPath @Path to the sound.
---@return boolean
function LuaGameScript.is_valid_sound_path(sound_path) end

--- Checks if the given SpritePath is valid and contains a loaded sprite. The existence of the image is not checked for paths of type `file`.
---@param sprite_path SpritePath @Path to the image.
---@return boolean
function LuaGameScript.is_valid_sprite_path(sprite_path) end

--- Convert a JSON string to a table.
---@param json string @The string to convert.
---@return AnyBasic @The returned object, or `nil` if the JSON string was invalid.
function LuaGameScript.json_to_table(json) end

--- Kicks the given player from this multiplayer game. Does nothing if this is a single player game or if the player running this isn't an admin.
---@param player PlayerIdentification @The player to kick.
---@param reason LocalisedString|nil @The reason given if any.
---@overload fun(player: PlayerIdentification)
function LuaGameScript.kick_player(player, reason) end

--- Marks two forces to be merged together. All entities in the source force will be reassigned to the target force. The source force will then be destroyed.
---@param source ForceIdentification @The force to remove.
---@param destination ForceIdentification @The force to reassign all entities to.
function LuaGameScript.merge_forces(source, destination) end

--- Mutes the given player. Does nothing if the player running this isn't an admin.
---@param player PlayerIdentification @The player to mute.
function LuaGameScript.mute_player(player) end

--- Convert a map exchange string to map gen settings and map settings.
---@param map_exchange_string string
---@return MapExchangeStringData
function LuaGameScript.parse_map_exchange_string(map_exchange_string) end

---@shape LuaGameScript_play_sound_params
   ---@field path SoundPath @The sound to play.
   ---@field position MapPosition|nil @Where the sound should be played. If not given, it's played at the current position of each player.
   ---@field volume_modifier double|nil @The volume of the sound to play. Must be between 0 and 1 inclusive.
   ---@field override_sound_type SoundType|nil @The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.

--- Play a sound for every player in the game.
---@param p LuaGameScript_play_sound_params
function LuaGameScript.play_sound(p) end

--- Print text to the chat console all players.
---@param message LocalisedString
---@param color Color|nil
---@overload fun(message: LocalisedString)
function LuaGameScript.print(message, color) end

--- Purges the given players messages from the game. Does nothing if the player running this isn't an admin.
---@param player PlayerIdentification @The player to purge.
function LuaGameScript.purge_player(player) end

--- Regenerate autoplacement of some entities on all surfaces. This can be used to autoplace newly-added entities.
---@param entities string | string[] @Prototype names of entity or entities to autoplace.
function LuaGameScript.regenerate_entity(entities) end

--- Forces a reload of all mods.
function LuaGameScript.reload_mods() end

--- Forces a reload of the scenario script from the original scenario location.
function LuaGameScript.reload_script() end

--- Remove players who are currently not connected from the map.
---@param players ((LuaPlayer | string)[])|nil @List of players to remove. If not specified, remove all offline players.
---@overload fun()
function LuaGameScript.remove_offline_players(players) end

--- Remove a file or directory in the `script-output` folder, located in the game's [user data directory](https://wiki.factorio.com/User_data_directory). Can be used to remove files created by [LuaGameScript::write_file](LuaGameScript::write_file).
---@param path string @The path to the file or directory to remove, relative to `script-output`.
function LuaGameScript.remove_path(path) end

--- Reset scenario state (game_finished, player_won, etc.).
function LuaGameScript.reset_game_state() end

--- Resets the amount of time played for this map.
function LuaGameScript.reset_time_played() end

--- Saves the current configuration of Atlas to a file. This will result in huge file containing all of the game graphics moved to as small space as possible.
function LuaGameScript.save_atlas() end

--- Instruct the server to save the map.
---@param name string|nil @Save name. If not specified, writes into the currently-running save.
---@overload fun()
function LuaGameScript.server_save(name) end

---@shape LuaGameScript_set_game_state_params
   ---@field game_finished boolean|nil
   ---@field player_won boolean|nil
   ---@field next_level string|nil
   ---@field can_continue boolean|nil
   ---@field victorious_force ForceIdentification|nil

--- Set scenario state. Any parameters not provided do not change the current state.
---@param p LuaGameScript_set_game_state_params
function LuaGameScript.set_game_state(p) end

--- Forces the screenshot saving system to wait until all queued screenshots have been written to disk.
function LuaGameScript.set_wait_for_screenshots_to_finish() end

---@shape LuaGameScript_show_message_dialog_params
   ---@field text LocalisedString @What the dialog should say
   ---@field image string|nil @Path to an image to show on the dialog
   ---@field point_to GuiArrowSpecification|nil @If specified, dialog will show an arrow pointing to this place. When not specified, the arrow will point to the player's position. (Use `point_to={type="nowhere"}` to remove the arrow entirely.) The dialog itself will be placed near the arrow's target.
   ---@field style string|nil @The gui style to use for this speech bubble. Must be of type speech_bubble.
   ---@field wrapper_frame_style string|nil @Must be of type flow_style.

--- Show an in-game message dialog.
---@param p LuaGameScript_show_message_dialog_params
function LuaGameScript.show_message_dialog(p) end

--- Convert a table to a JSON string
---@param data table
---@return string
function LuaGameScript.table_to_json(data) end

---@shape LuaGameScript_take_screenshot_params
   ---@field player PlayerIdentification|nil @The player to focus on. Defaults to the local player.
   ---@field by_player PlayerIdentification|nil @If defined, the screenshot will only be taken for this player.
   ---@field surface SurfaceIdentification|nil @If defined, the screenshot will be taken on this surface.
   ---@field position MapPosition|nil @If defined, the screenshot will be centered on this position. Otherwise, the screenshot will center on `player`.
   ---@field resolution TilePosition|nil @The maximum allowed resolution is 16384x16384 (8192x8192 when `anti_alias` is `true`), but the maximum recommended resolution is 4096x4096 (resp. 2048x2048).
   ---@field zoom double|nil @The map zoom to take the screenshot at. Defaults to `1`.
   ---@field path string|nil @The name of the image file. It should include a file extension indicating the desired format. Supports `.png`, `.jpg` /`.jpeg`, `.tga` and `.bmp`. Providing a directory path (ex. `"save/here/screenshot.png"`) will create the necessary folder structure in `script-output`. Defaults to `"screenshot.png"`.
   ---@field show_gui boolean|nil @Whether to include GUIs in the screenshot or not. Defaults to `false`.
   ---@field show_entity_info boolean|nil @Whether to include entity info ("Alt mode") or not. Defaults to `false`.
   ---@field show_cursor_building_preview boolean|nil @When `true` and when `player` is specified, the building preview for the item in the player's cursor will also be rendered. Defaults to `false`.
   ---@field anti_alias boolean|nil @Whether to render in double resolution and downscale the result (including GUI). Defaults to `false`.
   ---@field quality int|nil @The `.jpg` render quality as a percentage (from 0% to 100% inclusive), if used. A lower value means a more compressed image. Defaults to `80`.
   ---@field allow_in_replay boolean|nil @Whether to save the screenshot even during replay playback. Defaults to `false`.
   ---@field daytime double|nil @Overrides the current surface daytime for the duration of screenshot rendering.
   ---@field water_tick uint|nil @Overrides the tick of water animation, if animated water is enabled.
   ---@field force_render boolean|nil @Screenshot requests are processed in between game update and render. The game may skip rendering (ie. drop frames) if the previous frame has not finished rendering or the game simulation starts to fall below 60 updates per second. If `force_render` is set to `true`, the game won't drop frames and process the screenshot request at the end of the update in which the request was created. This is not honored on multiplayer clients that are catching up to server. Defaults to `false`.

--- Take a screenshot of the game and save it to the `script-output` folder, located in the game's [user data directory](https://wiki.factorio.com/User_data_directory). The name of the image file can be specified via the `path` parameter.
---@param p LuaGameScript_take_screenshot_params
function LuaGameScript.take_screenshot(p) end

---@shape LuaGameScript_take_technology_screenshot_params
   ---@field force ForceIdentification|nil @The force whose technology to screenshot. If not given, the `"player`" force is used.
   ---@field path string|nil @The name of the image file. It should include a file extension indicating the desired format. Supports `.png`, `.jpg` /`.jpeg`, `.tga` and `.bmp`. Providing a directory path (ex. `"save/here/screenshot.png"`) will create the necessary folder structure in `script-output`. Defaults to `"technology-screenshot.png"`.
   ---@field by_player PlayerIdentification|nil @If given, the screenshot will only be taken for this player.
   ---@field selected_technology TechnologyIdentification|nil @The technology to highlight.
   ---@field skip_disabled boolean|nil @If `true`, disabled technologies will be skipped. Their successors will be attached to the disabled technology's parents. Defaults to `false`.
   ---@field quality int|nil @The `.jpg` render quality as a percentage (from 0% to 100% inclusive), if used. A lower value means a more compressed image. Defaults to `80`.

--- Take a screenshot of the technology screen and save it to the `script-output` folder, located in the game's [user data directory](https://wiki.factorio.com/User_data_directory). The name of the image file can be specified via the `path` parameter.
---@param p LuaGameScript_take_technology_screenshot_params
function LuaGameScript.take_technology_screenshot(p) end

--- Unbans the given player from this multiplayer game. Does nothing if this is a single player game of if the player running this isn't an admin.
---@param player PlayerIdentification @The player to unban.
function LuaGameScript.unban_player(player) end

--- Unmutes the given player. Does nothing if the player running this isn't an admin.
---@param player PlayerIdentification @The player to unmute.
function LuaGameScript.unmute_player(player) end

--- Write a file to the `script-output` folder, located in the game's [user data directory](https://wiki.factorio.com/User_data_directory). The name and file extension of the file can be specified via the `filename` parameter.
---@param filename string @The name of the file. Providing a directory path (ex. `"save/here/example.txt"`) will create the necessary folder structure in `script-output`.
---@param data LocalisedString @The content to write to the file.
---@param append boolean|nil @If `true`, `data` will be appended to the end of the file. Defaults to `false`, which will overwrite any pre-existing file with the new `data`.
---@param for_player uint|nil @If given, the file will only be written for this `player_index`. Providing `0` will only write to the server's output if present.
---@overload fun(filename: string, data: LocalisedString, append: boolean|nil)
---@overload fun(filename: string, data: LocalisedString)
function LuaGameScript.write_file(filename, data, append, for_player) end

---@class LuaGenericOnOffControlBehavior: LuaControlBehavior @An abstract base class for behaviors that support switching the entity on or off based on some condition.
  ---@field circuit_condition CircuitConditionDefinition @RW; The circuit condition. Writing `nil` clears the circuit condition.
  ---@field connect_to_logistic_network boolean @RW; `true` if this should connect to the logistic network.
  ---@field disabled boolean @RW; If the entity is currently disabled because of the control behavior.
  ---@field logistic_condition CircuitConditionDefinition @RW; The logistic condition. Writing `nil` clears the logistic condition.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaGenericOnOffControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaGenericOnOffControlBehavior.help() end

---@class LuaGroup: any @Item group or subgroup.
  ---@field group LuaGroup @RW nilable; The parent group, if any.
  ---@field localised_name LocalisedString @RW nilable; Localised name of the group.
  ---@field name string @RW nilable
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field order_in_recipe string @RW nilable; The additional order value used in recipe ordering. Can only be used on groups, not on subgroups.
  ---@field subgroups LuaGroup[] @RW nilable; Subgroups of this group. Can only be used on groups, not on subgroups.
  ---@field type string @RW nilable
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaGroup = {}

--- All methods and properties that this object supports.
---@return string
function LuaGroup.help() end

---@class LuaGui: any @The root of the GUI. This type houses the root elements, `top`, `left`, `center`, `goal`, and `screen`, to which other elements can be added to be displayed on screen.
  ---@field center LuaGuiElement @RW; The center part of the GUI. It is a flow element.
  ---@field children table<string, LuaGuiElement> @RW; The children GUI elements mapped by name <> element.
  ---@field goal LuaGuiElement @RW; The flow used in the objectives window. It is a flow element. The objectives window is only visible when the flow is not empty or the objective text is set.
  ---@field left LuaGuiElement @RW; The left part of the GUI. It is a flow element inside a scroll pane element.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field player LuaPlayer @RW; The player who owns this gui.
  ---@field relative LuaGuiElement @RW; For showing a GUI somewhere relative to one of the game GUIs. It is an empty-widget element.
  ---@field screen LuaGuiElement @RW; For showing a GUI somewhere on the entire screen. It is an empty-widget element.
  ---@field top LuaGuiElement @RW; The top part of the GUI. It is a flow element inside a scroll pane element.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaGui = {}

--- All methods and properties that this object supports.
---@return string
function LuaGui.help() end

--- Returns `true` if sprite_path is valid and contains loaded sprite, otherwise `false`. Sprite path of type `file` doesn't validate if file exists.
--- If you want to avoid needing a LuaGui object, [LuaGameScript::is_valid_sprite_path](LuaGameScript::is_valid_sprite_path) can be used instead.
---@param sprite_path SpritePath @Path to a image.
---@return boolean
function LuaGui.is_valid_sprite_path(sprite_path) end

---@class LuaGuiElement: any @An element of a custom GUI. This type is used to represent any kind of a GUI element - labels, buttons and frames are all instances of this type. Just like [LuaEntity](LuaEntity), different kinds of elements support different attributes; attempting to access an attribute on an element that doesn't support it (for instance, trying to access the `column_count` of a `textfield`) will result in a runtime error. The following types of GUI element are supported: - `"button"`: A clickable element. Relevant event: [on_gui_click](on_gui_click) - `"sprite-button"`: A `button` that displays a sprite rather than text. Relevant event: [on_gui_click](on_gui_click) - `"checkbox"`: A clickable element with a check mark that can be turned off or on. Relevant event: [on_gui_checked_state_changed](on_gui_checked_state_changed) - `"flow"`: An invisible container that lays out its children either horizontally or vertically. - `"frame"`: A non-transparent box that contains other elements. It can have a title (set via the `caption` attribute). Just like a `flow`, it lays out its children either horizontally or vertically. Relevant event: [on_gui_location_changed](on_gui_location_changed) - `"label"`: A piece of text. - `"line"`: A horizontal or vertical separation line. - `"progressbar"`: A partially filled bar that can be used to indicate progress. - `"table"`: An invisible container that lays out its children in a specific number of columns. The width of each column is determined by the widest element it contains. - `"textfield"`: A single-line box the user can type into. Relevant events: [on_gui_text_changed](on_gui_text_changed), [on_gui_confirmed](on_gui_confirmed) - `"radiobutton"`: A clickable element that is functionally identical to a `checkbox`, but has a circular appearance. Relevant event: [on_gui_checked_state_changed](on_gui_checked_state_changed) - `"sprite"`: An element that shows an image. - `"scroll-pane"`: An invisible element that is similar to a `flow`, but has the ability to show and use scroll bars. - `"drop-down"`: A drop-down containing strings of text. Relevant event: [on_gui_selection_state_changed](on_gui_selection_state_changed) - `"list-box"`: A list of strings, only one of which can be selected at a time. Shows a scroll bar if necessary. Relevant event: [on_gui_selection_state_changed](on_gui_selection_state_changed) - `"camera"`: A camera that shows the game at the given position on the given surface. It can visually track an [entity](LuaGuiElement::entity) that is set after the element has been created. - `"choose-elem-button"`: A button that lets the player pick from a certain kind of prototype, with optional filtering. Relevant event: [on_gui_elem_changed](on_gui_elem_changed) - `"text-box"`: A multi-line `textfield`. Relevant event: [on_gui_text_changed](on_gui_text_changed) - `"slider"`: A horizontal number line which can be used to choose a number. Relevant event: [on_gui_value_changed](on_gui_value_changed) - `"minimap"`: A minimap preview, similar to the normal player minimap. It can visually track an [entity](LuaGuiElement::entity) that is set after the element has been created. - `"entity-preview"`: A preview of an entity. The [entity](LuaGuiElement::entity) has to be set after the element has been created. - `"empty-widget"`: An empty element that just exists. The root GUI elements `screen` and `relative` are `empty-widget`s. - `"tabbed-pane"`: A collection of `tab`s and their contents. Relevant event: [on_gui_selected_tab_changed](on_gui_selected_tab_changed) - `"tab"`: A tab for use in a `tabbed-pane`. - `"switch"`: A switch with three possible states. Can have labels attached to either side. Relevant event: [on_gui_switch_state_changed](on_gui_switch_state_changed) Each GUI element allows access to its children by having them as attributes. Thus, one can use the `parent.child` syntax to refer to children. Lua also supports the `parent["child"]` syntax to refer to the same element. This can be used in cases where the child has a name that isn't a valid Lua identifier.
  ---@field allow_decimal boolean @RW; Whether this textfield (when in numeric mode) allows decimal numbers.
  ---@field allow_negative boolean @RW; Whether this textfield (when in numeric mode) allows negative numbers.
  ---@field allow_none_state boolean @RW; Whether the `"none"` state is allowed for this switch.
  ---@field anchor GuiAnchor @RW nilable; The anchor for this relative widget, if any. Setting `nil` clears the anchor.
  ---@field auto_center boolean @RW; Whether this frame auto-centers on window resize when stored in [LuaGui::screen](LuaGui::screen).
  ---@field badge_text LocalisedString @RW; The text to display after the normal tab text (designed to work with numbers)
  ---@field caption LocalisedString @RW; The text displayed on this element. For frames, this is the "heading". For other elements, like buttons or labels, this is the content.
  ---@field children LuaGuiElement[] @RW; The child-elements of this GUI element.
  ---@field children_names string[] @RW; Names of all the children of this element. These are the identifiers that can be used to access the child as an attribute of this element.
  ---@field clear_and_focus_on_right_click boolean @RW; Makes it so right-clicking on this textfield clears and focuses it.
  ---@field clicked_sprite SpritePath @RW; The sprite to display on this sprite-button when it is clicked.
  ---@field column_count uint @RW; The number of columns in this table.
  ---@field direction string @RW; Direction of this element's layout. May be either `"horizontal"` or `"vertical"`.
  ---@field drag_target LuaGuiElement @RW nilable; The `frame` that is being moved when dragging this GUI element, if any. This element needs to be a child of the `drag_target` at some level.
  ---@field draw_horizontal_line_after_headers boolean @RW; Whether this table should draw a horizontal grid line below the first table row.
  ---@field draw_horizontal_lines boolean @RW; Whether this table should draw horizontal grid lines.
  ---@field draw_vertical_lines boolean @RW; Whether this table should draw vertical grid lines.
  ---@field elem_filters PrototypeFilter @RW nilable; The elem filters of this choose-elem-button, if any. The compatible type of filter is determined by `elem_type`.
  ---@field elem_type string @RW; The elem type of this choose-elem-button.
  ---@field elem_value string | SignalID @RW nilable; The elem value of this choose-elem-button, if any.
  ---@field enabled boolean @RW; Whether this GUI element is enabled. Disabled GUI elements don't trigger events when clicked.
  ---@field entity LuaEntity @RW nilable; The entity associated with this entity-preview, camera, minimap, if any.
  ---@field force string @RW nilable; The force this minimap is using, if any.
  ---@field gui LuaGui @RW; The GUI this element is a child of.
  ---@field horizontal_scroll_policy string @RW; Policy of the horizontal scroll bar. Possible values are `"auto"`, `"never"`, `"always"`, `"auto-and-reserve-space"`, `"dont-show-but-allow-scrolling"`.
  ---@field hovered_sprite SpritePath @RW; The sprite to display on this sprite-button when it is hovered.
  ---@field ignored_by_interaction boolean @RW; Whether this GUI element is ignored by interaction. This makes clicks on this element 'go through' to the GUI element or even the game surface below it.
  ---@field index uint @RW; The index of this GUI element (unique amongst the GUI elements of a LuaPlayer).
  ---@field is_password boolean @RW; Whether this textfield displays as a password field, which renders all characters as `*`.
  ---@field items LocalisedString[] @RW; The items in this dropdown or listbox.
  ---@field left_label_caption LocalisedString @RW; The text shown for the left switch label.
  ---@field left_label_tooltip LocalisedString @RW; The tooltip shown on the left switch label.
  ---@field location GuiLocation @RW nilable; The location of this widget when stored in [LuaGui::screen](LuaGui::screen). `nil` if not set or not in [LuaGui::screen](LuaGui::screen).
  ---@field locked boolean @RW; Whether this choose-elem-button can be changed by the player.
  ---@field lose_focus_on_confirm boolean @RW; Whether this textfield loses focus after [defines.events.on_gui_confirmed](defines.events.on_gui_confirmed) is fired.
  ---@field minimap_player_index uint @RW; The player index this minimap is using.
  ---@field mouse_button_filter MouseButtonFlags @RW; The mouse button filters for this button or sprite-button.
  ---@field name string @RW; The name of this element. `""` if no name was set.
  ---@field number double @RW; The number to be shown in the bottom right corner of this sprite-button. Set this to `nil` to show nothing.
  ---@field numeric boolean @RW; Whether this textfield is limited to only numberic characters.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field parent LuaGuiElement @RW nilable; The direct parent of this element. `nil` if this is a top-level element.
  ---@field player_index uint @RW; Index into [LuaGameScript::players](LuaGameScript::players) specifying the player who owns this element.
  ---@field position MapPosition @RW; The position this camera or minimap is focused on, if any.
  ---@field read_only boolean @RW; Whether this text-box is read-only. Defaults to `false`.
  ---@field resize_to_sprite boolean @RW; Whether the sprite widget should resize according to the sprite in it. Defaults to `true`.
  ---@field right_label_caption LocalisedString @RW; The text shown for the right switch label.
  ---@field right_label_tooltip LocalisedString @RW; The tooltip shown on the right switch label.
  ---@field selectable boolean @RW; Whether the contents of this text-box are selectable. Defaults to `true`.
  ---@field selected_index uint @RW; The selected index for this dropdown or listbox. Returns `0` if none is selected.
  ---@field selected_tab_index uint @RW nilable; The selected tab index for this tabbed pane, if any.
  ---@field show_percent_for_small_numbers boolean @RW; Related to the number to be shown in the bottom right corner of this sprite-button. When set to `true`, numbers that are non-zero and smaller than one are shown as a percentage rather than the value. For example, `0.5` will be shown as `50%` instead.
  ---@field slider_value double @RW; The value of this slider element.
  ---@field sprite SpritePath @RW; The sprite to display on this sprite-button or sprite in the default state.
  ---@field state boolean @RW; Is this checkbox or radiobutton checked?
  ---@field style LuaStyle | string @RW; The style of this element. When read, this evaluates to a [LuaStyle](LuaStyle). For writing, it only accepts a string that specifies the textual identifier (prototype name) of the desired style.
  ---@field surface_index uint @RW; The surface index this camera or minimap is using.
  ---@field switch_state string @RW; The switch state (left, none, right) for this switch.
  ---@field tabs TabAndContent[] @RW; The tabs and contents being shown in this tabbed-pane.
  ---@field tags Tags @RW; The tags associated with this LuaGuiElement.
  ---@field text string @RW; The text contained in this textfield or text-box.
  ---@field tooltip LocalisedString @RW
  ---@field type string @RW; The type of this GUI element.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field value double @RW; How much this progress bar is filled. It is a value in the range [0, 1].
  ---@field vertical_centering boolean @RW; Whether the content of this table should be vertically centered. Overrides [LuaStyle::column_alignments](LuaStyle::column_alignments). Defaults to `true`.
  ---@field vertical_scroll_policy string @RW; Policy of the vertical scroll bar. Possible values are `"auto"`, `"never"`, `"always"`, `"auto-and-reserve-space"`, `"dont-show-but-allow-scrolling"`.
  ---@field visible boolean @RW; Sets whether this GUI element is visible or completely hidden, taking no space in the layout.
  ---@field word_wrap boolean @RW; Whether this text-box will word-wrap automatically. Defaults to `false`.
  ---@field zoom double @RW; The zoom this camera or minimap is using. This value must be positive.
LuaGuiElement = {}

---@shape LuaGuiElement_add_params
   ---@field type string @The kind of element to add. Has to be one of the GUI element types listed at the top of this page.
   ---@field name string|nil @Name of the child element. It must be unique within the parent element.
   ---@field caption LocalisedString|nil @Text displayed on the child element. For frames, this is their title. For other elements, like buttons or labels, this is the content. Whilst this attribute may be used on all elements, it doesn't make sense for tables and flows as they won't display it.
   ---@field tooltip LocalisedString|nil @Tooltip of the child element.
   ---@field enabled boolean|nil @Whether the child element is enabled. Defaults to `true`.
   ---@field visible boolean|nil @Whether the child element is visible. Defaults to `true`.
   ---@field ignored_by_interaction boolean|nil @Whether the child element is ignored by interaction. Defaults to `false`.
   ---@field style string|nil @The name of the style prototype to apply to the new element.
   ---@field tags Tags|nil @[Tags](Tags) associated with the child element.
   ---@field index uint|nil @Location in its parent that the child element should slot into. By default, the child will be appended onto the end.
   ---@field anchor GuiAnchor|nil @Where to position the child element when in the `relative` element.

--- Add a new child element to this GuiElement.
---@param p LuaGuiElement_add_params
---@return LuaGuiElement @The GUI element that was added.
function LuaGuiElement.add(p) end

--- Inserts a string at the end or at the given index of this dropdown or listbox.
---@param string LocalisedString @The text to insert.
---@param index uint|nil @The index at which to insert the item.
---@overload fun(string: LocalisedString)
function LuaGuiElement.add_item(string, index) end

--- Adds the given tab and content widgets to this tabbed pane as a new tab.
---@param tab LuaGuiElement @The tab to add, must be a GUI element of type "tab".
---@param content LuaGuiElement @The content to show when this tab is selected. Can be any type of GUI element.
function LuaGuiElement.add_tab(tab, content) end

--- Moves this GUI element to the "front" so it will draw over other elements.
function LuaGuiElement.bring_to_front() end

--- Remove children of this element. Any [LuaGuiElement](LuaGuiElement) objects referring to the destroyed elements become invalid after this operation.
function LuaGuiElement.clear() end

--- Removes the items in this dropdown or listbox.
function LuaGuiElement.clear_items() end

--- Remove this element, along with its children. Any [LuaGuiElement](LuaGuiElement) objects referring to the destroyed elements become invalid after this operation.
function LuaGuiElement.destroy() end

--- Focuses this GUI element if possible.
function LuaGuiElement.focus() end

--- Forces this frame to re-auto-center. Only works on frames stored directly in [LuaGui::screen](LuaGui::screen).
function LuaGuiElement.force_auto_center() end

--- Gets the index that this element has in its parent element.
---@return uint
function LuaGuiElement.get_index_in_parent() end

--- Gets the item at the given index from this dropdown or listbox.
---@param index uint @The index to get
---@return LocalisedString
function LuaGuiElement.get_item(index) end

--- The mod that owns this Gui element or `nil` if it's owned by the scenario script.
---@return string
function LuaGuiElement.get_mod() end

--- Returns whether this slider only allows being moved to discrete positions.
---@return boolean
function LuaGuiElement.get_slider_discrete_slider() end

--- Returns whether this slider only allows discrete values.
---@return boolean
function LuaGuiElement.get_slider_discrete_values() end

--- Gets this sliders maximum value.
---@return double
function LuaGuiElement.get_slider_maximum() end

--- Gets this sliders minimum value.
---@return double
function LuaGuiElement.get_slider_minimum() end

--- Gets the minimum distance this slider can move.
---@return double
function LuaGuiElement.get_slider_value_step() end

--- All methods and properties that this object supports.
---@return string
function LuaGuiElement.help() end

--- Removes the item at the given index from this dropdown or listbox.
---@param index uint @The index
function LuaGuiElement.remove_item(index) end

--- Removes the given tab and its associated content from this tabbed pane.
---@param tab LuaGuiElement @The tab to remove. If not given, it removes all tabs.
function LuaGuiElement.remove_tab(tab) end

--- Scrolls this scroll bar to the bottom.
function LuaGuiElement.scroll_to_bottom() end

--- Scrolls this scroll bar such that the specified GUI element is visible to the player.
---@param element LuaGuiElement @The element to scroll to.
---@param scroll_mode string|nil @Where the element should be positioned in the scroll-pane. Must be either `"in-view"` or `"top-third"`. Defaults to `"in-view"`.
---@overload fun(element: LuaGuiElement)
function LuaGuiElement.scroll_to_element(element, scroll_mode) end

--- Scrolls the scroll bar such that the specified listbox item is visible to the player.
---@param index int @The item index to scroll to.
---@param scroll_mode string|nil @Where the item should be positioned in the list-box. Must be either `"in-view"` or `"top-third"`. Defaults to `"in-view"`.
---@overload fun(index: int)
function LuaGuiElement.scroll_to_item(index, scroll_mode) end

--- Scrolls this scroll bar to the left.
function LuaGuiElement.scroll_to_left() end

--- Scrolls this scroll bar to the right.
function LuaGuiElement.scroll_to_right() end

--- Scrolls this scroll bar to the top.
function LuaGuiElement.scroll_to_top() end

--- Selects a range of text in this textbox.
---@param start int @The index of the first character to select
---@param end_ int @The index of the last character to select
function LuaGuiElement.select(start, end_) end

--- Selects all the text in this textbox.
function LuaGuiElement.select_all() end

--- Sets the given string at the given index in this dropdown or listbox.
---@param index uint @The index whose text to replace.
---@param string LocalisedString @The text to set at the given index.
function LuaGuiElement.set_item(index, string) end

--- Sets whether this slider only allows being moved to discrete positions.
---@param value boolean
function LuaGuiElement.set_slider_discrete_slider(value) end

--- Sets whether this slider only allows discrete values.
---@param value boolean
function LuaGuiElement.set_slider_discrete_values(value) end

--- Sets this sliders minimum and maximum values.
---@param minimum double
---@param maximum double
function LuaGuiElement.set_slider_minimum_maximum(minimum, maximum) end

--- Sets the minimum distance this slider can move.
---@param value double
function LuaGuiElement.set_slider_value_step(value) end

--- Swaps the children at the given indices in this element.
---@param index_1 uint @The index of the first child.
---@param index_2 uint @The index of the second child.
function LuaGuiElement.swap_children(index_1, index_2) end

---@class LuaHeatBufferPrototype: any @Prototype of a heat buffer.
  ---@field connections HeatConnection[] @RW
  ---@field default_temperature double @RW
  ---@field max_temperature double @RW
  ---@field max_transfer double @RW
  ---@field min_temperature_gradient double @RW
  ---@field min_working_temperature double @RW
  ---@field minimum_glow_temperature double @RW
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field specific_heat double @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaHeatBufferPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaHeatBufferPrototype.help() end

---@class LuaHeatEnergySourcePrototype: any @Prototype of a heat energy source.
  ---@field connections HeatConnection[] @RW
  ---@field default_temperature double @RW
  ---@field emissions double @RW; The emissions of this energy source in `pollution/Joule`. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
  ---@field heat_buffer_prototype LuaHeatBufferPrototype @RW
  ---@field max_temperature double @RW
  ---@field max_transfer double @RW
  ---@field min_temperature_gradient double @RW
  ---@field min_working_temperature double @RW
  ---@field minimum_glow_temperature double @RW
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field render_no_network_icon boolean @RW
  ---@field render_no_power_icon boolean @RW
  ---@field specific_heat double @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaHeatEnergySourcePrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaHeatEnergySourcePrototype.help() end

---@class LuaInserterControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for inserters.
  ---@field circuit_hand_read_mode defines__control_behavior__inserter__hand_read_mode @RW; The hand read mode for the inserter.
  ---@field circuit_mode_of_operation defines__control_behavior__inserter__circuit_mode_of_operation @RW; The circuit mode of operations for the inserter.
  ---@field circuit_read_hand_contents boolean @RW; `true` if the contents of the inserter hand should be sent to the circuit network
  ---@field circuit_set_stack_size boolean @RW; If the stack size of the inserter is set through the circuit network or not.
  ---@field circuit_stack_control_signal SignalID @RW; The signal used to set the stack size of the inserter.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaInserterControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaInserterControlBehavior.help() end

---@class LuaInventory: any @A storage of item stacks.
  ---@field entity_owner LuaEntity @RW nilable; The entity that owns this inventory, if any.
  ---@field equipment_owner LuaEquipment @RW nilable; The equipment that owns this inventory, if any.
  ---@field index defines__inventory @RW nilable; The inventory index this inventory uses, if any.
  ---@field mod_owner string @RW nilable; The mod that owns this inventory, if any.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field player_owner LuaPlayer @RW nilable; The player that owns this inventory, if any.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaInventory = {}

--- Can at least some items be inserted?
---@param items ItemStackIdentification @Items that would be inserted.
---@return boolean @`true` if at least a part of the given items could be inserted into this inventory.
function LuaInventory.can_insert(items) end

--- If the given inventory slot filter can be set to the given filter.
---@param index uint @The item stack index
---@param filter string @The item name of the filter
---@return boolean
function LuaInventory.can_set_filter(index, filter) end

--- Make this inventory empty.
function LuaInventory.clear() end

--- Counts the number of empty stacks.
---@param include_filtered boolean|nil @If true, filtered slots will be included. Defaults to false.
---@overload fun(): uint
---@return uint
function LuaInventory.count_empty_stacks(include_filtered) end

--- Destroys this inventory.
function LuaInventory.destroy() end

--- Finds the first empty stack. Filtered slots are excluded unless a filter item is given.
---@param item string|nil @If given, empty stacks that are filtered for this item will be included.
---@overload fun(): LuaItemStack, uint
---@return LuaItemStack, uint @The first empty stack, or `nil` if there aren't any empty stacks.; The stack index of the matching stack, if any is found.
function LuaInventory.find_empty_stack(item) end

--- Finds the first LuaItemStack in the inventory that matches the given item name.
---@param item string @The item name to find
---@return LuaItemStack, uint @The first matching stack, or `nil` if none match.; The stack index of the matching stack, if any is found.
function LuaInventory.find_item_stack(item) end

--- Get the current bar. This is the index at which the red area starts.
---@return uint
function LuaInventory.get_bar() end

--- Get counts of all items in this inventory.
---@return table<string, uint> @The counts, indexed by item names.
function LuaInventory.get_contents() end

--- Gets the filter for the given item stack index.
---@param index uint @The item stack index
---@return string @The current filter or `nil` if none.
function LuaInventory.get_filter(index) end

--- Gets the number of the given item that can be inserted into this inventory.
---@param item string @The item to check.
function LuaInventory.get_insertable_count(item) end

--- Get the number of all or some items in this inventory.
---@param item string|nil @Prototype name of the item to count. If not specified, count all items.
---@overload fun(): uint
---@return uint
function LuaInventory.get_item_count(item) end

--- All methods and properties that this object supports.
---@return string
function LuaInventory.help() end

--- Insert items into this inventory.
---@param items ItemStackIdentification @Items to insert.
---@return uint @Number of items actually inserted.
function LuaInventory.insert(items) end

--- Does this inventory contain nothing?
---@return boolean
function LuaInventory.is_empty() end

--- If this inventory supports filters and has at least 1 filter set.
---@return boolean
function LuaInventory.is_filtered() end

--- Remove items from this inventory.
---@param items ItemStackIdentification @Items to remove.
---@return uint @Number of items actually removed.
function LuaInventory.remove(items) end

--- Resizes the inventory.
---@param size uint16 @New size of a inventory
function LuaInventory.resize(size) end

--- Set the current bar.
---@param bar uint|nil @The new limit. Omitting this parameter will clear the limit.
---@overload fun()
function LuaInventory.set_bar(bar) end

--- Sets the filter for the given item stack index.
---@param index uint @The item stack index.
---@param filter string | nil @The new filter. `nil` erases any existing filter.
---@return boolean @If the filter was allowed to be set.
function LuaInventory.set_filter(index, filter) end

--- Sorts and merges the items in this inventory.
function LuaInventory.sort_and_merge() end

--- Does this inventory support a bar? Bar is the draggable red thing, found for example on chests, that limits the portion of the inventory that may be manipulated by machines.
---@return boolean
function LuaInventory.supports_bar() end

--- If this inventory supports filters.
---@return boolean
function LuaInventory.supports_filters() end

---@class LuaItemPrototype: any @Prototype of an item.
  ---@field alt_entity_filter_mode string @RW nilable; The alt entity filter mode used by this selection tool.
  ---@field alt_entity_filters table<string, LuaEntityPrototype> @RW nilable; The alt entity filters used by this selection tool indexed by entity name.
  ---@field alt_entity_type_filters table<string, boolean> @RW nilable; The alt entity type filters used by this selection tool indexed by entity type.
  ---@field alt_selection_border_color Color @RW nilable; The color used when doing alt selection with this selection tool prototype.
  ---@field alt_selection_cursor_box_type string @RW nilable
  ---@field alt_selection_mode_flags SelectionModeFlags @RW nilable; Flags that affect which entities will be selected during alternate selection.
  ---@field alt_tile_filter_mode string @RW nilable; The alt tile filter mode used by this selection tool.
  ---@field alt_tile_filters table<string, LuaTilePrototype> @RW nilable; The alt tile filters used by this selection tool indexed by tile name.
  ---@field always_include_tiles boolean @RW nilable; If tiles area always included when doing selection with this selection tool prototype.
  ---@field attack_parameters AttackParameters @RW nilable; The gun attack parameters.
  ---@field burnt_result LuaItemPrototype @RW nilable; The result of burning this item as fuel, if any.
  ---@field can_be_mod_opened boolean @RW; If this item can be mod-opened.
  ---@field capsule_action CapsuleAction @RW nilable; The capsule action for this capsule item prototype.
  ---@field category string @RW nilable; The name of a [LuaModuleCategoryPrototype](LuaModuleCategoryPrototype). Used when upgrading modules: Ctrl + click modules into an entity and it will replace lower tier modules of the same category with higher tier modules.
  ---@field curved_rail LuaEntityPrototype @RW nilable; The curved rail prototype used for this rail planner prototype.
  ---@field default_label_color Color @RW nilable; The default label color used for this item with label, if any.
  ---@field default_request_amount uint @RW; The default request value.
  ---@field draw_label_for_cursor_render boolean @RW nilable; If true, and this item with label has a label it is drawn in place of the normal number when held in the cursor.
  ---@field durability double @RW nilable; The durability of this tool item.
  ---@field durability_description_key string @RW nilable; The durability message key used when displaying the durability of this tool.
  ---@field entity_filter_mode string @RW nilable; The entity filter mode used by this selection tool.
  ---@field entity_filter_slots uint @RW nilable; The number of entity filters this deconstruction item has.
  ---@field entity_filters table<string, LuaEntityPrototype> @RW nilable; The entity filters used by this selection tool indexed by entity name.
  ---@field entity_type_filters table<string, boolean> @RW nilable; The entity type filters used by this selection tool indexed by entity type.
  ---@field equipment_grid LuaEquipmentGridPrototype @RW nilable; The prototype of this armor equipment grid, if any.
  ---@field extend_inventory_by_default boolean @RW nilable; If this item with inventory extends the inventory it resides in by default.
  ---@field filter_mode string @RW nilable; The filter mode used by this item with inventory.
  ---@field flags ItemPrototypeFlags @RW; The flags for this item prototype.
  ---@field fuel_acceleration_multiplier double @RW; The acceleration multiplier when this item is used as fuel in a vehicle.
  ---@field fuel_category string @RW nilable; The fuel category of this item prototype, if any.
  ---@field fuel_emissions_multiplier double @RW; The emissions multiplier if this is used as fuel.
  ---@field fuel_top_speed_multiplier double @RW; The fuel top speed multiplier when this item is used as fuel in a vehicle.
  ---@field fuel_value float @RW; Fuel value when burned.
  ---@field group LuaGroup @RW; The group this prototype belongs to.
  ---@field infinite boolean @RW nilable; If this tool item has infinite durability.
  ---@field insertion_priority_mode string @RW nilable; The insertion priority mode used by this item with inventory.
  ---@field inventory_size uint @RW nilable; The main inventory size for item-with-inventory-prototype.
  ---@field inventory_size_bonus uint @RW nilable; The inventory size bonus for this armor prototype.
  ---@field item_filters table<string, LuaItemPrototype> @RW nilable
  ---@field item_group_filters table<string, LuaGroup> @RW nilable
  ---@field item_subgroup_filters table<string, LuaGroup> @RW nilable
  ---@field limitation_message_key string @RW nilable; The limitation message key used when the player attempts to use this modules in some place it's not allowed.
  ---@field limitations string[] @RW nilable; An array of recipe names this module is allowed to work with. Empty when all recipes are allowed.
  ---@field localised_description LocalisedString @RW
  ---@field localised_filter_message LocalisedString @RW nilable; The localised string used when the player attempts to put items into this item with inventory that aren't allowed.
  ---@field localised_name LocalisedString @RW
  ---@field magazine_size float @RW nilable; Size of full magazine.
  ---@field mapper_count uint @RW nilable; How many filters an upgrade item has.
  ---@field module_effects ModuleEffects @RW nilable; Effects of this module.
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field place_as_equipment_result LuaEquipmentPrototype @RW nilable; Prototype of the equipment that will be created by placing this item in an equipment grid, if any.
  ---@field place_as_tile_result PlaceAsTileResult @RW nilable; The place-as-tile result if one is defined, if any.
  ---@field place_result LuaEntityPrototype @RW nilable; Prototype of the entity that will be created by placing this item, if any.
  ---@field reload_time float @RW nilable; Amount of extra time (in ticks) it takes to reload the weapon after depleting the magazine.
  ---@field repair_result TriggerItem[] @RW nilable; The repair result of this repair tool prototype.
  ---@field resistances table<string, Resistance> @RW nilable; Resistances of this armor item, if any, indexed by damage type name.
  ---@field reverse_alt_entity_filter_mode string @RW nilable; The reverse entity filter mode used by this selection tool.
  ---@field reverse_entity_filters table<string, LuaEntityPrototype> @RW nilable; The reverse entity filters used by this selection tool indexed by entity name.
  ---@field reverse_entity_type_filters table<string, boolean> @RW nilable; The reverse entity type filters used by this selection tool indexed by entity type.
  ---@field reverse_selection_border_color Color @RW nilable; The color used when doing reverse selection with this selection tool prototype.
  ---@field reverse_selection_cursor_box_type string @RW nilable
  ---@field reverse_selection_mode_flags SelectionModeFlags @RW nilable; Flags that affect which entities will be selected during reverse selection.
  ---@field reverse_tile_filter_mode string @RW nilable; The reverse tile filter mode used by this selection tool.
  ---@field reverse_tile_filters table<string, LuaTilePrototype> @RW nilable; The reverse tile filters used by this selection tool indexed by tile name.
  ---@field rocket_launch_products Product[] @RW; The results of launching this item in a rocket.
  ---@field selection_border_color Color @RW nilable; The color used when doing normal selection with this selection tool prototype.
  ---@field selection_cursor_box_type string @RW nilable
  ---@field selection_mode_flags SelectionModeFlags @RW nilable; Flags that affect which entities will be selected.
  ---@field speed float @RW nilable; The repairing speed if this is a repairing tool.
  ---@field stack_size uint @RW; Maximum stack size of the item specified by this prototype.
  ---@field stackable boolean @RW; Is this item allowed to stack at all?
  ---@field straight_rail LuaEntityPrototype @RW nilable; The straight rail prototype used for this rail planner prototype.
  ---@field subgroup LuaGroup @RW; The subgroup this prototype belongs to.
  ---@field tier uint @RW nilable; Tier of the module inside its category. Used when upgrading modules: Ctrl + click modules into an entity and it will replace lower tier modules with higher tier modules if they have the same category.
  ---@field tile_filter_mode string @RW nilable; The tile filter mode used by this selection tool.
  ---@field tile_filter_slots uint @RW nilable; The number of tile filters this deconstruction item has.
  ---@field tile_filters table<string, LuaTilePrototype> @RW nilable; The tile filters used by this selection tool indexed by tile name.
  ---@field type string @RW; Type of this prototype. E.g. `"gun"` or `"mining-tool"`.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field wire_count uint @RW; The number of items needed to connect two entities with this as wire.
LuaItemPrototype = {}

--- The type of this ammo prototype.
---@param ammo_source_type string|nil @One of `"default"`, `"player"`, `"turret"`, or `"vehicle"`. Defaults to `"default"`.
---@overload fun(): AmmoType
---@return AmmoType
function LuaItemPrototype.get_ammo_type(ammo_source_type) end

--- Does this prototype have a flag enabled?
---@param flag string @The flag to check. Can be one of [ItemPrototypeFlags](ItemPrototypeFlags). Any other value will cause an error.
---@return boolean
function LuaItemPrototype.has_flag(flag) end

--- All methods and properties that this object supports.
---@return string
function LuaItemPrototype.help() end

---@class LuaItemStack: any @A reference to an item and count owned by some external entity.
  ---@field active_index uint @RW nilable; The active blueprint index for this blueprint book. `nil` if this blueprint book is empty.
  ---@field allow_manual_label_change boolean @RW; Whether the label for this item can be manually changed. When false the label can only be changed through the API.
  ---@field ammo uint @RW; Number of bullets left in the magazine.
  ---@field blueprint_absolute_snapping boolean @RW; If absolute snapping is enabled on this blueprint item.
  ---@field blueprint_icons BlueprintSignalIcon[] @RW nilable; Icons of this blueprint item, blueprint book, deconstruction item or upgrade planner. An item that doesn't have icons returns `nil` on read and throws error on write.
  ---@field blueprint_position_relative_to_grid TilePosition @RW nilable; The offset from the absolute grid. `nil` if absolute snapping is not enabled.
  ---@field blueprint_snap_to_grid TilePosition @RW nilable; The snapping grid size in this blueprint item. `nil` if snapping is not enabled.
  ---@field connected_entity LuaEntity @RW nilable; If this item is a spidertron remote that has a spidertron bound to it, it returns the connected spider-vehicle entity.
  ---@field cost_to_build table<string, uint> @RW; Raw materials required to build this blueprint. Result is a dictionary mapping each item prototype name to the required count.
  ---@field count uint @RW; Number of items in this stack.
  ---@field custom_description LocalisedString @RW; The custom description this item-with-tags. This is shown over the normal item description if this is set to a non-empty value.
  ---@field default_icons BlueprintItemIcon[] @RW; The default icons for a blueprint item.
  ---@field durability double @RW nilable; Durability of the contained item. Automatically capped at the item's maximum durability.
  ---@field entity_filter_count uint @RW; The number of entity filters this deconstruction item supports.
  ---@field entity_filter_mode defines__deconstruction_item__entity_filter_mode @RW; The blacklist/whitelist entity filter mode for this deconstruction item.
  ---@field entity_filters string[] @RW; The entity filters for this deconstruction item. The attribute is a sparse array with the keys representing the index of the filter. All strings in this array must be entity prototype names that don't have the `"not-deconstructable"` flag set and are either a `cliff` or marked as `minable`.
  ---@field extends_inventory boolean @RW; If this item extends the inventory it resides in (provides its contents for counts, crafting, insertion). Only callable on items with inventories.
  ---@field grid LuaEquipmentGrid @RW nilable; The equipment grid of this item, if any.
  ---@field health float @RW; How much health the item has, as a number in range [0, 1].
  ---@field is_armor boolean @RW; If this is an armor item.
  ---@field is_blueprint boolean @RW; If this is a blueprint item.
  ---@field is_blueprint_book boolean @RW; If this is a blueprint book item.
  ---@field is_deconstruction_item boolean @RW; If this is a deconstruction tool item.
  ---@field is_item_with_entity_data boolean @RW; If this is an item with entity data item.
  ---@field is_item_with_inventory boolean @RW; If this is an item with inventory item.
  ---@field is_item_with_label boolean @RW; If this is an item with label item.
  ---@field is_item_with_tags boolean @RW; If this is an item with tags item.
  ---@field is_mining_tool boolean @RW; If this is a mining tool item.
  ---@field is_module boolean @RW; If this is a module item.
  ---@field is_repair_tool boolean @RW; If this is a repair tool item.
  ---@field is_selection_tool boolean @RW; If this is a selection tool item.
  ---@field is_tool boolean @RW; If this is a tool item.
  ---@field is_upgrade_item boolean @RW; If this is a upgrade item.
  ---@field item_number uint @RW nilable; The unique identifier for this item , if any. Note that this ID stays the same no matter where the item is moved to. Only these types of items have unique IDs: - `"armor"` - `"spidertron-remote"` - `"selection-tool"` - `"copy-paste-tool"` - `"upgrade-item"` - `"deconstruction-item"` - `"blueprint"` - `"blueprint-book"` - `"item-with-entity-data"` - `"item-with-inventory"` - `"item-with-tags"`
  ---@field label string @RW nilable; The current label for this item, if any.
  ---@field label_color Color @RW nilable; The current label color for this item, if any.
  ---@field name string @RW; Prototype name of the item held in this stack.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field prioritize_insertion_mode string @RW; The insertion mode priority this ItemWithInventory uses when items are inserted into an inventory it resides in. Only callable on items with inventories.
  ---@field prototype LuaItemPrototype @RW; Prototype of the item held in this stack.
  ---@field tags Tags @RW
  ---@field tile_filter_count uint @RW; The number of tile filters this deconstruction item supports.
  ---@field tile_filter_mode defines__deconstruction_item__tile_filter_mode @RW; The blacklist/whitelist tile filter mode for this deconstruction item.
  ---@field tile_filters string[] @RW; The tile filters for this deconstruction item. The attribute is a sparse array with the keys representing the index of the filter. All strings in this array must be tile prototype names.
  ---@field tile_selection_mode defines__deconstruction_item__tile_selection_mode @RW; The tile selection mode for this deconstruction item.
  ---@field trees_and_rocks_only boolean @RW; If this deconstruction item is set to allow trees and rocks only.
  ---@field type string @RW; Type of the item prototype.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field valid_for_read boolean @RW; Is this valid for reading? Differs from the usual `valid` in that `valid` will be `true` even if the item stack is blank but the entity that holds it is still valid.
LuaItemStack = {}

--- Add ammo to this ammo item.
---@param amount float @Amount of ammo to add.
function LuaItemStack.add_ammo(amount) end

--- Add durability to this tool item.
---@param amount double @Amount of durability to add.
function LuaItemStack.add_durability(amount) end

---@shape LuaItemStack_build_blueprint_params
   ---@field surface SurfaceIdentification @Surface to build on
   ---@field force ForceIdentification @Force to use for the building
   ---@field position MapPosition @The position to build at
   ---@field force_build boolean|nil @When true, anything that can be built is else nothing is built if any one thing can't be built
   ---@field direction defines__direction|nil @The direction to use when building
   ---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
   ---@field by_player PlayerIdentification|nil @The player to use if any. If provided [defines.events.on_built_entity](defines.events.on_built_entity) will also be fired on successful entity creation.
   ---@field raise_built boolean|nil @If true; [defines.events.script_raised_built](defines.events.script_raised_built) will be fired on successful entity creation. Note: this is ignored if by_player is provided.

---@param p LuaItemStack_build_blueprint_params
---@return LuaEntity[] @Array of created ghosts
function LuaItemStack.build_blueprint(p) end

--- Would a call to [LuaItemStack::set_stack](LuaItemStack::set_stack) succeed?
---@param stack ItemStackIdentification|nil @Stack that would be set, possibly `nil`.
---@overload fun(): boolean
---@return boolean
function LuaItemStack.can_set_stack(stack) end

---@shape LuaItemStack_cancel_deconstruct_area_params
   ---@field surface SurfaceIdentification @Surface to cancel deconstruct on
   ---@field force ForceIdentification @Force to use for canceling deconstruction
   ---@field area BoundingBox @The area to deconstruct
   ---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
   ---@field by_player PlayerIdentification|nil @The player to use if any.

--- Cancel deconstruct the given area with this deconstruction item.
---@param p LuaItemStack_cancel_deconstruct_area_params
function LuaItemStack.cancel_deconstruct_area(p) end

--- Clear this item stack.
function LuaItemStack.clear() end

--- Clears this blueprint item.
function LuaItemStack.clear_blueprint() end

--- Clears all settings/filters on this deconstruction item resetting it to default values.
function LuaItemStack.clear_deconstruction_item() end

--- Clears all settings/filters on this upgrade item resetting it to default values.
function LuaItemStack.clear_upgrade_item() end

---@shape LuaItemStack_create_blueprint_params
   ---@field surface SurfaceIdentification @Surface to create from
   ---@field force ForceIdentification @Force to use for the creation
   ---@field area BoundingBox @The bounding box
   ---@field always_include_tiles boolean|nil @When true, blueprintable tiles are always included in the blueprint. When false they're only included if no entities exist in the setup area.
   ---@field include_entities boolean|nil @When true, entities are included in the blueprint. Defaults to true.
   ---@field include_modules boolean|nil @When true, modules are included in the blueprint. Defaults to true.
   ---@field include_station_names boolean|nil @When true, station names are included in the blueprint. Defaults to false.
   ---@field include_trains boolean|nil @When true, trains are included in the blueprint. Defaults to false.
   ---@field include_fuel boolean|nil @When true, train fuel is included in the blueprint, Defaults to true.

--- Sets up this blueprint using the found blueprintable entities/tiles on the surface.
---@param p LuaItemStack_create_blueprint_params
---@return table<uint, LuaEntity> @The blueprint entity index to source entity mapping.
function LuaItemStack.create_blueprint(p) end

--- Creates the equipment grid for this item if it doesn't exist and this is an item-with-entity-data that supports equipment grids.
---@return LuaEquipmentGrid
function LuaItemStack.create_grid() end

---@shape LuaItemStack_deconstruct_area_params
   ---@field surface SurfaceIdentification @Surface to deconstruct on
   ---@field force ForceIdentification @Force to use for the deconstruction
   ---@field area BoundingBox @The area to deconstruct
   ---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
   ---@field by_player PlayerIdentification|nil @The player to use if any.

--- Deconstruct the given area with this deconstruction item.
---@param p LuaItemStack_deconstruct_area_params
function LuaItemStack.deconstruct_area(p) end

--- Remove ammo from this ammo item.
---@param amount float @Amount of ammo to remove.
function LuaItemStack.drain_ammo(amount) end

--- Remove durability from this tool item.
---@param amount double @Amount of durability to remove.
function LuaItemStack.drain_durability(amount) end

--- Export a supported item (blueprint, blueprint-book, deconstruction-planner, upgrade-planner, item-with-tags) to a string.
---@return string @The exported string
function LuaItemStack.export_stack() end

--- The entities in this blueprint.
---@return BlueprintEntity[]
function LuaItemStack.get_blueprint_entities() end

--- Gets the number of entities in this blueprint item.
---@return uint
function LuaItemStack.get_blueprint_entity_count() end

--- Gets the given tag on the given blueprint entity index in this blueprint item.
---@param index uint @The entity index.
---@param tag string @The tag to get.
---@return AnyBasic
function LuaItemStack.get_blueprint_entity_tag(index, tag) end

--- Gets the tags for the given blueprint entity index in this blueprint item.
---@param index uint
---@return Tags
function LuaItemStack.get_blueprint_entity_tags(index) end

--- A list of the tiles in this blueprint.
---@return Tile[]
function LuaItemStack.get_blueprint_tiles() end

--- Gets the entity filter at the given index for this deconstruction item.
---@param index uint
---@return string
function LuaItemStack.get_entity_filter(index) end

--- Access the inner inventory of an item.
---@param inventory defines__inventory @Index of the inventory to access, which can only be [defines.inventory.item_main](defines.inventory.item_main).
---@return LuaInventory @`nil` if there is no inventory with the given index.
function LuaItemStack.get_inventory(inventory) end

--- Gets the filter at the given index for this upgrade item.
---@param index uint @The index of the mapper to read.
---@param type string @`"from"` or `"to"`.
---@return UpgradeFilter
function LuaItemStack.get_mapper(index, type) end

--- Gets the tag with the given name or returns `nil` if it doesn't exist.
---@param tag_name string
---@return AnyBasic
function LuaItemStack.get_tag(tag_name) end

--- Gets the tile filter at the given index for this deconstruction item.
---@param index uint
---@return string
function LuaItemStack.get_tile_filter(index) end

--- All methods and properties that this object supports.
---@return string
function LuaItemStack.help() end

--- Import a supported item (blueprint, blueprint-book, deconstruction-planner, upgrade-planner, item-with-tags) from a string.
---@param data string @The string to import
---@return int @0 if the import succeeded with no errors. -1 if the import succeeded with errors. 1 if the import failed.
function LuaItemStack.import_stack(data) end

--- Is this blueprint item setup? I.e. is it a non-empty blueprint?
---@return boolean
function LuaItemStack.is_blueprint_setup() end

--- Removes a tag with the given name.
---@param tag string
---@return boolean @If the tag existed and was removed.
function LuaItemStack.remove_tag(tag) end

--- Set new entities to be a part of this blueprint.
---@param entities BlueprintEntity[] @The new blueprint entities.
function LuaItemStack.set_blueprint_entities(entities) end

--- Sets the given tag on the given blueprint entity index in this blueprint item.
---@param index uint @The entity index.
---@param tag string @The tag to set.
---@param value AnyBasic @The tag value to set or `nil` to clear the tag.
function LuaItemStack.set_blueprint_entity_tag(index, tag, value) end

--- Sets the tags on the given blueprint entity index in this blueprint item.
---@param index uint @The entity index
---@param tags Tags
function LuaItemStack.set_blueprint_entity_tags(index, tags) end

--- Set specific tiles in this blueprint.
---@param tiles Tile[] @Tiles to be a part of the blueprint.
function LuaItemStack.set_blueprint_tiles(tiles) end

--- Sets the entity filter at the given index for this deconstruction item.
---@param index uint
---@param filter string | LuaEntityPrototype | LuaEntity | nil @Writing `nil` removes the filter.
---@return boolean @Whether the new filter was successfully set (ie. was valid).
function LuaItemStack.set_entity_filter(index, filter) end

--- Sets the module filter at the given index for this upgrade item.
---@param index uint @The index of the mapper to set.
---@param type string @`from` or `to`.
---@param filter UpgradeFilter @The filter to set or `nil`
function LuaItemStack.set_mapper(index, type, filter) end

--- Set this item stack to another item stack.
---@param stack ItemStackIdentification|nil @Item stack to set it to. Omitting this parameter or passing `nil` will clear this item stack, as if [LuaItemStack::clear](LuaItemStack::clear) was called.
---@overload fun(): boolean
---@return boolean @Whether the stack was set successfully. Returns `false` if this stack was not [valid for write](LuaItemStack::can_set_stack).
function LuaItemStack.set_stack(stack) end

--- Sets the tag with the given name and value.
---@param tag_name string
---@param tag AnyBasic
function LuaItemStack.set_tag(tag_name, tag) end

--- Sets the tile filter at the given index for this deconstruction item.
---@param index uint
---@param filter string | LuaTilePrototype | LuaTile @Setting to nil erases the filter.
---@return boolean @Whether the new filter was successfully set (ie. was valid).
function LuaItemStack.set_tile_filter(index, filter) end

--- Swaps this item stack with the given item stack if allowed.
---@param stack LuaItemStack
---@return boolean @Whether the 2 stacks were swapped successfully.
function LuaItemStack.swap_stack(stack) end

--- Transfers the given item stack into this item stack.
---@param stack ItemStackIdentification
---@return boolean @`true` if the full stack was transferred.
function LuaItemStack.transfer_stack(stack) end

---@class LuaLampControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for lamps.
  ---@field color Color @RW nilable; The color the lamp is showing, if any.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field use_colors boolean @RW; `true` if the lamp should set the color from the circuit network signals.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLampControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaLampControlBehavior.help() end

---@class LuaLazyLoadedValue: any @A lazily loaded value. For performance reasons, we sometimes return a custom lazily-loaded value type instead of the native Lua value. This custom type lazily constructs the necessary value when [LuaLazyLoadedValue::get](LuaLazyLoadedValue::get) is called, therefore preventing its unnecessary construction in some cases. An instance of LuaLazyLoadedValue is only valid during the event it was created from and cannot be saved.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLazyLoadedValue = {}

--- Gets the value of this lazy loaded value.
---@return Any
function LuaLazyLoadedValue.get() end

--- All methods and properties that this object supports.
---@return string
function LuaLazyLoadedValue.help() end

---@class LuaLogisticCell: any @Logistic cell of a particular [LuaEntity](LuaEntity). A "Logistic Cell" is the given name for settings and properties used by what would normally be seen as a "Roboport". A logistic cell however doesn't have to be attached to the roboport entity (the character has one for the personal roboport).
  ---@field charge_approach_distance float @RW; Radius at which the robots hover when waiting to be charged.
  ---@field charging_robot_count uint @RW; Number of robots currently charging.
  ---@field charging_robots LuaEntity[] @RW; Robots currently being charged.
  ---@field construction_radius float @RW; Construction radius of this cell.
  ---@field logistic_network LuaLogisticNetwork @RW nilable; The network that owns this cell, if any.
  ---@field logistic_radius float @RW; Logistic radius of this cell.
  ---@field logistics_connection_distance float @RW; Logistic connection distance of this cell.
  ---@field mobile boolean @RW; `true` if this is a mobile cell. In vanilla, only the logistic cell created by a character's personal roboport is mobile.
  ---@field neighbours LuaLogisticCell[] @RW; Neighbouring cells.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field owner LuaEntity @RW; This cell's owner.
  ---@field stationed_construction_robot_count uint @RW; Number of stationed construction robots in this cell.
  ---@field stationed_logistic_robot_count uint @RW; Number of stationed logistic robots in this cell.
  ---@field to_charge_robot_count uint @RW; Number of robots waiting to charge.
  ---@field to_charge_robots LuaEntity[] @RW; Robots waiting to charge.
  ---@field transmitting boolean @RW; `true` if this cell is active.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLogisticCell = {}

--- All methods and properties that this object supports.
---@return string
function LuaLogisticCell.help() end

--- Is a given position within the construction range of this cell?
---@param position MapPosition
---@return boolean
function LuaLogisticCell.is_in_construction_range(position) end

--- Is a given position within the logistic range of this cell?
---@param position MapPosition
---@return boolean
function LuaLogisticCell.is_in_logistic_range(position) end

--- Are two cells neighbours?
---@param other LuaLogisticCell
---@return boolean
function LuaLogisticCell.is_neighbour_with(other) end

---@class LuaLogisticContainerControlBehavior: LuaControlBehavior @Control behavior for logistic chests.
  ---@field circuit_mode_of_operation defines__control_behavior__logistic_container__circuit_mode_of_operation @RW; The circuit mode of operations for the logistic container.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLogisticContainerControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaLogisticContainerControlBehavior.help() end

---@class LuaLogisticNetwork: any @A single logistic network of a given force on a given surface.
  ---@field active_provider_points LuaLogisticPoint[] @RW; All active provider points in this network.
  ---@field all_construction_robots uint @RW; The total number of construction robots in the network (idle and active + in roboports).
  ---@field all_logistic_robots uint @RW; The total number of logistic robots in the network (idle and active + in roboports).
  ---@field available_construction_robots uint @RW; Number of construction robots available for a job.
  ---@field available_logistic_robots uint @RW; Number of logistic robots available for a job.
  ---@field cells LuaLogisticCell[] @RW; All cells in this network.
  ---@field construction_robots LuaEntity[] @RW; All construction robots in this logistic network.
  ---@field empty_provider_points LuaLogisticPoint[] @RW; All things that have empty provider points in this network.
  ---@field empty_providers LuaEntity[] @RW; All entities that have empty logistic provider points in this network.
  ---@field force LuaForce @RW; The force this logistic network belongs to.
  ---@field logistic_members LuaEntity[] @RW; All other entities that have logistic points in this network (inserters mostly).
  ---@field logistic_robots LuaEntity[] @RW; All logistic robots in this logistic network.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field passive_provider_points LuaLogisticPoint[] @RW; All passive provider points in this network.
  ---@field provider_points LuaLogisticPoint[] @RW; All things that have provider points in this network.
  ---@field providers LuaEntity[] @RW; All entities that have logistic provider points in this network.
  ---@field requester_points LuaLogisticPoint[] @RW; All things that have requester points in this network.
  ---@field requesters LuaEntity[] @RW; All entities that have logistic requester points in this network.
  ---@field robot_limit uint @RW; Maximum number of robots the network can work with. Currently only used for the personal roboport.
  ---@field robots LuaEntity[] @RW; All robots in this logistic network.
  ---@field storage_points LuaLogisticPoint[] @RW; All things that have storage points in this network.
  ---@field storages LuaEntity[] @RW; All entities that have logistic storage points in this network.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLogisticNetwork = {}

--- Can the network satisfy a request for a given item and count.
---@param item string @Item name to check.
---@param count uint|nil @Count to check. Defaults to 1.
---@param include_buffers boolean|nil @Should buffers be considered? Defaults to false.
---@overload fun(item: string, count: uint|nil): boolean
---@overload fun(item: string): boolean
---@return boolean @Whether the network can satisfy the request.
function LuaLogisticNetwork.can_satisfy_request(item, count, include_buffers) end

--- Find logistic cell closest to a given position.
---@param position MapPosition
---@return LuaLogisticCell @`nil` if no cell was found.
function LuaLogisticNetwork.find_cell_closest_to(position) end

--- Get item counts for the entire network, similar to how [LuaInventory::get_contents](LuaInventory::get_contents) does.
---@return table<string, uint> @A mapping of item prototype names to the number available in the network.
function LuaLogisticNetwork.get_contents() end

--- Count given or all items in the network or given members.
---@param item string|nil @Item name to count. If not given, gives counts of all items in the network.
---@param member string|nil @Logistic members to check, must be either `"storage"` or `"providers"`. If not given, gives count in the entire network.
---@overload fun(item: string|nil): int
---@overload fun(): int
---@return int
function LuaLogisticNetwork.get_item_count(item, member) end

--- Get the amount of items of the given type indexed by the storage member.
---@param item string @Item name to check.
---@return table<string, uint> @A mapping of member types ("storage", "passive-provider", "buffer", "active-provider") to the number available in the members.
function LuaLogisticNetwork.get_supply_counts(item) end

--- Gets the logistic points with of the given type indexed by the storage member.
---@param item string @Item name to check.
---@return table<string, LuaLogisticPoint[]> @A mapping of member types ("storage", "passive-provider", "buffer", "active-provider") to an array of LuaLogisticPoint.
function LuaLogisticNetwork.get_supply_points(item) end

--- All methods and properties that this object supports.
---@return string
function LuaLogisticNetwork.help() end

--- Insert items into the logistic network. This will actually insert the items into some logistic chests.
---@param item ItemStackIdentification @What to insert.
---@param members string|nil @Which logistic members to insert the items to. Must be `"storage"`, `"storage-empty"` (storage chests that are completely empty), `"storage-empty-slot"` (storage chests that have an empty slot), or `"requester"`. If not specified, inserts items into the logistic network in the usual order.
---@overload fun(item: ItemStackIdentification): uint
---@return uint @Number of items actually inserted.
function LuaLogisticNetwork.insert(item, members) end

--- Remove items from the logistic network. This will actually remove the items from some logistic chests.
---@param item ItemStackIdentification @What to remove.
---@param members string|nil @Which logistic members to remove from. Must be `"storage"`, `"passive-provider"`, `"buffer"`, or `"active-provider"`. If not specified, removes from the network in the usual order.
---@overload fun(item: ItemStackIdentification): uint
---@return uint @Number of items removed.
function LuaLogisticNetwork.remove_item(item, members) end

---@shape LuaLogisticNetwork_select_drop_point_params
   ---@field stack ItemStackIdentification @Name of the item to select.
   ---@field members string|nil @When given, it will find from only the specific type of member. Must be `"storage"`, `"storage-empty"`, `"storage-empty-slot"` or `"requester"`. If not specified, selects with normal priorities.

--- Find a logistic point to drop the specific item stack.
---@param p LuaLogisticNetwork_select_drop_point_params
---@return LuaLogisticPoint @`nil` if no point was found.
function LuaLogisticNetwork.select_drop_point(p) end

---@shape LuaLogisticNetwork_select_pickup_point_params
   ---@field name string @Name of the item to select.
   ---@field position MapPosition|nil @When given, it will find the storage 'best' storage point from this position.
   ---@field include_buffers boolean|nil @Whether to consider buffer chests or not. Defaults to false. Only considered if selecting with position.
   ---@field members string|nil @When given, it will find from only the specific type of member. Must be `"storage"`, `"passive-provider"`, `"buffer"` or `"active-provider"`. If not specified, selects with normal priorities. Not considered if position is specified.

--- Find the 'best' logistic point with this item ID and from the given position or from given chest type.
---@param p LuaLogisticNetwork_select_pickup_point_params
---@return LuaLogisticPoint @`nil` if no point was found.
function LuaLogisticNetwork.select_pickup_point(p) end

---@class LuaLogisticPoint: any @Logistic point of a particular [LuaEntity](LuaEntity). A "Logistic point" is the name given for settings and properties used by requester, provider, and storage points in a given logistic network. These "points" don't have to be a logistic container but often are. One other entity that can own several points is the "character" character type entity.
  ---@field exact boolean @RW; If this logistic point is using the exact mode. In exact mode robots never over-deliver requests.
  ---@field filters LogisticFilter[] @RW nilable; The logistic filters for this logistic point, if this uses any.
  ---@field force LuaForce @RW; The force of this logistic point.
  ---@field logistic_member_index uint @RW; The Logistic member index of this logistic point.
  ---@field logistic_network LuaLogisticNetwork @RW
  ---@field mode defines__logistic_mode @RW; The logistic mode.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field owner LuaEntity @RW; The [LuaEntity](LuaEntity) owner of this [LuaLogisticPoint](LuaLogisticPoint).
  ---@field targeted_items_deliver table<string, uint> @RW; Items targeted to be dropped off into this logistic point by robots. The attribute is a dictionary mapping the item prototype names to their item counts.
  ---@field targeted_items_pickup table<string, uint> @RW; Items targeted to be picked up from this logistic point by robots. The attribute is a dictionary mapping the item prototype names to their item counts.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLogisticPoint = {}

--- All methods and properties that this object supports.
---@return string
function LuaLogisticPoint.help() end

---@class LuaMiningDrillControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for mining drills.
  ---@field circuit_enable_disable boolean @RW; `true` if this drill is enabled or disabled using the logistics or circuit condition.
  ---@field circuit_read_resources boolean @RW; `true` if this drill should send the resources in the field to the circuit network. Which resources depends on [LuaMiningDrillControlBehavior::resource_read_mode](LuaMiningDrillControlBehavior::resource_read_mode)
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field resource_read_mode defines__control_behavior__mining_drill__resource_read_mode @RW; If the mining drill should send just the resources in its area or the entire field it's on to the circuit network.
  ---@field resource_read_targets LuaEntity[] @RW; The resource entities that the mining drill will send information about to the circuit network or an empty array.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaMiningDrillControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaMiningDrillControlBehavior.help() end

---@class LuaModSettingPrototype: any @Prototype of a mod setting.
  ---@field allow_blank boolean @RW nilable; Whether this string setting allows blank values. `nil` if not a string setting.
  ---@field allowed_values string[] | int[] | double[] @RW nilable; The allowed values for this setting. `nil` if this setting doesn't use the a fixed set of values.
  ---@field auto_trim boolean @RW nilable; Whether this string setting auto-trims values. `nil` if not a string setting
  ---@field default_value boolean | double | int | string @RW; The default value of this setting.
  ---@field hidden boolean @RW; Whether this setting is hidden from the GUI.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field maximum_value double | int @RW nilable; The maximum value for this setting. `nil` if this setting type doesn't support a maximum.
  ---@field minimum_value double | int @RW nilable; The minimum value for this setting. `nil` if this setting type doesn't support a minimum.
  ---@field mod string @RW; The mod that owns this setting.
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field setting_type string @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaModSettingPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaModSettingPrototype.help() end

---@class LuaModuleCategoryPrototype: any @Prototype of a module category.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaModuleCategoryPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaModuleCategoryPrototype.help() end

---@class LuaNamedNoiseExpression: any @Prototype of a named noise expression.
  ---@field expression NoiseExpression @RW; The expression itself.
  ---@field intended_property string @RW; Name of the property that this expression is intended to provide a value for, if any.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaNamedNoiseExpression = {}

--- All methods and properties that this object supports.
---@return string
function LuaNamedNoiseExpression.help() end

---@class LuaNoiseLayerPrototype: any @Prototype of a noise layer.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaNoiseLayerPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaNoiseLayerPrototype.help() end

---@class LuaParticlePrototype: any @Prototype of an optimized particle.
  ---@field ended_in_water_trigger_effect TriggerEffectItem @RW
  ---@field life_time uint @RW
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field mining_particle_frame_speed float @RW
  ---@field movement_modifier float @RW
  ---@field movement_modifier_when_on_ground float @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field regular_trigger_effect TriggerEffectItem @RW
  ---@field regular_trigger_effect_frequency uint @RW
  ---@field render_layer RenderLayer @RW
  ---@field render_layer_when_on_ground RenderLayer @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaParticlePrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaParticlePrototype.help() end

---@class LuaPermissionGroup: any @A permission group that defines what players in this group are allowed to do.
  ---@field group_id uint @RW; The group ID
  ---@field name string @RW; The name of this group.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field players LuaPlayer[] @RW; The players in this group.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaPermissionGroup = {}

--- Adds the given player to this group.
---@param player PlayerIdentification
---@return boolean @Whether the player was added.
function LuaPermissionGroup.add_player(player) end

--- Whether this group allows the given action.
---@param action defines__input_action @The action in question.
---@return boolean
function LuaPermissionGroup.allows_action(action) end

--- Destroys this group.
---@return boolean @Whether the group was successfully destroyed.
function LuaPermissionGroup.destroy() end

--- All methods and properties that this object supports.
---@return string
function LuaPermissionGroup.help() end

--- Removes the given player from this group.
---@param player PlayerIdentification
---@return boolean @Whether the player was removed.
function LuaPermissionGroup.remove_player(player) end

--- Sets whether this group allows the performance the given action.
---@param action defines__input_action @The action in question.
---@param allow_action boolean @Whether to allow the specified action.
---@return boolean @Whether the value was successfully applied.
function LuaPermissionGroup.set_allows_action(action, allow_action) end

---@class LuaPermissionGroups: any @All permission groups.
  ---@field groups LuaPermissionGroup[] @RW; All of the permission groups.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaPermissionGroups = {}

--- Creates a new permission group.
---@param name string|nil
---@overload fun(): LuaPermissionGroup
---@return LuaPermissionGroup @`nil` if the calling player doesn't have permission to make groups.
function LuaPermissionGroups.create_group(name) end

--- Gets the permission group with the given name or group ID.
---@param group string | uint
---@return LuaPermissionGroup @`nil` if there is no matching group.
function LuaPermissionGroups.get_group(group) end

--- All methods and properties that this object supports.
---@return string
function LuaPermissionGroups.help() end

---@class LuaPlayer: LuaControl @A player in the game. Pay attention that a player may or may not have a character, which is the [LuaEntity](LuaEntity) of the little guy running around the world doing things.
  ---@field admin boolean @RW; `true` if the player is an admin.
  ---@field afk_time uint @RW; How many ticks since the last action of this player
  ---@field auto_sort_main_inventory boolean @RW; If the main inventory will be auto sorted.
  ---@field blueprint_to_setup LuaItemStack @RW; The item stack containing a blueprint to be setup.
  ---@field character LuaEntity @RW nilable; The character attached to this player, if any. Returns `nil` when the player is disconnected (see [LuaPlayer::connected](LuaPlayer::connected)).
  ---@field chat_color Color @RW; The color used when this player talks in game.
  ---@field color Color @RW; The color associated with the player. This will be used to tint the player's character as well as their buildings and vehicles.
  ---@field connected boolean @RW; `true` if the player is currently connected to the game.
  ---@field controller_type defines__controllers @RW
  ---@field cutscene_character LuaEntity @RW nilable; When in a cutscene; the character this player would be using once the cutscene is over, if any. Returns `nil` when the player is disconnected (see [LuaPlayer::connected](LuaPlayer::connected)).
  ---@field display_resolution DisplayResolution @RW; The display resolution for this player.
  ---@field display_scale double @RW; The display scale for this player.
  ---@field entity_copy_source LuaEntity @RW nilable; The source entity used during entity settings copy-paste, if any.
  ---@field game_view_settings GameViewSettings @RW; The player's game view settings.
  ---@field gui LuaGui @RW
  ---@field hand_location ItemStackLocation @RW nilable; The original location of the item in the cursor, marked with a hand. `nil` if the cursor stack is empty. When writing, the specified inventory slot must be empty and the cursor stack must not be empty.
  ---@field index uint @RW; This player's unique index in [LuaGameScript::players](LuaGameScript::players). It is given to them when they are [created](on_player_created) and remains assigned to them until they are [removed](on_player_removed).
  ---@field infinity_inventory_filters InfinityInventoryFilter[] @RW; The filters for this map editor infinity inventory settings.
  ---@field last_online uint @RW; At what tick this player was last online.
  ---@field map_view_settings MapViewSettings @The player's map view settings. To write to this, use a table containing the fields that should be changed.
  ---@field minimap_enabled boolean @RW; `true` if the minimap is visible.
  ---@field mod_settings table<string, ModSetting> @RW; The current per-player settings for the this player, indexed by prototype name. Returns the same structure as [LuaSettings::get_player_settings](LuaSettings::get_player_settings).
  ---@field name string @RW; The player's username.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field online_time uint @RW; How many ticks did this player spend playing this save (all sessions combined)
  ---@field opened_self boolean @RW; `true` if the player opened itself. I.e. if they opened the character or god-controller GUI.
  ---@field permission_group LuaPermissionGroup @RW nilable; The permission group this player is part of, if any.
  ---@field remove_unfiltered_items boolean @RW; If items not included in this map editor infinity inventory filters should be removed.
  ---@field render_mode defines__render_mode @RW; The render mode of the player, like map or zoom to world. The render mode can be set using [LuaPlayer::open_map](LuaPlayer::open_map), [LuaPlayer::zoom_to_world](LuaPlayer::zoom_to_world) and [LuaPlayer::close_map](LuaPlayer::close_map).
  ---@field show_on_map boolean @RW; If `true`, circle and name of given player is rendered on the map/chart.
  ---@field spectator boolean @RW; If `true`, zoom-to-world noise effect will be disabled and environmental sounds will be based on zoom-to-world view instead of position of player's character.
  ---@field stashed_controller_type defines__controllers @RW nilable; The stashed controller type, if any.
  ---@field tag string @RW; The tag that is shown after the player in chat and on the map.
  ---@field ticks_to_respawn uint @RW nilable; The number of ticks until this player will respawn. `nil` if this player is not waiting to respawn. Set to `nil` to immediately respawn the player.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field zoom double @The player's zoom-level.
LuaPlayer = {}

--- Gets a copy of the currently selected blueprint in the clipboard queue into the player's cursor, as if the player activated Paste.
function LuaPlayer.activate_paste() end

--- Adds an alert to this player for the given entity of the given alert type.
---@param entity LuaEntity
---@param type defines__alert_type
function LuaPlayer.add_alert(entity, type) end

--- Adds a custom alert to this player.
---@param entity LuaEntity @If the alert is clicked, the map will open at the position of this entity.
---@param icon SignalID
---@param message LocalisedString
---@param show_on_map boolean
function LuaPlayer.add_custom_alert(entity, icon, message, show_on_map) end

--- Adds the given recipe to the list of recipe notifications for this player.
---@param recipe string @Name of the recipe prototype to add.
function LuaPlayer.add_recipe_notification(recipe) end

--- Adds the given blueprint to this player's clipboard queue.
---@param blueprint LuaItemStack @The blueprint to add.
function LuaPlayer.add_to_clipboard(blueprint) end

--- Associates a character with this player.
---@param character LuaEntity @The character entity.
function LuaPlayer.associate_character(character) end

---@shape LuaPlayer_build_from_cursor_params
   ---@field position MapPosition @Where the entity would be placed
   ---@field direction defines__direction|nil @Direction the entity would be placed
   ---@field alt boolean|nil @If alt build should be used instead of normal build. Defaults to normal.
   ---@field terrain_building_size uint|nil @The size for building terrain if building terrain. Defaults to 2.
   ---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.

--- Builds what ever is in the cursor on the surface the player is on.
---@param p LuaPlayer_build_from_cursor_params
function LuaPlayer.build_from_cursor(p) end

---@shape LuaPlayer_can_build_from_cursor_params
   ---@field position MapPosition @Where the entity would be placed
   ---@field direction defines__direction|nil @Direction the entity would be placed
   ---@field alt boolean|nil @If alt build should be used instead of normal build. Defaults to normal.
   ---@field terrain_building_size uint|nil @The size for building terrain if building terrain. Defaults to 2.
   ---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.

--- Checks if this player can build what ever is in the cursor on the surface the player is on.
---@param p LuaPlayer_can_build_from_cursor_params
---@return boolean
function LuaPlayer.can_build_from_cursor(p) end

---@shape LuaPlayer_can_place_entity_params
   ---@field name string @Name of the entity to check.
   ---@field position MapPosition @Where the entity would be placed.
   ---@field direction defines__direction|nil @Direction the entity would be placed. Defaults to `north`.

--- Checks if this player can build the give entity at the given location on the surface the player is on.
---@param p LuaPlayer_can_place_entity_params
---@return boolean
function LuaPlayer.can_place_entity(p) end

--- Clear the chat console.
function LuaPlayer.clear_console() end

--- Invokes the "clear cursor" action on the player as if the user pressed it.
---@return boolean @Whether the cursor is now empty.
function LuaPlayer.clear_cursor() end

--- Clears all recipe notifications for this player.
function LuaPlayer.clear_recipe_notifications() end

--- Clears the players selection tool selection position.
function LuaPlayer.clear_selection() end

--- Queues request to switch to the normal game view from the map or zoom to world view. Render mode change requests are processed before rendering of the next frame.
function LuaPlayer.close_map() end

---@shape LuaPlayer_connect_to_server_params
   ---@field address string @The server (address:port) if port is not given the default Factorio port is used.
   ---@field name LocalisedString|nil @The name of the server.
   ---@field description LocalisedString|nil
   ---@field password string|nil @The password if different from the one used to join this game. Note, if the current password is not empty but the one required to join the new server is an empty string should be given for this field.

--- Asks the player if they would like to connect to the given server.
---@param p LuaPlayer_connect_to_server_params
function LuaPlayer.connect_to_server(p) end

--- Creates and attaches a character entity to this player.
---@param character string|nil @The character to create else the default is used.
---@overload fun(): boolean
---@return boolean @Whether the character was created.
function LuaPlayer.create_character(character) end

---@shape LuaPlayer_create_local_flying_text_params
   ---@field text LocalisedString @The flying text to show.
   ---@field position MapPosition|nil @The location on the map at which to show the flying text.
   ---@field create_at_cursor boolean|nil @If `true`, the flying text is created at the player's cursor. Defaults to `false`.
   ---@field color Color|nil @The color of the flying text. Defaults to white text.
   ---@field time_to_live uint|nil @The amount of ticks that the flying text will be shown for. Defaults to `80`.
   ---@field speed double|nil @The speed at which the text rises upwards in tiles/second. Can't be a negative value.

--- Spawn flying text that is only visible to this player. Either `position` or `create_at_cursor` are required. When `create_at_cursor` is `true`, all parameters other than `text` are ignored.
---@param p LuaPlayer_create_local_flying_text_params
function LuaPlayer.create_local_flying_text(p) end

--- Disables alerts for the given alert category.
---@param alert_type defines__alert_type
---@return boolean @Whether the alert type was disabled (false if it was already disabled).
function LuaPlayer.disable_alert(alert_type) end

--- Disable recipe groups.
function LuaPlayer.disable_recipe_groups() end

--- Disable recipe subgroups.
function LuaPlayer.disable_recipe_subgroups() end

--- Disassociates a character from this player. This is functionally the same as setting [LuaEntity::associated_player](LuaEntity::associated_player) to `nil`.
---@param character LuaEntity @The character entity
function LuaPlayer.disassociate_character(character) end

---@shape LuaPlayer_drag_wire_params
   ---@field position MapPosition @Position at which cursor was clicked. Used only to decide which side of arithmetic combinator, decider combinator or power switch is to be connected. Entity itself to be connected is based on the player's selected entity.

--- Start/end wire dragging at the specified location, wire type is based on the cursor contents
---@param p LuaPlayer_drag_wire_params
---@return boolean @`true` if the action did something
function LuaPlayer.drag_wire(p) end

--- Enables alerts for the given alert category.
---@param alert_type defines__alert_type
---@return boolean @Whether the alert type was enabled (false if it was already enabled).
function LuaPlayer.enable_alert(alert_type) end

--- Enable recipe groups.
function LuaPlayer.enable_recipe_groups() end

--- Enable recipe subgroups.
function LuaPlayer.enable_recipe_subgroups() end

--- Exit the current cutscene. Errors if not in a cutscene.
function LuaPlayer.exit_cutscene() end

--- Gets which quick bar page is being used for the given screen page or `nil` if not known.
---@param index uint @The screen page. Index 1 is the top row in the gui. Index can go beyond the visible number of bars on the screen to account for the interface config setting change.
---@return uint8
function LuaPlayer.get_active_quick_bar_page(index) end

---@shape LuaPlayer_get_alerts_params
   ---@field entity LuaEntity|nil
   ---@field prototype LuaEntityPrototype|nil
   ---@field position MapPosition|nil
   ---@field type defines__alert_type|nil
   ---@field surface SurfaceIdentification|nil

--- Get all alerts matching the given filters, or all alerts if no filters are given.
---@param p LuaPlayer_get_alerts_params
---@return table<uint, table<defines__alert_type, Alert[]>> @A mapping of surface index to an array of arrays of [alerts](Alert) indexed by the [alert type](defines.alert_type).
function LuaPlayer.get_alerts(p) end

--- The characters associated with this player.
---@return LuaEntity[]
function LuaPlayer.get_associated_characters() end

--- Get the current goal description, as a localised string.
---@return LocalisedString
function LuaPlayer.get_goal_description() end

--- Gets the filter for this map editor infinity filters at the given index or `nil` if the filter index doesn't exist or is empty.
---@param index uint @The index to get.
---@return InfinityInventoryFilter
function LuaPlayer.get_infinity_inventory_filter(index) end

--- Gets the quick bar filter for the given slot or `nil`.
---@param index uint @The slot index. 1 for the first slot of page one, 2 for slot two of page one, 11 for the first slot of page 2, etc.
---@return LuaItemPrototype
function LuaPlayer.get_quick_bar_slot(index) end

--- All methods and properties that this object supports.
---@return string
function LuaPlayer.help() end

--- If the given alert type is currently enabled.
---@param alert_type defines__alert_type
---@return boolean
function LuaPlayer.is_alert_enabled(alert_type) end

--- If the given alert type is currently muted.
---@param alert_type defines__alert_type
---@return boolean
function LuaPlayer.is_alert_muted(alert_type) end

--- Is a custom Lua shortcut currently available?
---@param prototype_name string @Prototype name of the custom shortcut.
---@return boolean
function LuaPlayer.is_shortcut_available(prototype_name) end

--- Is a custom Lua shortcut currently toggled?
---@param prototype_name string @Prototype name of the custom shortcut.
---@return boolean
function LuaPlayer.is_shortcut_toggled(prototype_name) end

--- Jump to the specified cutscene waypoint. Only works when the player is viewing a cutscene.
---@param waypoint_index uint
function LuaPlayer.jump_to_cutscene_waypoint(waypoint_index) end

--- Logs a dictionary of chunks -> active entities for the surface this player is on.
function LuaPlayer.log_active_entity_chunk_counts() end

--- Logs a dictionary of active entities -> count for the surface this player is on.
function LuaPlayer.log_active_entity_counts() end

--- Mutes alerts for the given alert category.
---@param alert_type defines__alert_type
---@return boolean @Whether the alert type was muted (false if it was already muted).
function LuaPlayer.mute_alert(alert_type) end

--- Queues a request to open the map at the specified position. If the map is already opened, the request will simply set the position (and scale). Render mode change requests are processed before rendering of the next frame.
---@param position MapPosition
---@param scale double|nil
---@overload fun(position: MapPosition)
function LuaPlayer.open_map(position, scale) end

--- Invokes the "smart pipette" action on the player as if the user pressed it.
---@param entity string | LuaEntity | LuaEntityPrototype
---@return boolean @Whether the smart pipette found something to place.
function LuaPlayer.pipette_entity(entity) end

---@shape LuaPlayer_play_sound_params
   ---@field path SoundPath @The sound to play.
   ---@field position MapPosition|nil @Where the sound should be played. If not given, it's played at the current position of the player.
   ---@field volume_modifier double|nil @The volume of the sound to play. Must be between 0 and 1 inclusive.
   ---@field override_sound_type SoundType|nil @The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.

--- Play a sound for this player.
---@param p LuaPlayer_play_sound_params
function LuaPlayer.play_sound(p) end

--- Print text to the chat console.
---@param message LocalisedString
---@param color Color|nil
---@overload fun(message: LocalisedString)
function LuaPlayer.print(message, color) end

--- Print entity statistics to the player's console.
---@param entities string[]|nil @Entity prototypes to get statistics for. If not specified or empty, display statistics for all entities.
---@overload fun()
function LuaPlayer.print_entity_statistics(entities) end

--- Print LuaObject counts per mod.
function LuaPlayer.print_lua_object_statistics() end

--- Print construction robot job counts to the players console.
function LuaPlayer.print_robot_jobs() end

---@shape LuaPlayer_remove_alert_params
   ---@field entity LuaEntity|nil
   ---@field prototype (LuaEntityPrototype | string)|nil
   ---@field position MapPosition|nil
   ---@field type defines__alert_type|nil
   ---@field surface SurfaceIdentification|nil
   ---@field icon SignalID|nil
   ---@field message LocalisedString|nil

--- Removes all alerts matching the given filters or if an empty filters table is given all alerts are removed.
---@param p LuaPlayer_remove_alert_params
function LuaPlayer.remove_alert(p) end

--- Requests a translation for the given localised string. If the request is successful the [on_string_translated](on_string_translated) event will be fired at a later time with the results.
---@param localised_string LocalisedString
---@return boolean @Whether the request was sent or not.
function LuaPlayer.request_translation(localised_string) end

--- Sets which quick bar page is being used for the given screen page.
---@param screen_index uint @The screen page. Index 1 is the top row in the gui. Index can go beyond the visible number of bars on the screen to account for the interface config setting change.
---@param page_index uint @The new quick bar page.
function LuaPlayer.set_active_quick_bar_page(screen_index, page_index) end

---@shape LuaPlayer_set_controller_params
   ---@field type defines__controllers @Which controller to use.
   ---@field character LuaEntity|nil @Entity to control. Mandatory when `type` is [defines.controllers.character](defines.controllers.character), ignored otherwise.
   ---@field waypoints CutsceneWaypoint|nil @List of waypoints for the cutscene controller. This parameter is mandatory when `type` is [defines.controllers.cutscene](defines.controllers.cutscene).
   ---@field start_position MapPosition|nil @If specified and `type` is [defines.controllers.cutscene](defines.controllers.cutscene), the cutscene will start at this position. If not given the start position will be the player position.
   ---@field start_zoom double|nil @If specified and `type` is [defines.controllers.cutscene](defines.controllers.cutscene), the cutscene will start at this zoom level. If not given the start zoom will be the players zoom.
   ---@field final_transition_time uint|nil @If specified and `type` is [defines.controllers.cutscene](defines.controllers.cutscene), it is the time in ticks it will take for the camera to pan from the final waypoint back to the starting position. If not given the camera will not pan back to the start position/zoom.
   ---@field chart_mode_cutoff double|nil @If specified and `type` is [defines.controllers.cutscene](defines.controllers.cutscene), the game will switch to chart-mode (map zoomed out) rendering when the zoom level is less than this value.

--- Set the controller type of the player.
---@param p LuaPlayer_set_controller_params
function LuaPlayer.set_controller(p) end

--- Setup the screen to be shown when the game is finished.
---@param message LocalisedString @Message to be shown.
---@param file string|nil @Path to image to be shown.
---@overload fun(message: LocalisedString)
function LuaPlayer.set_ending_screen_data(message, file) end

--- Set the text in the goal window (top left).
---@param text LocalisedString|nil @The text to display. Lines can be delimited with `\n`. Passing an empty string or omitting this parameter entirely will make the goal window disappear.
---@param only_update boolean|nil @When `true`, won't play the "goal updated" sound.
---@overload fun(text: LocalisedString|nil)
---@overload fun()
function LuaPlayer.set_goal_description(text, only_update) end

--- Sets the filter for this map editor infinity filters at the given index.
---@param index uint @The index to set.
---@param filter InfinityInventoryFilter | nil @The new filter or `nil` to clear the filter.
function LuaPlayer.set_infinity_inventory_filter(index, filter) end

--- Sets the quick bar filter for the given slot.
---@param index uint @The slot index. 1 for the first slot of page one, 2 for slot two of page one, 11 for the first slot of page 2, etc.
---@param filter string | LuaItemPrototype | LuaItemStack @The filter or `nil`.
function LuaPlayer.set_quick_bar_slot(index, filter) end

--- Make a custom Lua shortcut available or unavailable.
---@param prototype_name string @Prototype name of the custom shortcut.
---@param available boolean
function LuaPlayer.set_shortcut_available(prototype_name, available) end

--- Toggle or untoggle a custom Lua shortcut
---@param prototype_name string @Prototype name of the custom shortcut.
---@param toggled boolean
function LuaPlayer.set_shortcut_toggled(prototype_name, toggled) end

--- Starts selection with selection tool from the specified position. Does nothing if the players cursor is not a selection tool.
---@param position MapPosition @The position to start selection from.
---@param selection_mode string @The type of selection to start. Can be `select`, `alternative-select`, `reverse-select`.
function LuaPlayer.start_selection(position, selection_mode) end

--- Toggles this player into or out of the map editor. Does nothing if this player isn't an admin or if the player doesn't have permission to use the map editor.
function LuaPlayer.toggle_map_editor() end

--- Unlock the achievements of the given player. This has any effect only when this is the local player, the achievement isn't unlocked so far and the achievement is of the type "achievement".
---@param name string @name of the achievement to unlock
function LuaPlayer.unlock_achievement(name) end

--- Unmutes alerts for the given alert category.
---@param alert_type defines__alert_type
---@return boolean @Whether the alert type was unmuted (false if it was wasn't muted).
function LuaPlayer.unmute_alert(alert_type) end

--- Uses the current item in the cursor if it's a capsule or does nothing if not.
---@param position MapPosition @Where the item would be used.
function LuaPlayer.use_from_cursor(position) end

--- Queues a request to zoom to world at the specified position. If the player is already zooming to world, the request will simply set the position (and scale). Render mode change requests are processed before rendering of the next frame.
---@param position MapPosition
---@param scale double|nil
---@overload fun(position: MapPosition)
function LuaPlayer.zoom_to_world(position, scale) end

---@class LuaProfiler: any @An object used to measure script performance.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaProfiler = {}

--- Add the duration of another timer to this timer. Useful to reduce start/stop overhead when accumulating time onto many timers at once.
---@param other LuaProfiler @The timer to add to this timer.
function LuaProfiler.add(other) end

--- Divides the current duration by a set value. Useful for calculating the average of many iterations.
---@param number double @The number to divide by. Must be > 0.
function LuaProfiler.divide(number) end

--- All methods and properties that this object supports.
---@return string
function LuaProfiler.help() end

--- Resets the clock, also restarting it.
function LuaProfiler.reset() end

--- Start the clock again, without resetting it.
function LuaProfiler.restart() end

--- Stops the clock.
function LuaProfiler.stop() end

---@class LuaProgrammableSpeakerControlBehavior: LuaControlBehavior @Control behavior for programmable speakers.
  ---@field circuit_condition CircuitConditionDefinition @RW
  ---@field circuit_parameters ProgrammableSpeakerCircuitParameters @RW
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaProgrammableSpeakerControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaProgrammableSpeakerControlBehavior.help() end

---@class LuaRCON: any @An interface to send messages to the calling RCON interface.
  ---@field object_name string @RW; This object's name.
LuaRCON = {}

--- Print text to the calling RCON interface if any.
---@param message LocalisedString
function LuaRCON.print(message) end

---@class LuaRailChainSignalControlBehavior: LuaControlBehavior @Control behavior for rail chain signals.
  ---@field blue_signal SignalID @RW
  ---@field green_signal SignalID @RW
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field orange_signal SignalID @RW
  ---@field red_signal SignalID @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRailChainSignalControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaRailChainSignalControlBehavior.help() end

---@class LuaRailPath: any @A rail path.
  ---@field current uint @RW; The current rail index.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field rails table<uint, LuaEntity> @RW; Array of the rails that this path travels over.
  ---@field size uint @RW; The total number of rails in this path.
  ---@field total_distance double @RW; The total path distance.
  ---@field travelled_distance double @RW; The total distance travelled.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRailPath = {}

--- All methods and properties that this object supports.
---@return string
function LuaRailPath.help() end

---@class LuaRailSignalControlBehavior: LuaControlBehavior @Control behavior for rail signals.
  ---@field circuit_condition CircuitConditionDefinition @RW; The circuit condition when controlling the signal through the circuit network.
  ---@field close_signal boolean @RW; If this will close the rail signal based off the circuit condition.
  ---@field green_signal SignalID @RW
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field orange_signal SignalID @RW
  ---@field read_signal boolean @RW; If this will read the rail signal state.
  ---@field red_signal SignalID @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRailSignalControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaRailSignalControlBehavior.help() end

---@class LuaRandomGenerator: any @A deterministic random generator independent from the core games random generator that can be seeded and re-seeded at will. This random generator can be saved and loaded and will maintain its state. Note this is entirely different from calling [math.random](Libraries.html#math.random)() and you should be sure you actually want to use this over calling `math.random()`. If you aren't sure if you need to use this over calling `math.random()` then you probably don't need to use this.
  ---@overload fun(lower: int|nil, upper: int|nil): double
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRandomGenerator = {}

--- All methods and properties that this object supports.
---@return string
function LuaRandomGenerator.help() end

--- Re-seeds the random generator with the given value.
---@param seed uint
function LuaRandomGenerator.re_seed(seed) end

---@class LuaRecipe: any @A crafting recipe. Recipes belong to forces (see [LuaForce](LuaForce)) because some recipes are unlocked by research, and researches are per-force.
  ---@field category string @RW; Category of the recipe.
  ---@field enabled boolean @RW; Can the recipe be used?
  ---@field energy double @RW; Energy required to execute this recipe. This directly affects the crafting time: Recipe's energy is exactly its crafting time in seconds, when crafted in an assembling machine with crafting speed exactly equal to one.
  ---@field force LuaForce @RW; The force that owns this recipe.
  ---@field group LuaGroup @RW; Group of this recipe.
  ---@field hidden boolean @RW; Is the recipe hidden? Hidden recipe don't show up in the crafting menu.
  ---@field hidden_from_flow_stats boolean @RW; Is the recipe hidden from flow statistics?
  ---@field ingredients Ingredient[] @RW; Ingredients for this recipe.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW; Localised name of the recipe.
  ---@field name string @RW; Name of the recipe. This can be different than the name of the result items as there could be more recipes to make the same item.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field products Product[] @RW; The results of this recipe.
  ---@field prototype LuaRecipePrototype @RW; The prototype for this recipe.
  ---@field subgroup LuaGroup @RW; Subgroup of this recipe.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRecipe = {}

--- All methods and properties that this object supports.
---@return string
function LuaRecipe.help() end

--- Reload the recipe from the prototype.
function LuaRecipe.reload() end

---@class LuaRecipeCategoryPrototype: any @Prototype of a recipe category.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRecipeCategoryPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaRecipeCategoryPrototype.help() end

---@class LuaRecipePrototype: any @A crafting recipe prototype.
  ---@field allow_as_intermediate boolean @RW; If this recipe is enabled for the purpose of intermediate hand-crafting.
  ---@field allow_decomposition boolean @RW; Is this recipe allowed to be broken down for the recipe tooltip "Total raw" calculations?
  ---@field allow_inserter_overload boolean @RW; If the recipe is allowed to have the extra inserter overload bonus applied (4 * stack inserter stack size).
  ---@field allow_intermediates boolean @RW; If this recipe is allowed to use intermediate recipes when hand-crafting.
  ---@field always_show_made_in boolean @RW; Should this recipe always show "Made in" in the tooltip?
  ---@field always_show_products boolean @RW; If the products are always shown in the recipe tooltip.
  ---@field category string @RW; Category of the recipe.
  ---@field emissions_multiplier double @RW; The emissions multiplier for this recipe.
  ---@field enabled boolean @RW; If this recipe prototype is enabled by default (enabled at the beginning of a game).
  ---@field energy double @RW; Energy required to execute this recipe. This directly affects the crafting time: Recipe's energy is exactly its crafting time in seconds, when crafted in an assembling machine with crafting speed exactly equal to one.
  ---@field group LuaGroup @RW; Group of this recipe.
  ---@field hidden boolean @RW; Is the recipe hidden? Hidden recipe don't show up in the crafting menu.
  ---@field hidden_from_flow_stats boolean @RW; Is the recipe hidden from flow statistics (item/fluid production statistics)?
  ---@field hidden_from_player_crafting boolean @RW; Is the recipe hidden from player crafting? The recipe will still show up for selection in machines.
  ---@field ingredients Ingredient[] @RW; Ingredients for this recipe.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW; Localised name of the recipe.
  ---@field main_product Product @RW nilable; The main product of this recipe, if any.
  ---@field name string @RW; Name of the recipe. This can be different than the name of the result items as there could be more recipes to make the same item.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field overload_multiplier uint @RW; Used to determine how many extra items are put into an assembling machine before it's considered "full enough".
  ---@field products Product[] @RW; The results of this recipe.
  ---@field request_paste_multiplier uint @RW; The multiplier used when this recipe is copied from an assembling machine to a requester chest. For each item in the recipe the item count * this value is set in the requester chest.
  ---@field show_amount_in_title boolean @RW; If the amount is shown in the recipe tooltip title when the recipe produces more than 1 product.
  ---@field subgroup LuaGroup @RW; Subgroup of this recipe.
  ---@field unlock_results boolean @RW; Is this recipe unlocks the result item(s) so they're shown in filter-select GUIs.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRecipePrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaRecipePrototype.help() end

---@class LuaRemote: any @Registry of interfaces between scripts. An interface is simply a dictionary mapping names to functions. A script or mod can then register an interface with [LuaRemote](LuaRemote), after that any script can call the registered functions, provided it knows the interface name and the desired function name. An instance of LuaRemote is available through the global object named `remote`.
  ---@field interfaces table<string, table<string, true>> @RW; List of all registered interfaces. For each interface name, `remote.interfaces[name]` is a dictionary mapping the interface's registered functions to `true`.
  ---@field object_name string @RW; This object's name.
LuaRemote = {}

--- Add a remote interface.
---@param name string @Name of the interface. If the name matches any existing interface, an error is thrown.
---@param functions table<string, fun()> @List of functions that are members of the new interface.
function LuaRemote.add_interface(name, functions) end

--- Call a function of an interface.
---@param interface string @Interface to look up `function` in.
---@param func string @Function name that belongs to the `interface`.
---@return Any
function LuaRemote.call(interface, func) end

--- Removes an interface with the given name.
---@param name string @Name of the interface.
---@return boolean @Whether the interface was removed. `False` if the interface didn't exist.
function LuaRemote.remove_interface(name) end

---@class LuaRendering: any @Allows rendering of geometric shapes, text and sprites in the game world. Each render object is identified by an id that is universally unique for the lifetime of a whole game.
  ---@field object_name string @RW; This object's name.
LuaRendering = {}

--- Reorder this object so that it is drawn in front of the already existing objects.
---@param id uint64
function LuaRendering.bring_to_front(id) end

--- Destroys all render objects.
---@param mod_name string|nil @If provided, only the render objects created by this mod are destroyed.
---@overload fun()
function LuaRendering.clear(mod_name) end

--- Destroy the object with the given id.
---@param id uint64
function LuaRendering.destroy(id) end

---@shape LuaRendering_draw_animation_params
   ---@field animation string @Name of an [animation prototype](https://wiki.factorio.com/Prototype/Animation).
   ---@field orientation RealOrientation|nil @The orientation of the animation. Default is 0.
   ---@field x_scale double|nil @Horizontal scale of the animation. Default is 1.
   ---@field y_scale double|nil @Vertical scale of the animation. Default is 1.
   ---@field tint Color|nil
   ---@field render_layer RenderLayer|nil
   ---@field animation_speed double|nil @How many frames the animation goes forward per tick. Default is 1.
   ---@field animation_offset double|nil @Offset of the animation in frames. Default is 0.
   ---@field orientation_target (MapPosition | LuaEntity)|nil @If given, the animation rotates so that it faces this target. Note that `orientation` is still applied to the animation.
   ---@field orientation_target_offset Vector|nil @Only used if `orientation_target` is a LuaEntity.
   ---@field oriented_offset Vector|nil @Offsets the center of the animation if `orientation_target` is given. This offset will rotate together with the animation.
   ---@field target MapPosition | LuaEntity @Center of the animation.
   ---@field target_offset Vector|nil @Only used if `target` is a LuaEntity.
   ---@field surface SurfaceIdentification
   ---@field time_to_live uint|nil @In ticks. Defaults to living forever.
   ---@field forces ForceIdentification[]|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
   ---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
   ---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
   ---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create an animation.
---@param p LuaRendering_draw_animation_params
---@return uint64 @Id of the render object
function LuaRendering.draw_animation(p) end

---@shape LuaRendering_draw_arc_params
   ---@field color Color
   ---@field max_radius double @The radius of the outer edge of the arc, in tiles.
   ---@field min_radius double @The radius of the inner edge of the arc, in tiles.
   ---@field start_angle float @Where the arc starts, in radian.
   ---@field angle float @The angle of the arc, in radian.
   ---@field target MapPosition | LuaEntity
   ---@field target_offset Vector|nil @Only used if `target` is a LuaEntity.
   ---@field surface SurfaceIdentification
   ---@field time_to_live uint|nil @In ticks. Defaults to living forever.
   ---@field forces ForceIdentification[]|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
   ---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
   ---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
   ---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities.
   ---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create an arc.
---@param p LuaRendering_draw_arc_params
---@return uint64 @Id of the render object
function LuaRendering.draw_arc(p) end

---@shape LuaRendering_draw_circle_params
   ---@field color Color
   ---@field radius double @In tiles.
   ---@field width float|nil @Width of the outline, used only if filled = false. Value is in pixels (32 per tile).
   ---@field filled boolean @If the circle should be filled.
   ---@field target MapPosition | LuaEntity
   ---@field target_offset Vector|nil @Only used if `target` is a LuaEntity.
   ---@field surface SurfaceIdentification
   ---@field time_to_live uint|nil @In ticks. Defaults to living forever.
   ---@field forces ForceIdentification[]|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
   ---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
   ---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
   ---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities.
   ---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a circle.
---@param p LuaRendering_draw_circle_params
---@return uint64 @Id of the render object
function LuaRendering.draw_circle(p) end

---@shape LuaRendering_draw_light_params
   ---@field sprite SpritePath
   ---@field orientation RealOrientation|nil @The orientation of the light. Default is 0.
   ---@field scale float|nil @Default is 1.
   ---@field intensity float|nil @Default is 1.
   ---@field minimum_darkness float|nil @The minimum darkness at which this light is rendered. Default is 0.
   ---@field oriented boolean|nil @If this light has the same orientation as the entity target, default is false. Note that `orientation` is still applied to the sprite.
   ---@field color Color|nil @Defaults to white (no tint).
   ---@field target MapPosition | LuaEntity @Center of the light.
   ---@field target_offset Vector|nil @Only used if `target` is a LuaEntity.
   ---@field surface SurfaceIdentification
   ---@field time_to_live uint|nil @In ticks. Defaults to living forever.
   ---@field forces ForceIdentification[]|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
   ---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
   ---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
   ---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a light.
---@param p LuaRendering_draw_light_params
---@return uint64 @Id of the render object
function LuaRendering.draw_light(p) end

---@shape LuaRendering_draw_line_params
   ---@field color Color
   ---@field width float @In pixels (32 per tile).
   ---@field gap_length double|nil @Length of the gaps that this line has, in tiles. Default is 0.
   ---@field dash_length double|nil @Length of the dashes that this line has. Used only if gap_length > 0. Default is 0.
   ---@field from MapPosition | LuaEntity
   ---@field from_offset Vector|nil @Only used if `from` is a LuaEntity.
   ---@field to MapPosition | LuaEntity
   ---@field to_offset Vector|nil @Only used if `to` is a LuaEntity.
   ---@field surface SurfaceIdentification
   ---@field time_to_live uint|nil @In ticks. Defaults to living forever.
   ---@field forces ForceIdentification[]|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
   ---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
   ---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
   ---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities.
   ---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a line.
---@param p LuaRendering_draw_line_params
---@return uint64 @Id of the render object
function LuaRendering.draw_line(p) end

---@shape LuaRendering_draw_polygon_params
   ---@field color Color
   ---@field vertices ScriptRenderVertexTarget[]
   ---@field target (MapPosition | LuaEntity)|nil @Acts like an offset applied to all vertices that are not set to an entity.
   ---@field target_offset Vector|nil @Only used if `target` is a LuaEntity.
   ---@field orientation RealOrientation|nil @The orientation applied to all vertices. Default is 0.
   ---@field orientation_target (MapPosition | LuaEntity)|nil @If given, the vertices (that are not set to an entity) rotate so that it faces this target. Note that `orientation` is still applied.
   ---@field orientation_target_offset Vector|nil @Only used if `orientation_target` is a LuaEntity.
   ---@field surface SurfaceIdentification
   ---@field time_to_live uint|nil @In ticks. Defaults to living forever.
   ---@field forces ForceIdentification[]|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
   ---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
   ---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
   ---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities.
   ---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a triangle mesh defined by a triangle strip.
---@param p LuaRendering_draw_polygon_params
---@return uint64 @Id of the render object
function LuaRendering.draw_polygon(p) end

---@shape LuaRendering_draw_rectangle_params
   ---@field color Color
   ---@field width float|nil @Width of the outline, used only if filled = false. Value is in pixels (32 per tile).
   ---@field filled boolean @If the rectangle should be filled.
   ---@field left_top MapPosition | LuaEntity
   ---@field left_top_offset Vector|nil @Only used if `left_top` is a LuaEntity.
   ---@field right_bottom MapPosition | LuaEntity
   ---@field right_bottom_offset Vector|nil @Only used if `right_bottom` is a LuaEntity.
   ---@field surface SurfaceIdentification
   ---@field time_to_live uint|nil @In ticks. Defaults to living forever.
   ---@field forces ForceIdentification[]|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
   ---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
   ---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
   ---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities.
   ---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a rectangle.
---@param p LuaRendering_draw_rectangle_params
---@return uint64 @Id of the render object
function LuaRendering.draw_rectangle(p) end

---@shape LuaRendering_draw_sprite_params
   ---@field sprite SpritePath
   ---@field orientation RealOrientation|nil @The orientation of the sprite. Default is 0.
   ---@field x_scale double|nil @Horizontal scale of the sprite. Default is 1.
   ---@field y_scale double|nil @Vertical scale of the sprite. Default is 1.
   ---@field tint Color|nil
   ---@field render_layer RenderLayer|nil
   ---@field orientation_target (MapPosition | LuaEntity)|nil @If given, the sprite rotates so that it faces this target. Note that `orientation` is still applied to the sprite.
   ---@field orientation_target_offset Vector|nil @Only used if `orientation_target` is a LuaEntity.
   ---@field oriented_offset Vector|nil @Offsets the center of the sprite if `orientation_target` is given. This offset will rotate together with the sprite.
   ---@field target MapPosition | LuaEntity @Center of the sprite.
   ---@field target_offset Vector|nil @Only used if `target` is a LuaEntity.
   ---@field surface SurfaceIdentification
   ---@field time_to_live uint|nil @In ticks. Defaults to living forever.
   ---@field forces ForceIdentification[]|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
   ---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
   ---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
   ---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a sprite.
---@param p LuaRendering_draw_sprite_params
---@return uint64 @Id of the render object
function LuaRendering.draw_sprite(p) end

---@shape LuaRendering_draw_text_params
   ---@field text LocalisedString @The text to display.
   ---@field surface SurfaceIdentification
   ---@field target MapPosition | LuaEntity
   ---@field target_offset Vector|nil @Only used if `target` is a LuaEntity.
   ---@field color Color
   ---@field scale double|nil
   ---@field font string|nil @Name of font to use. Defaults to the same font as flying-text.
   ---@field time_to_live uint|nil @In ticks. Defaults to living forever.
   ---@field forces ForceIdentification[]|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
   ---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
   ---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
   ---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities.
   ---@field orientation RealOrientation|nil @The orientation of the text. Default is 0.
   ---@field alignment string|nil @Defaults to "left". Other options are "right" and "center".
   ---@field vertical_alignment string|nil @Defaults to "top". Other options are "middle", "baseline" and "bottom".
   ---@field scale_with_zoom boolean|nil @Defaults to false. If true, the text scales with player zoom, resulting in it always being the same size on screen, and the size compared to the game world changes.
   ---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a text.
---@param p LuaRendering_draw_text_params
---@return uint64 @Id of the render object
function LuaRendering.draw_text(p) end

--- Get the alignment of the text with this id.
---@param id uint64
---@return string @`nil` if the object is not a text.
function LuaRendering.get_alignment(id) end

--- Gets an array of all valid object ids.
---@param mod_name string|nil @If provided, get only the render objects created by this mod.
---@overload fun(): uint64[]
---@return uint64[]
function LuaRendering.get_all_ids(mod_name) end

--- Get the angle of the arc with this id.
---@param id uint64
---@return float @Angle in radian. `nil` if the object is not a arc.
function LuaRendering.get_angle(id) end

--- Get the animation prototype name of the animation with this id.
---@param id uint64
---@return string @`nil` if the object is not an animation.
function LuaRendering.get_animation(id) end

--- Get the animation offset of the animation with this id.
---@param id uint64
---@return double @Animation offset in frames. `nil` if the object is not an animation.
function LuaRendering.get_animation_offset(id) end

--- Get the animation speed of the animation with this id.
---@param id uint64
---@return double @Animation speed in frames per tick. `nil` if the object is not an animation.
function LuaRendering.get_animation_speed(id) end

--- Get the color or tint of the object with this id.
---@param id uint64
---@return Color @`nil` if the object does not support color.
function LuaRendering.get_color(id) end

--- Get the dash length of the line with this id.
---@param id uint64
---@return double @`nil` if the object is not a line.
function LuaRendering.get_dash_length(id) end

--- Get whether this is being drawn on the ground, under most entities and sprites.
---@param id uint64
---@return boolean
function LuaRendering.get_draw_on_ground(id) end

--- Get if the circle or rectangle with this id is filled.
---@param id uint64
---@return boolean @`nil` if the object is not a circle or rectangle.
function LuaRendering.get_filled(id) end

--- Get the font of the text with this id.
---@param id uint64
---@return string @`nil` if the object is not a text.
function LuaRendering.get_font(id) end

--- Get the forces that the object with this id is rendered to or `nil` if visible to all forces.
---@param id uint64
---@return LuaForce[]
function LuaRendering.get_forces(id) end

--- Get from where the line with this id is drawn.
---@param id uint64
---@return ScriptRenderTarget @`nil` if this object is not a line.
function LuaRendering.get_from(id) end

--- Get the length of the gaps in the line with this id.
---@param id uint64
---@return double @`nil` if the object is not a line.
function LuaRendering.get_gap_length(id) end

--- Get the intensity of the light with this id.
---@param id uint64
---@return float @`nil` if the object is not a light.
function LuaRendering.get_intensity(id) end

--- Get where top left corner of the rectangle with this id is drawn.
---@param id uint64
---@return ScriptRenderTarget @`nil` if the object is not a rectangle.
function LuaRendering.get_left_top(id) end

--- Get the radius of the outer edge of the arc with this id.
---@param id uint64
---@return double @`nil` if the object is not a arc.
function LuaRendering.get_max_radius(id) end

--- Get the radius of the inner edge of the arc with this id.
---@param id uint64
---@return double @`nil` if the object is not a arc.
function LuaRendering.get_min_radius(id) end

--- Get the minimum darkness at which the light with this id is rendered.
---@param id uint64
---@return float @`nil` if the object is not a light.
function LuaRendering.get_minimum_darkness(id) end

--- Get whether this is only rendered in alt-mode.
---@param id uint64
---@return boolean
function LuaRendering.get_only_in_alt_mode(id) end

--- Get the orientation of the object with this id.
---@param id uint64
---@return RealOrientation @`nil` if the object is not a text, polygon, sprite, light or animation.
function LuaRendering.get_orientation(id) end

--- The object rotates so that it faces this target. Note that `orientation` is still applied to the object. Get the orientation_target of the object with this id.
---@param id uint64
---@return ScriptRenderTarget @`nil` if no target or if this object is not a polygon, sprite, or animation.
function LuaRendering.get_orientation_target(id) end

--- Get if the light with this id is rendered has the same orientation as the target entity. Note that `orientation` is still applied to the sprite.
---@param id uint64
---@return boolean @`nil` if the object is not a light.
function LuaRendering.get_oriented(id) end

--- Offsets the center of the sprite or animation if `orientation_target` is given. This offset will rotate together with the sprite or animation. Get the oriented_offset of the sprite or animation with this id.
---@param id uint64
---@return Vector @`nil` if this object is not a sprite or animation.
function LuaRendering.get_oriented_offset(id) end

--- Get the players that the object with this id is rendered to or `nil` if visible to all players.
---@param id uint64
---@return LuaPlayer[]
function LuaRendering.get_players(id) end

--- Get the radius of the circle with this id.
---@param id uint64
---@return double @`nil` if the object is not a circle.
function LuaRendering.get_radius(id) end

--- Get the render layer of the sprite or animation with this id.
---@param id uint64
---@return RenderLayer @`nil` if the object is not a sprite or animation.
function LuaRendering.get_render_layer(id) end

--- Get where bottom right corner of the rectangle with this id is drawn.
---@param id uint64
---@return ScriptRenderTarget @`nil` if the object is not a rectangle.
function LuaRendering.get_right_bottom(id) end

--- Get the scale of the text or light with this id.
---@param id uint64
---@return double @`nil` if the object is not a text or light.
function LuaRendering.get_scale(id) end

--- Get if the text with this id scales with player zoom.
---@param id uint64
---@return boolean @`nil` if the object is not a text.
function LuaRendering.get_scale_with_zoom(id) end

--- Get the sprite of the sprite or light with this id.
---@param id uint64
---@return SpritePath @`nil` if the object is not a sprite or light.
function LuaRendering.get_sprite(id) end

--- Get where the arc with this id starts.
---@param id uint64
---@return float @Angle in radian. `nil` if the object is not a arc.
function LuaRendering.get_start_angle(id) end

--- The surface the object with this id is rendered on.
---@param id uint64
---@return LuaSurface
function LuaRendering.get_surface(id) end

--- Get where the object with this id is drawn.
---@param id uint64
---@return ScriptRenderTarget @`nil` if the object does not support target.
function LuaRendering.get_target(id) end

--- Get the text that is displayed by the text with this id.
---@param id uint64
---@return LocalisedString @`nil` if the object is not a text.
function LuaRendering.get_text(id) end

--- Get the time to live of the object with this id. This will be 0 if the object does not expire.
---@param id uint64
---@return uint
function LuaRendering.get_time_to_live(id) end

--- Get where the line with this id is drawn to.
---@param id uint64
---@return ScriptRenderTarget @`nil` if the object is not a line.
function LuaRendering.get_to(id) end

--- Gets the type of the given object. The types are "text", "line", "circle", "rectangle", "arc", "polygon", "sprite", "light" and "animation".
---@param id uint64
---@return string
function LuaRendering.get_type(id) end

--- Get the vertical alignment of the text with this id.
---@param id uint64
---@return string @`nil` if the object is not a text.
function LuaRendering.get_vertical_alignment(id) end

--- Get the vertices of the polygon with this id.
---@param id uint64
---@return ScriptRenderTarget[] @`nil` if the object is not a polygon.
function LuaRendering.get_vertices(id) end

--- Get whether this is rendered to anyone at all.
---@param id uint64
---@return boolean
function LuaRendering.get_visible(id) end

--- Get the width of the object with this id. Value is in pixels (32 per tile).
---@param id uint64
---@return float @`nil` if the object does not support width.
function LuaRendering.get_width(id) end

--- Get the horizontal scale of the sprite or animation with this id.
---@param id uint64
---@return double @`nil` if the object is not a sprite or animation.
function LuaRendering.get_x_scale(id) end

--- Get the vertical scale of the sprite or animation with this id.
---@param id uint64
---@return double @`nil` if the object is not a sprite or animation.
function LuaRendering.get_y_scale(id) end

--- Does a font with this name exist?
---@param font_name string
---@return boolean
function LuaRendering.is_font_valid(font_name) end

--- Does a valid object with this id exist?
---@param id uint64
---@return boolean
function LuaRendering.is_valid(id) end

--- Set the alignment of the text with this id. Does nothing if this object is not a text.
---@param id uint64
---@param alignment string @"left", "right" or "center".
function LuaRendering.set_alignment(id, alignment) end

--- Set the angle of the arc with this id. Does nothing if this object is not a arc.
---@param id uint64
---@param angle float @angle in radian
function LuaRendering.set_angle(id, angle) end

--- Set the animation prototype name of the animation with this id. Does nothing if this object is not an animation.
---@param id uint64
---@param animation string
function LuaRendering.set_animation(id, animation) end

--- Set the animation offset of the animation with this id. Does nothing if this object is not an animation.
---@param id uint64
---@param animation_offset double @Animation offset in frames.
function LuaRendering.set_animation_offset(id, animation_offset) end

--- Set the animation speed of the animation with this id. Does nothing if this object is not an animation.
---@param id uint64
---@param animation_speed double @Animation speed in frames per tick.
function LuaRendering.set_animation_speed(id, animation_speed) end

--- Set the color or tint of the object with this id. Does nothing if this object does not support color.
---@param id uint64
---@param color Color
function LuaRendering.set_color(id, color) end

--- Set the corners of the rectangle with this id. Does nothing if this object is not a rectangle.
---@param id uint64
---@param left_top MapPosition | LuaEntity
---@param left_top_offset Vector
---@param right_bottom MapPosition | LuaEntity
---@param right_bottom_offset Vector
function LuaRendering.set_corners(id, left_top, left_top_offset, right_bottom, right_bottom_offset) end

--- Set the dash length of the line with this id. Does nothing if this object is not a line.
---@param id uint64
---@param dash_length double
function LuaRendering.set_dash_length(id, dash_length) end

--- Set the length of the dashes and the length of the gaps in the line with this id. Does nothing if this object is not a line.
---@param id uint64
---@param dash_length double
---@param gap_length double
function LuaRendering.set_dashes(id, dash_length, gap_length) end

--- Set whether this is being drawn on the ground, under most entities and sprites.
---@param id uint64
---@param draw_on_ground boolean
function LuaRendering.set_draw_on_ground(id, draw_on_ground) end

--- Set if the circle or rectangle with this id is filled. Does nothing if this object is not a circle or rectangle.
---@param id uint64
---@param filled boolean
function LuaRendering.set_filled(id, filled) end

--- Set the font of the text with this id. Does nothing if this object is not a text.
---@param id uint64
---@param font string
function LuaRendering.set_font(id, font) end

--- Set the forces that the object with this id is rendered to.
---@param id uint64
---@param forces ForceIdentification[] @Providing an empty array will set the object to be visible to all forces.
function LuaRendering.set_forces(id, forces) end

--- Set from where the line with this id is drawn. Does nothing if the object is not a line.
---@param id uint64
---@param from MapPosition | LuaEntity
---@param from_offset Vector|nil
---@overload fun(id: uint64, from: MapPosition | LuaEntity)
function LuaRendering.set_from(id, from, from_offset) end

--- Set the length of the gaps in the line with this id. Does nothing if this object is not a line.
---@param id uint64
---@param gap_length double
function LuaRendering.set_gap_length(id, gap_length) end

--- Set the intensity of the light with this id. Does nothing if this object is not a light.
---@param id uint64
---@param intensity float
function LuaRendering.set_intensity(id, intensity) end

--- Set where top left corner of the rectangle with this id is drawn. Does nothing if this object is not a rectangle.
---@param id uint64
---@param left_top MapPosition | LuaEntity
---@param left_top_offset Vector|nil
---@overload fun(id: uint64, left_top: MapPosition | LuaEntity)
function LuaRendering.set_left_top(id, left_top, left_top_offset) end

--- Set the radius of the outer edge of the arc with this id. Does nothing if this object is not a arc.
---@param id uint64
---@param max_radius double
function LuaRendering.set_max_radius(id, max_radius) end

--- Set the radius of the inner edge of the arc with this id. Does nothing if this object is not a arc.
---@param id uint64
---@param min_radius double
function LuaRendering.set_min_radius(id, min_radius) end

--- Set the minimum darkness at which the light with this id is rendered. Does nothing if this object is not a light.
---@param id uint64
---@param minimum_darkness float
function LuaRendering.set_minimum_darkness(id, minimum_darkness) end

--- Set whether this is only rendered in alt-mode.
---@param id uint64
---@param only_in_alt_mode boolean
function LuaRendering.set_only_in_alt_mode(id, only_in_alt_mode) end

--- Set the orientation of the object with this id. Does nothing if this object is not a text, polygon, sprite, light or animation.
---@param id uint64
---@param orientation RealOrientation
function LuaRendering.set_orientation(id, orientation) end

--- The object rotates so that it faces this target. Note that `orientation` is still applied to the object. Set the orientation_target of the object with this id. Does nothing if this object is not a polygon, sprite, or animation. Set to `nil` if the object should not have an orientation_target.
---@param id uint64
---@param orientation_target MapPosition | LuaEntity
---@param orientation_target_offset Vector|nil
---@overload fun(id: uint64, orientation_target: MapPosition | LuaEntity)
function LuaRendering.set_orientation_target(id, orientation_target, orientation_target_offset) end

--- Set if the light with this id is rendered has the same orientation as the target entity. Does nothing if this object is not a light. Note that `orientation` is still applied to the sprite.
---@param id uint64
---@param oriented boolean
function LuaRendering.set_oriented(id, oriented) end

--- Offsets the center of the sprite or animation if `orientation_target` is given. This offset will rotate together with the sprite or animation. Set the oriented_offset of the sprite or animation with this id. Does nothing if this object is not a sprite or animation.
---@param id uint64
---@param oriented_offset Vector
function LuaRendering.set_oriented_offset(id, oriented_offset) end

--- Set the players that the object with this id is rendered to.
---@param id uint64
---@param players PlayerIdentification[] @Providing an empty array will set the object to be visible to all players.
function LuaRendering.set_players(id, players) end

--- Set the radius of the circle with this id. Does nothing if this object is not a circle.
---@param id uint64
---@param radius double
function LuaRendering.set_radius(id, radius) end

--- Set the render layer of the sprite or animation with this id. Does nothing if this object is not a sprite or animation.
---@param id uint64
---@param render_layer RenderLayer
function LuaRendering.set_render_layer(id, render_layer) end

--- Set where top bottom right of the rectangle with this id is drawn. Does nothing if this object is not a rectangle.
---@param id uint64
---@param right_bottom MapPosition | LuaEntity
---@param right_bottom_offset Vector|nil
---@overload fun(id: uint64, right_bottom: MapPosition | LuaEntity)
function LuaRendering.set_right_bottom(id, right_bottom, right_bottom_offset) end

--- Set the scale of the text or light with this id. Does nothing if this object is not a text or light.
---@param id uint64
---@param scale double
function LuaRendering.set_scale(id, scale) end

--- Set if the text with this id scales with player zoom, resulting in it always being the same size on screen, and the size compared to the game world changes. Does nothing if this object is not a text.
---@param id uint64
---@param scale_with_zoom boolean
function LuaRendering.set_scale_with_zoom(id, scale_with_zoom) end

--- Set the sprite of the sprite or light with this id. Does nothing if this object is not a sprite or light.
---@param id uint64
---@param sprite SpritePath
function LuaRendering.set_sprite(id, sprite) end

--- Set where the arc with this id starts. Does nothing if this object is not a arc.
---@param id uint64
---@param start_angle float @angle in radian
function LuaRendering.set_start_angle(id, start_angle) end

--- Set where the object with this id is drawn. Does nothing if this object does not support target.
---@param id uint64
---@param target MapPosition | LuaEntity
---@param target_offset Vector|nil
---@overload fun(id: uint64, target: MapPosition | LuaEntity)
function LuaRendering.set_target(id, target, target_offset) end

--- Set the text that is displayed by the text with this id. Does nothing if this object is not a text.
---@param id uint64
---@param text LocalisedString
function LuaRendering.set_text(id, text) end

--- Set the time to live of the object with this id. Set to 0 if the object should not expire.
---@param id uint64
---@param time_to_live uint
function LuaRendering.set_time_to_live(id, time_to_live) end

--- Set where the line with this id is drawn to. Does nothing if this object is not a line.
---@param id uint64
---@param to MapPosition | LuaEntity
---@param to_offset Vector|nil
---@overload fun(id: uint64, to: MapPosition | LuaEntity)
function LuaRendering.set_to(id, to, to_offset) end

--- Set the vertical alignment of the text with this id. Does nothing if this object is not a text.
---@param id uint64
---@param alignment string @"top", "middle", "baseline" or "bottom"
function LuaRendering.set_vertical_alignment(id, alignment) end

--- Set the vertices of the polygon with this id. Does nothing if this object is not a polygon.
---@param id uint64
---@param vertices ScriptRenderVertexTarget[]
function LuaRendering.set_vertices(id, vertices) end

--- Set whether this is rendered to anyone at all.
---@param id uint64
---@param visible boolean
function LuaRendering.set_visible(id, visible) end

--- Set the width of the object with this id. Does nothing if this object does not support width. Value is in pixels (32 per tile).
---@param id uint64
---@param width float
function LuaRendering.set_width(id, width) end

--- Set the horizontal scale of the sprite or animation with this id. Does nothing if this object is not a sprite or animation.
---@param id uint64
---@param x_scale double
function LuaRendering.set_x_scale(id, x_scale) end

--- Set the vertical scale of the sprite or animation with this id. Does nothing if this object is not a sprite or animation.
---@param id uint64
---@param y_scale double
function LuaRendering.set_y_scale(id, y_scale) end

---@class LuaResourceCategoryPrototype: any @Prototype of a resource category.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaResourceCategoryPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaResourceCategoryPrototype.help() end

---@class LuaRoboportControlBehavior: LuaControlBehavior @Control behavior for roboports.
  ---@field available_construction_output_signal SignalID @RW
  ---@field available_logistic_output_signal SignalID @RW
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field read_logistics boolean @RW; `true` if the roboport should report the logistics network content to the circuit network.
  ---@field read_robot_stats boolean @RW; `true` if the roboport should report the robot statistics to the circuit network.
  ---@field total_construction_output_signal SignalID @RW
  ---@field total_logistic_output_signal SignalID @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRoboportControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaRoboportControlBehavior.help() end

---@class LuaSettings: any @Object containing mod settings of three distinct types: `startup`, `global`, and `player`. An instance of LuaSettings is available through the global object named `settings`.
  ---@field global table<string, ModSetting> @RW; The current global mod settings, indexed by prototype name. Even though these are marked as read-only, they can be changed by overwriting individual [ModSetting](ModSetting) tables in the custom table. Mods can only change their own settings. Using the in-game console, all global settings can be changed.
  ---@field object_name string @RW; This object's name.
  ---@field player table<string, ModSetting> @RW; The default player mod settings for this map, indexed by prototype name. Even though these are marked as read-only, they can be changed by overwriting individual [ModSetting](ModSetting) tables in the custom table. Mods can only change their own settings. Using the in-game console, all player settings can be changed.
  ---@field startup table<string, ModSetting> @RW; The startup mod settings, indexed by prototype name.
LuaSettings = {}

--- Gets the current per-player settings for the given player, indexed by prototype name. Returns the same structure as [LuaPlayer::mod_settings](LuaPlayer::mod_settings).
---@param player PlayerIdentification
---@return table<string, ModSetting>
function LuaSettings.get_player_settings(player) end

---@class LuaShortcutPrototype: any @Prototype of a shortcut.
  ---@field action string @RW
  ---@field associated_control_input string @RW nilable; The control input that is associated with this shortcut, if any.
  ---@field item_to_spawn LuaItemPrototype @RW nilable; The item to create when this shortcut is used, if any.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field technology_to_unlock LuaTechnologyPrototype @RW nilable; The technology to unlock when this shortcut is used, if any.
  ---@field toggleable boolean @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaShortcutPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaShortcutPrototype.help() end

---@class LuaStorageTankControlBehavior: LuaControlBehavior @Control behavior for storage tanks.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaStorageTankControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaStorageTankControlBehavior.help() end

---@class LuaStyle: any @Style of a GUI element. All of the attributes listed here may be `nil` if not available for a particular GUI element.
  ---@field badge_font string @RW
  ---@field badge_horizontal_spacing int @RW
  ---@field bar_width uint @RW
  ---@field bottom_cell_padding int @RW; Space between the table cell contents bottom and border.
  ---@field bottom_margin int @RW
  ---@field bottom_padding int @RW
  ---@field cell_padding int @Space between the table cell contents and border. Sets top/right/bottom/left cell paddings to this value.
  ---@field clicked_font_color Color @RW
  ---@field clicked_vertical_offset int @RW
  ---@field color Color @RW
  ---@field column_alignments table<uint, Alignment> @RW; Array containing the alignment for every column of this table element. Even though this property is marked as read-only, the alignment can be changed by indexing the LuaCustomTable, like so:
  ---@field default_badge_font_color Color @RW
  ---@field disabled_badge_font_color Color @RW
  ---@field disabled_font_color Color @RW
  ---@field extra_bottom_margin_when_activated int @RW
  ---@field extra_bottom_padding_when_activated int @RW
  ---@field extra_left_margin_when_activated int @RW
  ---@field extra_left_padding_when_activated int @RW
  ---@field extra_margin_when_activated int | int[] @Sets `extra_top/right/bottom/left_margin_when_activated` to this value. An array with two values sets top/bottom margin to the first value and left/right margin to the second value. An array with four values sets top, right, bottom, left margin respectively.
  ---@field extra_padding_when_activated int | int[] @Sets `extra_top/right/bottom/left_padding_when_activated` to this value. An array with two values sets top/bottom padding to the first value and left/right padding to the second value. An array with four values sets top, right, bottom, left padding respectively.
  ---@field extra_right_margin_when_activated int @RW
  ---@field extra_right_padding_when_activated int @RW
  ---@field extra_top_margin_when_activated int @RW
  ---@field extra_top_padding_when_activated int @RW
  ---@field font string @RW
  ---@field font_color Color @RW
  ---@field gui LuaGui @RW; Gui of the [LuaGuiElement](LuaGuiElement) of this style.
  ---@field height int @Sets both minimal and maximal height to the given value.
  ---@field horizontal_align string @RW nilable; Horizontal align of the inner content of the widget, if any. Possible values are "left", "center" or "right".
  ---@field horizontal_spacing int @RW; Horizontal space between individual cells.
  ---@field horizontally_squashable boolean @RW nilable; Whether the GUI element can be squashed (by maximal width of some parent element) horizontally. `nil` if this element does not support squashing. This is mainly meant to be used for scroll-pane The default value is false.
  ---@field horizontally_stretchable boolean @RW nilable; Whether the GUI element stretches its size horizontally to other elements. `nil` if this element does not support stretching.
  ---@field hovered_font_color Color @RW
  ---@field left_cell_padding int @RW; Space between the table cell contents left and border.
  ---@field left_margin int @RW
  ---@field left_padding int @RW
  ---@field margin int | int[] @Sets top/right/bottom/left margins to this value. An array with two values sets top/bottom margin to the first value and left/right margin to the second value. An array with four values sets top, right, bottom, left margin respectively.
  ---@field maximal_height int @RW; Maximal height ensures, that the widget will never be bigger than than that size. It can't be stretched to be bigger.
  ---@field maximal_width int @RW; Maximal width ensures, that the widget will never be bigger than than that size. It can't be stretched to be bigger.
  ---@field minimal_height int @RW; Minimal height ensures, that the widget will never be smaller than than that size. It can't be squashed to be smaller.
  ---@field minimal_width int @RW; Minimal width ensures, that the widget will never be smaller than than that size. It can't be squashed to be smaller.
  ---@field name string @RW; Name of this style.
  ---@field natural_height int @RW; Natural height specifies the height of the element tries to have, but it can still be squashed/stretched to have a smaller or bigger size.
  ---@field natural_width int @RW; Natural width specifies the width of the element tries to have, but it can still be squashed/stretched to have a smaller or bigger size.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field padding int | int[] @Sets top/right/bottom/left paddings to this value. An array with two values sets top/bottom padding to the first value and left/right padding to the second value. An array with four values sets top, right, bottom, left padding respectively.
  ---@field pie_progress_color Color @RW
  ---@field rich_text_setting defines__rich_text_setting @RW; How this GUI element handles rich text.
  ---@field right_cell_padding int @RW; Space between the table cell contents right and border.
  ---@field right_margin int @RW
  ---@field right_padding int @RW
  ---@field selected_badge_font_color Color @RW
  ---@field selected_clicked_font_color Color @RW
  ---@field selected_font_color Color @RW
  ---@field selected_hovered_font_color Color @RW
  ---@field single_line boolean @RW
  ---@field size int | int[] @Sets both width and height to the given value. Also accepts an array with two values, setting width to the first and height to the second one.
  ---@field stretch_image_to_widget_size boolean @RW
  ---@field strikethrough_color Color @RW
  ---@field top_cell_padding int @RW; Space between the table cell contents top and border.
  ---@field top_margin int @RW
  ---@field top_padding int @RW
  ---@field use_header_filler boolean @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field vertical_align string @RW nilable; Vertical align of the inner content of the widget, if any. Possible values are "top", "center" or "bottom".
  ---@field vertical_spacing int @RW; Vertical space between individual cells.
  ---@field vertically_squashable boolean @RW nilable; Whether the GUI element can be squashed (by maximal height of some parent element) vertically. `nil` if this element does not support squashing. This is mainly meant to be used for scroll-pane The default (parent) value for scroll pane is true, false otherwise.
  ---@field vertically_stretchable boolean @RW nilable; Whether the GUI element stretches its size vertically to other elements. `nil` if this element does not support stretching.
  ---@field width int @Sets both minimal and maximal width to the given value.
LuaStyle = {}

--- All methods and properties that this object supports.
---@return string
function LuaStyle.help() end

---@class LuaSurface: any @A "domain" of the world. Surfaces can only be created and deleted through the API. Surfaces are uniquely identified by their name. Every game contains at least the surface "nauvis".
  ---@field always_day boolean @RW; When set to true, the sun will always shine.
  ---@field brightness_visual_weights ColorModifier @RW; Defines how surface daytime brightness influences each color channel of the current color lookup table (LUT). The LUT is multiplied by `((1 - weight) + brightness * weight)` and result is clamped to range [0, 1]. Default is `{0, 0, 0}`, which means no influence.
  ---@field darkness float @RW; Amount of darkness at the current time, as a number in range [0, 1].
  ---@field dawn double @RW; The daytime when dawn starts.
  ---@field daytime double @RW; Current time of day, as a number in range [0, 1).
  ---@field dusk double @RW; The daytime when dusk starts.
  ---@field evening double @RW; The daytime when evening starts.
  ---@field freeze_daytime boolean @RW; True if daytime is currently frozen.
  ---@field generate_with_lab_tiles boolean @RW; When set to true, new chunks will be generated with lab tiles, instead of using the surface's map generation settings.
  ---@field index uint @RW; Unique ID associated with this surface.
  ---@field map_gen_settings MapGenSettings @RW; The generation settings for this surface. These can be modified to after surface generation, but note that this will not retroactively update the surface. To manually adjust it, [LuaSurface::regenerate_entity](LuaSurface::regenerate_entity), [LuaSurface::regenerate_decorative](LuaSurface::regenerate_decorative) and [LuaSurface::delete_chunk](LuaSurface::delete_chunk) can be used.
  ---@field min_brightness double @RW; The minimal brightness during the night. Default is `0.15`. The value has an effect on the game simalution only, it doesn't have any effect on rendering.
  ---@field morning double @RW; The daytime when morning starts.
  ---@field name string @RW; The name of this surface. Names are unique among surfaces.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field peaceful_mode boolean @RW; Is peaceful mode enabled on this surface?
  ---@field show_clouds boolean @RW; If clouds are shown on this surface.
  ---@field solar_power_multiplier double @RW; The multiplier of solar power on this surface. Cannot be less than 0.
  ---@field ticks_per_day uint @RW; The number of ticks per day for this surface.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field wind_orientation RealOrientation @RW; Current wind direction.
  ---@field wind_orientation_change double @RW; Change in wind orientation per tick.
  ---@field wind_speed double @RW; Current wind speed.
LuaSurface = {}

--- Adds the given script area.
---@param area ScriptArea
---@return uint @The id of the created area.
function LuaSurface.add_script_area(area) end

--- Adds the given script position.
---@param area ScriptPosition
---@return uint @The id of the created position.
function LuaSurface.add_script_position(area) end

--- Sets the given area to the checkerboard lab tiles.
---@param area BoundingBox @The tile area.
function LuaSurface.build_checkerboard(area) end

--- Send a group to build a new base.
---@param position MapPosition @Location of the new base.
---@param unit_count uint @Number of biters to send for the base-building task.
---@param force ForceIdentification|nil @Force the new base will belong to. Defaults to enemy.
---@overload fun(position: MapPosition, unit_count: uint)
function LuaSurface.build_enemy_base(position, unit_count, force) end

---@param property_names string[] @Names of properties (e.g. "elevation") to calculate
---@param positions MapPosition[] @Positions for which to calculate property values
---@return table<string, double[]> @Table of property value lists, keyed by property name
function LuaSurface.calculate_tile_properties(property_names, positions) end

---@shape LuaSurface_can_fast_replace_params
   ---@field name string @Name of the entity to check.
   ---@field position MapPosition @Where the entity would be placed.
   ---@field direction defines__direction|nil @Direction the entity would be placed. Defaults to `north`.
   ---@field force ForceIdentification|nil @The force that would place the entity. Defaults to the `"neutral"` force.

--- If there exists an entity at the given location that can be fast-replaced with the given entity parameters.
---@param p LuaSurface_can_fast_replace_params
---@return boolean
function LuaSurface.can_fast_replace(p) end

---@shape LuaSurface_can_place_entity_params
   ---@field name string @Name of the entity prototype to check.
   ---@field position MapPosition @Where the entity would be placed.
   ---@field direction defines__direction|nil @Direction of the placed entity. Defaults to `north`.
   ---@field force ForceIdentification|nil @The force that would place the entity. Defaults to the `"neutral"` force.
   ---@field build_check_type defines__build_check_type|nil @Which type of check should be carried out. Defaults to `ghost_revive`.
   ---@field forced boolean|nil @If `true`, entities that can be marked for deconstruction are ignored. Only used if `build_check_type` is either `manual_ghost`, `script_ghost` or `blueprint_ghost`. Defaults to `false`.
   ---@field inner_name string|nil @The prototype name of the entity contained in the ghost. Only used if `name` is `entity-ghost`.

--- Check for collisions with terrain or other entities.
---@param p LuaSurface_can_place_entity_params
---@return boolean
function LuaSurface.can_place_entity(p) end

---@shape LuaSurface_cancel_deconstruct_area_params
   ---@field area BoundingBox @The area to cancel deconstruction orders in.
   ---@field force ForceIdentification @The force whose deconstruction orders to cancel.
   ---@field player PlayerIdentification|nil @The player to set the last_user to if any.
   ---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
   ---@field item LuaItemStack|nil @The deconstruction item to use if any.

--- Cancel a deconstruction order.
---@param p LuaSurface_cancel_deconstruct_area_params
function LuaSurface.cancel_deconstruct_area(p) end

---@shape LuaSurface_cancel_upgrade_area_params
   ---@field area BoundingBox @The area to cancel upgrade orders in.
   ---@field force ForceIdentification @The force whose upgrade orders to cancel.
   ---@field player PlayerIdentification|nil @The player to set the last_user to if any.
   ---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
   ---@field item LuaItemStack|nil @The upgrade item to use if any.

--- Cancel a upgrade order.
---@param p LuaSurface_cancel_upgrade_area_params
function LuaSurface.cancel_upgrade_area(p) end

--- Clears this surface deleting all entities and chunks on it.
---@param ignore_characters boolean|nil @Whether characters on this surface that are connected to or associated with players should be ignored (not destroyed).
---@overload fun()
function LuaSurface.clear(ignore_characters) end

--- Clears all pollution on this surface.
function LuaSurface.clear_pollution() end

---@shape LuaSurface_clone_area_params
   ---@field source_area BoundingBox
   ---@field destination_area BoundingBox
   ---@field destination_surface SurfaceIdentification|nil
   ---@field destination_force (LuaForce | string)|nil
   ---@field clone_tiles boolean|nil @If tiles should be cloned
   ---@field clone_entities boolean|nil @If entities should be cloned
   ---@field clone_decoratives boolean|nil @If decoratives should be cloned
   ---@field clear_destination_entities boolean|nil @If the destination entities should be cleared
   ---@field clear_destination_decoratives boolean|nil @If the destination decoratives should be cleared
   ---@field expand_map boolean|nil @If the destination surface should be expanded when destination_area is outside current bounds. Default false.
   ---@field create_build_effect_smoke boolean|nil @If true, the building effect smoke will be shown around the new entities.

--- Clones the given area.
---@param p LuaSurface_clone_area_params
function LuaSurface.clone_area(p) end

---@shape LuaSurface_clone_brush_params
   ---@field source_offset TilePosition
   ---@field destination_offset TilePosition
   ---@field source_positions TilePosition[]
   ---@field destination_surface SurfaceIdentification|nil
   ---@field destination_force (LuaForce | string)|nil
   ---@field clone_tiles boolean|nil @If tiles should be cloned
   ---@field clone_entities boolean|nil @If entities should be cloned
   ---@field clone_decoratives boolean|nil @If decoratives should be cloned
   ---@field clear_destination_entities boolean|nil @If the destination entities should be cleared
   ---@field clear_destination_decoratives boolean|nil @If the destination decoratives should be cleared
   ---@field expand_map boolean|nil @If the destination surface should be expanded when destination_area is outside current bounds. Default false.
   ---@field manual_collision_mode boolean|nil @If manual-style collision checks should be done.
   ---@field create_build_effect_smoke boolean|nil @If true, the building effect smoke will be shown around the new entities.

--- Clones the given area.
---@param p LuaSurface_clone_brush_params
function LuaSurface.clone_brush(p) end

---@shape LuaSurface_clone_entities_params
   ---@field entities LuaEntity[]
   ---@field destination_offset Vector
   ---@field destination_surface SurfaceIdentification|nil
   ---@field destination_force ForceIdentification|nil
   ---@field snap_to_grid boolean|nil
   ---@field create_build_effect_smoke boolean|nil @If true, the building effect smoke will be shown around the new entities.

--- Clones the given entities.
---@param p LuaSurface_clone_entities_params
function LuaSurface.clone_entities(p) end

---@shape LuaSurface_count_entities_filtered_params
   ---@field area BoundingBox|nil
   ---@field position MapPosition|nil
   ---@field radius double|nil @If given with position, will count all entities within the radius of the position.
   ---@field name (string | string[])|nil
   ---@field type (string | string[])|nil
   ---@field ghost_name (string | string[])|nil
   ---@field ghost_type (string | string[])|nil
   ---@field direction (defines__direction | defines__direction[])|nil
   ---@field collision_mask (CollisionMaskLayer | CollisionMaskLayer[])|nil
   ---@field force (ForceIdentification | ForceIdentification[])|nil
   ---@field to_be_deconstructed boolean|nil
   ---@field to_be_upgraded boolean|nil
   ---@field limit uint|nil
   ---@field is_military_target boolean|nil
   ---@field invert boolean|nil @Whether the filters should be inverted.

--- Count entities of given type or name in a given area. Works just like [LuaSurface::find_entities_filtered](LuaSurface::find_entities_filtered), except this only returns the count. As it doesn't construct all the wrapper objects, this is more efficient if one is only interested in the number of entities.
--- If no `area` or `position` are given, the entire surface is searched. If `position` is given, this returns the entities colliding with that position (i.e the given position is within the entity's collision box). If `position` and `radius` are given, this returns entities in the radius of the position. If `area` is specified, this returns entities colliding with that area.
---@param p LuaSurface_count_entities_filtered_params
---@return uint
function LuaSurface.count_entities_filtered(p) end

---@shape LuaSurface_count_tiles_filtered_params
   ---@field area BoundingBox|nil
   ---@field position MapPosition|nil @Ignored if not given with radius.
   ---@field radius double|nil @If given with position, will return all entities within the radius of the position.
   ---@field name (string | string[])|nil
   ---@field force (ForceIdentification | ForceIdentification[])|nil
   ---@field limit uint|nil
   ---@field has_hidden_tile boolean|nil
   ---@field has_tile_ghost boolean|nil @Can be further filtered by supplying a `force` filter.
   ---@field to_be_deconstructed boolean|nil @Can be further filtered by supplying a `force` filter.
   ---@field collision_mask (CollisionMaskLayer | CollisionMaskLayer[])|nil
   ---@field invert boolean|nil @If the filters should be inverted.

--- Count tiles of a given name in a given area. Works just like [LuaSurface::find_tiles_filtered](LuaSurface::find_tiles_filtered), except this only returns the count. As it doesn't construct all the wrapper objects, this is more efficient if one is only interested in the number of tiles.
--- If no `area` or `position` and `radius` is given, the entire surface is searched. If `position` and `radius` are given, only tiles within the radius of the position are included.
---@param p LuaSurface_count_tiles_filtered_params
---@return uint
function LuaSurface.count_tiles_filtered(p) end

---@shape LuaSurface_create_decoratives_params
   ---@field check_collision boolean|nil @If collision should be checked against entities/tiles.
   ---@field decoratives Decorative[]

--- Adds the given decoratives to the surface.
---@param p LuaSurface_create_decoratives_params
function LuaSurface.create_decoratives(p) end

---@shape LuaSurface_create_entity_params
   ---@field name string @The entity prototype name to create.
   ---@field position MapPosition @Where to create the entity.
   ---@field direction defines__direction|nil @Desired orientation of the entity after creation.
   ---@field force ForceIdentification|nil @Force of the entity, default is enemy.
   ---@field target (LuaEntity | MapPosition)|nil @Entity with health for the new entity to target.
   ---@field source (LuaEntity | MapPosition)|nil @Source entity. Used for beams and highlight-boxes.
   ---@field fast_replace boolean|nil @If true, building will attempt to simulate fast-replace building.
   ---@field player PlayerIdentification|nil @If given set the last_user to this player. If fast_replace is true simulate fast replace using this player.
   ---@field spill boolean|nil @If false while fast_replace is true and player is nil any items from fast-replacing will be deleted instead of dropped on the ground.
   ---@field raise_built boolean|nil @If true; [defines.events.script_raised_built](defines.events.script_raised_built) will be fired on successful entity creation.
   ---@field create_build_effect_smoke boolean|nil @If false, the building effect smoke will not be shown around the new entity.
   ---@field spawn_decorations boolean|nil @If true, entity types that have spawn_decorations property will apply triggers defined in the property.
   ---@field move_stuck_players boolean|nil @If true, any characters that are in the way of the entity are teleported out of the way.
   ---@field item LuaItemStack|nil @If provided, the entity will attempt to pull stored values from this item (for example; creating a spidertron from a previously named and mined spidertron)

--- Create an entity on this surface.
---@param p LuaSurface_create_entity_params
---@return LuaEntity @The created entity or `nil` if the creation failed.
function LuaSurface.create_entity(p) end

---@shape LuaSurface_create_particle_params
   ---@field name string @The particle name.
   ---@field position MapPosition @Where to create the particle.
   ---@field movement Vector
   ---@field height float
   ---@field vertical_speed float
   ---@field frame_speed float

--- Creates a particle at the given location
---@param p LuaSurface_create_particle_params
function LuaSurface.create_particle(p) end

---@shape LuaSurface_create_trivial_smoke_params
   ---@field name string @The smoke prototype name to create.
   ---@field position MapPosition @Where to create the smoke.

---@param p LuaSurface_create_trivial_smoke_params
function LuaSurface.create_trivial_smoke(p) end

---@shape LuaSurface_create_unit_group_params
   ---@field position MapPosition @Initial position of the new unit group.
   ---@field force ForceIdentification|nil @Force of the new unit group. Defaults to `"enemy"`.

--- Create a new unit group at a given position.
---@param p LuaSurface_create_unit_group_params
---@return LuaUnitGroup
function LuaSurface.create_unit_group(p) end

---@shape LuaSurface_deconstruct_area_params
   ---@field area BoundingBox @The area to mark for deconstruction.
   ---@field force ForceIdentification @The force whose bots should perform the deconstruction.
   ---@field player PlayerIdentification|nil @The player to set the last_user to if any.
   ---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
   ---@field item LuaItemStack|nil @The deconstruction item to use if any.

--- Place a deconstruction request.
---@param p LuaSurface_deconstruct_area_params
function LuaSurface.deconstruct_area(p) end

---@param prototype string @The decorative prototype to check
---@param position MapPosition @The position to check
function LuaSurface.decorative_prototype_collides(prototype, position) end

---@param position ChunkPosition @The chunk position to delete
function LuaSurface.delete_chunk(position) end

---@shape LuaSurface_destroy_decoratives_params
   ---@field area BoundingBox|nil
   ---@field position TilePosition|nil
   ---@field name (string | string[] | LuaDecorativePrototype | LuaDecorativePrototype[])|nil
   ---@field collision_mask (CollisionMaskLayer | CollisionMaskLayer[])|nil
   ---@field from_layer string|nil
   ---@field to_layer string|nil
   ---@field exclude_soft boolean|nil @Soft decoratives can be drawn over rails.
   ---@field limit uint|nil
   ---@field invert boolean|nil @If the filters should be inverted.

--- Removes all decoratives from the given area. If no area and no position are given, then the entire surface is searched.
---@param p LuaSurface_destroy_decoratives_params
function LuaSurface.destroy_decoratives(p) end

--- Sets the given script area to the new values.
---@param id uint @The area to edit.
---@param area ScriptArea
function LuaSurface.edit_script_area(id, area) end

--- Sets the given script position to the new values.
---@param id uint @The position to edit.
---@param area ScriptPosition
function LuaSurface.edit_script_position(id, area) end

---@param prototype EntityPrototypeIdentification @The entity prototype to check
---@param position MapPosition @The position to check
---@param use_map_generation_bounding_box boolean @If the map generation bounding box should be used instead of the collision bounding box
---@param direction defines__direction|nil
---@overload fun(prototype: EntityPrototypeIdentification, position: MapPosition, use_map_generation_bounding_box: boolean)
function LuaSurface.entity_prototype_collides(prototype, position, use_map_generation_bounding_box, direction) end

---@shape LuaSurface_find_decoratives_filtered_params
   ---@field area BoundingBox|nil
   ---@field position TilePosition|nil
   ---@field name (string | string[] | LuaDecorativePrototype | LuaDecorativePrototype[])|nil
   ---@field collision_mask (CollisionMaskLayer | CollisionMaskLayer[])|nil
   ---@field from_layer string|nil
   ---@field to_layer string|nil
   ---@field exclude_soft boolean|nil @Soft decoratives can be drawn over rails.
   ---@field limit uint|nil
   ---@field invert boolean|nil @If the filters should be inverted.

--- Find decoratives of a given name in a given area.
--- If no filters are given, returns all decoratives in the search area. If multiple filters are specified, returns only decoratives matching every given filter. If no area and no position are given, the entire surface is searched.
---@param p LuaSurface_find_decoratives_filtered_params
---@return DecorativeResult[]
function LuaSurface.find_decoratives_filtered(p) end

--- Find enemy units (entities with type "unit") of a given force within an area.
---@param center MapPosition @Center of the search area
---@param radius double @Radius of the circular search area
---@param force (LuaForce | string)|nil @Force to find enemies of. If not given, uses the player force.
---@overload fun(center: MapPosition, radius: double): LuaEntity[]
---@return LuaEntity[]
function LuaSurface.find_enemy_units(center, radius, force) end

--- Find entities in a given area.
--- If no area is given all entities on the surface are returned.
---@param area BoundingBox|nil
---@overload fun(): LuaEntity[]
---@return LuaEntity[]
function LuaSurface.find_entities(area) end

---@shape LuaSurface_find_entities_filtered_params
   ---@field area BoundingBox|nil
   ---@field position MapPosition|nil @Has precedence over area field.
   ---@field radius double|nil
   ---@field name (string | string[])|nil
   ---@field type (string | string[])|nil
   ---@field ghost_name (string | string[])|nil
   ---@field ghost_type (string | string[])|nil
   ---@field direction (defines__direction | defines__direction[])|nil
   ---@field collision_mask (CollisionMaskLayer | CollisionMaskLayer[])|nil
   ---@field force (ForceIdentification | ForceIdentification[])|nil
   ---@field to_be_deconstructed boolean|nil
   ---@field to_be_upgraded boolean|nil
   ---@field limit uint|nil
   ---@field is_military_target boolean|nil
   ---@field invert boolean|nil @Whether the filters should be inverted.

--- Find all entities of the given type or name in the given area.
--- If no filters (`name`, `type`, `force`, etc.) are given, this returns all entities in the search area. If multiple filters are specified, only entities matching all given filters are returned.
--- - If no `area` or `position` are given, the entire surface is searched.
--- - If `position` is given, this returns the entities colliding with that position (i.e the given position is within the entity's collision box).
--- - If `position` and `radius` are given, this returns the entities within the radius of the position. Looks for the center of entities.
--- - If `area` is specified, this returns the entities colliding with that area.
---@param p LuaSurface_find_entities_filtered_params
---@return LuaEntity[]
function LuaSurface.find_entities_filtered(p) end

--- Find a specific entity at a specific position.
---@param entity string @Entity to look for.
---@param position MapPosition @Coordinates to look at.
---@return LuaEntity @`nil` if no such entity is found.
function LuaSurface.find_entity(entity, position) end

--- Find the logistic network that covers a given position.
---@param position MapPosition
---@param force ForceIdentification @Force the logistic network should belong to.
---@return LuaLogisticNetwork @The found network or `nil` if no such network was found.
function LuaSurface.find_logistic_network_by_position(position, force) end

--- Finds all of the logistics networks whose construction area intersects with the given position.
---@param position MapPosition
---@param force ForceIdentification @Force the logistic networks should belong to.
---@return LuaLogisticNetwork[]
function LuaSurface.find_logistic_networks_by_construction_area(position, force) end

---@shape LuaSurface_find_nearest_enemy_params
   ---@field position MapPosition @Center of the search area.
   ---@field max_distance double @Radius of the circular search area.
   ---@field force ForceIdentification|nil @The force the result will be an enemy of. Uses the player force if not specified.

--- Find the enemy military target ([military entity](https://wiki.factorio.com/Military_units_and_structures)) closest to the given position.
---@param p LuaSurface_find_nearest_enemy_params
---@return LuaEntity @The nearest enemy military target or `nil` if no enemy could be found within the given area.
function LuaSurface.find_nearest_enemy(p) end

---@shape LuaSurface_find_nearest_enemy_entity_with_owner_params
   ---@field position MapPosition @Center of the search area.
   ---@field max_distance double @Radius of the circular search area.
   ---@field force ForceIdentification|nil @The force the result will be an enemy of. Uses the player force if not specified.

--- Find the enemy entity-with-owner closest to the given position.
---@param p LuaSurface_find_nearest_enemy_entity_with_owner_params
---@return LuaEntity @The nearest enemy entity-with-owner or `nil` if no enemy could be found within the given area.
function LuaSurface.find_nearest_enemy_entity_with_owner(p) end

--- Find a non-colliding position within a given radius.
---@param name string @Prototype name of the entity to find a position for. (The bounding box for the collision checking is taken from this prototype.)
---@param center MapPosition @Center of the search area.
---@param radius double @Max distance from `center` to search in. A radius of `0` means an infinitely-large search area.
---@param precision double @The step length from the given position as it searches, in tiles. Minimum value is `0.01`.
---@param force_to_tile_center boolean|nil @Will only check tile centers. This can be useful when your intent is to place a building at the resulting position, as they must generally be placed at tile centers. Default false.
---@overload fun(name: string, center: MapPosition, radius: double, precision: double): MapPosition
---@return MapPosition @The non-colliding position. May be `nil` if no suitable position was found.
function LuaSurface.find_non_colliding_position(name, center, radius, precision, force_to_tile_center) end

--- Find a non-colliding position within a given rectangle.
---@param name string @Prototype name of the entity to find a position for. (The bounding box for the collision checking is taken from this prototype.)
---@param search_space BoundingBox @The rectangle to search inside.
---@param precision double @The step length from the given position as it searches, in tiles. Minimum value is 0.01.
---@param force_to_tile_center boolean|nil @Will only check tile centers. This can be useful when your intent is to place a building at the resulting position, as they must generally be placed at tile centers. Default false.
---@overload fun(name: string, search_space: BoundingBox, precision: double): MapPosition
---@return MapPosition @The non-colliding position. May be `nil` if no suitable position was found.
function LuaSurface.find_non_colliding_position_in_box(name, search_space, precision, force_to_tile_center) end

---@shape LuaSurface_find_tiles_filtered_params
   ---@field area BoundingBox|nil
   ---@field position MapPosition|nil @Ignored if not given with radius.
   ---@field radius double|nil @If given with position, will return all entities within the radius of the position.
   ---@field name (string | string[])|nil
   ---@field force (ForceIdentification | ForceIdentification[])|nil
   ---@field limit uint|nil
   ---@field has_hidden_tile boolean|nil
   ---@field has_tile_ghost boolean|nil @Can be further filtered by supplying a `force` filter.
   ---@field to_be_deconstructed boolean|nil @Can be further filtered by supplying a `force` filter.
   ---@field collision_mask (CollisionMaskLayer | CollisionMaskLayer[])|nil
   ---@field invert boolean|nil @Whether the filters should be inverted.

--- Find all tiles of the given name in the given area.
--- If no filters are given, this returns all tiles in the search area.
--- If no `area` or `position` and `radius` is given, the entire surface is searched. If `position` and `radius` are given, only tiles within the radius of the position are included.
---@param p LuaSurface_find_tiles_filtered_params
---@return LuaTile[]
function LuaSurface.find_tiles_filtered(p) end

---@shape LuaSurface_find_units_params
   ---@field area BoundingBox @Box to find units within.
   ---@field force LuaForce | string @Force performing the search.
   ---@field condition ForceCondition @Only forces which meet the condition will be included in the search.

--- Find units (entities with type "unit") of a given force and force condition within a given area.
---@param p LuaSurface_find_units_params
---@return LuaEntity[]
function LuaSurface.find_units(p) end

--- Blocks and generates all chunks that have been requested using all available threads.
function LuaSurface.force_generate_chunk_requests() end

--- Get an iterator going over every chunk on this surface.
---@return LuaChunkIterator
function LuaSurface.get_chunks() end

--- Gets the closest entity in the list to this position.
---@param position MapPosition
---@param entities LuaEntity[] @The Entities to check
---@return LuaEntity
function LuaSurface.get_closest(position, entities) end

--- Gets all tiles of the given types that are connected horizontally or vertically to the given tile position including the given tile position.
---@param position TilePosition @The tile position to start at.
---@param tiles string[] @The tiles to search for.
---@return TilePosition[] @The resulting set of tiles.
function LuaSurface.get_connected_tiles(position, tiles) end

--- Returns all the military targets (entities with force) on this chunk for the given force.
---@param position ChunkPosition @The chunk's position.
---@param force LuaForce | string @Entities of this force will be returned.
---@return LuaEntity[]
function LuaSurface.get_entities_with_force(position, force) end

--- The hidden tile name.
---@param position TilePosition @The tile position.
---@return string @`nil` if there isn't one for the given position.
function LuaSurface.get_hidden_tile(position) end

--- Gets the map exchange string for the current map generation settings of this surface.
---@return string
function LuaSurface.get_map_exchange_string() end

--- Get the pollution for a given position.
---@param position MapPosition
---@return double
function LuaSurface.get_pollution(position) end

--- Gets a random generated chunk position or 0,0 if no chunks have been generated on this surface.
---@return ChunkPosition
function LuaSurface.get_random_chunk() end

--- Gets the resource amount of all resources on this surface
---@return table<string, uint>
function LuaSurface.get_resource_counts() end

--- Gets the first script area by name or id.
---@param key (string | uint)|nil @The name or id of the area to get.
---@overload fun(): ScriptArea
---@return ScriptArea
function LuaSurface.get_script_area(key) end

--- Gets the script areas that match the given name or if no name is given all areas are returned.
---@param name string|nil
---@overload fun(): ScriptArea[]
---@return ScriptArea[]
function LuaSurface.get_script_areas(name) end

--- Gets the first script position by name or id.
---@param key (string | uint)|nil @The name or id of the position to get.
---@overload fun(): ScriptPosition
---@return ScriptPosition
function LuaSurface.get_script_position(key) end

--- Gets the script positions that match the given name or if no name is given all positions are returned.
---@param name string|nil
---@overload fun(): ScriptPosition[]
---@return ScriptPosition[]
function LuaSurface.get_script_positions(name) end

--- Gets the starting area radius of this surface.
---@return double
function LuaSurface.get_starting_area_radius() end

--- Get the tile at a given position. An alternative call signature for this method is passing it a single [TilePosition](TilePosition).
---@param x int
---@param y int
---@return LuaTile
function LuaSurface.get_tile(x, y) end

--- Gets the total amount of pollution on the surface by iterating over all of the chunks containing pollution.
---@return double
function LuaSurface.get_total_pollution() end

---@shape LuaSurface_get_train_stops_params
   ---@field name (string | string[])|nil @The name(s) of the train stops. Not providing names will match any stop.
   ---@field force ForceIdentification|nil @The force to search. Not providing a force will match stops in any force.

--- Gets train stops matching the given filters.
---@param p LuaSurface_get_train_stops_params
---@return LuaEntity[]
---@overload fun(): LuaEntity[]
function LuaSurface.get_train_stops(p) end

---@param force ForceIdentification|nil @The force to search. Not providing a force will match trains in any force.
---@overload fun(): LuaTrain[]
---@return LuaTrain[]
function LuaSurface.get_trains(force) end

--- All methods and properties that this object supports.
---@return string
function LuaSurface.help() end

--- Is a given chunk generated?
---@param position ChunkPosition @The chunk's position.
---@return boolean
function LuaSurface.is_chunk_generated(position) end

---@shape LuaSurface_play_sound_params
   ---@field path SoundPath @The sound to play.
   ---@field position MapPosition|nil @Where the sound should be played. If not given, it's played at the current position of each player.
   ---@field volume_modifier double|nil @The volume of the sound to play. Must be between 0 and 1 inclusive.
   ---@field override_sound_type SoundType|nil @The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.

--- Play a sound for every player on this surface.
---@param p LuaSurface_play_sound_params
function LuaSurface.play_sound(p) end

--- Spawn pollution at the given position.
---@param source MapPosition @Where to spawn the pollution.
---@param amount double @How much pollution to add.
function LuaSurface.pollute(source, amount) end

--- Print text to the chat console of all players on this surface.
---@param message LocalisedString
---@param color Color|nil
---@overload fun(message: LocalisedString)
function LuaSurface.print(message, color) end

--- Regenerate autoplacement of some decoratives on this surface. This can be used to autoplace newly-added decoratives.
---@param decoratives (string | string[])|nil @Prototype names of decorative or decoratives to autoplace. When `nil` all decoratives with an autoplace are used.
---@param chunks ChunkPosition[]|nil @The chunk positions to regenerate the entities on. If not given all chunks are regenerated. Note chunks with status < entities are ignored.
---@overload fun(decoratives: (string | string[])|nil)
---@overload fun()
function LuaSurface.regenerate_decorative(decoratives, chunks) end

--- Regenerate autoplacement of some entities on this surface. This can be used to autoplace newly-added entities.
---@param entities (string | string[])|nil @Prototype names of entity or entities to autoplace. When `nil` all entities with an autoplace are used.
---@param chunks ChunkPosition[]|nil @The chunk positions to regenerate the entities on. If not given all chunks are regenerated. Note chunks with status < entities are ignored.
---@overload fun(entities: (string | string[])|nil)
---@overload fun()
function LuaSurface.regenerate_entity(entities, chunks) end

--- Removes the given script area.
---@param id uint
---@return boolean @If the area was actually removed. False when it didn't exist.
function LuaSurface.remove_script_area(id) end

--- Removes the given script position.
---@param id uint
---@return boolean @If the position was actually removed. False when it didn't exist.
function LuaSurface.remove_script_position(id) end

---@shape LuaSurface_request_path_params
   ---@field bounding_box BoundingBox @The dimensions of the object that's supposed to travel the path.
   ---@field collision_mask CollisionMaskWithFlags | string[] @The list of masks the `bounding_box` collides with.
   ---@field start MapPosition @The position from which to start pathfinding.
   ---@field goal MapPosition @The position to find a path to.
   ---@field force ForceIdentification @The force for which to generate the path, determining which gates can be opened for example.
   ---@field radius double|nil @How close the pathfinder needs to get to its `goal` (in tiles). Defaults to `1`.
   ---@field pathfind_flags PathfinderFlags|nil @Flags that affect pathfinder behavior.
   ---@field can_open_gates boolean|nil @Whether the path request can open gates. Defaults to `false`.
   ---@field path_resolution_modifier int|nil @Defines how coarse the pathfinder's grid is. Smaller values mean a coarser grid (negative numbers allowed). Allowed values are from -8 to 8. Defaults to `0`.
   ---@field entity_to_ignore LuaEntity|nil @Makes the pathfinder ignore collisions with this entity if it is given.

--- Generates a path with the specified constraints (as an array of [PathfinderWaypoints](PathfinderWaypoint)) using the unit pathfinding algorithm. This path can be used to emulate pathing behavior by script for non-unit entities, such as vehicles. If you want to command actual units (such as biters or spitters) to move, use [LuaEntity::set_command](LuaEntity::set_command) instead.
--- The resulting path is ultimately returned asynchronously via [on_script_path_request_finished](on_script_path_request_finished).
---@param p LuaSurface_request_path_params
---@return uint @A unique handle to identify this call when [on_script_path_request_finished](on_script_path_request_finished) fires.
function LuaSurface.request_path(p) end

--- Request that the game's map generator generate chunks at the given position for the given radius on this surface.
---@param position MapPosition @Where to generate the new chunks.
---@param radius uint @The chunk radius from `position` to generate new chunks in.
function LuaSurface.request_to_generate_chunks(position, radius) end

--- Set generated status of a chunk. Useful when copying chunks.
---@param position ChunkPosition @The chunk's position.
---@param status defines__chunk_generated_status @The chunk's new status.
function LuaSurface.set_chunk_generated_status(position, status) end

--- Set the hidden tile for the specified position. While during normal gameplay only [non-mineable](LuaTilePrototype::mineable_properties) tiles can become hidden, this method allows any kind of tile to be set as the hidden one.
---@param position TilePosition @The tile position.
---@param tile string | LuaTilePrototype @The new hidden tile or `nil` to clear the hidden tile.
function LuaSurface.set_hidden_tile(position, tile) end

---@shape LuaSurface_set_multi_command_params
   ---@field command Command
   ---@field unit_count uint @Number of units to give the command to.
   ---@field force ForceIdentification|nil @Force of the units this command is to be given to. If not specified, uses the enemy force.
   ---@field unit_search_distance uint|nil @Radius to search for units. The search area is centered on the destination of the command.

--- Give a command to multiple units. This will automatically select suitable units for the task.
---@param p LuaSurface_set_multi_command_params
---@return uint @Number of units actually sent. May be less than `count` if not enough units were available.
function LuaSurface.set_multi_command(p) end

--- Set tiles at specified locations. Can automatically correct the edges around modified tiles.
--- Placing a [mineable](LuaTilePrototype::mineable_properties) tile on top of a non-mineable one will turn the latter into the [LuaTile::hidden_tile](LuaTile::hidden_tile) for that tile. Placing a mineable tile on a mineable one or a non-mineable tile on a non-mineable one will not modify the hidden tile. This restriction can however be circumvented by using [LuaSurface::set_hidden_tile](LuaSurface::set_hidden_tile).
---@param tiles Tile[]
---@param correct_tiles boolean|nil @If `false`, the correction logic is not applied to the changed tiles. Defaults to `true`.
---@param remove_colliding_entities (boolean | string)|nil @`true`, `false`, or `abort_on_collision`. Defaults to `true`.
---@param remove_colliding_decoratives boolean|nil @`true` or `false`. Defaults to `true`.
---@param raise_event boolean|nil @`true` or `false`. Defaults to `false`.
---@overload fun(tiles: Tile[], correct_tiles: boolean|nil, remove_colliding_entities: (boolean | string)|nil, remove_colliding_decoratives: boolean|nil)
---@overload fun(tiles: Tile[], correct_tiles: boolean|nil, remove_colliding_entities: (boolean | string)|nil)
---@overload fun(tiles: Tile[], correct_tiles: boolean|nil)
---@overload fun(tiles: Tile[])
function LuaSurface.set_tiles(tiles, correct_tiles, remove_colliding_entities, remove_colliding_decoratives, raise_event) end

--- Spill items on the ground centered at a given location.
---@param position MapPosition @Center of the spillage
---@param items ItemStackIdentification @Items to spill
---@param enable_looted boolean|nil @When true, each created item will be flagged with the [LuaEntity::to_be_looted](LuaEntity::to_be_looted) flag.
---@param force (LuaForce | string)|nil @When provided (and not `nil`) the items will be marked for deconstruction by this force.
---@param allow_belts boolean|nil @Whether items can be spilled onto belts. Defaults to `true`.
---@overload fun(position: MapPosition, items: ItemStackIdentification, enable_looted: boolean|nil, force: (LuaForce | string)|nil): LuaEntity[]
---@overload fun(position: MapPosition, items: ItemStackIdentification, enable_looted: boolean|nil): LuaEntity[]
---@overload fun(position: MapPosition, items: ItemStackIdentification): LuaEntity[]
---@return LuaEntity[] @The created item-on-ground entities.
function LuaSurface.spill_item_stack(position, items, enable_looted, force, allow_belts) end

---@shape LuaSurface_upgrade_area_params
   ---@field area BoundingBox @The area to mark for upgrade.
   ---@field force ForceIdentification @The force whose bots should perform the upgrade.
   ---@field player PlayerIdentification|nil @The player to set the last_user to if any.
   ---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
   ---@field item LuaItemStack @The upgrade item to use.

--- Place an upgrade request.
---@param p LuaSurface_upgrade_area_params
function LuaSurface.upgrade_area(p) end

---@class LuaTechnology: any @One research item.
  ---@field effects TechnologyModifier[] @RW; Effects applied when this technology is researched.
  ---@field enabled boolean @RW; Can this technology be researched?
  ---@field force LuaForce @RW; The force this technology belongs to.
  ---@field level uint @RW; The current level of this technology. For level-based technology writing to this is the same as researching the technology to the previous level. Writing the level will set [LuaTechnology::enabled](LuaTechnology::enabled) to `true`.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW; Localised name of this technology.
  ---@field name string @RW; Name of this technology.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field prerequisites table<string, LuaTechnology> @RW; Prerequisites of this technology. The result maps technology name to the [LuaTechnology](LuaTechnology) object.
  ---@field prototype LuaTechnologyPrototype @RW; The prototype of this technology.
  ---@field research_unit_count uint @RW; The number of research units required for this technology.
  ---@field research_unit_count_formula string @RW nilable; The count formula used for this infinite research. `nil` if this research isn't infinite.
  ---@field research_unit_energy double @RW; Amount of energy required to finish a unit of research.
  ---@field research_unit_ingredients Ingredient[] @RW; The types of ingredients that labs will require to research this technology.
  ---@field researched boolean @RW; Has this technology been researched? Switching from `false` to `true` will trigger the technology advancement perks; switching from `true` to `false` will reverse them.
  ---@field upgrade boolean @RW; Is this an upgrade-type research?
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field visible_when_disabled boolean @RW; If this technology will be visible in the research GUI even though it is disabled.
LuaTechnology = {}

--- All methods and properties that this object supports.
---@return string
function LuaTechnology.help() end

--- Reload this technology from its prototype.
function LuaTechnology.reload() end

---@class LuaTechnologyPrototype: any @A Technology prototype.
  ---@field effects TechnologyModifier[] @RW; Effects applied when this technology is researched.
  ---@field enabled boolean @RW; If this technology prototype is enabled by default (enabled at the beginning of a game).
  ---@field hidden boolean @RW; If this technology prototype is hidden.
  ---@field ignore_tech_cost_multiplier boolean @RW; If this technology ignores the technology cost multiplier setting.
  ---@field level uint @RW; The level of this research.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW; Localised name of this technology.
  ---@field max_level uint @RW; The max level of this research.
  ---@field name string @RW; Name of this technology.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field prerequisites table<string, LuaTechnologyPrototype> @RW; Prerequisites of this technology. The result maps technology name to the [LuaTechnologyPrototype](LuaTechnologyPrototype) object.
  ---@field research_unit_count uint @RW; The number of research units required for this technology.
  ---@field research_unit_count_formula string @RW nilable; The count formula used for this infinite research. `nil` if this research isn't infinite.
  ---@field research_unit_energy double @RW; Amount of energy required to finish a unit of research.
  ---@field research_unit_ingredients Ingredient[] @RW; The types of ingredients that labs will require to research this technology.
  ---@field upgrade boolean @RW; If the is technology prototype is an upgrade to some other technology.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field visible_when_disabled boolean @RW; If this technology will be visible in the research GUI even though it is disabled.
LuaTechnologyPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaTechnologyPrototype.help() end

---@class LuaTile: any @A single "square" on the map.
  ---@field hidden_tile string @RW nilable; The name of the [LuaTilePrototype](LuaTilePrototype) hidden under this tile, if any. During normal gameplay, only [non-mineable](LuaTilePrototype::mineable_properties) tiles can become hidden. This can however be circumvented with [LuaSurface::set_hidden_tile](LuaSurface::set_hidden_tile).
  ---@field name string @RW; Prototype name of this tile. E.g. `"sand-3"` or `"grass-2"`.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field position TilePosition @RW; The position this tile references.
  ---@field prototype LuaTilePrototype @RW
  ---@field surface LuaSurface @RW; The surface this tile is on.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTile = {}

--- Cancels deconstruction if it is scheduled, does nothing otherwise.
---@param force ForceIdentification @The force who did the deconstruction order.
---@param player PlayerIdentification|nil @The player to set the last_user to if any.
---@overload fun(force: ForceIdentification)
function LuaTile.cancel_deconstruction(force, player) end

--- What type of things can collide with this tile?
---@param layer CollisionMaskLayer
---@return boolean
function LuaTile.collides_with(layer) end

--- Gets all tile ghosts on this tile.
---@param force ForceIdentification|nil @Get tile ghosts of this force.
---@overload fun(): LuaTile[]
---@return LuaTile[]
function LuaTile.get_tile_ghosts(force) end

--- Does this tile have any tile ghosts on it.
---@param force ForceIdentification|nil @Check for tile ghosts of this force.
---@overload fun(): boolean
---@return boolean
function LuaTile.has_tile_ghost(force) end

--- All methods and properties that this object supports.
---@return string
function LuaTile.help() end

--- Orders deconstruction of this tile by the given force.
---@param force ForceIdentification @The force whose robots are supposed to do the deconstruction.
---@param player PlayerIdentification|nil @The player to set the last_user to if any.
---@overload fun(force: ForceIdentification): LuaEntity
---@return LuaEntity @The deconstructible tile proxy created, if any.
function LuaTile.order_deconstruction(force, player) end

--- Is this tile marked for deconstruction?
---@param force ForceIdentification|nil @The force who did the deconstruction order.
---@overload fun(): boolean
---@return boolean
function LuaTile.to_be_deconstructed(force) end

---@class LuaTilePrototype: any @Prototype of a tile.
  ---@field allowed_neighbors table<string, LuaTilePrototype> @RW
  ---@field automatic_neighbors boolean @RW
  ---@field autoplace_specification AutoplaceSpecification @RW nilable; Autoplace specification for this prototype, if any.
  ---@field can_be_part_of_blueprint boolean @RW; False if this tile is not allowed in blueprints regardless of the ability to build it.
  ---@field check_collision_with_entities boolean @RW; True if building this tile should check for colliding entities above and prevent building if such are found. Also during mining tiles above this tile checks for entities colliding with this tile and prevents mining if such are found.
  ---@field collision_mask CollisionMask @RW; The collision mask this tile uses
  ---@field collision_mask_with_flags CollisionMaskWithFlags @RW
  ---@field decorative_removal_probability float @RW; The probability that decorative entities will be removed from on top of this tile when this tile is generated.
  ---@field emissions_per_second double @RW; Amount of pollution emissions per second this tile will absorb.
  ---@field items_to_place_this SimpleItemStack[] @RW; Items that when placed will produce this tile. It is a dictionary indexed by the item prototype name. `nil` (instead of an empty table) if no items can place this tile.
  ---@field layer uint @RW
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field map_color Color @RW
  ---@field mineable_properties _table15 @RW
  ---@field name string @RW; Name of this prototype.
  ---@field needs_correction boolean @RW; If this tile needs correction logic applied when it's generated in the world..
  ---@field next_direction LuaTilePrototype @RW nilable; The next direction of this tile, if any. Used when a tile has multiple directions (such as hazard concrete)
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field vehicle_friction_modifier float @RW
  ---@field walking_speed_modifier float @RW
LuaTilePrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaTilePrototype.help() end

---@class LuaTrain: any @A train. Trains are a sequence of connected rolling stocks -- locomotives and wagons.
  ---@field back_rail LuaEntity @RW nilable; The rail at the back end of the train, if any.
  ---@field back_stock LuaEntity @RW nilable; The back stock of this train, if any. The back of the train is at the opposite end of the [front](LuaTrain::front_stock).
  ---@field cargo_wagons LuaEntity[] @RW; The cargo carriages the train contains.
  ---@field carriages LuaEntity[] @RW; The rolling stocks this train is composed of, with the numbering starting at the [front](LuaTrain::front_stock) of the train.
  ---@field fluid_wagons LuaEntity[] @RW; The fluid carriages the train contains.
  ---@field front_rail LuaEntity @RW nilable; The rail at the front end of the train, if any.
  ---@field front_stock LuaEntity @RW nilable; The front stock of this train, if any. The front of the train is in the direction that a majority of locomotives are pointing in. If it's a tie, the North and West directions take precedence.
  ---@field has_path boolean @RW; If this train has a path.
  ---@field id uint @RW; The unique train ID.
  ---@field kill_count uint @RW; The total number of kills by this train.
  ---@field killed_players table<uint, uint> @RW; The players killed by this train. The keys are the player indices, the values are how often this train killed that player.
  ---@field locomotives table<string, LuaEntity[]> @RW; Arrays of locomotives. The result is two arrays, indexed by `"front_movers"` and `"back_movers"` containing the locomotives. E.g. `{front_movers={loco1, loco2}, back_movers={loco3}}`.
  ---@field manual_mode boolean @RW; When `true`, the train is explicitly controlled by the player or script. When `false`, the train moves autonomously according to its schedule.
  ---@field max_backward_speed double @RW; Current max speed when moving backwards, depends on locomotive prototype and fuel.
  ---@field max_forward_speed double @RW; Current max speed when moving forward, depends on locomotive prototype and fuel.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field passengers LuaPlayer[] @RW; The player passengers on the train
  ---@field path LuaRailPath @RW nilable; The path this train is using, if any.
  ---@field path_end_rail LuaEntity @RW nilable; The destination rail this train is currently pathing to, if any.
  ---@field path_end_stop LuaEntity @RW nilable; The destination train stop this train is currently pathing to, if any.
  ---@field rail_direction_from_back_rail defines__rail_direction @RW
  ---@field rail_direction_from_front_rail defines__rail_direction @RW
  ---@field riding_state RidingState @RW; The riding state of this train.
  ---@field schedule TrainSchedule @RW nilable; This train's current schedule, if any. Set to `nil` to clear.
  ---@field signal LuaEntity @RW nilable; The signal this train is arriving or waiting at, if any.
  ---@field speed double @RW; Current speed.
  ---@field state defines__train_state @RW; This train's current state.
  ---@field station LuaEntity @RW nilable; The train stop this train is stopped at, if any.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
  ---@field weight double @RW; The weight of this train.
LuaTrain = {}

--- Clears all fluids in this train.
function LuaTrain.clear_fluids_inside() end

--- Clear all items in this train.
function LuaTrain.clear_items_inside() end

--- Get a mapping of the train's inventory.
---@return table<string, uint> @The counts, indexed by item names.
function LuaTrain.get_contents() end

--- Gets a mapping of the train's fluid inventory.
---@return table<string, double> @The counts, indexed by fluid names.
function LuaTrain.get_fluid_contents() end

--- Get the amount of a particular fluid stored in the train.
---@param fluid string|nil @Fluid name to count. If not given, counts all fluids.
---@overload fun(): double
---@return double
function LuaTrain.get_fluid_count(fluid) end

--- Get the amount of a particular item stored in the train.
---@param item string|nil @Item name to count. If not given, counts all items.
---@overload fun(): uint
---@return uint
function LuaTrain.get_item_count(item) end

--- Gets all rails under the train.
---@return LuaEntity[]
function LuaTrain.get_rails() end

--- Go to the station specified by the index in the train's schedule.
---@param index uint
function LuaTrain.go_to_station(index) end

--- All methods and properties that this object supports.
---@return string
function LuaTrain.help() end

--- Insert a stack into the train.
---@param stack ItemStackIdentification
function LuaTrain.insert(stack) end

--- Inserts the given fluid into the first available location in this train.
---@param fluid Fluid
---@return double @The amount inserted.
function LuaTrain.insert_fluid(fluid) end

--- Checks if the path is invalid and tries to re-path if it isn't.
---@param force boolean|nil @Forces the train to re-path regardless of the current path being valid or not.
---@overload fun(): boolean
---@return boolean @If the train has a path after the repath attempt.
function LuaTrain.recalculate_path(force) end

--- Remove some fluid from the train.
---@param fluid Fluid
---@return double @The amount of fluid actually removed.
function LuaTrain.remove_fluid(fluid) end

--- Remove some items from the train.
---@param stack ItemStackIdentification @The amount and type of items to remove
---@return uint @Number of items actually removed.
function LuaTrain.remove_item(stack) end

---@class LuaTrainStopControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for train stops.
  ---@field enable_disable boolean @RW; `true` if the train stop is enabled/disabled through the circuit network.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field read_from_train boolean @RW; `true` if the train stop should send the train contents to the circuit network.
  ---@field read_stopped_train boolean @RW; `true` if the train stop should send the stopped train id to the circuit network.
  ---@field read_trains_count boolean @RW; `true` if the train stop should send amount of incoming trains to the circuit network.
  ---@field send_to_train boolean @RW; `true` if the train stop should send the circuit network contents to the train to use.
  ---@field set_trains_limit boolean @RW; `true` if the trains_limit_signal is used to set a limit of trains incoming for train stop.
  ---@field stopped_train_signal SignalID @RW; The signal that will be sent when using the send-train-id option.
  ---@field trains_count_signal SignalID @RW; The signal that will be sent when using the read-trains-count option.
  ---@field trains_limit_signal SignalID @RW; The signal to be used by set-trains-limit to limit amount of incoming trains
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTrainStopControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaTrainStopControlBehavior.help() end

---@class LuaTransportBeltControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for transport belts.
  ---@field enable_disable boolean @RW; If the belt will be enabled/disabled based off the circuit network.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field read_contents boolean @RW; If the belt will read the contents and send them to the circuit network.
  ---@field read_contents_mode defines__control_behavior__transport_belt__content_read_mode @RW; The read mode for the belt.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTransportBeltControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaTransportBeltControlBehavior.help() end

---@class LuaTransportLine: any @One line on a transport belt.
  ---@field input_lines LuaTransportLine[] @RW; The transport lines that this transport line is fed by or an empty table if none.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field output_lines LuaTransportLine[] @RW; The transport lines that this transport line outputs items to or an empty table if none.
  ---@field owner LuaEntity @RW; The entity this transport line belongs to.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTransportLine = {}

--- Can an item be inserted at a given position?
---@param position float @Where to insert an item.
---@return boolean
function LuaTransportLine.can_insert_at(position) end

--- Can an item be inserted at the back of this line?
---@return boolean
function LuaTransportLine.can_insert_at_back() end

--- Remove all items from this transport line.
function LuaTransportLine.clear() end

--- Get counts of all items on this line, similar to how [LuaInventory::get_contents](LuaInventory::get_contents) does.
---@return table<string, uint> @The counts, indexed by item names.
function LuaTransportLine.get_contents() end

--- Count some or all items on this line, similar to how [LuaInventory::get_item_count](LuaInventory::get_item_count) does.
---@param item string|nil @Prototype name of the item to count. If not specified, count all items.
---@overload fun(): uint
---@return uint
function LuaTransportLine.get_item_count(item) end

--- All methods and properties that this object supports.
---@return string
function LuaTransportLine.help() end

--- Insert items at a given position.
---@param position float @Where on the line to insert the items.
---@param items ItemStackIdentification @Items to insert.
---@return boolean @Were the items inserted successfully?
function LuaTransportLine.insert_at(position, items) end

--- Insert items at the back of this line.
---@param items ItemStackIdentification
---@return boolean @Were the items inserted successfully?
function LuaTransportLine.insert_at_back(items) end

--- Returns whether the associated internal transport line of this line is the same as the others associated internal transport line.
---@param other LuaTransportLine
---@return boolean
function LuaTransportLine.line_equals(other) end

--- Remove some items from this line.
---@param items ItemStackIdentification @Items to remove.
---@return uint @Number of items actually removed.
function LuaTransportLine.remove_item(items) end

---@class LuaTrivialSmokePrototype: any @Prototype of a trivial smoke.
  ---@field affected_by_wind boolean @RW
  ---@field color Color @RW
  ---@field cyclic boolean @RW
  ---@field duration uint @RW
  ---@field end_scale double @RW
  ---@field fade_away_duration uint @RW
  ---@field fade_in_duration uint @RW
  ---@field glow_animation boolean @RW
  ---@field glow_fade_away_duration uint @RW
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field movement_slow_down_factor double @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field render_layer RenderLayer @RW
  ---@field show_when_smoke_off boolean @RW
  ---@field spread_duration uint @RW
  ---@field start_scale double @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTrivialSmokePrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaTrivialSmokePrototype.help() end

---@class LuaUnitGroup: any @A collection of units moving and attacking together. The engine creates autonomous unit groups to attack polluted areas. The script can create and control such groups as well. Groups can accept commands in the same manner as regular units.
  ---@field command Command @RW nilable; The command given to this group, if any.
  ---@field distraction_command Command @RW nilable; The distraction command given to this group, if any.
  ---@field force LuaForce @RW; The force of this unit group.
  ---@field group_number uint @RW; The group number for this unit group.
  ---@field is_script_driven boolean @RW; Whether this unit group is controlled by a script or by the game engine. This can be changed using [LuaUnitGroup::set_autonomous](LuaUnitGroup::set_autonomous).
  ---@field members LuaEntity[] @RW; Members of this group.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field position MapPosition @RW; Group position. This can have different meanings depending on the group state. When the group is gathering, the position is the place of gathering. When the group is moving, the position is the expected position of its members along the path. When the group is attacking, it is the average position of its members.
  ---@field state defines__group_state @RW; Whether this group is gathering, moving or attacking.
  ---@field surface LuaSurface @RW; The surface of this unit group.
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaUnitGroup = {}

--- Make a unit a member of this group. Has the same effect as giving a `group_command` with this group to the unit.
---@param unit LuaEntity
function LuaUnitGroup.add_member(unit) end

--- Dissolve this group. Its members won't be destroyed, they will be merely unlinked from this group.
function LuaUnitGroup.destroy() end

--- All methods and properties that this object supports.
---@return string
function LuaUnitGroup.help() end

--- Make this group autonomous. Autonomous groups will automatically attack polluted areas. Autonomous groups aren't considered to be [script-driven](LuaUnitGroup::is_script_driven).
function LuaUnitGroup.set_autonomous() end

--- Give this group a command.
---@param command Command
function LuaUnitGroup.set_command(command) end

--- Give this group a distraction command.
---@param command Command
function LuaUnitGroup.set_distraction_command(command) end

--- Make the group start moving even if some of its members haven't yet arrived.
function LuaUnitGroup.start_moving() end

---@class LuaVirtualSignalPrototype: any @Prototype of a virtual signal.
  ---@field localised_description LocalisedString @RW
  ---@field localised_name LocalisedString @RW
  ---@field name string @RW; Name of this prototype.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field order string @RW; The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
  ---@field special boolean @RW; Whether this is a special signal. The `everything`, `anything`, `each`, and `unknown` signals are considered special.
  ---@field subgroup LuaGroup @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaVirtualSignalPrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaVirtualSignalPrototype.help() end

---@class LuaVoidEnergySourcePrototype: any @Prototype of a void energy source.
  ---@field emissions double @RW; The emissions of this energy source in `pollution/Joule`. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field render_no_network_icon boolean @RW
  ---@field render_no_power_icon boolean @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaVoidEnergySourcePrototype = {}

--- All methods and properties that this object supports.
---@return string
function LuaVoidEnergySourcePrototype.help() end

---@class LuaWallControlBehavior: LuaControlBehavior @Control behavior for walls.
  ---@field circuit_condition CircuitConditionDefinition @RW; The circuit condition.
  ---@field object_name string @RW; The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
  ---@field open_gate boolean @RW
  ---@field output_signal SignalID @RW
  ---@field read_sensor boolean @RW
  ---@field valid boolean @RW; Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaWallControlBehavior = {}

--- All methods and properties that this object supports.
---@return string
function LuaWallControlBehavior.help() end


--- events 

---@class CustomInputEvent: EventData @Called when a [CustomInput](https://wiki.factorio.com/Prototype/CustomInput) is activated.
  ---@field cursor_position MapPosition @The mouse cursor position when the custom input was activated.
  ---@field input_name string @The prototype name of the custom input that was activated.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player that activated the custom input.
  ---@field selected_prototype SelectedPrototypeData @nilable; Information about the prototype that is selected when the custom input is used. Needs to be enabled on the custom input's prototype. `nil` if none is selected.
  ---@field tick uint @Tick the event was generated.

---@class OnAiCommandCompleted: EventData @Called when a unit/group completes a command.
  ---@field name defines__events @Identifier of the event
  ---@field result defines__behavior_result
  ---@field tick uint @Tick the event was generated.
  ---@field unit_number uint @unit_number/group_number of the unit/group which just completed a command.
  ---@field was_distracted boolean @Was this command generated by a distraction.

---@class OnAreaCloned: EventData @Called when an area of the map is cloned.
  ---@field clear_destination_decoratives boolean
  ---@field clear_destination_entities boolean
  ---@field clone_decoratives boolean
  ---@field clone_entities boolean
  ---@field clone_tiles boolean
  ---@field destination_area BoundingBox
  ---@field destination_force LuaForce @nilable
  ---@field destination_surface LuaSurface
  ---@field name defines__events @Identifier of the event
  ---@field source_area BoundingBox
  ---@field source_surface LuaSurface
  ---@field tick uint @Tick the event was generated.

---@class OnBiterBaseBuilt: EventData @Called when a biter migration builds a base.
  ---@field entity LuaEntity @The entity that was built.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnBrushCloned: EventData @Called when a set of positions on the map is cloned.
  ---@field clear_destination_decoratives boolean
  ---@field clear_destination_entities boolean
  ---@field clone_decoratives boolean
  ---@field clone_entities boolean
  ---@field clone_tiles boolean
  ---@field destination_force LuaForce @nilable
  ---@field destination_offset TilePosition
  ---@field destination_surface LuaSurface
  ---@field name defines__events @Identifier of the event
  ---@field source_offset TilePosition
  ---@field source_positions TilePosition[]
  ---@field source_surface LuaSurface
  ---@field tick uint @Tick the event was generated.

---@class OnBuildBaseArrived: EventData @Called when a [defines.command.build_base](defines.command.build_base) command reaches its destination, and before building starts.
  ---@field group LuaUnitGroup @nilable; The unit group the command was assigned to.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.
  ---@field unit LuaEntity @nilable; The unit the command was assigned to.

---@class OnBuiltEntity: EventData @Called when player builds something. Can be filtered using [LuaPlayerBuiltEntityEventFilter](LuaPlayerBuiltEntityEventFilter).
  ---@field created_entity LuaEntity
  ---@field item LuaItemPrototype @nilable; The item prototype used to build the entity. Note this won't exist in some situations (built from blueprint, undo, etc).
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field stack LuaItemStack
  ---@field tags Tags @nilable; The tags associated with this entity if any.
  ---@field tick uint @Tick the event was generated.

---@class OnCancelledDeconstruction: EventData @Called when the deconstruction of an entity is canceled. Can be filtered using [LuaEntityDeconstructionCancelledEventFilter](LuaEntityDeconstructionCancelledEventFilter).
  ---@field entity LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable
  ---@field tick uint @Tick the event was generated.

---@class OnCancelledUpgrade: EventData @Called when the upgrade of an entity is canceled. Can be filtered using [LuaUpgradeCancelledEventFilter](LuaUpgradeCancelledEventFilter).
  ---@field direction defines__direction @nilable
  ---@field entity LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable
  ---@field target LuaEntityPrototype
  ---@field tick uint @Tick the event was generated.

---@class OnCharacterCorpseExpired: EventData @Called when a character corpse expires due to timeout or all of the items being removed from it.
  ---@field corpse LuaEntity @The corpse.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnChartTagAdded: EventData @Called when a chart tag is created.
  ---@field force LuaForce
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable
  ---@field tag LuaCustomChartTag
  ---@field tick uint @Tick the event was generated.

---@class OnChartTagModified: EventData @Called when a chart tag is modified by a player.
  ---@field force LuaForce
  ---@field name defines__events @Identifier of the event
  ---@field old_icon SignalID @nilable
  ---@field old_player uint @nilable
  ---@field old_text string
  ---@field player_index uint @nilable
  ---@field tag LuaCustomChartTag
  ---@field tick uint @Tick the event was generated.

---@class OnChartTagRemoved: EventData @Called just before a chart tag is deleted.
  ---@field force LuaForce
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable
  ---@field tag LuaCustomChartTag
  ---@field tick uint @Tick the event was generated.

---@class OnChunkCharted: EventData @Called when a chunk is charted or re-charted.
  ---@field area BoundingBox @Area of the chunk.
  ---@field force LuaForce
  ---@field name defines__events @Identifier of the event
  ---@field position ChunkPosition
  ---@field surface_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnChunkDeleted: EventData @Called when one or more chunks are deleted using [LuaSurface::delete_chunk](LuaSurface::delete_chunk).
  ---@field name defines__events @Identifier of the event
  ---@field positions ChunkPosition[] @The chunks deleted.
  ---@field surface_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnChunkGenerated: EventData @Called when a chunk is generated.
  ---@field area BoundingBox @Area of the chunk.
  ---@field name defines__events @Identifier of the event
  ---@field position ChunkPosition @Position of the chunk.
  ---@field surface LuaSurface @The surface the chunk is on.
  ---@field tick uint @Tick the event was generated.

---@class OnCombatRobotExpired: EventData @Called when a combat robot expires through a lack of energy, or timeout.
  ---@field name defines__events @Identifier of the event
  ---@field owner LuaEntity @nilable; The entity that owns the robot if any.
  ---@field robot LuaEntity
  ---@field tick uint @Tick the event was generated.

---@class OnConsoleChat: EventData @Called when a message is sent to the in-game console, either by a player or through the server interface.
  ---@field message string @The chat message that was sent.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable; The player doing the chatting, if any.
  ---@field tick uint @Tick the event was generated.

---@class OnConsoleCommand: EventData @Called when someone enters a command-like message regardless of it being a valid command.
  ---@field command string @The command as typed without the preceding forward slash ('/').
  ---@field name defines__events @Identifier of the event
  ---@field parameters string @The parameters provided if any.
  ---@field player_index uint @nilable; The player if any.
  ---@field tick uint @Tick the event was generated.

---@class OnCutsceneCancelled: EventData @Called when a cutscene is cancelled by the player or by script.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player the cutscene was shown to.
  ---@field tick uint @Tick the event was generated.

---@class OnCutsceneWaypointReached: EventData @Called when a cutscene is playing, each time it reaches a waypoint in that cutscene. This refers to an index in the table previously passed to set_controller which started the cutscene.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player index of the player viewing the cutscene.
  ---@field tick uint @Tick the event was generated.
  ---@field waypoint_index uint @The index of the waypoint we just completed.

---@class OnDifficultySettingsChanged: EventData @Called when the map difficulty settings are changed.
  ---@field name defines__events @Identifier of the event
  ---@field old_recipe_difficulty uint
  ---@field old_technology_difficulty uint
  ---@field tick uint @Tick the event was generated.

---@class OnEntityCloned: EventData @Called when an entity is cloned. Can be filtered for the source entity using [LuaEntityClonedEventFilter](LuaEntityClonedEventFilter).
  ---@field destination LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field source LuaEntity
  ---@field tick uint @Tick the event was generated.

---@class OnEntityDamaged: EventData @Called when an entity is damaged. Can be filtered using [LuaEntityDamagedEventFilter](LuaEntityDamagedEventFilter).
  ---@field cause LuaEntity @nilable; The entity that did the attacking if available.
  ---@field damage_type LuaDamagePrototype
  ---@field entity LuaEntity
  ---@field final_damage_amount float @The damage amount after resistances.
  ---@field final_health float @The health of the entity after the damage was applied.
  ---@field force LuaForce @nilable; The force that did the attacking if any.
  ---@field name defines__events @Identifier of the event
  ---@field original_damage_amount float @The damage amount before resistances.
  ---@field tick uint @Tick the event was generated.

---@class OnEntityDestroyed: EventData @Called after an entity is destroyed that has been registered with [LuaBootstrap::register_on_entity_destroyed](LuaBootstrap::register_on_entity_destroyed).
  ---@field name defines__events @Identifier of the event
  ---@field registration_number uint64 @The number returned by [register_on_entity_destroyed](LuaBootstrap::register_on_entity_destroyed) to uniquely identify this entity during this event.
  ---@field tick uint @Tick the event was generated.
  ---@field unit_number uint @nilable; The [LuaEntity::unit_number](LuaEntity::unit_number) of the destroyed entity, if it had one.

---@class OnEntityDied: EventData @Called when an entity dies. Can be filtered using [LuaEntityDiedEventFilter](LuaEntityDiedEventFilter).
  ---@field cause LuaEntity @nilable; The entity that did the killing if available.
  ---@field damage_type LuaDamagePrototype @nilable; The damage type if any.
  ---@field entity LuaEntity @The entity that died.
  ---@field force LuaForce @nilable; The force that did the killing if any.
  ---@field loot LuaInventory @The loot generated by this entity if any.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnEntityLogisticSlotChanged: EventData @Called when one of an entity's personal logistic slots changes.
  ---@field entity LuaEntity @The entity for whom a logistic slot was changed.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable; The player who changed the slot, or `nil` if changed by script.
  ---@field slot_index uint @The slot index that was changed.
  ---@field tick uint @Tick the event was generated.

---@class OnEntityRenamed: EventData @Called after an entity has been renamed either by the player or through script.
  ---@field by_script boolean
  ---@field entity LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field old_name string
  ---@field player_index uint @nilable; If by_script is true this will not be included.
  ---@field tick uint @Tick the event was generated.

---@class OnEntitySettingsPasted: EventData @Called after entity copy-paste is done.
  ---@field destination LuaEntity @The destination entity settings were copied to.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field source LuaEntity @The source entity settings were copied from.
  ---@field tick uint @Tick the event was generated.

---@class OnEntitySpawned: EventData @Called when an entity is spawned by a EnemySpawner
  ---@field entity LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field spawner LuaEntity
  ---@field tick uint @Tick the event was generated.

---@class OnEquipmentInserted: EventData @Called after equipment is inserted into an equipment grid.
  ---@field equipment LuaEquipment @The equipment inserted.
  ---@field grid LuaEquipmentGrid @The equipment grid inserted into.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnEquipmentRemoved: EventData @Called after equipment is removed from an equipment grid.
  ---@field count uint @The count of equipment removed.
  ---@field equipment string @The equipment removed.
  ---@field grid LuaEquipmentGrid @The equipment grid removed from.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnForceCeaseFireChanged: EventData @Called when the a forces cease fire values change.
  ---@field added boolean @If the other force was added or removed.
  ---@field force LuaForce @The force who's cease fire changed.
  ---@field name defines__events @Identifier of the event
  ---@field other_force LuaForce @Which force was added or removed.
  ---@field tick uint @Tick the event was generated.

---@class OnForceCreated: EventData @Called when a new force is created using `game.create_force()`
  ---@field force LuaForce @The newly created force.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnForceFriendsChanged: EventData @Called when the a forces friends change.
  ---@field added boolean @If the other force was added or removed.
  ---@field force LuaForce @The force who's friends changed.
  ---@field name defines__events @Identifier of the event
  ---@field other_force LuaForce @Which force was added or removed.
  ---@field tick uint @Tick the event was generated.

---@class OnForceReset: EventData @Called when [LuaForce::reset](LuaForce::reset) is finished.
  ---@field force LuaForce
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnForcesMerged: EventData @Called after two forces have been merged using `game.merge_forces()`.
  ---@field destination LuaForce @The force entities where reassigned to.
  ---@field name defines__events @Identifier of the event
  ---@field source_index uint @The index of the destroyed force.
  ---@field source_name string @The force destroyed.
  ---@field tick uint @Tick the event was generated.

---@class OnForcesMerging: EventData @Called when two forces are about to be merged using `game.merge_forces()`.
  ---@field destination LuaForce @The force to reassign entities to.
  ---@field name defines__events @Identifier of the event
  ---@field source LuaForce @The force to be destroyed
  ---@field tick uint @Tick the event was generated.

---@class OnGameCreatedFromScenario: EventData @Called when a game is created from a scenario. This is fired for every mod, even when the scenario's save data already includes it. In those cases however, [LuaBootstrap::on_init](LuaBootstrap::on_init) is not fired.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnGuiCheckedStateChanged: EventData @Called when [LuaGuiElement](LuaGuiElement) checked state is changed (related to checkboxes and radio buttons).
  ---@field element LuaGuiElement @The element whose checked state changed.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the change.
  ---@field tick uint @Tick the event was generated.

---@class OnGuiClick: EventData @Called when [LuaGuiElement](LuaGuiElement) is clicked.
  ---@field alt boolean @If alt was pressed.
  ---@field button defines__mouse_button_type @The mouse button used if any.
  ---@field control boolean @If control was pressed.
  ---@field element LuaGuiElement @The clicked element.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the clicking.
  ---@field shift boolean @If shift was pressed.
  ---@field tick uint @Tick the event was generated.

---@class OnGuiClosed: EventData @Called when the player closes the GUI they have open. This can only be raised when the GUI's player controller is still valid. If a GUI is thus closed due to the player disconnecting, dying, or becoming a spectator in other ways, it won't cause this event to be raised.
  ---@field element LuaGuiElement @nilable; The custom GUI element that was open
  ---@field entity LuaEntity @nilable; The entity that was open
  ---@field equipment LuaEquipment @nilable; The equipment that was open
  ---@field gui_type defines__gui_type @The GUI type that was open.
  ---@field inventory LuaInventory @nilable; The script inventory that was open
  ---@field item LuaItemStack @nilable; The item that was open
  ---@field name defines__events @Identifier of the event
  ---@field other_player LuaPlayer @nilable; The other player that was open
  ---@field player_index uint @The player.
  ---@field technology LuaTechnology @nilable; The technology that was automatically selected when opening the research GUI
  ---@field tick uint @Tick the event was generated.
  ---@field tile_position TilePosition @nilable; The tile position that was open

---@class OnGuiConfirmed: EventData @Called when a [LuaGuiElement](LuaGuiElement) is confirmed, for example by pressing Enter in a textfield.
  ---@field alt boolean @If alt was pressed.
  ---@field control boolean @If control was pressed.
  ---@field element LuaGuiElement @The confirmed element.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the confirming.
  ---@field shift boolean @If shift was pressed.
  ---@field tick uint @Tick the event was generated.

---@class OnGuiElemChanged: EventData @Called when [LuaGuiElement](LuaGuiElement) element value is changed (related to choose element buttons).
  ---@field element LuaGuiElement @The element whose element value changed.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the change.
  ---@field tick uint @Tick the event was generated.

---@class OnGuiLocationChanged: EventData @Called when [LuaGuiElement](LuaGuiElement) element location is changed (related to frames in `player.gui.screen`).
  ---@field element LuaGuiElement @The element whose location changed.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the change.
  ---@field tick uint @Tick the event was generated.

---@class OnGuiOpened: EventData @Called when the player opens a GUI.
  ---@field element LuaGuiElement @nilable; The custom GUI element that was opened
  ---@field entity LuaEntity @nilable; The entity that was opened
  ---@field equipment LuaEquipment @nilable; The equipment that was opened
  ---@field gui_type defines__gui_type @The GUI type that was opened.
  ---@field inventory LuaInventory @nilable; The script inventory that was opened
  ---@field item LuaItemStack @nilable; The item that was opened
  ---@field name defines__events @Identifier of the event
  ---@field other_player LuaPlayer @nilable; The other player that was opened
  ---@field player_index uint @The player.
  ---@field tick uint @Tick the event was generated.

---@class OnGuiSelectedTabChanged: EventData @Called when [LuaGuiElement](LuaGuiElement) selected tab is changed (related to tabbed-panes).
  ---@field element LuaGuiElement @The tabbed pane whose selected tab changed.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the change.
  ---@field tick uint @Tick the event was generated.

---@class OnGuiSelectionStateChanged: EventData @Called when [LuaGuiElement](LuaGuiElement) selection state is changed (related to drop-downs and listboxes).
  ---@field element LuaGuiElement @The element whose selection state changed.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the change.
  ---@field tick uint @Tick the event was generated.

---@class OnGuiSwitchStateChanged: EventData @Called when [LuaGuiElement](LuaGuiElement) switch state is changed (related to switches).
  ---@field element LuaGuiElement @The switch whose switch state changed.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the change.
  ---@field tick uint @Tick the event was generated.

---@class OnGuiTextChanged: EventData @Called when [LuaGuiElement](LuaGuiElement) text is changed by the player.
  ---@field element LuaGuiElement @The edited element.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the edit.
  ---@field text string @The new text in the element.
  ---@field tick uint @Tick the event was generated.

---@class OnGuiValueChanged: EventData @Called when [LuaGuiElement](LuaGuiElement) slider value is changed (related to the slider element).
  ---@field element LuaGuiElement @The element whose value changed.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the change.
  ---@field tick uint @Tick the event was generated.

---@class OnLandMineArmed: EventData @Called when a land mine is armed.
  ---@field mine LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnLuaShortcut: EventData @Called when a custom Lua shortcut is pressed.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field prototype_name string @Shortcut prototype name of the shortcut that was clicked.
  ---@field tick uint @Tick the event was generated.

---@class OnMarkedForDeconstruction: EventData @Called when an entity is marked for deconstruction with the Deconstruction planner or via script. Can be filtered using [LuaEntityMarkedForDeconstructionEventFilter](LuaEntityMarkedForDeconstructionEventFilter).
  ---@field entity LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable
  ---@field tick uint @Tick the event was generated.

---@class OnMarkedForUpgrade: EventData @Called when an entity is marked for upgrade with the Upgrade planner or via script. Can be filtered using [LuaEntityMarkedForUpgradeEventFilter](LuaEntityMarkedForUpgradeEventFilter).
  ---@field direction defines__direction @nilable; The new direction (if any)
  ---@field entity LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable
  ---@field target LuaEntityPrototype
  ---@field tick uint @Tick the event was generated.

---@class OnMarketItemPurchased: EventData @Called after a player purchases some offer from a `market` entity.
  ---@field count uint @The amount of offers purchased.
  ---@field market LuaEntity @The market entity.
  ---@field name defines__events @Identifier of the event
  ---@field offer_index uint @The index of the offer purchased.
  ---@field player_index uint @The player who did the purchasing.
  ---@field tick uint @Tick the event was generated.

---@class OnModItemOpened: EventData @Called when the player uses the 'Open item GUI' control on an item defined with the 'mod-openable' flag
  ---@field item LuaItemPrototype @The item clicked on.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player.
  ---@field tick uint @Tick the event was generated.

---@class OnPermissionGroupAdded: EventData @Called directly after a permission group is added.
  ---@field group LuaPermissionGroup @The group added.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player that added the group.
  ---@field tick uint @Tick the event was generated.

---@class OnPermissionGroupDeleted: EventData @Called directly after a permission group is deleted.
  ---@field group_name string @The group that was deleted.
  ---@field id uint @The group id that was deleted.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player doing the deletion.
  ---@field tick uint @Tick the event was generated.

---@class OnPermissionGroupEdited: EventData @Called directly after a permission group is edited in some way.
  ---@field action defines__input_action @The action when the `type` is "add-permission" or "remove-permission".
  ---@field group LuaPermissionGroup @The group being edited.
  ---@field name defines__events @Identifier of the event
  ---@field new_name string @The new group name when the `type` is "rename".
  ---@field old_name string @The old group name when the `type` is "rename".
  ---@field other_player_index uint @The other player when the `type` is "add-player" or "remove-player".
  ---@field player_index uint @The player that did the editing.
  ---@field tick uint @Tick the event was generated.
  ---@field type string @The edit type: "add-permission", "remove-permission", "enable-all", "disable-all", "add-player", "remove-player", "rename".

---@class OnPermissionStringImported: EventData @Called directly after a permission string is imported.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player that imported the string.
  ---@field tick uint @Tick the event was generated.

---@class OnPickedUpItem: EventData @Called when a player picks up an item.
  ---@field item_stack SimpleItemStack
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerAltSelectedArea: EventData @Called after a player alt-selects an area with a selection-tool item.
  ---@field area BoundingBox @The area selected.
  ---@field entities LuaEntity[] @The entities selected.
  ---@field item string @The item used to select the area.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player doing the selection.
  ---@field surface LuaSurface @The surface selected.
  ---@field tick uint @Tick the event was generated.
  ---@field tiles LuaTile[] @The tiles selected.

---@class OnPlayerAmmoInventoryChanged: EventData @Called after a players ammo inventory changed in some way.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerArmorInventoryChanged: EventData @Called after a players armor inventory changed in some way.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerBanned: EventData @Called when a player is banned.
  ---@field by_player uint @nilable; The player that did the banning if any.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable; The player banned.
  ---@field player_name string @The banned player name.
  ---@field reason string @nilable; The reason given if any.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerBuiltTile: EventData @Called after a player builds tiles.
  ---@field item LuaItemPrototype @nilable; The item type used to build the tiles
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field stack LuaItemStack @nilable; The stack used to build the tiles (may be empty if all of the items where used to build the tiles).
  ---@field surface_index uint @The surface the tile(s) were built on.
  ---@field tick uint @Tick the event was generated.
  ---@field tile LuaTilePrototype @The tile prototype that was placed.
  ---@field tiles OldTileAndPosition[] @The position data.

---@class OnPlayerCancelledCrafting: EventData @Called when a player cancels crafting.
  ---@field cancel_count uint @The number of crafts that have been cancelled.
  ---@field items LuaInventory @The crafting items returned to the player's inventory.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player that did the crafting.
  ---@field recipe LuaRecipe @The recipe that has been cancelled.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerChangedForce: EventData @Called after a player changes forces.
  ---@field force LuaForce @The old force.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who changed forces.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerChangedPosition: EventData @Called when the tile position a player is located at changes.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerChangedSurface: EventData @Called after a player changes surfaces.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who changed surfaces.
  ---@field surface_index uint @The surface index the player was on.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerCheatModeDisabled: EventData @Called when cheat mode is disabled on a player.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerCheatModeEnabled: EventData @Called when cheat mode is enabled on a player.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerClickedGpsTag: EventData @Called when a player clicks a gps tag
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @Index of the player
  ---@field position MapPosition @Map position contained in gps tag
  ---@field surface string @Surface name contained in gps tag, even when such surface does not exists
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerConfiguredBlueprint: EventData @Called when a player clicks the "confirm" button in the configure Blueprint GUI.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerConfiguredSpiderRemote: EventData @Called when a player configures spidertron remote to be connected with a given spidertron
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player that configured the remote.
  ---@field tick uint @Tick the event was generated.
  ---@field vehicle LuaEntity @Spider vehicle to which remote was connected to.

---@class OnPlayerCraftedItem: EventData @Called when the player finishes crafting an item. This event fires just before the results are inserted into the player's inventory, not when the crafting is queued (see [on_pre_player_crafted_item](on_pre_player_crafted_item)).
  ---@field item_stack LuaItemStack @The item that has been crafted.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player doing the crafting.
  ---@field recipe LuaRecipe @The recipe used to craft this item.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerCreated: EventData @Called after the player was created.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerCursorStackChanged: EventData @Called after a players cursorstack changed in some way.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerDeconstructedArea: EventData @Called when a player selects an area with a deconstruction planner.
  ---@field alt boolean @If normal selection or alt selection was used.
  ---@field area BoundingBox @The area selected.
  ---@field item string @The item used to select the area.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player doing the selection.
  ---@field surface LuaSurface @The surface selected.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerDemoted: EventData @Called when a player is demoted.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerDied: EventData @Called after a player dies.
  ---@field cause LuaEntity @nilable
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerDisplayResolutionChanged: EventData @Called when the display resolution changes for a given player.
  ---@field name defines__events @Identifier of the event
  ---@field old_resolution DisplayResolution @The old display resolution
  ---@field player_index uint @The player
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerDisplayScaleChanged: EventData @Called when the display scale changes for a given player.
  ---@field name defines__events @Identifier of the event
  ---@field old_scale double @The old display scale
  ---@field player_index uint @The player
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerDrivingChangedState: EventData @Called when the player's driving state has changed, meaning a player has either entered or left a vehicle.
  ---@field entity LuaEntity @nilable; The vehicle if any.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerDroppedItem: EventData @Called when a player drops an item on the ground.
  ---@field entity LuaEntity @The item-on-ground entity.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerFastTransferred: EventData @Called when a player fast-transfers something to or from an entity.
  ---@field entity LuaEntity @The entity transferred from or to.
  ---@field from_player boolean @Whether the transfer was from player to entity. If `false`, the transfer was from entity to player.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player transferred from or to.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerFlushedFluid: EventData @Called after player flushed fluid
  ---@field amount double @Amount of fluid that was removed
  ---@field entity LuaEntity @Entity from which flush was performed
  ---@field fluid string @Name of a fluid that was flushed
  ---@field name defines__events @Identifier of the event
  ---@field only_this_entity boolean @True if flush was requested only on this entity
  ---@field player_index uint @Index of the player
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerGunInventoryChanged: EventData @Called after a players gun inventory changed in some way.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerJoinedGame: EventData @Called after a player joins the game. This is not called when loading a save file in singleplayer, as the player doesn't actually leave the game, and the save is just on pause until they rejoin.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerKicked: EventData @Called when a player is kicked.
  ---@field by_player uint @nilable; The player that did the kicking if any.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player kicked.
  ---@field reason string @nilable; The reason given if any.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerLeftGame: EventData @Called after a player leaves the game. This is not called when closing a save file in singleplayer, as the player doesn't actually leave the game, and the save is just on pause until they rejoin.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field reason defines__disconnect_reason
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerMainInventoryChanged: EventData @Called after a players main inventory changed in some way.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerMinedEntity: EventData @Called after the results of an entity being mined are collected just before the entity is destroyed. After this event any items in the buffer will be transferred into the player as if they came from mining the entity. Can be filtered using [LuaPlayerMinedEntityEventFilter](LuaPlayerMinedEntityEventFilter).
  ---@field buffer LuaInventory @The temporary inventory that holds the result of mining the entity.
  ---@field entity LuaEntity @The entity that has been mined.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The index of the player doing the mining.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerMinedItem: EventData @Called when the player mines something.
  ---@field item_stack SimpleItemStack @The item given to the player
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerMinedTile: EventData @Called after a player mines tiles.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field surface_index uint @The surface the tile(s) were mined from.
  ---@field tick uint @Tick the event was generated.
  ---@field tiles OldTileAndPosition[] @The position data.

---@class OnPlayerMuted: EventData @Called when a player is muted.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerPipette: EventData @Called when a player invokes the "smart pipette" over an entity.
  ---@field item LuaItemPrototype @The item put in the cursor
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player
  ---@field tick uint @Tick the event was generated.
  ---@field used_cheat_mode boolean @If cheat mode was used to give a free stack of the item.

---@class OnPlayerPlacedEquipment: EventData @Called after the player puts equipment in an equipment grid
  ---@field equipment LuaEquipment @The equipment put in the equipment grid.
  ---@field grid LuaEquipmentGrid @The equipment grid the equipment was put in.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerPromoted: EventData @Called when a player is promoted.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerRemoved: EventData @Called when a player is removed (deleted) from the game. Not to be confused with the player logging of this is different in that the player is deleted as if he never existed in the save file.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player index that was removed
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerRemovedEquipment: EventData @Called after the player removes equipment from an equipment grid
  ---@field count uint @The count of equipment removed.
  ---@field equipment string @The equipment removed.
  ---@field grid LuaEquipmentGrid @The equipment grid removed from.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerRepairedEntity: EventData @Called when a player repairs an entity. Can be filtered using [LuaPlayerRepairedEntityEventFilter](LuaPlayerRepairedEntityEventFilter).
  ---@field entity LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerRespawned: EventData @Called after a player respawns.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field player_port LuaEntity @nilable; The player port used to respawn if one was used.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerReverseSelectedArea: EventData @Called after a player reverse-selects an area with a selection-tool item.
  ---@field area BoundingBox @The area selected.
  ---@field entities LuaEntity[] @The entities selected.
  ---@field item string @The item used to select the area.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player doing the selection.
  ---@field surface LuaSurface @The surface selected.
  ---@field tick uint @Tick the event was generated.
  ---@field tiles LuaTile[] @The tiles selected.

---@class OnPlayerRotatedEntity: EventData @Called when the player rotates an entity. This event is only fired when the entity actually changes its orientation -- pressing the rotate key on an entity that can't be rotated won't fire this event.
  ---@field entity LuaEntity @The rotated entity.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field previous_direction defines__direction @The previous direction
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerSelectedArea: EventData @Called after a player selects an area with a selection-tool item.
  ---@field area BoundingBox @The area selected.
  ---@field entities LuaEntity[] @The entities selected.
  ---@field item string @The item used to select the area.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player doing the selection.
  ---@field surface LuaSurface @The surface selected.
  ---@field tick uint @Tick the event was generated.
  ---@field tiles LuaTile[] @The tiles selected.

---@class OnPlayerSetQuickBarSlot: EventData @Called when a player sets a quickbar slot to anything (new value, or set to empty).
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerSetupBlueprint: EventData @Called when a player selects an area with a blueprint.
  ---@field alt boolean @If normal selection or alt selection was used.
  ---@field area BoundingBox @The area selected.
  ---@field item string @The item used to select the area.
  ---@field mapping table<uint, LuaEntity> @The blueprint entity index to source entity mapping. Note: if any mod changes the blueprint this will be incorrect.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player doing the selection.
  ---@field surface LuaSurface @The surface selected.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerToggledAltMode: EventData @Called when a player toggles alt mode, also known as "show entity info".
  ---@field alt_mode boolean @The new alt mode value. This value is a shortcut for accessing [GameViewSettings::show_entity_info](GameViewSettings::show_entity_info) on the player.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerToggledMapEditor: EventData @Called when a player toggles the map editor on or off.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerTrashInventoryChanged: EventData @Called after a players trash inventory changed in some way.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerUnbanned: EventData @Called when a player is un-banned.
  ---@field by_player uint @nilable; The player that did the un-banning if any.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable; The player un-banned.
  ---@field player_name string @The player name un-banned.
  ---@field reason string @nilable; The reason the player was banned if any.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerUnmuted: EventData @Called when a player is unmuted.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerUsedCapsule: EventData @Called when a player uses a capsule that results in some game action.
  ---@field item LuaItemPrototype @The capsule item used.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player.
  ---@field position MapPosition @The position the capsule was used.
  ---@field tick uint @Tick the event was generated.

---@class OnPlayerUsedSpiderRemote: EventData @Called when a player uses spidertron remote to send a spidertron to a given position
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player that used the remote.
  ---@field position MapPosition @Goal position to which spidertron was sent to.
  ---@field success boolean @If the use was successful. It may fail when spidertron has different driver or when player is on different surface.
  ---@field tick uint @Tick the event was generated.
  ---@field vehicle LuaEntity @Spider vehicle which was requested to move.

---@class OnPostEntityDied: EventData @Called after an entity dies. Can be filtered using [LuaPostEntityDiedEventFilter](LuaPostEntityDiedEventFilter).
  ---@field corpses LuaEntity[] @The corpses created by the entity dying if any.
  ---@field damage_type LuaDamagePrototype @nilable; The damage type if any.
  ---@field force LuaForce @nilable; The force that did the killing if any.
  ---@field ghost LuaEntity @nilable; The ghost created by the entity dying if any.
  ---@field name defines__events @Identifier of the event
  ---@field position MapPosition @Position where the entity died.
  ---@field prototype LuaEntityPrototype @The entity prototype of the entity that died.
  ---@field surface_index uint @The surface the entity was on.
  ---@field tick uint @Tick the event was generated.
  ---@field unit_number uint @nilable; The unit number the entity had if any.

---@class OnPreBuild: EventData @Called when players uses an item to build something. Called before [on_built_entity](on_built_entity).
  ---@field created_by_moving boolean @Item was placed while moving.
  ---@field direction defines__direction @The direction the item was facing when placed.
  ---@field flip_horizontal boolean @If building this blueprint was flipped horizontally.
  ---@field flip_vertical boolean @If building this blueprint was flipped vertically.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player who did the placing.
  ---@field position MapPosition @Where the item was placed.
  ---@field shift_build boolean @Item was placed using shift building.
  ---@field tick uint @Tick the event was generated.

---@class OnPreChunkDeleted: EventData @Called before one or more chunks are deleted using [LuaSurface::delete_chunk](LuaSurface::delete_chunk).
  ---@field name defines__events @Identifier of the event
  ---@field positions ChunkPosition[] @The chunks to be deleted.
  ---@field surface_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPreEntitySettingsPasted: EventData @Called before entity copy-paste is done.
  ---@field destination LuaEntity @The destination entity settings will be copied to.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field source LuaEntity @The source entity settings will be copied from.
  ---@field tick uint @Tick the event was generated.

---@class OnPreGhostDeconstructed: EventData @Called before a ghost entity is destroyed as a result of being marked for deconstruction. Can be filtered using [LuaPreGhostDeconstructedEventFilter](LuaPreGhostDeconstructedEventFilter).
  ---@field ghost LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable; The player that did the deconstruction if any.
  ---@field tick uint @Tick the event was generated.

---@class OnPreGhostUpgraded: EventData @Called before a ghost entity is upgraded. Can be filtered using [LuaPreGhostUpgradedEventFilter](LuaPreGhostUpgradedEventFilter).
  ---@field ghost LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable; The player that did the upgrade if any.
  ---@field target LuaEntityPrototype
  ---@field tick uint @Tick the event was generated.

---@class OnPrePermissionGroupDeleted: EventData @Called directly before a permission group is deleted.
  ---@field group LuaPermissionGroup @The group to be deleted.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player doing the deletion.
  ---@field tick uint @Tick the event was generated.

---@class OnPrePermissionStringImported: EventData @Called directly before a permission string is imported.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player importing the string.
  ---@field tick uint @Tick the event was generated.

---@class OnPrePlayerCraftedItem: EventData @Called when a player queues something to be crafted.
  ---@field items LuaInventory @The items removed from the players inventory to do the crafting.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player doing the crafting.
  ---@field queued_count uint @The number of times the recipe is being queued.
  ---@field recipe LuaRecipe @The recipe being queued.
  ---@field tick uint @Tick the event was generated.

---@class OnPrePlayerDied: EventData @Called before a players dies.
  ---@field cause LuaEntity @nilable
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPrePlayerLeftGame: EventData @Called before a player leaves the game.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field reason defines__disconnect_reason
  ---@field tick uint @Tick the event was generated.

---@class OnPrePlayerMinedItem: EventData @Called when the player completes a mining action, but before the entity is potentially removed from the map. This is called even if the entity does not end up being removed. Can be filtered using [LuaPrePlayerMinedEntityEventFilter](LuaPrePlayerMinedEntityEventFilter).
  ---@field entity LuaEntity @The entity being mined
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPrePlayerRemoved: EventData @Called before a player is removed (deleted) from the game. Not to be confused with the player logging of this is different in that the player is deleted as if he never existed in the save file.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player index that will be removed
  ---@field tick uint @Tick the event was generated.

---@class OnPrePlayerToggledMapEditor: EventData @Called before a player toggles the map editor on or off.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPreRobotExplodedCliff: EventData @Called directly before a robot explodes cliffs.
  ---@field cliff LuaEntity
  ---@field item LuaItemPrototype @The cliff explosive used.
  ---@field name defines__events @Identifier of the event
  ---@field robot LuaEntity
  ---@field tick uint @Tick the event was generated.

---@class OnPreScriptInventoryResized: EventData @Called just before a script inventory is resized.
  ---@field inventory LuaInventory
  ---@field mod string @The mod that did the resizing. This will be `"core"` if done by console command or scenario script.
  ---@field name defines__events @Identifier of the event
  ---@field new_size uint @The new inventory size.
  ---@field old_size uint @The old inventory size.
  ---@field player_index uint @nilable; If done by console command; the player who ran the command.
  ---@field tick uint @Tick the event was generated.

---@class OnPreSurfaceCleared: EventData @Called just before a surface is cleared (all entities removed and all chunks deleted).
  ---@field name defines__events @Identifier of the event
  ---@field surface_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnPreSurfaceDeleted: EventData @Called just before a surface is deleted.
  ---@field name defines__events @Identifier of the event
  ---@field surface_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnResearchCancelled: EventData @Called when research is cancelled.
  ---@field force LuaForce @The force whose research was cancelled.
  ---@field name defines__events @Identifier of the event
  ---@field research table<string, uint> @A mapping of technology name to how many times it was cancelled.
  ---@field tick uint @Tick the event was generated.

---@class OnResearchFinished: EventData @Called when a research finishes.
  ---@field by_script boolean @If the technology was researched by script.
  ---@field name defines__events @Identifier of the event
  ---@field research LuaTechnology @The researched technology
  ---@field tick uint @Tick the event was generated.

---@class OnResearchReversed: EventData @Called when a research is reversed (unresearched).
  ---@field by_script boolean @If the technology was un-researched by script.
  ---@field name defines__events @Identifier of the event
  ---@field research LuaTechnology @The technology un-researched
  ---@field tick uint @Tick the event was generated.

---@class OnResearchStarted: EventData @Called when a technology research starts.
  ---@field last_research LuaTechnology @nilable
  ---@field name defines__events @Identifier of the event
  ---@field research LuaTechnology @The technology being researched
  ---@field tick uint @Tick the event was generated.

---@class OnResourceDepleted: EventData @Called when a resource entity reaches 0 or its minimum yield for infinite resources.
  ---@field entity LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnRobotBuiltEntity: EventData @Called when a construction robot builds an entity. Can be filtered using [LuaRobotBuiltEntityEventFilter](LuaRobotBuiltEntityEventFilter).
  ---@field created_entity LuaEntity @The entity built.
  ---@field name defines__events @Identifier of the event
  ---@field robot LuaEntity @The robot that did the building.
  ---@field stack LuaItemStack @The item used to do the building.
  ---@field tags Tags @nilable; The tags associated with this entity if any.
  ---@field tick uint @Tick the event was generated.

---@class OnRobotBuiltTile: EventData @Called after a robot builds tiles.
  ---@field item LuaItemPrototype @The item type used to build the tiles.
  ---@field name defines__events @Identifier of the event
  ---@field robot LuaEntity @The robot.
  ---@field stack LuaItemStack @The stack used to build the tiles (may be empty if all of the items where used to build the tiles).
  ---@field surface_index uint @The surface the tile(s) are build on.
  ---@field tick uint @Tick the event was generated.
  ---@field tile LuaTilePrototype @The tile prototype that was placed.
  ---@field tiles OldTileAndPosition[] @The position data.

---@class OnRobotExplodedCliff: EventData @Called directly after a robot explodes cliffs.
  ---@field item LuaItemPrototype @The cliff explosive used.
  ---@field name defines__events @Identifier of the event
  ---@field robot LuaEntity
  ---@field tick uint @Tick the event was generated.

---@class OnRobotMined: EventData @Called when a robot mines an entity.
  ---@field item_stack SimpleItemStack @The entity the robot just picked up.
  ---@field name defines__events @Identifier of the event
  ---@field robot LuaEntity @The robot that did the mining.
  ---@field tick uint @Tick the event was generated.

---@class OnRobotMinedEntity: EventData @Called after the results of an entity being mined are collected just before the entity is destroyed. After this event any items in the buffer will be transferred into the robot as if they came from mining the entity. Can be filtered using [LuaRobotMinedEntityEventFilter](LuaRobotMinedEntityEventFilter).
  ---@field buffer LuaInventory @The temporary inventory that holds the result of mining the entity.
  ---@field entity LuaEntity @The entity that has been mined.
  ---@field name defines__events @Identifier of the event
  ---@field robot LuaEntity @The robot doing the mining.
  ---@field tick uint @Tick the event was generated.

---@class OnRobotMinedTile: EventData @Called after a robot mines tiles.
  ---@field name defines__events @Identifier of the event
  ---@field robot LuaEntity @The robot.
  ---@field surface_index uint @The surface the tile(s) were mined on.
  ---@field tick uint @Tick the event was generated.
  ---@field tiles OldTileAndPosition[] @The position data.

---@class OnRobotPreMined: EventData @Called before a robot mines an entity. Can be filtered using [LuaPreRobotMinedEntityEventFilter](LuaPreRobotMinedEntityEventFilter).
  ---@field entity LuaEntity @The entity which is about to be mined.
  ---@field name defines__events @Identifier of the event
  ---@field robot LuaEntity @The robot that's about to do the mining.
  ---@field tick uint @Tick the event was generated.

---@class OnRocketLaunchOrdered: EventData @Called when a rocket silo is ordered to be launched.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable; The player that is riding the rocket, if any.
  ---@field rocket LuaEntity
  ---@field rocket_silo LuaEntity
  ---@field tick uint @Tick the event was generated.

---@class OnRocketLaunched: EventData @Called when the rocket is launched.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable; The player that is riding the rocket, if any.
  ---@field rocket LuaEntity
  ---@field rocket_silo LuaEntity @nilable
  ---@field tick uint @Tick the event was generated.

---@class OnRuntimeModSettingChanged: EventData @Called when a runtime mod setting is changed by a player.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable; If the `setting_type` is `"global"` and it was changed through the mod settings GUI, this is the index of the player that changed the global setting. If the `setting_type` is `"runtime-per-user"` and it changed a current setting of the player, this is the index of the player whose setting was changed. In all other cases, this is `nil`.
  ---@field setting string @The prototype name of the setting that was changed.
  ---@field setting_type string @Either "runtime-per-user" or "runtime-global".
  ---@field tick uint @Tick the event was generated.

---@class OnScriptInventoryResized: EventData @Called just after a script inventory is resized.
  ---@field inventory LuaInventory
  ---@field mod string @The mod that did the resizing. This will be `"core"` if done by console command or scenario script.
  ---@field name defines__events @Identifier of the event
  ---@field new_size uint @The new inventory size.
  ---@field old_size uint @The old inventory size.
  ---@field overflow_inventory LuaInventory @Any items which didn't fit into the new inventory size.
  ---@field player_index uint @nilable; If done by console command; the player who ran the command.
  ---@field tick uint @Tick the event was generated.

---@class OnScriptPathRequestFinished: EventData @Called when a [LuaSurface::request_path](LuaSurface::request_path) call completes.
  ---@field id uint @Handle to associate the callback with a particular call to [LuaSurface::request_path](LuaSurface::request_path).
  ---@field name defines__events @Identifier of the event
  ---@field path PathfinderWaypoint[] @nilable; The actual path that the pathfinder has determined. `nil` if pathfinding failed.
  ---@field tick uint @Tick the event was generated.
  ---@field try_again_later boolean @Indicates that the pathfinder failed because it is too busy, and that you can retry later.

---@class OnScriptTriggerEffect: EventData @Called when a script trigger effect is triggered.
  ---@field effect_id string @The effect_id specified in the trigger effect.
  ---@field name defines__events @Identifier of the event
  ---@field source_entity LuaEntity @nilable
  ---@field source_position MapPosition @nilable
  ---@field surface_index uint @The surface the effect happened on.
  ---@field target_entity LuaEntity @nilable
  ---@field target_position MapPosition @nilable
  ---@field tick uint @Tick the event was generated.

---@class OnSectorScanned: EventData @Called when an entity of type `radar` finishes scanning a sector. Can be filtered for the radar using [LuaSectorScannedEventFilter](LuaSectorScannedEventFilter).
  ---@field area BoundingBox @Area of the scanned chunk.
  ---@field chunk_position ChunkPosition @The chunk scanned.
  ---@field name defines__events @Identifier of the event
  ---@field radar LuaEntity @The radar that did the scanning.
  ---@field tick uint @Tick the event was generated.

---@class OnSelectedEntityChanged: EventData @Called after the selected entity changes for a given player.
  ---@field last_entity LuaEntity @nilable; The last selected entity if it still exists and there was one.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player whose selected entity changed.
  ---@field tick uint @Tick the event was generated.

---@class OnSpiderCommandCompleted: EventData @Called when a spider finishes moving to its autopilot position.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.
  ---@field vehicle LuaEntity @Spider vehicle which was requested to move.

---@class OnStringTranslated: EventData @Called when a translation request generated through [LuaPlayer::request_translation](LuaPlayer::request_translation) is translated.
  ---@field localised_string LocalisedString @The localised string being translated.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @The player whose locale was used for the translation.
  ---@field result string @The translated `localised_string`.
  ---@field tick uint @Tick the event was generated.
  ---@field translated boolean @Whether the requested localised string was valid and could be translated.

---@class OnSurfaceCleared: EventData @Called just after a surface is cleared (all entities removed and all chunks deleted).
  ---@field name defines__events @Identifier of the event
  ---@field surface_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnSurfaceCreated: EventData @Called when a surface is created.
  ---@field name defines__events @Identifier of the event
  ---@field surface_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnSurfaceDeleted: EventData @Called after a surface is deleted.
  ---@field name defines__events @Identifier of the event
  ---@field surface_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnSurfaceImported: EventData @Called after a surface is imported.
  ---@field name defines__events @Identifier of the event
  ---@field original_name string @The original surface name.
  ---@field surface_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnSurfaceRenamed: EventData @Called when a surface is renamed.
  ---@field name defines__events @Identifier of the event
  ---@field new_name string
  ---@field old_name string
  ---@field surface_index uint
  ---@field tick uint @Tick the event was generated.

---@class OnTechnologyEffectsReset: EventData @Called when [LuaForce::reset_technology_effects](LuaForce::reset_technology_effects) is finished.
  ---@field force LuaForce
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnTick: EventData @It is fired once every tick. Since this event is fired every tick, its handler shouldn't include performance heavy code.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnTrainChangedState: EventData @Called when a train changes state (started to stopped and vice versa)
  ---@field name defines__events @Identifier of the event
  ---@field old_state defines__train_state
  ---@field tick uint @Tick the event was generated.
  ---@field train LuaTrain

---@class OnTrainCreated: EventData @Called when a new train is created either through disconnecting/connecting an existing one or building a new one.
  ---@field name defines__events @Identifier of the event
  ---@field old_train_id_1 uint @nilable; The first old train id when splitting/merging trains.
  ---@field old_train_id_2 uint @nilable; The second old train id when splitting/merging trains.
  ---@field tick uint @Tick the event was generated.
  ---@field train LuaTrain

---@class OnTrainScheduleChanged: EventData @Called when a trains schedule is changed either by the player or through script.
  ---@field name defines__events @Identifier of the event
  ---@field player_index uint @nilable; The player who made the change if any.
  ---@field tick uint @Tick the event was generated.
  ---@field train LuaTrain

---@class OnTriggerCreatedEntity: EventData @Called when an entity with a trigger prototype (such as capsules) create an entity AND that trigger prototype defined `trigger_created_entity="true"`.
  ---@field entity LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field source LuaEntity @nilable
  ---@field tick uint @Tick the event was generated.

---@class OnTriggerFiredArtillery: EventData @Called when an entity with a trigger prototype (such as capsules) fire an artillery projectile AND that trigger prototype defined `trigger_fired_artillery="true"`.
  ---@field entity LuaEntity
  ---@field name defines__events @Identifier of the event
  ---@field source LuaEntity @nilable
  ---@field tick uint @Tick the event was generated.

---@class OnUnitAddedToGroup: EventData @Called when a unit is added to a unit group.
  ---@field group LuaUnitGroup
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.
  ---@field unit LuaEntity

---@class OnUnitGroupCreated: EventData @Called when a new unit group is created, before any members are added to it.
  ---@field group LuaUnitGroup
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnUnitGroupFinishedGathering: EventData @Called when a unit group finishes gathering and starts executing its command.
  ---@field group LuaUnitGroup
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class OnUnitRemovedFromGroup: EventData @Called when a unit is removed from a unit group.
  ---@field group LuaUnitGroup
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.
  ---@field unit LuaEntity

---@class OnWorkerRobotExpired: EventData @Called when a worker (construction or logistic) robot expires through a lack of energy.
  ---@field name defines__events @Identifier of the event
  ---@field robot LuaEntity
  ---@field tick uint @Tick the event was generated.

---@class ScriptRaisedBuilt: EventData @A static event mods can use to tell other mods they built something by script. This event is only raised if a mod does so with [LuaBootstrap::raise_event](LuaBootstrap::raise_event) or [LuaBootstrap::raise_script_built](LuaBootstrap::raise_script_built), or when `raise_built` is passed to [LuaSurface::create_entity](LuaSurface::create_entity). Can be filtered using [LuaScriptRaisedBuiltEventFilter](LuaScriptRaisedBuiltEventFilter).
  ---@field entity LuaEntity @The entity that has been built.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class ScriptRaisedDestroy: EventData @A static event mods can use to tell other mods they destroyed something by script. This event is only raised if a mod does so with [LuaBootstrap::raise_event](LuaBootstrap::raise_event) or [LuaBootstrap::raise_script_destroy](LuaBootstrap::raise_script_destroy), or when `raise_destroy` is passed to [LuaEntity::destroy](LuaEntity::destroy). Can be filtered using [LuaScriptRaisedDestroyEventFilter](LuaScriptRaisedDestroyEventFilter).
  ---@field entity LuaEntity @The entity that was destroyed.
  ---@field name defines__events @Identifier of the event
  ---@field tick uint @Tick the event was generated.

---@class ScriptRaisedRevive: EventData @A static event mods can use to tell other mods they revived something by script. This event is only raised if a mod does so with [LuaBootstrap::raise_event](LuaBootstrap::raise_event) or [LuaBootstrap::raise_script_revive](LuaBootstrap::raise_script_revive), or when `raise_revive` is passed to [LuaEntity::revive](LuaEntity::revive). Can be filtered using [LuaScriptRaisedReviveEventFilter](LuaScriptRaisedReviveEventFilter).
  ---@field entity LuaEntity @The entity that was revived.
  ---@field name defines__events @Identifier of the event
  ---@field tags Tags @nilable; The tags associated with this entity, if any.
  ---@field tick uint @Tick the event was generated.

---@class ScriptRaisedSetTiles: EventData @A static event mods can use to tell other mods they changed tiles on a surface by script. This event is only raised if a mod does so with [LuaBootstrap::raise_event](LuaBootstrap::raise_event) or [LuaBootstrap::raise_script_set_tiles](LuaBootstrap::raise_script_set_tiles), or when `raise_event` is passed to [LuaSurface::set_tiles](LuaSurface::set_tiles).
  ---@field name defines__events @Identifier of the event
  ---@field surface_index uint @The surface whose tiles were changed.
  ---@field tick uint @Tick the event was generated.
  ---@field tiles Tile[] @The tiles that were changed.


--- global_functions 

--- `localised_print()` allows printing [LocalisedString](LocalisedString) to stdout without polluting the Factorio [log file](https://wiki.factorio.com/Log_file). This is primarily useful when communicating with external tools that launch Factorio as a child process.
---@param string LocalisedString
function localised_print(string) end


--- `log()` can print [LocalisedStrings](LocalisedString) to the Factorio [log file](https://wiki.factorio.com/Log_file). This, in combination with the serpent library, makes debugging in the data stage easier because it allows the inspection of entire prototype tables. For example, printing all properties of the sulfur item prototype can be done like so: `log(serpent.block(data.raw["item"]["sulfur"]))`
---@param string LocalisedString
function log(string) end


--- Factorio provides the `table_size()` function as a simple way to determine the size of tables with non-continuous keys, as the standard `#` operator does not work correctly for these. The function is a C++ implementation of the following Lua code, which is faster than doing the same in Lua:
--- ```
--- local function size(t)
---     local count = 0
---     for k,v in pairs(t) do
---         count = count + 1
---     end
---     return count
--- end
--- ```
--- Note that `table_size()` does not work correctly for [LuaCustomTable](LuaCustomTable), their size has to be determined with [LuaCustomTable::length_operator](LuaCustomTable::length_operator) instead.
---@param table table
---@return uint
function table_size(table) end



--- global_objects 

---@type LuaCommandProcessor @Allows registering custom commands for the in-game console accessible via the grave key.
commands = commands

---@type LuaGameScript @This is the main object, through which most of the API is accessed. It is, however, not available inside handlers registered with [LuaBootstrap::on_load](LuaBootstrap::on_load).
game = game

---@type LuaRCON @Allows printing messages to the calling RCON instance if any.
rcon = rcon

---@type LuaRemote @Allows inter-mod communication by way of providing a repository of interfaces that is shared by all mods.
remote = remote

---@type LuaRendering @Allows rendering of geometric shapes, text and sprites in the game world.
rendering = rendering

---@type LuaBootstrap @Provides an interface for registering event handlers.
script = script

---@type LuaSettings @Allows reading the current mod settings.
settings = settings



--- ex types

---@shape AchievementPrototypeFilter
  ---@field filter string @The condition to filter on. One of `"allowed-without-fight"`, `"type"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string | string[] @type; The prototype type, or a list of acceptable types.

---@shape AdvancedMapGenSettings
  ---@field pollution PollutionMapSettings
  ---@field enemy_evolution EnemyEvolutionMapSettings
  ---@field enemy_expansion EnemyExpansionMapSettings
  ---@field difficulty_settings DifficultySettings

---@shape Alert
  ---@field tick uint @The tick this alert was created.
  ---@field target LuaEntity|nil @nilable
  ---@field prototype LuaEntityPrototype|nil @nilable
  ---@field position MapPosition|nil @nilable
  ---@field icon SignalID|nil @nilable; The SignalID used for a custom alert. Only present for custom alerts.
  ---@field message LocalisedString|nil @nilable; The message for a custom alert. Only present for custom alerts.

---@shape AmmoType
  ---@field action TriggerItem[]|nil @nilable
  ---@field target_type string @One of `"entity"` (fires at an entity), `"position"` (fires directly at a position), or `"direction"` (fires in a direction).
  ---@field clamp_position boolean|nil @nilable; When `true`, the gun will be able to shoot even when the target is out of range. Only applies when `target_type` is `position`. The gun will fire at the maximum range in the direction of the target position. Defaults to `false`.
  ---@field category string @Ammo category of this ammo.
  ---@field energy_consumption double|nil @nilable; Energy consumption of a single shot, if applicable. Defaults to `0`.
  ---@field range_modifier double|nil @nilable
  ---@field cooldown_modifier double|nil @nilable
  ---@field consumption_modifier double|nil @nilable

---@shape ArithmeticCombinatorParameters
  ---@field first_signal SignalID|nil @nilable; First signal to use in an operation. If not specified, the second argument will be the value of `first_constant`.
  ---@field second_signal SignalID|nil @nilable; Second signal to use in an operation. If not specified, the second argument will be the value of `second_constant`.
  ---@field first_constant int|nil @nilable; Constant to use as the first argument of the operation. Has no effect when `first_signal` is set. Defaults to `0`.
  ---@field second_constant int|nil @nilable; Constant to use as the second argument of the operation. Has no effect when `second_signal` is set. Defaults to `0`.
  ---@field operation string|nil @nilable; Must be one of `"*"`, `"/"`, `"+"`, `"-"`, `"%"`, `"^"`, `"<<"`, `">>"`, `"AND"`, `"OR"`, `"XOR"`. When not specified, defaults to `"*"`.
  ---@field output_signal SignalID|nil @nilable; Specifies the signal to output.

---@shape AttackParameterFluid
  ---@field type string @Name of the [LuaFluidPrototype](LuaFluidPrototype).
  ---@field damage_modifier double @Multiplier applied to the damage of an attack.

---@shape AttackParameters
  ---@field type string @The type of AttackParameter. One of `'projectile'`, `'stream'` or `'beam'`.
  ---@field range float @Maximum range of attack.
  ---@field min_range float @Minimum range of attack. Used with flamethrower turrets to prevent self-immolation.
  ---@field range_mode string @Defines how the range is determined. Either `'center-to-center'` or `'bounding-box-to-bounding-box'`.
  ---@field fire_penalty float @When searching for the nearest enemy to attack, `fire_penalty` is added to the enemy's distance if they are on fire.
  ---@field rotate_penalty float @When searching for an enemy to attack, a higher `rotate_penalty` will discourage targeting enemies that would take longer to turn to face.
  ---@field health_penalty float @When searching for an enemy to attack, a higher `health_penalty` will discourage targeting enemies with high health. A negative penalty will do the opposite.
  ---@field min_attack_distance float @If less than `range`, the entity will choose a random distance between `range` and `min_attack_distance` and attack from that distance. Used for spitters.
  ---@field turn_range float @The arc that the entity can attack in as a fraction of a circle. A value of `1` means the full 360 degrees.
  ---@field damage_modifier float @Multiplier applied to the damage of an attack.
  ---@field ammo_consumption_modifier float @Multiplier applied to the ammo consumption of an attack.
  ---@field cooldown float @Minimum amount of ticks between shots. If this is less than `1`, multiple shots can be performed per tick.
  ---@field warmup uint @Number of ticks it takes for the weapon to actually shoot after it has been ordered to do so.
  ---@field movement_slow_down_factor double
  ---@field movement_slow_down_cooldown float
  ---@field ammo_type AmmoType|nil @nilable
  ---@field ammo_categories string[]|nil @nilable; List of the names of compatible [LuaAmmoCategoryPrototypes](LuaAmmoCategoryPrototype).
  ---@field projectile_center Vector @projectile
  ---@field projectile_creation_distance float @projectile
  ---@field projectile_orientation_offset float @projectile
  ---@field shell_particle CircularParticleCreationSpecification|nil @nilable; projectile
  ---@field projectile_creation_parameters CircularProjectileCreationSpecification[]|nil @nilable; projectile
  ---@field gun_barrel_length float @stream
  ---@field gun_center_shift table<string, Vector> @stream
  ---@field fluid_consumption float @stream
  ---@field fluids AttackParameterFluid[]|nil @nilable; stream
  ---@field projectile_creation_parameters CircularProjectileCreationSpecification[]|nil @nilable; stream

---@shape AutoplaceControl
  ---@field frequency MapGenSize @For things that are placed as spots such as ores and enemy bases, frequency is generally proportional to number of spots placed per unit area. For continuous features such as forests, frequency is how compressed the probability function is over distance, i.e. the inverse of 'scale' (similar to terrain_segmentation). When the [LuaAutoplaceControlPrototype](LuaAutoplaceControlPrototype) is of the category `"terrain"`, then scale is shown in the map generator GUI instead of frequency.
  ---@field size MapGenSize @For things that are placed as spots, size is proportional to the area of each spot. For continuous features, size affects how much of the map is covered with the thing, and is called 'coverage' in the GUI.
  ---@field richness MapGenSize @Has different effects for different things, but generally affects the 'health' or density of a thing that is placed without affecting where it is placed. For trees, richness affects tree health. For ores, richness multiplies the amount of ore at any given tile in a patch. Metadata about autoplace controls (such as whether or not 'richness' does anything for them) can be found in the [LuaAutoplaceControlPrototype](LuaAutoplaceControlPrototype) by looking up `game.autoplace_control_prototypes[(control prototype name)]`, e.g. `game.autoplace_control_prototypes["enemy-base"].richness` is false, because enemy base autoplacement doesn't use richness.

---@shape AutoplaceSettings
  ---@field treat_missing_as_default boolean @Whether missing autoplace names for this type should be default enabled.
  ---@field settings table<string, AutoplaceControl>

---@shape AutoplaceSpecification
  ---@field probability_expression NoiseExpression
  ---@field richness_expression NoiseExpression
  ---@field coverage double
  ---@field sharpness double
  ---@field max_probability double
  ---@field placement_density uint
  ---@field richness_base double
  ---@field richness_multiplier double
  ---@field richness_multiplier_distance_bonus double
  ---@field starting_area_size uint
  ---@field order string
  ---@field default_enabled boolean
  ---@field peaks AutoplaceSpecificationPeak[]|nil @nilable
  ---@field control string|nil @nilable; Control prototype name.
  ---@field tile_restriction AutoplaceSpecificationRestriction[]|nil @nilable
  ---@field force string
  ---@field random_probability_penalty double

---@shape AutoplaceSpecificationPeak
  ---@field influence double
  ---@field max_influence double
  ---@field min_influence double
  ---@field richness_influence double
  ---@field noisePersistence double
  ---@field noise_layer string|nil @nilable; Prototype name of the noise layer.
  ---@field noise_octaves_difference double
  ---@field water_optimal double
  ---@field water_range double
  ---@field water_max_range double
  ---@field water_top_property_limit double
  ---@field elevation_optimal double
  ---@field elevation_range double
  ---@field elevation_max_range double
  ---@field elevation_top_property_limit double
  ---@field temperature_optimal double
  ---@field temperature_range double
  ---@field temperature_max_range double
  ---@field temperature_top_property_limit double
  ---@field starting_area_weight_optimal double
  ---@field starting_area_weight_range double
  ---@field starting_area_weight_max_range double
  ---@field starting_area_weight_top_property_limit double
  ---@field tier_from_start_optimal double
  ---@field tier_from_start_range double
  ---@field tier_from_start_max_range double
  ---@field tier_from_start_top_property_limit double
  ---@field distance_optimal double
  ---@field distance_range double
  ---@field distance_max_range double
  ---@field distance_top_property_limit double
  ---@field aux_optimal double
  ---@field aux_range double
  ---@field aux_max_range double
  ---@field aux_top_property_limit double

---@shape AutoplaceSpecificationRestriction
  ---@field first string|nil @nilable; Tile prototype name
  ---@field second string|nil @nilable; Second prototype name

---@shape BeamTarget
  ---@field entity LuaEntity|nil @nilable; The target entity.
  ---@field position MapPosition|nil @nilable; The target position.

---@shape BlueprintEntity
  ---@field entity_number uint @The entity's unique identifier in the blueprint.
  ---@field name string @The prototype name of the entity.
  ---@field position MapPosition @The position of the entity.
  ---@field direction defines__direction|nil @nilable; The direction the entity is facing. Only present for entities that can face in different directions and when the entity is not facing north.
  ---@field tags Tags|nil @nilable; The entity tags of the entity, if there are any. Only relevant for entity ghosts.
  ---@field items (table<string, uint>)|nil @nilable; The items that the entity will request when revived, if there are any. It's a mapping of prototype names to amounts. Only relevant for entity ghosts.
  ---@field connections BlueprintCircuitConnection|nil @nilable; The circuit network connections of the entity, if there are any. Only relevant for entities that support circuit connections.
  ---@field control_behavior BlueprintControlBehavior|nil @nilable; The control behavior of the entity, if it has one. The format of the control behavior depends on the entity's type. Only relevant for entities that support control behaviors.
  ---@field schedule TrainScheduleRecord[]|nil @nilable; The schedule of the entity, if it has one. Only relevant for locomotives.

---@shape BlueprintItemIcon
  ---@field name string @Name of the item prototype whose icon should be used.
  ---@field index uint @Index of the icon in the blueprint icons slots. Has to be an integer in the range [1, 4].

---@shape BlueprintSignalIcon
  ---@field signal SignalID @The icon to use. It can be any item icon as well as any virtual signal icon.
  ---@field index uint @Index of the icon in the blueprint icons slots. Has to be an integer in the range [1, 4].

---@shape _BoundingBox1
  ---@field left_top MapPosition
  ---@field right_bottom MapPosition
  ---@field orientation RealOrientation|nil @nilable

---@shape _BoundingBox2
  ---@field [1] MapPosition
  ---@field [2] MapPosition
  ---@field [3] RealOrientation|nil @nilable

---@shape CapsuleAction
  ---@field type string @One of `"throw"`, `"equipment-remote"`, `"use-on-self"`, `"artillery-remote"`, `"destroy-cliffs"`.
  ---@field attack_parameters AttackParameters @throw
  ---@field uses_stack boolean @throw; Whether using the capsule consumes an item from the stack.
  ---@field equipment string @equipment-remote; Name of the [LuaEquipmentPrototype](LuaEquipmentPrototype).
  ---@field attack_parameters AttackParameters @use-on-self
  ---@field flare string @artillery-remote; Name of the [flare prototype](LuaEntityPrototype).
  ---@field attack_parameters AttackParameters @destroy-cliffs
  ---@field radius float @destroy-cliffs
  ---@field timeout uint @destroy-cliffs

---@shape ChartTagSpec
  ---@field position MapPosition
  ---@field icon SignalID|nil @nilable
  ---@field text string|nil @nilable
  ---@field last_user PlayerIdentification|nil @nilable

---@shape _ChunkPosition1
  ---@field x int
  ---@field y int

---@shape _ChunkPosition2
  ---@field [1] int
  ---@field [2] int

---@shape ChunkPositionAndArea
  ---@field x int
  ---@field y int
  ---@field area BoundingBox

---@shape CircuitCondition
  ---@field comparator ComparatorString|nil @nilable; Specifies how the inputs should be compared. If not specified, defaults to `"<"`.
  ---@field first_signal SignalID|nil @nilable; Defaults to blank
  ---@field second_signal SignalID|nil @nilable; What to compare `first_signal` to. If not specified, `first_signal` will be compared to `constant`.
  ---@field constant int|nil @nilable; Constant to compare `first_signal` to. Has no effect when `second_signal` is set. When neither `second_signal` nor `constant` are specified, the effect is as though `constant` were specified with the value `0`.

---@shape CircuitConditionDefinition
  ---@field condition CircuitCondition
  ---@field fulfilled boolean|nil @nilable; Whether the condition is currently fulfilled

---@shape CircuitConnectionDefinition
  ---@field wire defines__wire_type @Wire color, either [defines.wire_type.red](defines.wire_type.red) or [defines.wire_type.green](defines.wire_type.green).
  ---@field target_entity LuaEntity
  ---@field source_circuit_id defines__circuit_connector_id
  ---@field target_circuit_id defines__circuit_connector_id

---@shape CircularParticleCreationSpecification
  ---@field name string @Name of the [LuaEntityPrototype](LuaEntityPrototype)
  ---@field direction float
  ---@field direction_deviation float
  ---@field speed float
  ---@field speed_deviation float
  ---@field starting_frame_speed float
  ---@field starting_frame_speed_deviation float
  ---@field height float
  ---@field height_deviation float
  ---@field vertical_speed float
  ---@field vertical_speed_deviation float
  ---@field center Vector @This vector is a table with `x` and `y` keys instead of an array.
  ---@field creation_distance double
  ---@field creation_distance_orientation double
  ---@field use_source_position boolean

---@shape CircularProjectileCreationSpecification
  ---@field [1] RealOrientation
  ---@field [2] Vector

---@shape CliffPlacementSettings
  ---@field name string @Name of the cliff prototype.
  ---@field cliff_elevation_0 float @Elevation at which the first row of cliffs is placed. The default is `10`, and this cannot be set from the map generation GUI.
  ---@field cliff_elevation_interval float @Elevation difference between successive rows of cliffs. This is inversely proportional to 'frequency' in the map generation GUI. Specifically, when set from the GUI the value is `40 / frequency`.
  ---@field richness MapGenSize @Corresponds to 'continuity' in the GUI. This value is not used directly, but is used by the 'cliffiness' noise expression, which in combination with elevation and the two cliff elevation properties drives cliff placement (cliffs are placed when elevation crosses the elevation contours defined by `cliff_elevation_0` and `cliff_elevation_interval` when 'cliffiness' is greater than `0.5`). The default 'cliffiness' expression interprets this value such that larger values result in longer unbroken walls of cliffs, and smaller values (between `0` and `1`) result in larger gaps in cliff walls.

---@shape _Color1
  ---@field r float|nil @nilable
  ---@field g float|nil @nilable
  ---@field b float|nil @nilable
  ---@field a float|nil @nilable

---@shape _Color2
  ---@field [1] float|nil @nilable
  ---@field [2] float|nil @nilable
  ---@field [3] float|nil @nilable
  ---@field [4] float|nil @nilable

---@shape _ColorModifier1
  ---@field r float|nil @nilable
  ---@field g float|nil @nilable
  ---@field b float|nil @nilable
  ---@field a float|nil @nilable

---@shape _ColorModifier2
  ---@field [1] float|nil @nilable
  ---@field [2] float|nil @nilable
  ---@field [3] float|nil @nilable
  ---@field [4] float|nil @nilable

---@shape Command
  ---@field type defines__command @Type of command. The remaining fields depend on the value of this field.
  ---@field target LuaEntity @defines.command.attack
  ---@field distraction defines__distraction|nil @nilable; defines.command.attack; Defaults to `defines.distraction.by_enemy`.
  ---@field destination MapPosition|nil @nilable; defines.command.go_to_location; The position to path to. Either this or `destination_entity` need to be specified. If both are, `destination_entity` is used.
  ---@field destination_entity LuaEntity|nil @nilable; defines.command.go_to_location; The entity to path to. Either this or `destination` need to be specified. If both are, `destination_entity` is used.
  ---@field distraction defines__distraction|nil @nilable; defines.command.go_to_location; Defaults to `defines.distraction.by_enemy`.
  ---@field pathfind_flags PathfinderFlags|nil @nilable; defines.command.go_to_location; Flags that affect pathfinder behavior.
  ---@field radius double|nil @nilable; defines.command.go_to_location; How close the pathfinder needs to get to its destination (in tiles). Defaults to `3`.
  ---@field structure_type defines__compound_command @defines.command.compound; How the commands should be chained together.
  ---@field commands Command[] @defines.command.compound; The sub-commands.
  ---@field group LuaUnitGroup @defines.command.group; The group whose command to follow.
  ---@field distraction defines__distraction|nil @nilable; defines.command.group; Defaults to `defines.distraction.by_enemy`.
  ---@field use_group_distraction boolean|nil @nilable; defines.command.group; Whether the unit will use the group distraction or the commands distraction. Defaults to true.
  ---@field destination MapPosition @defines.command.attack_area; Center of the attack area.
  ---@field radius double @defines.command.attack_area; Radius of the attack area.
  ---@field distraction defines__distraction|nil @nilable; defines.command.attack_area; Defaults to `defines.distraction.by_enemy`.
  ---@field distraction defines__distraction|nil @nilable; defines.command.wander; Defaults to `defines.distraction.by_enemy`.
  ---@field radius double|nil @nilable; defines.command.wander; Defaults to 10. Does not apply when `wander_in_group` is `true`.
  ---@field wander_in_group boolean|nil @nilable; defines.command.wander; When commanding a group, defines how the group will wander. When `true`, the units in the group will wander around inside the group's radius, just like gathering biters. When `false`, the units will wander as a group, ie they will all walk together in the same random direction. Default is true for groups. Passing true for a single unit is an error.
  ---@field ticks_to_wait uint|nil @nilable; defines.command.wander; Ticks to wander before successfully completing the command. Default is max uint, which means wander forever.
  ---@field distraction defines__distraction|nil @nilable; defines.command.stop; Defaults to `defines.distraction.by_enemy`.
  ---@field ticks_to_wait uint|nil @nilable; defines.command.stop; Ticks to wander before successfully completing the command. Default is max uint, which means stop forever.
  ---@field from LuaEntity @defines.command.flee; The entity to flee from
  ---@field distraction defines__distraction|nil @nilable; defines.command.flee; Defaults to `defines.distraction.by_enemy`.
  ---@field destination MapPosition @defines.command.build_base; Where to build the base.
  ---@field distraction defines__distraction|nil @nilable; defines.command.build_base; Defaults to `defines.distraction.by_enemy`.
  ---@field ignore_planner boolean|nil @nilable; defines.command.build_base; Whether the units should ignore expansion candidate chunks. When `false`, they will obey and not build a base in a non-candidate chunk. Defaults to `false`.

---@shape ConfigurationChangedData
  ---@field old_version string|nil @nilable; Old version of the map. Present only when loading map version other than the current version.
  ---@field new_version string|nil @nilable; New version of the map. Present only when loading map version other than the current version.
  ---@field mod_changes table<string, ModChangeData> @Dictionary of mod changes. It is indexed by mod name.
  ---@field mod_startup_settings_changed boolean @`true` when mod startup settings have changed since the last time this save was loaded.
  ---@field migration_applied boolean @`true` when mod prototype migrations have been applied since the last time this save was loaded.

---@shape ConstantCombinatorParameters
  ---@field signal SignalID @Signal to emit.
  ---@field count int @Value of the signal to emit.
  ---@field index uint @Index of the constant combinator's slot to set this signal to.

---@shape CraftingQueueItem
  ---@field index uint @The index of the item in the crafting queue.
  ---@field recipe string @The recipe being crafted.
  ---@field count uint @The amount of items being crafted.
  ---@field prerequisite boolean @The item is a prerequisite for another item in the queue.

---@shape CustomCommandData
  ---@field name string @The name of the command.
  ---@field tick uint @The tick the command was used in.
  ---@field player_index uint|nil @nilable; The player who issued the command, or `nil` if it was issued from the server console.
  ---@field parameter string|nil @nilable; The parameter passed after the command, if there is one.

---@shape CutsceneWaypoint
  ---@field position MapPosition|nil @nilable; Position to pan the camera to.
  ---@field target (LuaEntity | LuaUnitGroup)|nil @nilable; Entity or unit group to pan the camera to.
  ---@field transition_time uint @How many ticks it will take to reach this waypoint from the previous one.
  ---@field time_to_wait uint @Time in ticks to wait before moving to the next waypoint.
  ---@field zoom double|nil @nilable; Zoom level to be set when the waypoint is reached. When not specified, the previous waypoint's zoom is used.

---@shape DeciderCombinatorParameters
  ---@field first_signal SignalID|nil @nilable; Defaults to blank.
  ---@field second_signal SignalID|nil @nilable; Second signal to use in an operation, if any. If this is not specified, the second argument to a decider combinator's operation is assumed to be the value of `constant`.
  ---@field constant uint|nil @nilable; Constant to use as the second argument of operation. Defaults to `0`.
  ---@field comparator ComparatorString|nil @nilable; Specifies how the inputs should be compared. If not specified, defaults to `"<"`.
  ---@field output_signal SignalID|nil @nilable; Defaults to blank.
  ---@field copy_count_from_input boolean|nil @nilable; Defaults to `true`. When `false`, will output a value of `1` for the given `output_signal`.

---@shape Decorative
  ---@field name string @The name of the decorative prototype.
  ---@field position TilePosition
  ---@field amount uint8

---@shape DecorativePrototypeFilter
  ---@field filter string @The condition to filter on. One of `"decal"`, `"autoplace"`, `"collision-mask"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field mask CollisionMask | CollisionMaskWithFlags @collision-mask
  ---@field mask_mode string @collision-mask; How to filter: `"collides"`, `"layers-equals"`, `"contains-any"` or `"contains-all"`

---@shape DecorativeResult
  ---@field position TilePosition
  ---@field decorative LuaDecorativePrototype
  ---@field amount uint

---@shape DifficultySettings
  ---@field recipe_difficulty defines__difficulty_settings__recipe_difficulty
  ---@field technology_difficulty defines__difficulty_settings__technology_difficulty
  ---@field technology_price_multiplier double @A value in range [0.001, 1000].
  ---@field research_queue_setting string @Either `"after-victory"`, `"always"` or `"never"`. Changing this to `"always"` or `"after-victory"` does not automatically unlock the research queue. See [LuaForce](LuaForce) for that.

---@shape DisplayResolution
  ---@field width uint
  ---@field height uint

---@shape EnemyEvolutionMapSettings
  ---@field enabled boolean @Whether enemy evolution is enabled at all.
  ---@field time_factor double @The amount evolution naturally progresses by every second. Defaults to `0.000004`.
  ---@field destroy_factor double @The amount evolution progresses for every destroyed spawner. Defaults to `0.002`.
  ---@field pollution_factor double @The amount evolution progresses for every unit of pollution. Defaults to `0.0000009`.

---@shape EnemyExpansionMapSettings
  ---@field enabled boolean @Whether enemy expansion is enabled at all.
  ---@field max_expansion_distance uint @Distance in chunks from the furthest base around to prevent expansions from reaching too far into the player's territory. Defaults to `7`.
  ---@field friendly_base_influence_radius uint @Defaults to `2`.
  ---@field enemy_building_influence_radius uint @Defaults to `2`.
  ---@field building_coefficient double @Defaults to `0.1`.
  ---@field other_base_coefficient double @Defaults to `2.0`.
  ---@field neighbouring_chunk_coefficient double @Defaults to `0.5`.
  ---@field neighbouring_base_chunk_coefficient double @Defaults to `0.4`.
  ---@field max_colliding_tiles_coefficient double @A chunk has to have at most this high of a percentage of unbuildable tiles for it to be considered a candidate to avoid chunks full of water as candidates. Defaults to `0.9`, or 90%.
  ---@field settler_group_min_size uint @The minimum size of a biter group that goes to build a new base. This is multiplied by the evolution factor. Defaults to `5`.
  ---@field settler_group_max_size uint @The maximum size of a biter group that goes to build a new base. This is multiplied by the evolution factor. Defaults to `20`.
  ---@field min_expansion_cooldown uint @The minimum time between expansions in ticks. The actual cooldown is adjusted to the current evolution levels. Defaults to `4*3,600=14,400` ticks.
  ---@field max_expansion_cooldown uint @The maximum time between expansions in ticks. The actual cooldown is adjusted to the current evolution levels. Defaults to `60*3,600=216,000` ticks.

---@shape EntityPrototypeFilter
  ---@field filter string @The condition to filter on. One of `"flying-robot"`, `"robot-with-logistics-interface"`, `"rail"`, `"ghost"`, `"explosion"`, `"vehicle"`, `"crafting-machine"`, `"rolling-stock"`, `"turret"`, `"transport-belt-connectable"`, `"wall-connectable"`, `"buildable"`, `"placable-in-editor"`, `"clonable"`, `"selectable"`, `"hidden"`, `"entity-with-health"`, `"building"`, `"fast-replaceable"`, `"uses-direction"`, `"minable"`, `"circuit-connectable"`, `"autoplace"`, `"blueprintable"`, `"item-to-place"`, `"name"`, `"type"`, `"collision-mask"`, `"flag"`, `"build-base-evolution-requirement"`, `"selection-priority"`, `"emissions"`, `"crafting-category"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field name string | string[] @name; The prototype name, or list of acceptable names.
  ---@field type string | string[] @type; The prototype type, or a list of acceptable types.
  ---@field mask CollisionMask | CollisionMaskWithFlags @collision-mask
  ---@field mask_mode string @collision-mask; How to filter: `"collides"`, `"layers-equals"`, `"contains-any"` or `"contains-all"`
  ---@field flag string @flag; One of the values in [EntityPrototypeFlags](EntityPrototypeFlags).
  ---@field comparison ComparatorString @build-base-evolution-requirement
  ---@field value double @build-base-evolution-requirement; The value to compare against.
  ---@field comparison ComparatorString @selection-priority
  ---@field value uint8 @selection-priority; The value to compare against.
  ---@field comparison ComparatorString @emissions
  ---@field value double @emissions; The value to compare against.
  ---@field crafting_category string @crafting-category; Matches if the prototype is for a crafting machine with this crafting category.

---@shape EquipmentPoint
  ---@field x uint
  ---@field y uint

---@shape _EquipmentPosition1
  ---@field x int
  ---@field y int

---@shape _EquipmentPosition2
  ---@field [1] int
  ---@field [2] int

---@shape EquipmentPrototypeFilter
  ---@field filter string @The condition to filter on. One of `"item-to-place"`, `"type"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string | string[] @type; The prototype type, or a list of acceptable types.

---@shape EventData
  ---@field name defines__events @The identifier of the event this handler was registered to.
  ---@field tick uint @The tick during which the event happened.
  ---@field mod_name string|nil @nilable; The name of the mod that raised the event if it was raised using [LuaBootstrap::raise_event](LuaBootstrap::raise_event).

---@shape Fluid
  ---@field name string @Fluid prototype name of the fluid.
  ---@field amount double @Amount of the fluid.
  ---@field temperature double|nil @nilable; The temperature. When reading from [LuaFluidBox](LuaFluidBox), this field will always be present. It is not necessary to specify it when writing, however. When not specified, the fluid will be set to the fluid's default temperature as specified in the fluid's prototype.

---@shape FluidBoxConnection
  ---@field type string @The connection type: "input", "output", or "input-output".
  ---@field positions Vector[] @The 4 cardinal direction connection points for this pipe. This vector is a table with `x` and `y` keys instead of an array.
  ---@field max_underground_distance uint|nil @nilable; The maximum tile distance this underground connection can connect at if this is an underground pipe.

---@shape FluidBoxFilter
  ---@field name string @Fluid prototype name of the filtered fluid.
  ---@field minimum_temperature double @The minimum temperature allowed into the fluidbox.
  ---@field maximum_temperature double @The maximum temperature allowed into the fluidbox.

---@shape FluidBoxFilterSpec
  ---@field name string @Fluid prototype name of the filtered fluid.
  ---@field minimum_temperature double|nil @nilable; The minimum temperature allowed into the fluidbox.
  ---@field maximum_temperature double|nil @nilable; The maximum temperature allowed into the fluidbox.
  ---@field force boolean|nil @nilable; Force the filter to be set, regardless of current fluid content.

---@shape FluidPrototypeFilter
  ---@field filter string @The condition to filter on. One of `"hidden"`, `"name"`, `"subgroup"`, `"default-temperature"`, `"max-temperature"`, `"heat-capacity"`, `"fuel-value"`, `"emissions-multiplier"`, `"gas-temperature"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field name string | string[] @name; The prototype name, or list of acceptable names.
  ---@field subgroup string @subgroup; A [LuaGroup](LuaGroup) (subgroup) name
  ---@field comparison ComparatorString @default-temperature
  ---@field value double @default-temperature; The value to compare against.
  ---@field comparison ComparatorString @max-temperature
  ---@field value double @max-temperature; The value to compare against.
  ---@field comparison ComparatorString @heat-capacity
  ---@field value double @heat-capacity; The value to compare against.
  ---@field comparison ComparatorString @fuel-value
  ---@field value double @fuel-value; The value to compare against.
  ---@field comparison ComparatorString @emissions-multiplier
  ---@field value double @emissions-multiplier; The value to compare against.
  ---@field comparison ComparatorString @gas-temperature
  ---@field value double @gas-temperature; The value to compare against.

---@shape GameViewSettings
  ---@field show_controller_gui boolean @RW; Show the controller GUI elements. This includes the toolbar, the selected tool slot, the armour slot, and the gun and ammunition slots.
  ---@field show_minimap boolean @RW; Show the chart in the upper right-hand corner of the screen.
  ---@field show_research_info boolean @RW; Show research progress and name in the upper right-hand corner of the screen.
  ---@field show_entity_info boolean @RW; Show overlay icons on entities. Also known as "alt-mode".
  ---@field show_alert_gui boolean @RW; Show the flashing alert icons next to the player's toolbar.
  ---@field update_entity_selection boolean @RW; When `true` (the default), mousing over an entity will select it. Otherwise, moving the mouse won't update entity selection.
  ---@field show_rail_block_visualisation boolean @RW; When `true` (`false` is default), the rails will always show the rail block visualisation.
  ---@field show_side_menu boolean @RW; Shows or hides the buttons row.
  ---@field show_map_view_options boolean @RW; Shows or hides the view options when map is opened.
  ---@field show_quickbar boolean @RW; Shows or hides quickbar of shortcuts.
  ---@field show_shortcut_bar boolean @RW; Shows or hides the shortcut bar.

---@shape GuiAnchor
  ---@field gui defines__relative_gui_type
  ---@field position defines__relative_gui_position
  ---@field type string|nil @nilable; If provided, only anchors the GUI element when the opened things type matches the type.
  ---@field name string|nil @nilable; If provided, only anchors the GUI element when the opened thing matches the name. `name` takes precedence over `names`.
  ---@field names string[]|nil @nilable; If provided, only anchors the GUI element when the opened thing matches one of the names. When reading an anchor, `names` is always populated.

---@shape GuiArrowSpecification
  ---@field type string @This determines which of the following fields will be required. Must be one of `"nowhere"` (will remove the arrow entirely), `"goal"` (will point to the current goal), `"entity_info"`, `"active_window"`, `"entity"`, `"position"`, `"crafting_queue"` or `"item_stack"` (will point to a given item stack in an inventory). Depending on this value, other fields may have to be specified.
  ---@field entity LuaEntity @entity
  ---@field position MapPosition @position
  ---@field crafting_queueindex uint @crafting_queue; Index in the crafting queue to point to.
  ---@field inventory_index defines__inventory @item_stack; Which inventory the stack is in.
  ---@field item_stack_index uint @item_stack; Which stack to point to.
  ---@field source string @item_stack; Must be either `"player"`, `"target"`, `"player-quickbar"` or `"player-equipment-bar"`.

---@shape _GuiLocation1
  ---@field x int
  ---@field y int

---@shape _GuiLocation2
  ---@field [1] int
  ---@field [2] int

---@shape HeatConnection
  ---@field position Vector
  ---@field direction defines__direction

---@shape HeatSetting
  ---@field temperature double|nil @nilable; The target temperature. Defaults to the minimum temperature of the heat buffer.
  ---@field mode string|nil @nilable; `"at-least"`, `"at-most"`, `"exactly"`, `"add"`, or `"remove"`. Defaults to `"at-least"`.

---@shape InfinityInventoryFilter
  ---@field name string @Name of the item.
  ---@field count uint|nil @nilable; The count of the filter.
  ---@field mode string|nil @nilable; `"at-least"`, `"at-most"`, or `"exactly"`. Defaults to `"at-least"`.
  ---@field index uint @The index of this filter in the filters list.

---@shape InfinityPipeFilter
  ---@field name string @Name of the fluid.
  ---@field percentage double|nil @nilable; The fill percentage the pipe (e.g. 0.5 for 50%). Can't be negative.
  ---@field temperature double|nil @nilable; The temperature of the fluid. Defaults to the default/minimum temperature of the fluid.
  ---@field mode string|nil @nilable; `"at-least"`, `"at-most"`, `"exactly"`, `"add"`, or `"remove"`. Defaults to `"at-least"`.

---@shape Ingredient
  ---@field type string @`"item"` or `"fluid"`.
  ---@field name string @Prototype name of the required item or fluid.
  ---@field amount double @Amount of the item or fluid.
  ---@field catalyst_amount (uint | double)|nil @nilable; How much of this ingredient is a catalyst.
  ---@field minimum_temperature double|nil @nilable; fluid; The minimum fluid temperature required.
  ---@field maximum_temperature double|nil @nilable; fluid; The maximum fluid temperature allowed.

---@shape InserterCircuitConditions
  ---@field circuit CircuitCondition|nil @nilable
  ---@field logistics CircuitCondition|nil @nilable

---@shape InventoryFilter
  ---@field index uint @Position of the corresponding filter slot.
  ---@field name string @Item prototype name of the item to filter.

---@shape ItemPrototypeFilter
  ---@field filter string @The condition to filter on. One of `"tool"`, `"mergeable"`, `"item-with-inventory"`, `"selection-tool"`, `"item-with-label"`, `"has-rocket-launch-products"`, `"fuel"`, `"place-result"`, `"burnt-result"`, `"place-as-tile"`, `"placed-as-equipment-result"`, `"name"`, `"type"`, `"flag"`, `"subgroup"`, `"fuel-category"`, `"stack-size"`, `"default-request-amount"`, `"wire-count"`, `"fuel-value"`, `"fuel-acceleration-multiplier"`, `"fuel-top-speed-multiplier"`, `"fuel-emissions-multiplier"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field elem_filters EntityPrototypeFilter[]|nil @nilable; place-result; Filters for the place result.
  ---@field elem_filters ItemPrototypeFilter[]|nil @nilable; burnt-result; Filters for the burnt result.
  ---@field elem_filters TilePrototypeFilter[]|nil @nilable; place-as-tile; Filters for the placed tile.
  ---@field elem_filters EquipmentPrototypeFilter[]|nil @nilable; placed-as-equipment-result; Filters for the placed equipment.
  ---@field name string | string[] @name; The prototype name, or list of acceptable names.
  ---@field type string | string[] @type; The prototype type, or a list of acceptable types.
  ---@field flag string @flag; One of the values in [ItemPrototypeFlags](ItemPrototypeFlags).
  ---@field subgroup string @subgroup; A [LuaGroup](LuaGroup) (subgroup) name
  ---@field ["fuel-category"] string @fuel-category; A [LuaFuelCategoryPrototype](LuaFuelCategoryPrototype) name
  ---@field comparison ComparatorString @stack-size
  ---@field value uint @stack-size; The value to compare against.
  ---@field comparison ComparatorString @default-request-amount
  ---@field value uint @default-request-amount; The value to compare against.
  ---@field comparison ComparatorString @wire-count
  ---@field value uint @wire-count; The value to compare against.
  ---@field comparison ComparatorString @fuel-value
  ---@field value double @fuel-value; The value to compare against.
  ---@field comparison ComparatorString @fuel-acceleration-multiplier
  ---@field value double @fuel-acceleration-multiplier; The value to compare against.
  ---@field comparison ComparatorString @fuel-top-speed-multiplier
  ---@field value double @fuel-top-speed-multiplier; The value to compare against.
  ---@field comparison ComparatorString @fuel-emissions-multiplier
  ---@field value double @fuel-emissions-multiplier; The value to compare against.

---@shape ItemStackDefinition
  ---@field name string @Prototype name of the item the stack holds.
  ---@field count uint|nil @nilable; Number of items the stack holds. If not specified, defaults to `1`.
  ---@field health float|nil @nilable; Health of the items in the stack. Defaults to `1.0`.
  ---@field durability double|nil @nilable; Durability of the tool items in the stack.
  ---@field ammo double|nil @nilable; Amount of ammo in the ammo items in the stack.
  ---@field tags string[]|nil @nilable; Tags of the items with tags in the stack.

---@shape ItemStackLocation
  ---@field inventory defines__inventory
  ---@field slot uint

---@shape LogisticFilter
  ---@field index uint @The index this filter applies to.
  ---@field name string @The item name for this filter.
  ---@field count uint @The count for this filter.

---@shape LogisticParameters
  ---@field name string|nil @nilable; The item. `nil` clears the filter.
  ---@field min uint|nil @nilable
  ---@field max uint|nil @nilable

---@shape Loot
  ---@field item string @Item prototype name of the result.
  ---@field probability double @Probability that any loot at all will drop, as a number in range [0, 1].
  ---@field count_min double @Minimum amount of loot to drop.
  ---@field count_max double @Maximum amount of loot to drop.

---@shape LuaEntityClonedEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaEntityDamagedEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`, `"original-damage-amount"`, `"final-damage-amount"`, `"damage-type"`, `"final-health"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name
  ---@field comparison ComparatorString @original-damage-amount
  ---@field value float @original-damage-amount; The value to compare against.
  ---@field comparison ComparatorString @final-damage-amount
  ---@field value float @final-damage-amount; The value to compare against.
  ---@field type string @damage-type; A [LuaDamagePrototype](LuaDamagePrototype) name
  ---@field comparison ComparatorString @final-health
  ---@field value float @final-health; The value to compare against.

---@shape LuaEntityDeconstructionCancelledEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaEntityDiedEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaEntityMarkedForDeconstructionEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaEntityMarkedForUpgradeEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaPlayerBuiltEntityEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`, `"force"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name
  ---@field force string @force; The entity force

---@shape LuaPlayerMinedEntityEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaPlayerRepairedEntityEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaPostEntityDiedEventFilter
  ---@field filter string @The condition to filter on. Can only be `"type"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type

---@shape LuaPreGhostDeconstructedEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaPreGhostUpgradedEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaPrePlayerMinedEntityEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaPreRobotMinedEntityEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaRobotBuiltEntityEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`, `"force"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name
  ---@field force string @force; The entity force

---@shape LuaRobotMinedEntityEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaScriptRaisedBuiltEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaScriptRaisedDestroyEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaScriptRaisedReviveEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaSectorScannedEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape LuaUpgradeCancelledEventFilter
  ---@field filter string @The condition to filter on. One of `"ghost"`, `"rail"`, `"rail-signal"`, `"rolling-stock"`, `"robot-with-logistics-interface"`, `"vehicle"`, `"turret"`, `"crafting-machine"`, `"wall-connectable"`, `"transport-belt-connectable"`, `"circuit-network-connectable"`, `"type"`, `"name"`, `"ghost_type"`, `"ghost_name"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string @type; The prototype type
  ---@field name string @name; The prototype name
  ---@field type string @ghost_type; The ghost prototype type
  ---@field name string @ghost_name; The ghost prototype name

---@shape MapAndDifficultySettings
  ---@field pollution PollutionMapSettings
  ---@field enemy_evolution EnemyEvolutionMapSettings
  ---@field enemy_expansion EnemyExpansionMapSettings
  ---@field unit_group UnitGroupMapSettings
  ---@field steering SteeringMapSettings
  ---@field path_finder PathFinderMapSettings
  ---@field max_failed_behavior_count uint @If a behavior fails this many times, the enemy (or enemy group) is destroyed. This solves biters getting stuck within their own base.
  ---@field difficulty_settings DifficultySettings

---@shape MapExchangeStringData
  ---@field map_settings MapAndDifficultySettings
  ---@field map_gen_settings MapGenSettings

---@shape MapGenPreset
  ---@field order string @The string used to alphabetically sort the presets. It is a simple string that has no additional semantic meaning.
  ---@field default boolean|nil @nilable; Whether this is the preset that is selected by default.
  ---@field basic_settings MapGenSettings|nil @nilable
  ---@field advanced_settings AdvancedMapGenSettings|nil @nilable

---@shape MapGenSettings
  ---@field terrain_segmentation MapGenSize @The inverse of 'water scale' in the map generator GUI. Lower `terrain_segmentation` increases the scale of elevation features (lakes, continents, etc). This behavior can be overridden with alternate elevation generators (see `property_expression_names`, below).
  ---@field water MapGenSize @The equivalent to 'water coverage' in the map generator GUI. Specifically, when this value is non-zero, `water_level = 10 * log2` (the value of this field), and the elevation generator subtracts water level from elevation before adding starting lakes. If water is set to 'none', elevation is clamped to a small positive value before adding starting lakes. This behavior can be overridden with alternate elevation generators (see `property_expression_names`, below).
  ---@field autoplace_controls table<string, AutoplaceControl> @Indexed by autoplace control prototype name.
  ---@field default_enable_all_autoplace_controls boolean @Whether undefined `autoplace_controls` should fall back to the default controls or not. Defaults to `true`.
  ---@field autoplace_settings table<string, AutoplaceSettings> @Each setting in this dictionary maps the string type to the settings for that type. Valid types are `"entity"`, `"tile"` and `"decorative"`.
  ---@field cliff_settings CliffPlacementSettings @Map generation settings for entities of the type "cliff".
  ---@field seed uint @The random seed used to generated this map.
  ---@field width uint @Width in tiles. If `0`, the map has 'infinite' width, with the actual limitation being one million tiles in each direction from the center.
  ---@field height uint @Height in tiles. If `0`, the map has 'infinite' height, with the actual limitation being one million tiles in each direction from the center.
  ---@field starting_area MapGenSize @Size of the starting area.
  ---@field starting_points MapPosition[] @Positions of the starting areas.
  ---@field peaceful_mode boolean @Whether peaceful mode is enabled for this map.
  ---@field property_expression_names table<string, string> @Overrides for tile property value generators. Values either name a NamedNoiseExpression or can be literal numbers, stored as strings (e.g. `"5"`). All other controls can be overridden by a property expression names. Notable properties: - `moisture` - a value between 0 and 1 that determines whether a tile becomes sandy (low moisture) or grassy (high moisture). - `aux` - a value between 0 and 1 that determines whether low-moisture tiles become sand or red desert. - `temperature` - provides a value (vaguely representing degrees Celsius, varying between -20 and 50) that is used (together with moisture and aux) as part of tree and decorative placement. - `elevation` - tiles values less than zero become water. Cliffs are placed along certain contours according to [CliffPlacementSettings](CliffPlacementSettings). - `cliffiness` - determines whether (when >0.5) or not (when <0.5) a cliff will be placed at an otherwise suitable (according to [CliffPlacementSettings](CliffPlacementSettings)) location. - `enemy-base-intensity` - a number that is referenced by both `enemy-base-frequency` and `enemy-base-radius`. i.e. if this is overridden, enemy base frequency and size will both be affected and do something reasonable. By default, this expression returns a value proportional to distance from any starting point, clamped at about 7. - `enemy-base-frequency` - a number representing average number of enemy bases per tile for a region, by default in terms of `enemy-base-intensity`. - `enemy-base-radius` - a number representing the radius of an enemy base, if one were to be placed on the given tile, by default proportional to a constant plus `enemy-base-intensity`. Climate controls ('Moisture' and 'Terrain type' at the bottom of the Terrain tab in the map generator GUI) don't have their own dedicated structures in MapGenSettings. Instead, their values are stored as property expression overrides with long names: - `control-setting:moisture:frequency:multiplier` - frequency (inverse of scale) multiplier for moisture noise. Default is 1. - `control-setting:moisture:bias` - global bias for moisture (which normally varies between 0 and 1). Default is 0. - `control-setting:aux:frequency:multiplier` - frequency (inverse of scale) multiplier for aux (called 'terrain type' in the GUI) noise. Default is 1. - `control-setting:aux:bias` - global bias for aux/terrain type (which normally varies between 0 and 1). Default is 0. All other MapGenSettings feed into named noise expressions, and therefore placement can be overridden by including the name of a property in this dictionary. The probability and richness functions for placing specific tiles, entities, and decoratives can be overridden by including an entry named `{tile|entity|decorative}:(prototype name):{probability|richness}`.

---@shape _MapPosition1
  ---@field x double
  ---@field y double

---@shape _MapPosition2
  ---@field [1] double
  ---@field [2] double

---@shape MapSettings
  ---@field pollution PollutionMapSettings
  ---@field enemy_evolution EnemyEvolutionMapSettings
  ---@field enemy_expansion EnemyExpansionMapSettings
  ---@field unit_group UnitGroupMapSettings
  ---@field steering SteeringMapSettings
  ---@field path_finder PathFinderMapSettings
  ---@field max_failed_behavior_count uint @If a behavior fails this many times, the enemy (or enemy group) is destroyed. This solves biters getting stuck within their own base.

---@shape MapViewSettings
  ---@field ["show-logistic-network"] boolean|nil @nilable
  ---@field ["show-electric-network"] boolean|nil @nilable
  ---@field ["show-turret-range"] boolean|nil @nilable
  ---@field ["show-pollution"] boolean|nil @nilable
  ---@field ["show-train-station-names"] boolean|nil @nilable
  ---@field ["show-player-names"] boolean|nil @nilable
  ---@field ["show-networkless-logistic-members"] boolean|nil @nilable
  ---@field ["show-non-standard-map-info"] boolean|nil @nilable

---@shape ModChangeData
  ---@field old_version string @Old version of the mod. May be `nil` if the mod wasn't previously present (i.e. it was just added).
  ---@field new_version string @New version of the mod. May be `nil` if the mod is no longer present (i.e. it was just removed).

---@shape ModSetting
  ---@field value int | double | boolean | string @The value of the mod setting. The type depends on the kind of setting.

---@shape ModSettingPrototypeFilter
  ---@field filter string @The condition to filter on. One of `"type"`, `"mod"`, `"setting-type"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field type string | string[] @type; The prototype type, or a list of acceptable types.
  ---@field mod string @mod; The mod name
  ---@field type string @setting-type; The setting scope type (`"startup"`, `"runtime-global"`, or `"runtime-per-user"`)

---@shape ModuleEffectValue
  ---@field bonus float @The percentual increase of the attribute. A value of `0.6` means a 60% increase.

---@shape ModuleEffects
  ---@field consumption ModuleEffectValue|nil @nilable
  ---@field speed ModuleEffectValue|nil @nilable
  ---@field productivity ModuleEffectValue|nil @nilable
  ---@field pollution ModuleEffectValue|nil @nilable

---@shape NoiseExpression
  ---@field type string @Names the type of the expression and determines what other fields are required.

---@shape NthTickEventData
  ---@field tick uint @The tick during which the event happened.
  ---@field nth_tick uint @The nth tick this handler was registered to.

---@shape Offer
  ---@field price Ingredient[] @List of prices.
  ---@field offer TechnologyModifier @The action that will take place when a player accepts the offer. Usually a `"give-item"` modifier.

---@shape OldTileAndPosition
  ---@field old_tile LuaTilePrototype
  ---@field position TilePosition

---@shape PathFinderMapSettings
  ---@field fwd2bwd_ratio uint @The pathfinder performs a step of the backward search every `fwd2bwd_ratio`'th step. The minimum allowed value is `2`, which means symmetric search. The default value is `5`.
  ---@field goal_pressure_ratio double @When looking at which node to check next, their heuristic value is multiplied by this ratio. The higher it is, the more the search is directed straight at the goal. Defaults to `2`.
  ---@field max_steps_worked_per_tick double @The maximum number of nodes that are expanded per tick. Defaults to `1,000`.
  ---@field max_work_done_per_tick uint @The maximum amount of work each pathfinding job is allowed to do per tick. Defaults to `8,000`.
  ---@field use_path_cache boolean @Whether to cache paths at all. Defaults to `true`.
  ---@field short_cache_size uint @Number of elements in the short cache. Defaults to `5`.
  ---@field long_cache_size uint @Number of elements in the long cache. Defaults to `25`.
  ---@field short_cache_min_cacheable_distance double @The minimal distance to the goal in tiles required to be searched in the short path cache. Defaults to `10`.
  ---@field short_cache_min_algo_steps_to_cache uint @The minimal number of nodes required to be searched in the short path cache. Defaults to `50`.
  ---@field long_cache_min_cacheable_distance double @The minimal distance to the goal in tiles required to be searched in the long path cache. Defaults to `30`.
  ---@field cache_max_connect_to_cache_steps_multiplier uint @When looking for a connection to a cached path, search at most for this number of steps times the original estimate. Defaults to `100`.
  ---@field cache_accept_path_start_distance_ratio double @When looking for a path from cache, make sure it doesn't start too far from the requested start in relative terms. Defaults to `0.2`.
  ---@field cache_accept_path_end_distance_ratio double @When looking for a path from cache, make sure it doesn't end too far from the requested end in relative terms. This is typically more lenient than the start ratio since the end target could be moving. Defaults to `0.15`.
  ---@field negative_cache_accept_path_start_distance_ratio double @Same principle as `cache_accept_path_start_distance_ratio`, but used for negative cache queries. Defaults to `0.3`.
  ---@field negative_cache_accept_path_end_distance_ratio double @Same principle as `cache_accept_path_end_distance_ratio`, but used for negative cache queries. Defaults to `0.3`.
  ---@field cache_path_start_distance_rating_multiplier double @When assigning a rating to the best path, this multiplier times start distances is considered. Defaults to `10`.
  ---@field cache_path_end_distance_rating_multiplier double @When assigning a rating to the best path, this multiplier times end distances is considered. This value is typically higher than the start multiplier as this results in better end path quality. Defaults to `20`.
  ---@field stale_enemy_with_same_destination_collision_penalty double @A penalty that is applied for another unit that is on the way to the goal. This is mainly relevant for situations where a group of units has arrived at the target they are supposed to attack, making units further back circle around to reach the target. Defaults to `30`.
  ---@field ignore_moving_enemy_collision_distance double @The distance in tiles after which other moving units are not considered for pathfinding. Defaults to `5`.
  ---@field enemy_with_different_destination_collision_penalty double @A penalty that is applied for another unit that is too close and either not moving or has a different goal. Defaults to `30`.
  ---@field general_entity_collision_penalty double @The general collision penalty with other units. Defaults to `10`.
  ---@field general_entity_subsequent_collision_penalty double @The collision penalty for positions that require the destruction of an entity to get to. Defaults to `3`.
  ---@field extended_collision_penalty double @The collision penalty for collisions in the extended bounding box but outside the entity's actual bounding box. Defaults to `3`.
  ---@field max_clients_to_accept_any_new_request uint @The amount of path finder requests accepted per tick regardless of the requested path's length. Defaults to `10`.
  ---@field max_clients_to_accept_short_new_request uint @When the `max_clients_to_accept_any_new_request` amount is exhausted, only path finder requests with a short estimate will be accepted until this amount (per tick) is reached. Defaults to `100`.
  ---@field direct_distance_to_consider_short_request uint @The maximum direct distance in tiles before a request is no longer considered short. Defaults to `100`.
  ---@field short_request_max_steps uint @The maximum amount of nodes a short request will traverse before being rescheduled as a long request. Defaults to `1000`.
  ---@field short_request_ratio double @The amount of steps that are allocated to short requests each tick, as a percentage of all available steps. Defaults to `0.5`, or 50%.
  ---@field min_steps_to_check_path_find_termination uint @The minimum amount of steps that are guaranteed to be performed for every request. Defaults to `2000`.
  ---@field start_to_goal_cost_multiplier_to_terminate_path_find double @If the actual amount of steps is higher than the initial estimate by this factor, pathfinding is terminated. Defaults to `2000.0`.
  ---@field overload_levels uint[] @The thresholds of waiting clients after each of which the per-tick work limit will be increased by the corresponding value in `overload_multipliers`. This is to avoid clients having to wait too long. Must have the same number of elements as `overload_multipliers`. Defaults to `{0, 100, 500}`.
  ---@field overload_multipliers double[] @The multipliers to the amount of per-tick work applied after the corresponding thresholds in `overload_levels` have been reached. Must have the same number of elements as `overload_multipliers`. Defaults to `{2, 3, 4}`.
  ---@field negative_path_cache_delay_interval uint @The delay in ticks between decrementing the score of all paths in the negative cache by one. Defaults to `20`.

---@shape PathfinderFlags
  ---@field allow_destroy_friendly_entities boolean|nil @nilable; Allows pathing through friendly entities. Defaults to `false`.
  ---@field allow_paths_through_own_entities boolean|nil @nilable; Allows the pathfinder to path through entities of the same force. Defaults to `false`.
  ---@field cache boolean|nil @nilable; Enables path caching. This can be more efficient, but might fail to respond to changes in the environment. Defaults to `true`.
  ---@field prefer_straight_paths boolean|nil @nilable; Makes the pathfinder try to path in straight lines. Defaults to `false`.
  ---@field low_priority boolean|nil @nilable; Sets lower priority on the path request, meaning it might take longer to find a path at the expense of speeding up others. Defaults to `false`.
  ---@field no_break boolean|nil @nilable; Makes the pathfinder not break in the middle of processing this pathfind, no matter how much work is needed. Defaults to `false`.

---@shape PathfinderWaypoint
  ---@field position MapPosition @The position of the waypoint on its surface.
  ---@field needs_destroy_to_reach boolean @`true` if the path from the previous waypoint to this one goes through an entity that must be destroyed.

---@shape PlaceAsTileResult
  ---@field result LuaTilePrototype @The tile prototype.
  ---@field condition_size uint
  ---@field condition CollisionMask

---@shape PollutionMapSettings
  ---@field enabled boolean @Whether pollution is enabled at all.
  ---@field diffusion_ratio double @The amount that is diffused to a neighboring chunk (possibly repeated for other directions as well). Defaults to `0.02`.
  ---@field min_to_diffuse double @The amount of PUs that need to be in a chunk for it to start diffusing. Defaults to `15`.
  ---@field ageing double @The amount of pollution eaten by a chunk's tiles as a percentage of 1. Defaults to `1`.
  ---@field expected_max_per_chunk double @Any amount of pollution larger than this value is visualized as this value instead. Defaults to `150`.
  ---@field min_to_show_per_chunk double @Any amount of pollution smaller than this value (but bigger than zero) is visualized as this value instead. Defaults to `50`.
  ---@field min_pollution_to_damage_trees double @Defaults to `60`.
  ---@field pollution_with_max_forest_damage double @Defaults to `150`.
  ---@field pollution_per_tree_damage double @Defaults to `50`.
  ---@field pollution_restored_per_tree_damage double @Defaults to `10`.
  ---@field max_pollution_to_restore_trees double @Defaults to `20`.
  ---@field enemy_attack_pollution_consumption_modifier double @Defaults to `1`.

---@shape Product
  ---@field type string @`"item"` or `"fluid"`.
  ---@field name string @Prototype name of the result.
  ---@field amount double|nil @nilable; Amount of the item or fluid to give. If not specified, `amount_min`, `amount_max` and `probability` must all be specified.
  ---@field amount_min (uint | double)|nil @nilable; Minimal amount of the item or fluid to give. Has no effect when `amount` is specified.
  ---@field amount_max (uint | double)|nil @nilable; Maximum amount of the item or fluid to give. Has no effect when `amount` is specified.
  ---@field probability double|nil @nilable; A value in range [0, 1]. Item or fluid is only given with this probability; otherwise no product is produced.
  ---@field catalyst_amount (uint | double)|nil @nilable; How much of this product is a catalyst.
  ---@field temperature double|nil @nilable; fluid; The fluid temperature of this product.

---@shape ProgrammableSpeakerAlertParameters
  ---@field show_alert boolean
  ---@field show_on_map boolean
  ---@field icon_signal_id SignalID
  ---@field alert_message string

---@shape ProgrammableSpeakerCircuitParameters
  ---@field signal_value_is_pitch boolean
  ---@field instrument_id uint
  ---@field note_id uint

---@shape ProgrammableSpeakerInstrument
  ---@field name string
  ---@field notes string[]

---@shape ProgrammableSpeakerParameters
  ---@field playback_volume double
  ---@field playback_globally boolean
  ---@field allow_polyphony boolean

---@shape RecipePrototypeFilter
  ---@field filter string @The condition to filter on. One of `"enabled"`, `"hidden"`, `"hidden-from-flow-stats"`, `"hidden-from-player-crafting"`, `"allow-as-intermediate"`, `"allow-intermediates"`, `"allow-decomposition"`, `"always-show-made-in"`, `"always-show-products"`, `"show-amount-in-title"`, `"has-ingredients"`, `"has-products"`, `"has-ingredient-item"`, `"has-ingredient-fluid"`, `"has-product-item"`, `"has-product-fluid"`, `"subgroup"`, `"category"`, `"energy"`, `"emissions-multiplier"`, `"request-paste-multiplier"`, `"overload-multiplier"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field elem_filters ItemPrototypeFilter[]|nil @nilable; has-ingredient-item; Matches if at least 1 ingredient is an item that matches these filters.
  ---@field elem_filters FluidPrototypeFilter[]|nil @nilable; has-ingredient-fluid; Matches if at least 1 ingredient is a fluid that matches these filters.
  ---@field elem_filters ItemPrototypeFilter[]|nil @nilable; has-product-item; Matches if at least 1 product is an item that matches these filters.
  ---@field elem_filters FluidPrototypeFilter[]|nil @nilable; has-product-fluid; Matches if at least 1 product is a fluid that matches these filters.
  ---@field subgroup string @subgroup; A [LuaGroup](LuaGroup) (subgroup) name
  ---@field category string @category; A [LuaRecipeCategoryPrototype](LuaRecipeCategoryPrototype) name
  ---@field comparison ComparatorString @energy
  ---@field value double @energy; The value to compare against.
  ---@field comparison ComparatorString @emissions-multiplier
  ---@field value double @emissions-multiplier; The value to compare against.
  ---@field comparison ComparatorString @request-paste-multiplier
  ---@field value uint @request-paste-multiplier; The value to compare against.
  ---@field comparison ComparatorString @overload-multiplier
  ---@field value uint @overload-multiplier; The value to compare against.

---@shape Resistance
  ---@field decrease float @Absolute damage decrease
  ---@field percent float @Percentual damage decrease

---@shape RidingState
  ---@field acceleration defines__riding__acceleration
  ---@field direction defines__riding__direction

---@shape ScriptArea
  ---@field area BoundingBox
  ---@field name string
  ---@field color Color
  ---@field id uint

---@shape ScriptPosition
  ---@field position MapPosition
  ---@field name string
  ---@field color Color
  ---@field id uint

---@shape ScriptRenderTarget
  ---@field entity LuaEntity|nil @nilable
  ---@field entity_offset Vector|nil @nilable
  ---@field position MapPosition|nil @nilable

---@shape ScriptRenderVertexTarget
  ---@field target MapPosition | LuaEntity
  ---@field target_offset Vector|nil @nilable; Only used if `target` is a LuaEntity.

---@shape SelectedPrototypeData
  ---@field base_type string @E.g. `"entity"`.
  ---@field derived_type string @E.g. `"tree"`.
  ---@field name string @E.g. `"tree-05"`.

---@shape Signal
  ---@field signal SignalID @ID of the signal.
  ---@field count int @Value of the signal.

---@shape SignalID
  ---@field type string @`"item"`, `"fluid"`, or `"virtual"`.
  ---@field name string|nil @nilable; Name of the item, fluid or virtual signal.

---@shape SmokeSource
  ---@field name string
  ---@field frequency double
  ---@field offset double
  ---@field position Vector|nil @nilable
  ---@field north_position Vector|nil @nilable
  ---@field east_position Vector|nil @nilable
  ---@field south_position Vector|nil @nilable
  ---@field west_position Vector|nil @nilable
  ---@field deviation MapPosition|nil @nilable
  ---@field starting_frame_speed uint16
  ---@field starting_frame_speed_deviation double
  ---@field starting_frame uint16
  ---@field starting_frame_deviation double
  ---@field slow_down_factor uint8
  ---@field height float
  ---@field height_deviation float
  ---@field starting_vertical_speed float
  ---@field starting_vertical_speed_deviation float
  ---@field vertical_speed_slowdown float

---@shape SpawnPointDefinition
  ---@field evolution_factor double @Evolution factor for which this weight applies.
  ---@field weight double @Probability of spawning this unit at this evolution factor.

---@shape SteeringMapSetting
  ---@field radius double @Does not include the radius of the unit.
  ---@field separation_factor double
  ---@field separation_force double
  ---@field force_unit_fuzzy_goto_behavior boolean @Used to make steering look better for aesthetic purposes.

---@shape SteeringMapSettings
  ---@field default SteeringMapSetting
  ---@field moving SteeringMapSetting

---@shape TabAndContent
  ---@field tab LuaGuiElement
  ---@field content LuaGuiElement

---@shape TechnologyModifier
  ---@field type string @Modifier type. Specifies which of the other fields will be available. Possible values are: `"inserter-stack-size-bonus"`, `"stack-inserter-capacity-bonus"`, `"laboratory-speed"`, `"character-logistic-trash-slots"`, `"maximum-following-robots-count"`, `"worker-robot-speed"`, `"worker-robot-storage"`, `"ghost-time-to-live"`, `"turret-attack"`, `"ammo-damage"`, `"give-item"`, `"gun-speed"`, `"unlock-recipe"`, `"character-crafting-speed"`, `"character-mining-speed"`, `"character-running-speed"`, `"character-build-distance"`, `"character-item-drop-distance"`, `"character-reach-distance"`, `"character-resource-reach-distance"`, `"character-item-pickup-distance"`, `"character-loot-pickup-distance"`, `"character-inventory-slots-bonus"`, `"deconstruction-time-to-live"`, `"max-failed-attempts-per-tick-per-construction-queue"`, `"max-successful-attempts-per-tick-per-construction-queue"`, `"character-health-bonus"`, `"mining-drill-productivity-bonus"`, `"train-braking-force-bonus"`, `"zoom-to-world-enabled"`, `"zoom-to-world-ghost-building-enabled"`, `"zoom-to-world-blueprint-enabled"`, `"zoom-to-world-deconstruction-planner-enabled"`, `"zoom-to-world-upgrade-planner-enabled"`, `"zoom-to-world-selection-tool-enabled"`, `"worker-robot-battery"`, `"laboratory-productivity"`, `"follower-robot-lifetime"`, `"artillery-range"`, `"nothing"`, `"character-additional-mining-categories"`, `"character-logistic-requests"`.
  ---@field ammo_category string @gun-speed; Prototype name of the ammunition category that is affected
  ---@field modifier double @gun-speed; Modification value. This will be added to the current gun speed modifier upon researching.
  ---@field ammo_category string @ammo-damage; Prototype name of the ammunition category that is affected
  ---@field modifier double @ammo-damage; Modification value. This will be added to the current ammo damage modifier upon researching.
  ---@field item string @give-item; Item prototype name to give.
  ---@field count uint|nil @nilable; give-item; Number of items to give. Defaults to `1`.
  ---@field turret_id string @turret-attack; Turret prototype name this modifier will affect.
  ---@field modifier double @turret-attack; Modification value. This will be added to the current turret damage modifier upon researching.
  ---@field recipe string @unlock-recipe; Recipe prototype name to unlock.
  ---@field effect_description LocalisedString @nothing; Description of this nothing modifier.
  ---@field modifier double @Other types; Modification value. This value will be added to the variable it modifies.

---@shape TechnologyPrototypeFilter
  ---@field filter string @The condition to filter on. One of `"enabled"`, `"hidden"`, `"upgrade"`, `"visible-when-disabled"`, `"has-effects"`, `"has-prerequisites"`, `"research-unit-ingredient"`, `"level"`, `"max-level"`, `"time"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field ingredient string @research-unit-ingredient; The research ingredient to check.
  ---@field comparison ComparatorString @level
  ---@field value uint @level; The value to compare against.
  ---@field comparison ComparatorString @max-level
  ---@field value uint @max-level; The value to compare against.
  ---@field comparison ComparatorString @time
  ---@field value uint @time; The value to compare against.

---@shape Tile
  ---@field position TilePosition @The position of the tile.
  ---@field name string @The prototype name of the tile.

---@shape _TilePosition1
  ---@field x int
  ---@field y int

---@shape _TilePosition2
  ---@field [1] int
  ---@field [2] int

---@shape TilePrototypeFilter
  ---@field filter string @The condition to filter on. One of `"minable"`, `"autoplace"`, `"blueprintable"`, `"item-to-place"`, `"collision-mask"`, `"walking-speed-modifier"`, `"vehicle-friction-modifier"`, `"decorative-removal-probability"`, `"emissions"`.
  ---@field mode string|nil @nilable; How to combine this with the previous filter. Must be `"or"` or `"and"`. Defaults to `"or"`. When evaluating the filters, `"and"` has higher precedence than `"or"`.
  ---@field invert boolean|nil @nilable; Inverts the condition. Default is `false`.
  ---@field mask CollisionMask | CollisionMaskWithFlags @collision-mask
  ---@field mask_mode string @collision-mask; How to filter: `"collides"`, `"layers-equals"`, `"contains-any"` or `"contains-all"`
  ---@field comparison ComparatorString @walking-speed-modifier
  ---@field value double @walking-speed-modifier; The value to compare against.
  ---@field comparison ComparatorString @vehicle-friction-modifier
  ---@field value double @vehicle-friction-modifier; The value to compare against.
  ---@field comparison ComparatorString @decorative-removal-probability
  ---@field value float @decorative-removal-probability; The value to compare against.
  ---@field comparison ComparatorString @emissions
  ---@field value double @emissions; The value to compare against.

---@shape TrainSchedule
  ---@field current uint @Index of the currently active record
  ---@field records TrainScheduleRecord[]

---@shape TrainScheduleRecord
  ---@field station string|nil @nilable; Name of the station.
  ---@field rail LuaEntity|nil @nilable; Rail to path to. Ignored if `station` is present.
  ---@field rail_direction defines__rail_direction|nil @nilable; When a train is allowed to reach rail target from any direction it will be `nil`. If rail has to be reached from specific direction, this value allows to choose the direction. This value corresponds to [LuaEntity::connected_rail_direction](LuaEntity::connected_rail_direction) of a TrainStop.
  ---@field wait_conditions WaitCondition[]|nil @nilable
  ---@field temporary boolean|nil @nilable; Only present when the station is temporary, the value is then always `true`.

---@shape TriggerDelivery
  ---@field type string @One of `"instant"`, `"projectile"`, `"flame-thrower"`, `"beam"`, `"stream"`, `"artillery"`.
  ---@field source_effects TriggerEffectItem[]
  ---@field target_effects TriggerEffectItem[]

---@shape TriggerEffectItem
  ---@field type string @One of`"damage"`, `"create-entity"`, `"create-explosion"`, `"create-fire"`, `"create-smoke"`, `"create-trivial-smoke"`, `"create-particle"`, `"create-sticker"`, `"nested-result"`, `"play-sound"`, `"push-back"`, `"destroy-cliffs"`, `"show-explosion-on-chart"`, `"insert-item"`, `"script"`.
  ---@field repeat_count uint
  ---@field affects_target boolean
  ---@field show_in_tooltip boolean

---@shape TriggerItem
  ---@field type string @One of `"direct"`, `"area"`, `"line"`, `"cluster"`.
  ---@field action_delivery TriggerDelivery[]|nil @nilable
  ---@field entity_flags EntityPrototypeFlags|nil @nilable; The trigger will only affect entities that contain any of these flags.
  ---@field ignore_collision_condition boolean
  ---@field collision_mask CollisionMask @The trigger will only affect entities that would collide with given collision mask.
  ---@field trigger_target_mask TriggerTargetMask
  ---@field force ForceCondition @If `"enemy"`, the trigger will only affect entities whose force is different from the attacker's and for which there is no cease-fire set. `"ally"` is the opposite of `"enemy"`.
  ---@field repeat_count uint

---@shape UnitGroupMapSettings
  ---@field min_group_gathering_time uint @The minimum amount of time in ticks a group will spend gathering before setting off. The actual time is a random time between the minimum and maximum times. Defaults to `3,600` ticks.
  ---@field max_group_gathering_time uint @The maximum amount of time in ticks a group will spend gathering before setting off. The actual time is a random time between the minimum and maximum times. Defaults to `10*3,600=36,000` ticks.
  ---@field max_wait_time_for_late_members uint @After gathering has finished, the group is allowed to wait this long in ticks for delayed members. New members are not accepted anymore however. Defaults to `2*3,600=7,200` ticks.
  ---@field min_group_radius double @The minimum group radius in tiles. The actual radius is adjusted based on the number of members. Defaults to `5.0`.
  ---@field max_group_radius double @The maximum group radius in tiles. The actual radius is adjusted based on the number of members. Defaults to `30.0`.
  ---@field max_member_speedup_when_behind double @The maximum speed a percentage of its regular speed that a group member can speed up to when catching up with the group. Defaults to `1.4`, or 140%.
  ---@field max_member_slowdown_when_ahead double @The minimum speed a percentage of its regular speed that a group member can slow down to when ahead of the group. Defaults to `0.6`, or 60%.
  ---@field max_group_slowdown_factor double @The minimum speed as a percentage of its maximum speed that a group will slow down to so members that fell behind can catch up. Defaults to `0.3`, or 30%.
  ---@field max_group_member_fallback_factor double @When a member of a group falls back more than this factor times the group radius, the group will slow down to its `max_group_slowdown_factor` speed to let them catch up. Defaults to `3`.
  ---@field member_disown_distance double @When a member of a group falls back more than this factor times the group radius, it will be dropped from the group. Defaults to `10`.
  ---@field tick_tolerance_when_member_arrives uint
  ---@field max_gathering_unit_groups uint @The maximum number of automatically created unit groups gathering for attack at any time. Defaults to `30`.
  ---@field max_unit_group_size uint @The maximum number of members for an attack unit group. This only affects automatically created unit groups, manual groups created through the API are unaffected. Defaults to `200`.

---@shape UnitSpawnDefinition
  ---@field unit string @Prototype name of the unit that would be spawned.
  ---@field spawn_points SpawnPointDefinition[] @The points at which to spawn the unit.

---@shape UpgradeFilter
  ---@field type string @`"item"`, or `"entity"`.
  ---@field name string|nil @nilable; Name of the item, or entity.

---@shape _Vector1
  ---@field x float
  ---@field y float

---@shape _Vector2
  ---@field [1] float
  ---@field [2] float

---@shape VehicleAutomaticTargetingParameters
  ---@field auto_target_without_gunner boolean
  ---@field auto_target_with_gunner boolean

---@shape WaitCondition
  ---@field type string @One of `"time"`, `"inactivity"`, `"full"`, `"empty"`, `"item_count"`, `"circuit"`, `"robots_inactive"`, `"fluid_count"`, `"passenger_present"`, `"passenger_not_present"`.
  ---@field compare_type string @Either `"and"`, or `"or"`. Tells how this condition is to be compared with the preceding conditions in the corresponding `wait_conditions` array.
  ---@field ticks uint|nil @nilable; Number of ticks to wait when `type` is `"time"`, or number of ticks of inactivity when `type` is `"inactivity"`.
  ---@field condition CircuitCondition|nil @nilable; Only present when `type` is `"item_count"`, `"circuit"` or `"fluid_count"`, and a circuit condition is configured.

---@shape WireConnectionDefinition
  ---@field wire defines__wire_type @Wire color, either [defines.wire_type.red](defines.wire_type.red) or [defines.wire_type.green](defines.wire_type.green).
  ---@field target_entity LuaEntity @The entity to (dis)connect the source entity with.
  ---@field source_circuit_id defines__circuit_connector_id|nil @nilable; Mandatory if the source entity has more than one circuit connection using circuit wire.
  ---@field target_circuit_id defines__circuit_connector_id|nil @nilable; Mandatory if the target entity has more than one circuit connection using circuit wire.
  ---@field source_wire_id defines__circuit_connector_id|nil @nilable; Mandatory if the source entity has more than one wire connection using copper wire.
  ---@field target_wire_id defines__circuit_connector_id|nil @nilable; Mandatory if the target entity has more than one wire connection using copper wire.

---@shape _table1
  ---@field is_simulation boolean|nil @nilable; Is this level a simulation? (The main menu and 'Tips and tricks' use simulations)
  ---@field is_tutorial boolean|nil @nilable; Is this level a tutorial?
  ---@field campaign_name string|nil @nilable; The campaign name if any.
  ---@field level_name string @The level name.
  ---@field mod_name string|nil @nilable; The mod name if any.

---@shape _table2
  ---@field minimum_intensity float
  ---@field maximum_intensity float
  ---@field derivation_change_frequency float
  ---@field derivation_change_deviation float
  ---@field border_fix_speed float
  ---@field minimum_light_size float
  ---@field light_intensity_to_size_coefficient float
  ---@field color Color

---@shape _table3
  ---@field mining boolean @Whether the player is mining at all
  ---@field position MapPosition|nil @nilable; What tiles the player is mining; only used when the player is mining tiles (holding a tile in the cursor).

---@shape _table4
  ---@field repairing boolean @The current state
  ---@field position MapPosition @The position being repaired

---@shape _table5
  ---@field state defines__shooting @The current state
  ---@field position MapPosition @The position being shot at

---@shape _table6
  ---@field walking boolean @If `false`, the player is currently not walking; otherwise it's going somewhere
  ---@field direction defines__direction @Direction where the player is walking

---@shape _table7
  ---@field red LuaEntity[] @Entities connected via the red wire.
  ---@field green LuaEntity[] @Entities connected via the green wire.

---@shape _table8
  ---@field smoke_name string
  ---@field offsets Vector[]
  ---@field offset_deviation BoundingBox
  ---@field initial_height float
  ---@field max_radius float|nil @nilable
  ---@field speed Vector
  ---@field speed_multiplier float
  ---@field speed_multiplier_deviation float
  ---@field starting_frame float
  ---@field starting_frame_deviation float
  ---@field starting_frame_speed float
  ---@field starting_frame_speed_deviation float
  ---@field speed_from_center float
  ---@field speed_from_center_deviation float

---@shape _table9
  ---@field spawn_and_station_height float
  ---@field spawn_and_station_shadow_height_offset float
  ---@field charge_approach_distance float
  ---@field logistic_radius float
  ---@field construction_radius float
  ---@field charging_station_count uint
  ---@field charging_distance float
  ---@field charging_station_shift Vector
  ---@field charging_energy double
  ---@field charging_threshold_distance float
  ---@field robot_vertical_acceleration float
  ---@field stationing_offset Vector
  ---@field robot_limit uint
  ---@field logistics_connection_distance float
  ---@field robots_shrink_when_entering_and_exiting boolean

---@shape _table10
  ---@field minable boolean @Is this entity mineable at all?
  ---@field mining_time double @Energy required to mine an entity.
  ---@field mining_particle string|nil @nilable; Prototype name of the particle produced when mining this entity. Will only be present if this entity produces any particle during mining.
  ---@field products Product[]|nil @nilable; Products obtained by mining this entity.
  ---@field fluid_amount double|nil @nilable; The required fluid amount if any.
  ---@field required_fluid string|nil @nilable; The prototype name of the required fluid if any.
  ---@field mining_trigger TriggerItem[]|nil @nilable; The mining trigger if any.

---@shape _table11
  ---@field min double
  ---@field max double

---@shape _table12
  ---@field width uint
  ---@field height uint

---@shape _table13
  ---@field spawn_and_station_height float
  ---@field spawn_and_station_shadow_height_offset float
  ---@field charge_approach_distance float
  ---@field logistic_radius float
  ---@field construction_radius float
  ---@field charging_station_count uint
  ---@field charging_distance float
  ---@field charging_station_shift Vector
  ---@field charging_energy double
  ---@field charging_threshold_distance float
  ---@field robot_vertical_acceleration float
  ---@field stationing_offset Vector
  ---@field robot_limit uint
  ---@field logistics_connection_distance float
  ---@field robots_shrink_when_entering_and_exiting boolean

---@shape _table14
  ---@field width uint
  ---@field height uint
  ---@field points EquipmentPoint[]|nil @nilable; Only set when the shape is "manual"

---@shape _table15
  ---@field minable boolean @Is this tile mineable at all?
  ---@field mining_time double @Energy required to mine a tile.
  ---@field mining_particle string|nil @nilable; Prototype name of the particle produced when mining this tile. Will only be present if this tile produces any particle during mining.
  ---@field products Product[] @Products obtained by mining this tile.

