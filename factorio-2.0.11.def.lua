-- Generated lua defines of Factorio api
-- https://github.com/dvilker/factorio-api-lua-defs

---@alias true true
---@alias tuple {}
---@alias BlueprintControlBehavior userdata
--- defines

defines = {
  alert_type = {
    collector_path_blocked = 0,
    custom = 1,
    entity_destroyed = 2,
    entity_under_attack = 3,
    no_material_for_construction = 4,
    no_platform_storage = 5,
    no_roboport_storage = 6,
    no_storage = 7,
    not_enough_construction_robots = 8,
    not_enough_repair_packs = 9,
    pipeline_overextended = 10,
    platform_tile_building_blocked = 11,
    train_no_path = 12,
    train_out_of_fuel = 13,
    turret_fire = 14,
    turret_out_of_ammo = 15,
    unclaimed_cargo = 16,
  },
  --- AI command exit status. See [LuaEntity::set_command](runtime:LuaEntity::set_command)
  behavior_result = {
    deleted = 3,
    fail = 1,
    in_progress = 0,
    success = 2,
  },
  build_check_type = {
    blueprint_ghost = 4,
    ghost_revive = 5,
    manual = 1,
    manual_ghost = 2,
    script = 0,
    script_ghost = 3,
  },
  build_mode = {
    forced = 1,
    normal = 0,
    superforced = 2,
  },
  --- State of a chain signal.
  chain_signal_state = {
    all_open = 1,
    none = 0,
    none_open = 3,
    partially_open = 2,
  },
  chunk_generated_status = {
    basic_tiles = 2,
    corrected_tiles = 3,
    custom_tiles = 1,
    entities = 5,
    nothing = 0,
    tiles = 4,
  },
  --- Command given to units describing what they should do.
  command = {
    --- Attack another entity.
    attack = 0,
    --- Go to a place and attack what you see.
    attack_area = 4,
    --- Go to a position and build a base there.
    build_base = 8,
    --- Chain commands together, see [defines.compound_command](runtime:defines.compound_command).
    compound = 2,
    --- Flee from another entity.
    flee = 6,
    --- Go to a specific position.
    go_to_location = 1,
    --- Do what your group wants you to do.
    group = 3,
    --- Stop moving and stay where you are.
    stop = 7,
    --- Chill.
    wander = 5,
  },
  --- How commands are joined together in a compound command (see [defines.command.compound](runtime:defines.command.compound)).
  compound_command = {
    --- Fail on first failure. Only succeeds if all commands (executed one after another) succeed.
    logical_and = 0,
    --- Succeed on first success. Only fails if all commands (executed one after another) fail.
    logical_or = 1,
    --- Execute all commands in sequence and fail or succeed depending on the return status of the last command.
    return_last = 2,
  },
  control_behavior = {
    cargo_landing_pad = {
      exclusive_mode = {
        none = 0,
        send_contents = 1,
        set_requests = 2,
      },
    },
    inserter = {
      hand_read_mode = {
        hold = 0,
        pulse = 1,
      },
    },
    lamp = {
      color_mode = {
        color_mapping = 0,
        components = 1,
        packed_rgb = 2,
      },
    },
    logistic_container = {
      exclusive_mode = {
        none = 2,
        send_contents = 0,
        set_requests = 1,
      },
    },
    mining_drill = {
      resource_read_mode = {
        entire_patch = 1,
        this_miner = 0,
      },
    },
    roboport = {
      read_items_mode = {
        logistics = 1,
        missing_requests = 2,
        none = 0,
      },
    },
    rocket_silo = {
      read_mode = {
        logistic_inventory = 1,
        none = 0,
        orbital_requests = 2,
      },
    },
    transport_belt = {
      content_read_mode = {
        entire_belt_hold = 2,
        hold = 1,
        pulse = 0,
      },
    },
    type = {
      --- [LuaAccumulatorControlBehavior](runtime:LuaAccumulatorControlBehavior)
      accumulator = 12,
      --- [LuaAgriculturalTowerControlBehavior](runtime:LuaAgriculturalTowerControlBehavior)
      agricultural_tower = 31,
      --- [LuaArithmeticCombinatorControlBehavior](runtime:LuaArithmeticCombinatorControlBehavior)
      arithmetic_combinator = 9,
      --- [LuaArtilleryTurretControlBehavior](runtime:LuaArtilleryTurretControlBehavior)
      artillery_turret = 25,
      --- [LuaAssemblingMachineControlBehavior](runtime:LuaAssemblingMachineControlBehavior)
      assembling_machine = 18,
      --- [LuaAsteroidCollectorControlBehavior](runtime:LuaAsteroidCollectorControlBehavior)
      asteroid_collector = 26,
      --- [LuaCargoLandingPadControlBehavior](runtime:LuaCargoLandingPadControlBehavior)
      cargo_landing_pad = 30,
      --- [LuaConstantCombinatorControlBehavior](runtime:LuaConstantCombinatorControlBehavior)
      constant_combinator = 10,
      --- [LuaContainerControlBehavior](runtime:LuaContainerControlBehavior)
      container = 0,
      --- [LuaDeciderCombinatorControlBehavior](runtime:LuaDeciderCombinatorControlBehavior)
      decider_combinator = 8,
      --- [LuaDisplayPanelControlBehavior](runtime:LuaDisplayPanelControlBehavior)
      display_panel = 28,
      --- [LuaGenericOnOffControlBehavior](runtime:LuaGenericOnOffControlBehavior)
      generic_on_off = 1,
      --- [LuaInserterControlBehavior](runtime:LuaInserterControlBehavior)
      inserter = 2,
      --- [LuaLampControlBehavior](runtime:LuaLampControlBehavior)
      lamp = 3,
      --- [LuaLoaderControlBehavior](runtime:LuaLoaderControlBehavior)
      loader = 29,
      --- [LuaLogisticContainerControlBehavior](runtime:LuaLogisticContainerControlBehavior)
      logistic_container = 4,
      --- [LuaMiningDrillControlBehavior](runtime:LuaMiningDrillControlBehavior)
      mining_drill = 16,
      --- [LuaProgrammableSpeakerControlBehavior](runtime:LuaProgrammableSpeakerControlBehavior)
      programmable_speaker = 17,
      --- [LuaPumpControlBehavior](runtime:LuaPumpControlBehavior)
      pump = 19,
      --- [LuaRadarControlBehavior](runtime:LuaRadarControlBehavior)
      radar = 27,
      --- [LuaRailSignalBaseControlBehavior](runtime:LuaRailSignalBaseControlBehavior)
      rail_chain_signal = 14,
      --- [LuaRailSignalBaseControlBehavior](runtime:LuaRailSignalBaseControlBehavior)
      rail_signal = 13,
      --- [LuaReactorControlBehavior](runtime:LuaReactorControlBehavior)
      reactor = 23,
      --- [LuaRoboportControlBehavior](runtime:LuaRoboportControlBehavior)
      roboport = 5,
      --- [LuaRocketSiloControlBehavior](runtime:LuaRocketSiloControlBehavior)
      rocket_silo = 21,
      --- [LuaSelectorCombinatorControlBehavior](runtime:LuaSelectorCombinatorControlBehavior)
      selector_combinator = 20,
      --- [LuaSpacePlatformHubControlBehavior](runtime:LuaSpacePlatformHubControlBehavior)
      space_platform_hub = 24,
      --- [LuaStorageTankControlBehavior](runtime:LuaStorageTankControlBehavior)
      storage_tank = 6,
      --- [LuaTrainStopControlBehavior](runtime:LuaTrainStopControlBehavior)
      train_stop = 7,
      --- [LuaTransportBeltControlBehavior](runtime:LuaTransportBeltControlBehavior)
      transport_belt = 11,
      --- [LuaTurretControlBehavior](runtime:LuaTurretControlBehavior)
      turret = 22,
      --- [LuaWallControlBehavior](runtime:LuaWallControlBehavior)
      wall = 15,
    },
  },
  controllers = {
    --- The controller controls a character. This is the default controller in freeplay.
    character = 1,
    --- The player can't interact with the world, and the camera pans around in a predefined manner.
    cutscene = 4,
    --- The Editor Controller near ultimate power to do almost anything in the game.
    editor = 3,
    --- Can't interact with the world, can only observe. Used in the multiplayer waiting-to-respawn screen.
    ghost = 0,
    --- The controller isn't tied to a character. This is the default controller in sandbox.
    god = 2,
    --- Can't move/change items but can build ghosts/change settings.
    remote = 6,
    --- Can't change anything in the world but can view anything.
    spectator = 5,
  },
  deconstruction_item = {
    entity_filter_mode = {
      blacklist = 1,
      whitelist = 0,
    },
    tile_filter_mode = {
      blacklist = 1,
      whitelist = 0,
    },
    tile_selection_mode = {
      always = 1,
      never = 2,
      normal = 0,
      only = 3,
    },
  },
  default_icon_size = {
  },
  difficulty = {
    easy = 0,
    hard = 2,
    normal = 1,
  },
  direction = {
    east = 4,
    eastnortheast = 3,
    eastsoutheast = 5,
    north = 0,
    northeast = 2,
    northnortheast = 1,
    northnorthwest = 15,
    northwest = 14,
    south = 8,
    southeast = 6,
    southsoutheast = 7,
    southsouthwest = 9,
    southwest = 10,
    west = 12,
    westnorthwest = 13,
    westsouthwest = 11,
  },
  disconnect_reason = {
    afk = 6,
    banned = 9,
    cannot_keep_up = 5,
    desync_limit_reached = 4,
    dropped = 1,
    kicked = 7,
    kicked_and_deleted = 8,
    quit = 0,
    reconnect = 2,
    switching_servers = 10,
    wrong_input = 3,
  },
  distraction = {
    --- Attack closer enemy entities, including entities "built" by player (belts, inserters, chests).
    by_anything = 2,
    --- Attack when attacked.
    by_damage = 3,
    --- Attack closer enemy entities with force.
    by_enemy = 1,
    --- Perform command even if someone attacks the unit.
    none = 0,
  },
  entity_status = {
    --- Only used if set through [LuaEntity::status](runtime:LuaEntity::status) or [ContainerPrototype::default_status](prototype:ContainerPrototype::default_status).
    broken = 3,
    --- Used by rail signals.
    cant_divide_segments = 59,
    --- Used by accumulators.
    charging = 17,
    closed_by_circuit_network = 10,
    --- Used by asteroid collectors.
    computing_navigation = 63,
    --- Used by trains.
    destination_stop_full = 48,
    --- Used by constant combinators: Combinator is turned off via switch in GUI.
    disabled = 56,
    disabled_by_control_behavior = 8,
    disabled_by_script = 11,
    --- Used by accumulators.
    discharging = 18,
    --- Used by crafting machines.
    fluid_ingredient_shortage = 28,
    frozen = 7,
    --- Used by burner energy sources.
    full_burnt_result_output = 31,
    --- Used by crafting machines, boilers, burner energy sources and reactors: Reactor/burner has full burnt result inventory, boiler has full output fluidbox.
    full_output = 29,
    --- Used by accumulators.
    fully_charged = 19,
    --- Used by ghosts.
    ghost = 2,
    --- Used by crafting machines.
    item_ingredient_shortage = 32,
    --- Used by the rocket silo.
    launching_rocket = 41,
    --- Used by boilers and fluid turrets: Boiler still has some fluid but is about to run out.
    low_input_fluid = 27,
    low_power = 5,
    --- Used by heat energy sources.
    low_temperature = 55,
    marked_for_deconstruction = 12,
    --- Used by mining drills when the mining fluid is missing.
    missing_required_fluid = 33,
    --- Used by labs.
    missing_science_packs = 34,
    --- Used by power switches.
    networks_connected = 15,
    --- Used by power switches.
    networks_disconnected = 16,
    --- Used by ammo turrets.
    no_ammo = 54,
    --- Used by filter inserters.
    no_filter = 60,
    no_fuel = 6,
    --- Used by furnaces.
    no_ingredients = 22,
    --- Used by boilers, fluid turrets and fluid energy sources: Boiler has no fluid to work with.
    no_input_fluid = 23,
    --- Used by mining drills.
    no_minable_resources = 25,
    --- Used by beacons.
    no_modules_to_transmit = 50,
    --- Used by trains and space platform hubs.
    no_path = 49,
    no_power = 4,
    --- Used by assembling machines.
    no_recipe = 21,
    --- Used by labs.
    no_research_in_progress = 24,
    --- Used by agricultural towers.
    no_spot_seedable_by_inputs = 61,
    normal = 1,
    --- Used by cargo bays.
    not_connected_to_hub_or_pad = 26,
    --- Used by rail signals.
    not_connected_to_rail = 58,
    --- Used by agricultural towers.
    not_enough_space_in_output = 30,
    --- Used by space platform hubs.
    not_enough_thrust = 47,
    --- Used by generators and solar panels.
    not_plugged_in_electric_network = 14,
    --- Used by space platform hubs.
    on_the_way = 43,
    opened_by_circuit_network = 9,
    --- Used by logistic containers.
    out_of_logistic_network = 20,
    --- Used by space platform hubs.
    paused = 13,
    --- Used by pipes, pipes to ground and storage tanks.
    pipeline_overextended = 64,
    --- Used by the rocket silo.
    preparing_rocket_for_launch = 38,
    --- Used by roboports.
    recharging_after_power_outage = 51,
    --- Used by assembling machines.
    recipe_not_researched = 65,
    --- Used by thrusters.
    thrust_not_required = 42,
    --- Used by lamps.
    turned_off_during_daytime = 57,
    --- Used by trains.
    waiting_at_stop = 45,
    --- Used by inserters when wait_for_full_hand is set.
    waiting_for_more_items = 36,
    --- Used by agricultural towers.
    waiting_for_plants_to_grow = 62,
    --- Used by space platform hubs.
    waiting_for_rockets_to_arrive = 46,
    --- Used by inserters.
    waiting_for_source_items = 35,
    --- Used by inserters and mining drills.
    waiting_for_space_in_destination = 37,
    --- Used by the rocket silo.
    waiting_for_space_in_platform_hub = 40,
    --- Used by inserters targeting entity ghosts.
    waiting_for_target_to_be_built = 52,
    --- Used by inserters targeting rails.
    waiting_for_train = 53,
    --- Used by space platform hubs.
    waiting_in_orbit = 44,
    --- Used by the rocket silo.
    waiting_to_launch_rocket = 39,
    working = 0,
  },
  entity_status_diode = {
    green = 0,
    red = 1,
    yellow = 2,
  },
  --- See the [events page](runtime:events) for more info on what events contain and when they get raised.
  events = {
    on_achievement_gained = 0,
    on_ai_command_completed = 1,
    on_area_cloned = 2,
    on_biter_base_built = 3,
    on_brush_cloned = 4,
    on_build_base_arrived = 5,
    on_built_entity = 6,
    on_cancelled_deconstruction = 7,
    on_cancelled_upgrade = 8,
    on_character_corpse_expired = 9,
    on_chart_tag_added = 10,
    on_chart_tag_modified = 11,
    on_chart_tag_removed = 12,
    on_chunk_charted = 13,
    on_chunk_deleted = 14,
    on_chunk_generated = 15,
    on_combat_robot_expired = 16,
    on_console_chat = 17,
    on_console_command = 18,
    on_cutscene_cancelled = 19,
    on_cutscene_finished = 20,
    on_cutscene_started = 21,
    on_cutscene_waypoint_reached = 22,
    on_entity_cloned = 23,
    on_entity_color_changed = 24,
    on_entity_damaged = 25,
    on_entity_died = 26,
    on_entity_logistic_slot_changed = 27,
    on_entity_renamed = 28,
    on_entity_settings_pasted = 29,
    on_entity_spawned = 30,
    on_equipment_inserted = 31,
    on_equipment_removed = 32,
    on_force_cease_fire_changed = 33,
    on_force_created = 34,
    on_force_friends_changed = 35,
    on_force_reset = 36,
    on_forces_merged = 37,
    on_forces_merging = 38,
    on_game_created_from_scenario = 39,
    on_gui_checked_state_changed = 40,
    on_gui_click = 41,
    on_gui_closed = 42,
    on_gui_confirmed = 43,
    on_gui_elem_changed = 44,
    on_gui_hover = 45,
    on_gui_leave = 46,
    on_gui_location_changed = 47,
    on_gui_opened = 48,
    on_gui_selected_tab_changed = 49,
    on_gui_selection_state_changed = 50,
    on_gui_switch_state_changed = 51,
    on_gui_text_changed = 52,
    on_gui_value_changed = 53,
    on_land_mine_armed = 54,
    on_lua_shortcut = 55,
    on_marked_for_deconstruction = 56,
    on_marked_for_upgrade = 57,
    on_market_item_purchased = 58,
    on_mod_item_opened = 59,
    on_object_destroyed = 60,
    on_permission_group_added = 61,
    on_permission_group_deleted = 62,
    on_permission_group_edited = 63,
    on_permission_string_imported = 64,
    on_picked_up_item = 65,
    on_player_alt_reverse_selected_area = 66,
    on_player_alt_selected_area = 67,
    on_player_ammo_inventory_changed = 68,
    on_player_armor_inventory_changed = 69,
    on_player_banned = 70,
    on_player_built_tile = 71,
    on_player_cancelled_crafting = 72,
    on_player_changed_force = 73,
    on_player_changed_position = 74,
    on_player_changed_surface = 75,
    on_player_cheat_mode_disabled = 76,
    on_player_cheat_mode_enabled = 77,
    on_player_clicked_gps_tag = 78,
    on_player_configured_blueprint = 79,
    on_player_controller_changed = 80,
    on_player_crafted_item = 81,
    on_player_created = 82,
    on_player_cursor_stack_changed = 83,
    on_player_deconstructed_area = 84,
    on_player_demoted = 85,
    on_player_died = 86,
    on_player_display_density_scale_changed = 87,
    on_player_display_resolution_changed = 88,
    on_player_display_scale_changed = 89,
    on_player_driving_changed_state = 90,
    on_player_dropped_item = 91,
    on_player_fast_transferred = 92,
    on_player_flipped_entity = 93,
    on_player_flushed_fluid = 94,
    on_player_gun_inventory_changed = 95,
    on_player_input_method_changed = 96,
    on_player_joined_game = 97,
    on_player_kicked = 98,
    on_player_left_game = 99,
    on_player_locale_changed = 100,
    on_player_main_inventory_changed = 101,
    on_player_mined_entity = 102,
    on_player_mined_item = 103,
    on_player_mined_tile = 104,
    on_player_muted = 105,
    on_player_pipette = 106,
    on_player_placed_equipment = 107,
    on_player_promoted = 108,
    on_player_removed = 109,
    on_player_removed_equipment = 110,
    on_player_repaired_entity = 111,
    on_player_respawned = 112,
    on_player_reverse_selected_area = 113,
    on_player_rotated_entity = 114,
    on_player_selected_area = 115,
    on_player_set_quick_bar_slot = 116,
    on_player_setup_blueprint = 117,
    on_player_toggled_alt_mode = 118,
    on_player_toggled_map_editor = 119,
    on_player_trash_inventory_changed = 120,
    on_player_unbanned = 121,
    on_player_unmuted = 122,
    on_player_used_capsule = 123,
    on_player_used_spidertron_remote = 124,
    on_post_entity_died = 125,
    on_pre_build = 126,
    on_pre_chunk_deleted = 127,
    on_pre_entity_settings_pasted = 128,
    on_pre_ghost_deconstructed = 129,
    on_pre_ghost_upgraded = 130,
    on_pre_permission_group_deleted = 131,
    on_pre_permission_string_imported = 132,
    on_pre_player_crafted_item = 133,
    on_pre_player_died = 134,
    on_pre_player_left_game = 135,
    on_pre_player_mined_item = 136,
    on_pre_player_removed = 137,
    on_pre_player_toggled_map_editor = 138,
    on_pre_robot_exploded_cliff = 139,
    on_pre_scenario_finished = 140,
    on_pre_script_inventory_resized = 141,
    on_pre_surface_cleared = 142,
    on_pre_surface_deleted = 143,
    on_redo_applied = 144,
    on_research_cancelled = 145,
    on_research_finished = 146,
    on_research_moved = 147,
    on_research_reversed = 148,
    on_research_started = 149,
    on_resource_depleted = 150,
    on_robot_built_entity = 151,
    on_robot_built_tile = 152,
    on_robot_exploded_cliff = 153,
    on_robot_mined = 154,
    on_robot_mined_entity = 155,
    on_robot_mined_tile = 156,
    on_robot_pre_mined = 157,
    on_rocket_launch_ordered = 158,
    on_rocket_launched = 159,
    on_runtime_mod_setting_changed = 160,
    on_script_inventory_resized = 161,
    on_script_path_request_finished = 162,
    on_script_trigger_effect = 163,
    on_sector_scanned = 164,
    on_segment_entity_created = 165,
    on_selected_entity_changed = 166,
    on_space_platform_built_entity = 167,
    on_space_platform_built_tile = 168,
    on_space_platform_changed_state = 169,
    on_space_platform_mined_entity = 170,
    on_space_platform_mined_item = 171,
    on_space_platform_mined_tile = 172,
    on_space_platform_pre_mined = 173,
    on_spider_command_completed = 174,
    on_string_translated = 175,
    on_surface_cleared = 176,
    on_surface_created = 177,
    on_surface_deleted = 178,
    on_surface_imported = 179,
    on_surface_renamed = 180,
    on_technology_effects_reset = 181,
    on_tick = 182,
    on_train_changed_state = 183,
    on_train_created = 184,
    on_train_schedule_changed = 185,
    on_trigger_created_entity = 186,
    on_trigger_fired_artillery = 187,
    on_undo_applied = 188,
    on_unit_added_to_group = 189,
    on_unit_group_created = 190,
    on_unit_group_finished_gathering = 191,
    on_unit_removed_from_group = 192,
    on_worker_robot_expired = 193,
    script_raised_built = 194,
    script_raised_destroy = 195,
    script_raised_revive = 196,
    script_raised_set_tiles = 197,
    script_raised_teleported = 198,
  },
  flow_precision_index = {
    fifty_hours = 5,
    five_seconds = 0,
    one_hour = 3,
    one_minute = 1,
    one_thousand_hours = 7,
    ten_hours = 4,
    ten_minutes = 2,
    two_hundred_fifty_hours = 6,
  },
  game_controller_interaction = {
    --- Game controller will always hover this element regardless of type or state.
    always = 0,
    --- Never hover this element with a game controller.
    never = 1,
    --- Hover according to the element type and implementation.
    normal = 2,
  },
  group_state = {
    attacking_distraction = 2,
    attacking_target = 3,
    finished = 4,
    gathering = 0,
    moving = 1,
    pathfinding = 5,
    wander_in_group = 6,
  },
  gui_type = {
    achievement = 0,
    blueprint_library = 1,
    bonus = 2,
    controller = 3,
    custom = 4,
    entity = 5,
    equipment = 6,
    global_electric_network = 7,
    item = 8,
    logistic = 9,
    none = 10,
    opened_entity_grid = 11,
    other_player = 12,
    permissions = 13,
    player_management = 14,
    production = 15,
    script_inventory = 16,
    server_management = 17,
    tile = 18,
    trains = 19,
  },
  input_action = {
    activate_interrupt = 0,
    activate_paste = 1,
    add_decider_combinator_condition = 2,
    add_decider_combinator_output = 3,
    add_logistic_section = 4,
    add_permission_group = 5,
    add_pin = 6,
    add_train_interrupt = 7,
    add_train_station = 8,
    adjust_blueprint_snapping = 9,
    admin_action = 10,
    alt_reverse_select_area = 11,
    alt_select_area = 12,
    alt_select_blueprint_entities = 13,
    alternative_copy = 14,
    begin_mining = 15,
    begin_mining_terrain = 16,
    build = 17,
    build_rail = 18,
    build_terrain = 19,
    cancel_craft = 20,
    cancel_deconstruct = 21,
    cancel_delete_space_platform = 22,
    cancel_new_blueprint = 23,
    cancel_research = 24,
    cancel_upgrade = 25,
    change_active_character_tab = 26,
    change_active_item_group_for_crafting = 27,
    change_active_item_group_for_filters = 28,
    change_active_quick_bar = 29,
    change_arithmetic_combinator_parameters = 30,
    change_entity_label = 31,
    change_item_label = 32,
    change_logistic_point_group = 33,
    change_multiplayer_config = 34,
    change_picking_state = 35,
    change_programmable_speaker_alert_parameters = 36,
    change_programmable_speaker_circuit_parameters = 37,
    change_programmable_speaker_parameters = 38,
    change_riding_state = 39,
    change_selector_combinator_parameters = 40,
    change_shooting_state = 41,
    change_train_name = 42,
    change_train_stop_station = 43,
    change_train_wait_condition = 44,
    change_train_wait_condition_data = 45,
    clear_cursor = 46,
    connect_rolling_stock = 47,
    copy = 48,
    copy_entity_settings = 49,
    copy_large_opened_blueprint = 50,
    copy_large_opened_item = 51,
    copy_opened_blueprint = 52,
    copy_opened_item = 53,
    craft = 54,
    create_space_platform = 55,
    cursor_split = 56,
    cursor_transfer = 57,
    custom_input = 58,
    cycle_blueprint_book_backwards = 59,
    cycle_blueprint_book_forwards = 60,
    cycle_quality_down = 61,
    cycle_quality_up = 62,
    deconstruct = 63,
    delete_blueprint_library = 64,
    delete_blueprint_record = 65,
    delete_custom_tag = 66,
    delete_logistic_group = 67,
    delete_permission_group = 68,
    delete_space_platform = 69,
    destroy_item = 70,
    destroy_opened_item = 71,
    disconnect_rolling_stock = 72,
    drag_decider_combinator_condition = 73,
    drag_decider_combinator_output = 74,
    drag_train_schedule = 75,
    drag_train_schedule_interrupt = 76,
    drag_train_wait_condition = 77,
    drop_blueprint_record = 78,
    drop_item = 79,
    edit_blueprint_tool_preview = 80,
    edit_custom_tag = 81,
    edit_display_panel = 82,
    edit_display_panel_always_show = 83,
    edit_display_panel_icon = 84,
    edit_display_panel_parameters = 85,
    edit_display_panel_show_in_chart = 86,
    edit_interrupt = 87,
    edit_permission_group = 88,
    edit_pin = 89,
    enable_transitional_requests = 90,
    export_blueprint = 91,
    fast_entity_split = 92,
    fast_entity_transfer = 93,
    flip_entity = 94,
    flush_opened_entity_fluid = 95,
    flush_opened_entity_specific_fluid = 96,
    go_to_train_station = 97,
    grab_blueprint_record = 98,
    gui_checked_state_changed = 99,
    gui_click = 100,
    gui_confirmed = 101,
    gui_elem_changed = 102,
    gui_hover = 103,
    gui_leave = 104,
    gui_location_changed = 105,
    gui_selected_tab_changed = 106,
    gui_selection_state_changed = 107,
    gui_switch_state_changed = 108,
    gui_text_changed = 109,
    gui_value_changed = 110,
    import_blueprint = 111,
    import_blueprint_string = 112,
    import_blueprints_filtered = 113,
    import_permissions_string = 114,
    instantly_create_space_platform = 115,
    inventory_split = 116,
    inventory_transfer = 117,
    land_at_planet = 118,
    launch_rocket = 119,
    lua_shortcut = 120,
    map_editor_action = 121,
    market_offer = 122,
    mod_settings_changed = 123,
    modify_decider_combinator_condition = 124,
    modify_decider_combinator_output = 125,
    move_research = 126,
    open_achievements_gui = 127,
    open_blueprint_library_gui = 128,
    open_blueprint_record = 129,
    open_bonus_gui = 130,
    open_character_gui = 131,
    open_current_vehicle_gui = 132,
    open_equipment = 133,
    open_global_electric_network_gui = 134,
    open_gui = 135,
    open_item = 136,
    open_logistics_gui = 137,
    open_mod_item = 138,
    open_new_platform_button_from_rocket_silo = 139,
    open_opened_entity_grid = 140,
    open_parent_of_opened_item = 141,
    open_production_gui = 142,
    open_train_gui = 143,
    open_train_station_gui = 144,
    open_trains_gui = 145,
    parametrise_blueprint = 146,
    paste_entity_settings = 147,
    pin_alert_group = 148,
    pin_custom_alert = 149,
    pin_search_result = 150,
    pipette = 151,
    place_equipment = 152,
    quick_bar_pick_slot = 153,
    quick_bar_set_selected_page = 154,
    quick_bar_set_slot = 155,
    reassign_blueprint = 156,
    redo = 157,
    remote_view_entity = 158,
    remote_view_surface = 159,
    remove_cables = 160,
    remove_decider_combinator_condition = 161,
    remove_decider_combinator_output = 162,
    remove_logistic_section = 163,
    remove_pin = 164,
    remove_train_interrupt = 165,
    remove_train_station = 166,
    rename_interrupt = 167,
    rename_space_platform = 168,
    reorder_logistic_section = 169,
    request_missing_construction_materials = 170,
    reset_assembling_machine = 171,
    reverse_select_area = 172,
    rotate_entity = 173,
    select_area = 174,
    select_asteroid_chunk_slot = 175,
    select_blueprint_entities = 176,
    select_entity_filter_slot = 177,
    select_entity_slot = 178,
    select_item_filter = 179,
    select_mapper_slot_from = 180,
    select_mapper_slot_to = 181,
    select_next_valid_gun = 182,
    select_tile_slot = 183,
    send_spidertron = 184,
    send_stack_to_trash = 185,
    send_stacks_to_trash = 186,
    send_train_to_pin_target = 187,
    set_behavior_mode = 188,
    set_car_weapons_control = 189,
    set_cheat_mode_quality = 190,
    set_circuit_condition = 191,
    set_circuit_mode_of_operation = 192,
    set_combinator_description = 193,
    set_copy_color_from_train_stop = 194,
    set_deconstruction_item_tile_selection_mode = 195,
    set_deconstruction_item_trees_and_rocks_only = 196,
    set_entity_color = 197,
    set_entity_energy_property = 198,
    set_filter = 199,
    set_ghost_cursor = 200,
    set_heat_interface_mode = 201,
    set_heat_interface_temperature = 202,
    set_infinity_container_filter_item = 203,
    set_infinity_container_remove_unfiltered_items = 204,
    set_infinity_pipe_filter = 205,
    set_inserter_max_stack_size = 206,
    set_inventory_bar = 207,
    set_lamp_always_on = 208,
    set_linked_container_link_i_d = 209,
    set_logistic_filter_item = 210,
    set_logistic_network_name = 211,
    set_logistic_section_active = 212,
    set_player_color = 213,
    set_pump_fluid_filter = 214,
    set_request_from_buffers = 215,
    set_research_finished_stops_game = 216,
    set_rocket_silo_send_to_orbit_automated_mode = 217,
    set_schedule_record_allow_unloading = 218,
    set_signal = 219,
    set_splitter_priority = 220,
    set_spoil_priority = 221,
    set_train_stop_priority = 222,
    set_train_stopped = 223,
    set_trains_limit = 224,
    set_turret_ignore_unlisted = 225,
    set_use_inserter_filters = 226,
    set_vehicle_automatic_targeting_parameters = 227,
    setup_assembling_machine = 228,
    setup_blueprint = 229,
    setup_single_blueprint_record = 230,
    spawn_item = 231,
    spectator_change_surface = 232,
    stack_split = 233,
    stack_transfer = 234,
    start_repair = 235,
    start_research = 236,
    start_walking = 237,
    stop_drag_build = 238,
    swap_logistic_filter_items = 239,
    switch_connect_to_logistic_network = 240,
    switch_constant_combinator_state = 241,
    switch_inserter_filter_mode_state = 242,
    switch_mining_drill_filter_mode_state = 243,
    switch_power_switch_state = 244,
    take_equipment = 245,
    toggle_artillery_auto_targeting = 246,
    toggle_deconstruction_item_entity_filter_mode = 247,
    toggle_deconstruction_item_tile_filter_mode = 248,
    toggle_driving = 249,
    toggle_enable_vehicle_logistics_while_moving = 250,
    toggle_entity_logistic_requests = 251,
    toggle_equipment_movement_bonus = 252,
    toggle_map_editor = 253,
    toggle_personal_logistic_requests = 254,
    toggle_personal_roboport = 255,
    toggle_selected_entity = 256,
    toggle_show_entity_info = 257,
    translate_string = 258,
    trash_not_requested_items = 259,
    undo = 260,
    upgrade = 261,
    upgrade_opened_blueprint_by_item = 262,
    upgrade_opened_blueprint_by_record = 263,
    use_item = 264,
    wire_dragging = 265,
    write_to_console = 266,
  },
  input_method = {
    game_controller = 1,
    keyboard_and_mouse = 0,
  },
  inventory = {
    artillery_turret_ammo = 42,
    artillery_wagon_ammo = 43,
    assembling_machine_dump = 25,
    assembling_machine_input = 22,
    assembling_machine_modules = 24,
    assembling_machine_output = 23,
    beacon_modules = 40,
    burnt_result = 1,
    car_ammo = 37,
    car_trunk = 36,
    cargo_landing_pad_main = 49,
    cargo_landing_pad_trash = 50,
    cargo_unit = 35,
    cargo_wagon = 38,
    character_ammo = 9,
    character_armor = 10,
    character_corpse = 41,
    character_guns = 8,
    character_main = 7,
    character_trash = 12,
    character_vehicle = 11,
    chest = 2,
    editor_ammo = 16,
    editor_armor = 17,
    editor_guns = 15,
    editor_main = 14,
    fuel = 0,
    furnace_modules = 6,
    furnace_result = 5,
    furnace_source = 4,
    god_main = 13,
    hub_main = 47,
    hub_trash = 48,
    item_main = 29,
    lab_input = 26,
    lab_modules = 27,
    logistic_container_trash = 3,
    mining_drill_modules = 28,
    roboport_material = 19,
    roboport_robot = 18,
    robot_cargo = 20,
    robot_repair = 21,
    rocket_silo_input = 32,
    rocket_silo_modules = 34,
    rocket_silo_output = 33,
    rocket_silo_rocket = 30,
    rocket_silo_trash = 31,
    spider_ammo = 45,
    spider_trash = 46,
    spider_trunk = 44,
    turret_ammo = 39,
  },
  logistic_member_index = {
    character_provider = 4,
    character_requester = 2,
    character_storage = 3,
    generic_on_off_behavior = 5,
    logistic_container = 0,
    spidertron_requester = 6,
    vehicle_storage = 1,
  },
  logistic_mode = {
    active_provider = 1,
    buffer = 5,
    none = 0,
    passive_provider = 4,
    requester = 3,
    storage = 2,
  },
  logistic_section_type = {
    circuit_controlled = 1,
    manual = 0,
    --- Used by space platform hubs.
    request_missing_materials_controlled = 3,
    --- Used by rocket silos.
    transitional_request_controlled = 2,
  },
  mouse_button_type = {
    left = 1,
    middle = 3,
    none = 0,
    right = 2,
  },
  moving_state = {
    adaptive = 2,
    moving = 1,
    stale = 0,
    stuck = 3,
  },
  print_skip = {
    --- Print will be skipped if same text was recently printed (within last 60 ticks). Used by most game messages.
    if_redundant = 1,
    --- Print will be skipped if same text is still visible (printed within last 1152 ticks). Used by some notifications.
    if_visible = 2,
    --- Print will not be skipped.
    never = 0,
  },
  print_sound = {
    always = 0,
    never = 1,
    use_player_settings = 2,
  },
  --- This define describes all top-level prototypes and their associated subtypes. It is organized as a lookup table, meaning the values of all the defines is `0`. As an example, `defines.prototypes['entity']` looks like `{furnace=0, inserter=0, container=0, ...}`.
  prototypes = {
    achievement = {
      achievement = 0,
      build__entity__achievement = 1,
      change__surface__achievement = 2,
      combat__robot__count__achievement = 3,
      complete__objective__achievement = 4,
      construct__with__robots__achievement = 5,
      create__platform__achievement = 6,
      deconstruct__with__robots__achievement = 7,
      deliver__by__robots__achievement = 8,
      deplete__resource__achievement = 9,
      destroy__cliff__achievement = 10,
      dont__build__entity__achievement = 11,
      dont__craft__manually__achievement = 12,
      dont__kill__manually__achievement = 13,
      dont__research__before__researching__achievement = 14,
      dont__use__entity__in__energy__production__achievement = 15,
      equip__armor__achievement = 16,
      group__attack__achievement = 17,
      kill__achievement = 18,
      module__transfer__achievement = 19,
      place__equipment__achievement = 20,
      player__damaged__achievement = 21,
      produce__achievement = 22,
      produce__per__hour__achievement = 23,
      research__achievement = 24,
      research__with__science__pack__achievement = 25,
      shoot__achievement = 26,
      space__connection__distance__traveled__achievement = 27,
      train__path__achievement = 28,
      use__item__achievement = 29,
    },
    active__trigger = {
      chain__active__trigger = 0,
      delayed__active__trigger = 1,
    },
    airborne__pollutant = {
      airborne__pollutant = 0,
    },
    ambient__sound = {
      ambient__sound = 0,
    },
    ammo__category = {
      ammo__category = 0,
    },
    animation = {
      animation = 0,
    },
    asteroid__chunk = {
      asteroid__chunk = 0,
    },
    autoplace__control = {
      autoplace__control = 0,
    },
    burner__usage = {
      burner__usage = 0,
    },
    collision__layer = {
      collision__layer = 0,
    },
    custom__event = {
      custom__event = 0,
    },
    custom__input = {
      custom__input = 0,
    },
    damage__type = {
      damage__type = 0,
    },
    decorative = {
      optimized__decorative = 0,
    },
    deliver__category = {
      deliver__category = 0,
    },
    deliver__impact__combination = {
      deliver__impact__combination = 0,
    },
    editor__controller = {
      editor__controller = 0,
    },
    entity = {
      accumulator = 0,
      agricultural__tower = 1,
      ammo__turret = 2,
      arithmetic__combinator = 3,
      arrow = 4,
      artillery__flare = 5,
      artillery__projectile = 6,
      artillery__turret = 7,
      artillery__wagon = 8,
      assembling__machine = 9,
      asteroid = 10,
      asteroid__collector = 11,
      beacon = 12,
      beam = 13,
      boiler = 14,
      burner__generator = 15,
      capture__robot = 16,
      car = 17,
      cargo__bay = 18,
      cargo__landing__pad = 19,
      cargo__pod = 20,
      cargo__wagon = 21,
      character = 22,
      character__corpse = 23,
      cliff = 24,
      combat__robot = 25,
      constant__combinator = 26,
      construction__robot = 27,
      container = 28,
      corpse = 29,
      crafting__machine = 30,
      curved__rail__a = 31,
      curved__rail__b = 32,
      decider__combinator = 33,
      deconstructible__tile__proxy = 34,
      display__panel = 35,
      electric__energy__interface = 36,
      electric__pole = 37,
      electric__turret = 38,
      elevated__curved__rail__a = 39,
      elevated__curved__rail__b = 40,
      elevated__half__diagonal__rail = 41,
      elevated__straight__rail = 42,
      entity__ghost = 43,
      explosion = 44,
      fire = 45,
      fish = 46,
      fluid__turret = 47,
      fluid__wagon = 48,
      furnace = 49,
      fusion__generator = 50,
      fusion__reactor = 51,
      gate = 52,
      generator = 53,
      half__diagonal__rail = 54,
      heat__interface = 55,
      heat__pipe = 56,
      highlight__box = 57,
      infinity__container = 58,
      infinity__pipe = 59,
      inserter = 60,
      item__entity = 61,
      item__request__proxy = 62,
      lab = 63,
      lamp = 64,
      land__mine = 65,
      lane__splitter = 66,
      legacy__curved__rail = 67,
      legacy__straight__rail = 68,
      lightning = 69,
      lightning__attractor = 70,
      linked__belt = 71,
      linked__container = 72,
      loader = 73,
      loader__1x1 = 74,
      locomotive = 75,
      logistic__container = 76,
      logistic__robot = 77,
      market = 78,
      mining__drill = 79,
      offshore__pump = 80,
      particle__source = 81,
      pipe = 82,
      pipe__to__ground = 83,
      plant = 84,
      player__port = 85,
      power__switch = 86,
      programmable__speaker = 87,
      projectile = 88,
      pump = 89,
      radar = 90,
      rail = 91,
      rail__chain__signal = 92,
      rail__ramp = 93,
      rail__remnants = 94,
      rail__signal = 95,
      rail__support = 96,
      reactor = 97,
      resource = 98,
      roboport = 99,
      rocket__silo = 100,
      rocket__silo__rocket = 101,
      rocket__silo__rocket__shadow = 102,
      rolling__stock = 103,
      segment = 104,
      segmented__unit = 105,
      selector__combinator = 106,
      simple__entity = 107,
      simple__entity__with__force = 108,
      simple__entity__with__owner = 109,
      smoke__with__trigger = 110,
      solar__panel = 111,
      space__platform__hub = 112,
      speech__bubble = 113,
      spider__leg = 114,
      spider__unit = 115,
      spider__vehicle = 116,
      splitter = 117,
      sticker = 118,
      storage__tank = 119,
      straight__rail = 120,
      stream = 121,
      temporary__container = 122,
      thruster = 123,
      tile__ghost = 124,
      train__stop = 125,
      transport__belt = 126,
      transport__belt__connectable = 127,
      tree = 128,
      turret = 129,
      underground__belt = 130,
      unit = 131,
      unit__spawner = 132,
      vehicle = 133,
      wall = 134,
    },
    equipment = {
      active__defense__equipment = 0,
      battery__equipment = 1,
      belt__immunity__equipment = 2,
      energy__shield__equipment = 3,
      equipment__ghost = 4,
      generator__equipment = 5,
      inventory__bonus__equipment = 6,
      movement__bonus__equipment = 7,
      night__vision__equipment = 8,
      roboport__equipment = 9,
      solar__panel__equipment = 10,
    },
    equipment__category = {
      equipment__category = 0,
    },
    equipment__grid = {
      equipment__grid = 0,
    },
    fluid = {
      fluid = 0,
    },
    font = {
      font = 0,
    },
    fuel__category = {
      fuel__category = 0,
    },
    god__controller = {
      god__controller = 0,
    },
    gui__style = {
      gui__style = 0,
    },
    impact__category = {
      impact__category = 0,
    },
    item = {
      ammo = 0,
      armor = 1,
      blueprint = 2,
      blueprint__book = 3,
      capsule = 4,
      copy__paste__tool = 5,
      deconstruction__item = 6,
      gun = 7,
      item = 8,
      item__with__entity__data = 9,
      item__with__inventory = 10,
      item__with__label = 11,
      item__with__tags = 12,
      module = 13,
      rail__planner = 14,
      repair__tool = 15,
      selection__tool = 16,
      space__platform__starter__pack = 17,
      spidertron__remote = 18,
      tool = 19,
      upgrade__item = 20,
    },
    item__group = {
      item__group = 0,
    },
    item__subgroup = {
      item__subgroup = 0,
    },
    map__gen__presets = {
      map__gen__presets = 0,
    },
    map__settings = {
      map__settings = 0,
    },
    module__category = {
      module__category = 0,
    },
    mouse__cursor = {
      mouse__cursor = 0,
    },
    noise__expression = {
      noise__expression = 0,
    },
    noise__function = {
      noise__function = 0,
    },
    particle = {
      optimized__particle = 0,
    },
    procession = {
      procession = 0,
    },
    procession__layer__inheritance__group = {
      procession__layer__inheritance__group = 0,
    },
    quality = {
      quality = 0,
    },
    recipe = {
      recipe = 0,
    },
    recipe__category = {
      recipe__category = 0,
    },
    remote__controller = {
      remote__controller = 0,
    },
    resource__category = {
      resource__category = 0,
    },
    shortcut = {
      shortcut = 0,
    },
    sound = {
      sound = 0,
    },
    space__connection = {
      space__connection = 0,
    },
    space__location = {
      planet = 0,
      space__location = 1,
    },
    spectator__controller = {
      spectator__controller = 0,
    },
    sprite = {
      sprite = 0,
    },
    surface = {
      surface = 0,
    },
    surface__property = {
      surface__property = 0,
    },
    technology = {
      technology = 0,
    },
    tile = {
      tile = 0,
    },
    tile__effect = {
      tile__effect = 0,
    },
    tips__and__tricks__item = {
      tips__and__tricks__item = 0,
    },
    tips__and__tricks__item__category = {
      tips__and__tricks__item__category = 0,
    },
    trigger__target__type = {
      trigger__target__type = 0,
    },
    trivial__smoke = {
      trivial__smoke = 0,
    },
    tutorial = {
      tutorial = 0,
    },
    utility__constants = {
      utility__constants = 0,
    },
    utility__sounds = {
      utility__sounds = 0,
    },
    utility__sprites = {
      utility__sprites = 0,
    },
    virtual__signal = {
      virtual__signal = 0,
    },
  },
  rail_connection_direction = {
    left = 0,
    none = 3,
    right = 2,
    straight = 1,
  },
  rail_direction = {
    back = 1,
    front = 0,
  },
  rail_layer = {
    elevated = 1,
    ground = 0,
  },
  relative_gui_position = {
    bottom = 1,
    left = 2,
    right = 3,
    top = 0,
  },
  relative_gui_type = {
    accumulator_gui = 0,
    achievement_gui = 1,
    additional_entity_info_gui = 2,
    admin_gui = 3,
    agriculture_tower_gui = 4,
    arithmetic_combinator_gui = 5,
    armor_gui = 6,
    assembling_machine_gui = 7,
    assembling_machine_select_recipe_gui = 8,
    asteroid_collector_gui = 9,
    beacon_gui = 10,
    blueprint_book_gui = 11,
    blueprint_library_gui = 12,
    blueprint_setup_gui = 13,
    bonus_gui = 14,
    burner_equipment_gui = 15,
    car_gui = 16,
    cargo_landing_pad_gui = 17,
    constant_combinator_gui = 18,
    container_gui = 19,
    controller_gui = 20,
    decider_combinator_gui = 21,
    deconstruction_item_gui = 22,
    display_panel_gui = 23,
    electric_energy_interface_gui = 24,
    electric_network_gui = 25,
    entity_variations_gui = 26,
    entity_with_energy_source_gui = 27,
    equipment_grid_gui = 28,
    furnace_gui = 29,
    generic_on_off_entity_gui = 30,
    ghost_picker_gui = 31,
    global_electric_network_gui = 32,
    heat_interface_gui = 33,
    infinity_pipe_gui = 34,
    inserter_gui = 35,
    item_with_inventory_gui = 36,
    lab_gui = 37,
    lamp_gui = 38,
    linked_container_gui = 39,
    loader_gui = 40,
    logistic_gui = 41,
    market_gui = 42,
    mining_drill_gui = 43,
    other_player_gui = 44,
    permissions_gui = 45,
    pick_stop_gui = 46,
    pipe_gui = 47,
    power_switch_gui = 48,
    production_gui = 49,
    programmable_speaker_gui = 50,
    pump_gui = 51,
    rail_signal_base_gui = 52,
    reactor_gui = 53,
    resource_entity_gui = 54,
    roboport_gui = 55,
    rocket_silo_gui = 56,
    script_inventory_gui = 57,
    selector_combinator_gui = 58,
    server_config_gui = 59,
    space_platform_hub_gui = 60,
    spider_vehicle_gui = 61,
    splitter_gui = 62,
    standalone_character_gui = 63,
    storage_tank_gui = 64,
    tile_variations_gui = 65,
    tips_and_tricks_gui = 66,
    train_gui = 67,
    train_stop_gui = 68,
    trains_gui = 69,
    transport_belt_gui = 70,
    turret_gui = 71,
    upgrade_item_gui = 72,
    wall_gui = 73,
  },
  render_mode = {
    chart = 1,
    chart_zoomed_in = 2,
    game = 0,
  },
  rich_text_setting = {
    disabled = 1,
    enabled = 0,
    highlight = 2,
  },
  riding = {
    acceleration = {
      accelerating = 1,
      braking = 2,
      nothing = 0,
      reversing = 3,
    },
    direction = {
      left = 0,
      right = 2,
      straight = 1,
    },
  },
  robot_order_type = {
    --- Construct a ghost.
    construct = 0,
    --- Deconstruct an entity.
    deconstruct = 4,
    --- Deliver an item.
    deliver = 2,
    --- Deliver specific items to an entity (item request proxy).
    deliver_items = 5,
    --- Explode a cliff.
    explode_cliff = 7,
    --- Pickup an item.
    pickup = 1,
    --- Pickup items from an entity (item request proxy).
    pickup_items = 8,
    --- Repair an entity.
    repair = 3,
    --- Upgrade an entity.
    upgrade = 6,
  },
  --- The various parts of the launch sequence of the rocket silo.
  rocket_silo_status = {
    --- The next state is `rocket_ready` or if the rocket is destroyed in this state then the next state will be `lights_blinking_close`. The rocket is getting prepared for launch.
    arms_advance = 6,
    --- The next state is `rocket_flying` or if the rocket is destroyed in this state then the next state will be `lights_blinking_close`. The rocket is getting launched.
    arms_retract = 10,
    --- The rocket silo is crafting rocket parts. When there are enough rocket parts, the silo will switch into the `create_rocket` state.
    building_rocket = 0,
    --- The next state is `lights_blinking_open`. The rocket silo rocket entity gets created.
    create_rocket = 1,
    --- The next state is `building_rocket`.
    doors_closing = 13,
    --- The next state is `rocket_rising` or if the rocket is destroyed in this state then the next state will be `lights_blinking_close`. The rocket is getting prepared for launch.
    doors_opened = 4,
    --- The next state is `doors_opened`. The rocket is getting prepared for launch.
    doors_opening = 3,
    --- The next state is `arms_retract` or if the rocket is destroyed in this state then the next state will be `lights_blinking_close`. The rocket is getting launched.
    engine_starting = 9,
    --- The next state is `engine_starting` or if the rocket is destroyed in this state then the next state will be `lights_blinking_close`. The rocket is getting launched.
    launch_started = 14,
    --- The next state is `launch_started`.
    launch_starting = 8,
    --- The next state is `doors_closing`.
    lights_blinking_close = 12,
    --- The next state is `doors_opening`. The rocket is getting prepared for launch.
    lights_blinking_open = 2,
    --- The next state is `lights_blinking_close`. The rocket is getting launched.
    rocket_flying = 11,
    --- The rocket launch can be started by the player. When the launch is started, the silo switches into the `launch_starting` state.
    rocket_ready = 7,
    --- The next state is `arms_advance` or if the rocket is destroyed in this state then the next state will be `lights_blinking_close`. The rocket is getting prepared for launch.
    rocket_rising = 5,
  },
  selection_mode = {
    alt_reverse_select = 3,
    alt_select = 1,
    reverse_select = 2,
    select = 0,
  },
  shooting = {
    not_shooting = 0,
    shooting_enemies = 1,
    shooting_selected = 2,
  },
  --- State of an ordinary rail signal.
  signal_state = {
    --- Red.
    closed = 1,
    --- Green.
    open = 0,
    --- Orange.
    reserved = 2,
    --- Red - From circuit network.
    reserved_by_circuit_network = 3,
  },
  space_platform_state = {
    --- Doesn't have anywhere to go.
    no_path = 6,
    --- Waiting for a starter pack
    no_schedule = 5,
    --- Following the path.
    on_the_path = 3,
    --- Starter pack is on the way.
    starter_pack_on_the_way = 2,
    --- Starter pack was requested from the logistics system.
    starter_pack_requested = 1,
    --- Waiting at a station.
    waiting_at_station = 7,
    --- Platform is ready to leave this planet and does not accept deliveries.
    waiting_for_departure = 4,
    --- Waiting for a starter pack.
    waiting_for_starter_pack = 0,
  },
  target_type = {
    commandable = 15,
    custom_chart_tag = 16,
    entity = 0,
    equipment = 1,
    equipment_grid = 2,
    gui_element = 17,
    item = 3,
    logistic_cell = 4,
    logistic_network = 5,
    logistic_section = 6,
    permission_group = 7,
    planet = 8,
    player = 9,
    rail_path = 10,
    render_object = 11,
    space_platform = 12,
    surface = 13,
    train = 14,
  },
  train_state = {
    --- Braking before a rail signal.
    arrive_signal = 3,
    --- Braking before a station.
    arrive_station = 5,
    --- Same as no_path but all candidate train stops are full
    destination_full = 9,
    --- Can move if user explicitly sits in and rides the train.
    manual_control = 7,
    --- Switched to manual control and has to stop.
    manual_control_stop = 6,
    --- Has no path and is stopped.
    no_path = 2,
    --- Doesn't have anywhere to go.
    no_schedule = 1,
    --- Normal state -- following the path.
    on_the_path = 0,
    --- Waiting at a signal.
    wait_signal = 4,
    --- Waiting at a station.
    wait_station = 8,
  },
  transport_line = {
    left_line = 0,
    left_split_line = 6,
    left_underground_line = 2,
    right_line = 1,
    right_split_line = 7,
    right_underground_line = 3,
    secondary_left_line = 4,
    secondary_left_split_line = 8,
    secondary_right_line = 5,
    secondary_right_split_line = 9,
  },
  wire_connector_id = {
    circuit_green = 1,
    circuit_red = 0,
    combinator_input_green = 3,
    combinator_input_red = 2,
    combinator_output_green = 5,
    combinator_output_red = 4,
    pole_copper = 6,
    power_switch_left_copper = 7,
    power_switch_right_copper = 8,
  },
  wire_origin = {
    player = 0,
    radars = 2,
    script = 1,
  },
  wire_type = {
    copper = 2,
    green = 1,
    red = 0,
  },
}

---@alias defines.alert_type number
---@alias defines.behavior_result number
---@alias defines.build_check_type number
---@alias defines.build_mode number
---@alias defines.chain_signal_state number
---@alias defines.chunk_generated_status number
---@alias defines.command number
---@alias defines.compound_command number
---@alias defines.control_behavior.cargo_landing_pad.exclusive_mode number
---@alias defines.control_behavior.inserter.hand_read_mode number
---@alias defines.control_behavior.lamp.color_mode number
---@alias defines.control_behavior.logistic_container.exclusive_mode number
---@alias defines.control_behavior.mining_drill.resource_read_mode number
---@alias defines.control_behavior.roboport.read_items_mode number
---@alias defines.control_behavior.rocket_silo.read_mode number
---@alias defines.control_behavior.transport_belt.content_read_mode number
---@alias defines.control_behavior.type number
---@alias defines.controllers number
---@alias defines.deconstruction_item.entity_filter_mode number
---@alias defines.deconstruction_item.tile_filter_mode number
---@alias defines.deconstruction_item.tile_selection_mode number
---@alias defines.difficulty number
---@alias defines.direction number
---@alias defines.disconnect_reason number
---@alias defines.distraction number
---@alias defines.entity_status number
---@alias defines.entity_status_diode number
---@alias defines.events number
---@alias defines.flow_precision_index number
---@alias defines.game_controller_interaction number
---@alias defines.group_state number
---@alias defines.gui_type number
---@alias defines.input_action number
---@alias defines.input_method number
---@alias defines.inventory number
---@alias defines.logistic_member_index number
---@alias defines.logistic_mode number
---@alias defines.logistic_section_type number
---@alias defines.mouse_button_type number
---@alias defines.moving_state number
---@alias defines.print_skip number
---@alias defines.print_sound number
---@alias defines.prototypes.achievement number
---@alias defines.prototypes.active_trigger number
---@alias defines.prototypes.airborne_pollutant number
---@alias defines.prototypes.ambient_sound number
---@alias defines.prototypes.ammo_category number
---@alias defines.prototypes.animation number
---@alias defines.prototypes.asteroid_chunk number
---@alias defines.prototypes.autoplace_control number
---@alias defines.prototypes.burner_usage number
---@alias defines.prototypes.collision_layer number
---@alias defines.prototypes.custom_event number
---@alias defines.prototypes.custom_input number
---@alias defines.prototypes.damage_type number
---@alias defines.prototypes.decorative number
---@alias defines.prototypes.deliver_category number
---@alias defines.prototypes.deliver_impact_combination number
---@alias defines.prototypes.editor_controller number
---@alias defines.prototypes.entity number
---@alias defines.prototypes.equipment number
---@alias defines.prototypes.equipment_category number
---@alias defines.prototypes.equipment_grid number
---@alias defines.prototypes.fluid number
---@alias defines.prototypes.font number
---@alias defines.prototypes.fuel_category number
---@alias defines.prototypes.god_controller number
---@alias defines.prototypes.gui_style number
---@alias defines.prototypes.impact_category number
---@alias defines.prototypes.item number
---@alias defines.prototypes.item_group number
---@alias defines.prototypes.item_subgroup number
---@alias defines.prototypes.map_gen_presets number
---@alias defines.prototypes.map_settings number
---@alias defines.prototypes.module_category number
---@alias defines.prototypes.mouse_cursor number
---@alias defines.prototypes.noise_expression number
---@alias defines.prototypes.noise_function number
---@alias defines.prototypes.particle number
---@alias defines.prototypes.procession number
---@alias defines.prototypes.procession_layer_inheritance_group number
---@alias defines.prototypes.quality number
---@alias defines.prototypes.recipe number
---@alias defines.prototypes.recipe_category number
---@alias defines.prototypes.remote_controller number
---@alias defines.prototypes.resource_category number
---@alias defines.prototypes.shortcut number
---@alias defines.prototypes.sound number
---@alias defines.prototypes.space_connection number
---@alias defines.prototypes.space_location number
---@alias defines.prototypes.spectator_controller number
---@alias defines.prototypes.sprite number
---@alias defines.prototypes.surface number
---@alias defines.prototypes.surface_property number
---@alias defines.prototypes.technology number
---@alias defines.prototypes.tile number
---@alias defines.prototypes.tile_effect number
---@alias defines.prototypes.tips_and_tricks_item number
---@alias defines.prototypes.tips_and_tricks_item_category number
---@alias defines.prototypes.trigger_target_type number
---@alias defines.prototypes.trivial_smoke number
---@alias defines.prototypes.tutorial number
---@alias defines.prototypes.utility_constants number
---@alias defines.prototypes.utility_sounds number
---@alias defines.prototypes.utility_sprites number
---@alias defines.prototypes.virtual_signal number
---@alias defines.rail_connection_direction number
---@alias defines.rail_direction number
---@alias defines.rail_layer number
---@alias defines.relative_gui_position number
---@alias defines.relative_gui_type number
---@alias defines.render_mode number
---@alias defines.rich_text_setting number
---@alias defines.riding.acceleration number
---@alias defines.riding.direction number
---@alias defines.robot_order_type number
---@alias defines.rocket_silo_status number
---@alias defines.selection_mode number
---@alias defines.shooting number
---@alias defines.signal_state number
---@alias defines.space_platform_state number
---@alias defines.target_type number
---@alias defines.train_state number
---@alias defines.transport_line number
---@alias defines.wire_connector_id number
---@alias defines.wire_origin number
---@alias defines.wire_type number


--- concepts
---@alias AchievementPrototypeFilter {filter: "allowed-without-fight" | "type", mode: "or" | "and", invert: boolean}
---@alias AdvancedMapGenSettings {pollution: PollutionMapSettings, enemy_evolution: EnemyEvolutionMapSettings, enemy_expansion: EnemyExpansionMapSettings, difficulty_settings: DifficultySettings}
---@alias Alert {tick: uint, target: LuaEntity, prototype: LuaEntityPrototype, position: MapPosition, icon: SignalID, message: LocalisedString}
---@alias Alignment "top-left" | "middle-left" | "left" | "bottom-left" | "top-center" | "middle-center" | "center" | "bottom-center" | "top-right" | "right" | "bottom-right"
---@alias AmmoType {action: TriggerItem[], target_type: TargetType, clamp_position: boolean, energy_consumption: double, range_modifier: double, cooldown_modifier: double, consumption_modifier: float}
---@alias Any string | boolean | number | table | LuaObject
---@alias AnyBasic string | boolean | number | table
---@alias ArithmeticCombinatorParameters {first_signal: SignalID, second_signal: SignalID, first_constant: int, second_constant: int, operation: "*" | "/" | "+" | "-" | "%" | "^" | "<<" | ">>" | "AND" | "OR" | "XOR", output_signal: SignalID}
---@alias AsteroidChunk {name: string, position: MapPosition, movement: Vector}
---@alias AsteroidChunkID LuaAsteroidChunkPrototype | string
---@alias AsteroidChunkPrototypeFilter {filter: "minable", mode: "or" | "and", invert: boolean}
---@alias AsteroidMapSettings {spawning_rate: double, max_ray_portals_expanded_per_tick: uint}
---@alias AttackParameterFluid {type: string, damage_modifier: double}
---@alias AttackParameters {type: "projectile" | "stream" | "beam", range: float, min_range: float, range_mode: RangeMode, fire_penalty: float, rotate_penalty: float, health_penalty: float, min_attack_distance: float, turn_range: float, damage_modifier: float, ammo_consumption_modifier: float, cooldown: float, warmup: uint, movement_slow_down_factor: double, movement_slow_down_cooldown: float, ammo_type: AmmoType, ammo_categories: string[]}
---@alias AutoplaceControl {frequency: MapGenSize, size: MapGenSize, richness: MapGenSize}
---@alias AutoplaceSettings {treat_missing_as_default: boolean, settings: table<string, AutoplaceControl>}
---@alias AutoplaceSpecification {control: string, default_enabled: boolean, force: string, order: string, placement_density: uint, tile_restriction: AutoplaceSpecificationRestriction[], probability_expression: NoiseExpression, richness_expression: NoiseExpression}
---@alias AutoplaceSpecificationRestriction {first: string, second: string}
---@alias BeamTarget {entity: LuaEntity, position: MapPosition}
---@alias BlueprintEntity {entity_number: uint, name: string, position: MapPosition, direction: defines.direction, mirror: boolean, quality: string, control_behavior: BlueprintControlBehavior, items: BlueprintInsertPlan[], tags: Tags, schedule: BlueprintSchedule, wires: BlueprintWire[]}
---@alias BlueprintInsertPlan {id: ItemIDAndQualityIDPair, items: ItemInventoryPositions}
---@alias BlueprintLogisticFilter {index: LogisticFilterIndex, type: SignalIDType, name: string, quality: string, comparator: ComparatorString, count: int, max_count: ItemCountType, minimum_delivery_count: ItemCountType, import_from: string}
---@alias BlueprintSchedule {records: BlueprintScheduleRecord[], group: string, interrupts: BlueprintScheduleInterrupt[]}
---@alias BlueprintScheduleInterrupt {name: string, conditions: WaitCondition[], targets: BlueprintScheduleRecord[], inside_interrupt: boolean}
---@alias BlueprintScheduleRecord {station: string, wait_conditions: WaitCondition[], temporary: boolean, created_by_interrupt: boolean, allows_unloading: boolean}
---@alias BlueprintSignalIcon {signal: SignalID, index: uint}
---@alias BlueprintWire tuple<uint, defines.wire_connector_id, uint, defines.wire_connector_id>
---@alias BlueprintWireEnd {entity: BlueprintEntity, connector: defines.wire_connector_id}
---@alias BoundingBox {left_top: MapPosition, right_bottom: MapPosition, orientation: RealOrientation} | (tuple<MapPosition, MapPosition>)
---@alias BurnerUsageID string
---@alias CapsuleAction {type: "throw" | "equipment-remote" | "use-on-self" | "artillery-remote" | "destroy-cliffs"}
---@alias ChartTagSpec {position: MapPosition, icon: SignalID, text: string, last_user: PlayerIdentification}
---@alias ChunkPosition {x: int, y: int} | (tuple<int, int>)
---@alias ChunkPositionAndArea {x: int, y: int, area: BoundingBox}
---@alias CircuitCondition {comparator: ComparatorString, first_signal: SignalID, second_signal: SignalID, constant: int}
---@alias CircuitConditionDefinition {condition: CircuitCondition, fulfilled: boolean}
---@alias CircuitNetworkSelection table
---@alias CircularParticleCreationSpecification {name: string, direction: float, direction_deviation: float, speed: float, speed_deviation: float, starting_frame_speed: float, starting_frame_speed_deviation: float, height: float, height_deviation: float, vertical_speed: float, vertical_speed_deviation: float, center: Vector, creation_distance: double, creation_distance_orientation: double, use_source_position: boolean}
---@alias CircularProjectileCreationSpecification tuple<RealOrientation, Vector>
---@alias CliffOrientation "west-to-east" | "north-to-south" | "east-to-west" | "south-to-north" | "west-to-north" | "north-to-east" | "east-to-south" | "south-to-west" | "west-to-south" | "north-to-west" | "east-to-north" | "south-to-east" | "west-to-none" | "none-to-east" | "east-to-none" | "none-to-west" | "north-to-none" | "none-to-south" | "south-to-none" | "none-to-north"
---@alias CliffPlacementSettings {name: string, control: string, cliff_elevation_0: float, cliff_elevation_interval: float, cliff_smoothing: float, richness: MapGenSize}
---@alias CollisionLayerID string
---@alias CollisionMask {layers: table<string, true>, not_colliding_with_itself: boolean, consider_tile_transitions: boolean, colliding_with_tiles_only: boolean}
---@alias Color {r: float, g: float, b: float, a: float} | (tuple<float, float, float, float>)
---@alias ColorModifier {r: float, g: float, b: float, a: float} | (tuple<float, float, float, float>)
---@alias Command {type: defines.command}
---@alias ComparatorString "=" | ">" | "<" | "≥" | ">=" | "≤" | "<=" | "≠" | "!="
---@alias CompiledLogisticFilter {index: LogisticFilterIndex, type: SignalIDType, name: string, quality: string, comparator: ComparatorString, count: int, max_count: ItemCountType, minimum_delivery_count: ItemCountType}
---@alias ConfigurationChangedData {old_version: string, new_version: string, mod_changes: table<string, ModChangeData>, mod_startup_settings_changed: boolean, migration_applied: boolean}
---@alias CraftingQueueItem {index: uint, recipe: string, count: uint, prerequisite: boolean}
---@alias CursorBoxRenderType "entity" | "multiplayer-entity" | "electricity" | "copy" | "not-allowed" | "pair" | "logistics" | "train-visualization" | "blueprint-snap-rectangle" | "spidertron-remote-selected" | "spidertron-remote-to-be-selected"
---@alias CustomCommandData {name: string, tick: uint, player_index: uint, parameter: string}
---@alias CustomEntityStatus {diode: defines.entity_status_diode, label: LocalisedString}
---@alias CutsceneWaypoint {position: MapPosition, target: LuaEntity | LuaCommandable, transition_time: uint, time_to_wait: uint, zoom: double}
---@alias DamageTypeFilters {whitelist: boolean, types: table<string, true>}
---@alias DamageTypeID LuaDamagePrototype | string
---@alias DeciderCombinatorCondition table
---@alias DeciderCombinatorOutput table
---@alias DeciderCombinatorParameters {conditions: DeciderCombinatorCondition[], outputs: DeciderCombinatorOutput[]}
---@alias Decorative {name: string, position: TilePosition, amount: uint8}
---@alias DecorativeID LuaDecorativePrototype | string
---@alias DecorativePrototypeFilter {filter: "decal" | "autoplace" | "collision-mask", mode: "or" | "and", invert: boolean}
---@alias DecorativeResult {position: TilePosition, decorative: LuaDecorativePrototype, amount: uint}
---@alias DetailedItemOnLine {stack: LuaItemStack, position: float, unique_id: uint}
---@alias DisplayPanelMessageDefinition {text: string, icon: SignalID, condition: CircuitConditionDefinition}
---@alias DisplayResolution {width: uint, height: uint}
---@alias DragTarget {target_entity: LuaEntity, wire_connector_id: defines.wire_connector_id}
---@alias EffectReceiver {base_effect: ModuleEffects, uses_module_effects: boolean, uses_beacon_effects: boolean, uses_surface_effects: boolean}
---@alias ElemID {type: ElemType, name: string, quality: string}
---@alias ElemType "achievement" | "decorative" | "entity" | "equipment" | "fluid" | "item" | "item-group" | "recipe" | "signal" | "technology" | "tile" | "asteroid-chunk" | "space-location" | "item-with-quality" | "entity-with-quality" | "recipe-with-quality" | "equipment-with-quality"
---@alias EnemyEvolutionMapSettings {enabled: boolean, time_factor: double, destroy_factor: double, pollution_factor: double}
---@alias EnemyExpansionMapSettings {enabled: boolean, max_expansion_distance: uint, friendly_base_influence_radius: uint, enemy_building_influence_radius: uint, building_coefficient: double, other_base_coefficient: double, neighbouring_chunk_coefficient: double, neighbouring_base_chunk_coefficient: double, max_colliding_tiles_coefficient: double, settler_group_min_size: uint, settler_group_max_size: uint, min_expansion_cooldown: uint, max_expansion_cooldown: uint}
---@alias EntityID LuaEntityPrototype | LuaEntity | string
---@alias EntityIDAndQualityIDPair {name: EntityID, quality: QualityID}
---@alias EntityIDFilter {name: string, quality: string, comparator: ComparatorString}
---@alias EntityPrototypeFilter {filter: "flying-robot" | "robot-with-logistics-interface" | "rail" | "ghost" | "explosion" | "vehicle" | "crafting-machine" | "rolling-stock" | "turret" | "transport-belt-connectable" | "wall-connectable" | "buildable" | "placable-in-editor" | "clonable" | "selectable" | "hidden" | "entity-with-health" | "building" | "fast-replaceable" | "uses-direction" | "minable" | "circuit-connectable" | "autoplace" | "blueprintable" | "item-to-place" | "name" | "type" | "collision-mask" | "flag" | "build-base-evolution-requirement" | "selection-priority" | "emissions-per-second" | "crafting-category", mode: "or" | "and", invert: boolean}
---@alias EntityPrototypeFlag "not-rotatable" | "placeable-neutral" | "placeable-player" | "placeable-enemy" | "placeable-off-grid" | "player-creation" | "building-direction-8-way" | "filter-directions" | "get-by-unit-number" | "breaths-air" | "not-repairable" | "not-on-map" | "not-deconstructable" | "not-blueprintable" | "hide-alt-info" | "no-gap-fill-while-building" | "not-flammable" | "no-automated-item-removal" | "no-automated-item-insertion" | "no-copy-paste" | "not-selectable-in-game" | "not-upgradable" | "not-in-kill-statistics" | "building-direction-16-way" | "snap-to-rail-support-spot" | "not-in-made-in"
---@alias EntityPrototypeFlags table<EntityPrototypeFlag, true>
---@alias EntitySearchFilters {area: BoundingBox, position: MapPosition, radius: double, name: EntityID | EntityID[], type: string | string[], ghost_name: EntityID | EntityID[], ghost_type: string | string[], direction: defines.direction | defines.direction[], collision_mask: CollisionLayerID | CollisionLayerID[] | (table<CollisionLayerID, true>), force: ForceSet, to_be_deconstructed: boolean, to_be_upgraded: boolean, limit: uint, is_military_target: boolean, has_item_inside: ItemWithQualityID, quality: QualityCondition, invert: boolean}
---@alias EntityWithQualityID LuaEntity | LuaEntityPrototype | string | EntityIDAndQualityIDPair
---@alias EquipmentID LuaEquipmentPrototype | LuaEquipment | string
---@alias EquipmentIDAndQualityIDPair {name: EquipmentID, quality: QualityID}
---@alias EquipmentPoint {x: uint, y: uint}
---@alias EquipmentPosition {x: int, y: int} | (tuple<int, int>)
---@alias EquipmentPrototypeFilter {filter: "item-to-place" | "type", mode: "or" | "and", invert: boolean}
---@alias EquipmentWithQualityID LuaEquipmentPrototype | LuaEquipment | string | EquipmentIDAndQualityIDPair
---@alias EventData {name: defines.events, tick: uint, mod_name: string}
---@alias EventFilter (LuaPrePlatformMinedEntityEventFilter | LuaRobotMinedEntityEventFilter | LuaEntityMarkedForUpgradeEventFilter | LuaPreGhostUpgradedEventFilter | LuaPlatformMinedEntityEventFilter | LuaScriptRaisedDestroyEventFilter | LuaPlayerBuiltEntityEventFilter | LuaPlatformBuiltEntityEventFilter | LuaPreGhostDeconstructedEventFilter | LuaEntityClonedEventFilter | LuaScriptRaisedTeleportedEventFilter | LuaEntityDeconstructionCancelledEventFilter | LuaRobotBuiltEntityEventFilter | LuaScriptRaisedBuiltEventFilter | LuaPrePlayerMinedEntityEventFilter | LuaPlayerRepairedEntityEventFilter | LuaUpgradeCancelledEventFilter | LuaSectorScannedEventFilter | LuaPostEntityDiedEventFilter | LuaEntityMarkedForDeconstructionEventFilter | LuaPlayerMinedEntityEventFilter | LuaEntityDamagedEventFilter | LuaScriptRaisedReviveEventFilter | LuaEntityDiedEventFilter | LuaPreRobotMinedEntityEventFilter)[]
---@alias Fluid {name: string, amount: double, temperature: float}
---@alias FluidBoxConnectionRecord {this_linked_connection_id: uint, other_entity: LuaEntity, other_linked_connection_id: uint}
---@alias FluidBoxFilter {name: string, minimum_temperature: float, maximum_temperature: float}
---@alias FluidBoxFilterSpec {name: string, minimum_temperature: float, maximum_temperature: float, force: boolean}
---@alias FluidID string | LuaFluidPrototype | Fluid
---@alias FluidProduct {type: "fluid", name: string, amount: double, amount_min: double, amount_max: double, probability: double, ignored_by_stats: double, ignored_by_productivity: double, temperature: float, fluidbox_index: uint}
---@alias FluidPrototypeFilter {filter: "hidden" | "name" | "subgroup" | "default-temperature" | "max-temperature" | "heat-capacity" | "fuel-value" | "emissions-multiplier" | "gas-temperature", mode: "or" | "and", invert: boolean}
---@alias ForceCondition "all" | "enemy" | "ally" | "friend" | "not-friend" | "same" | "not-same"
---@alias ForceID string | uint8 | LuaForce
---@alias ForceSet ForceID[] | ForceID
---@alias GuiAnchor {gui: defines.relative_gui_type, position: defines.relative_gui_position, type: string, name: string, names: string[]}
---@alias GuiArrowSpecification {margin: uint, type: GuiArrowType}
---@alias GuiArrowType "nowhere" | "goal" | "entity_info" | "active_window" | "entity" | "position" | "crafting_queue" | "item_stack"
---@alias GuiDirection "horizontal" | "vertical"
---@alias GuiElementType "button" | "sprite-button" | "checkbox" | "flow" | "frame" | "label" | "line" | "progressbar" | "table" | "textfield" | "radiobutton" | "sprite" | "scroll-pane" | "drop-down" | "list-box" | "camera" | "choose-elem-button" | "text-box" | "slider" | "minimap" | "entity-preview" | "empty-widget" | "tabbed-pane" | "tab" | "switch"
---@alias GuiLocation {x: int, y: int} | (tuple<int, int>)
---@alias GunShift4Way {north: Vector, east: Vector, south: Vector, west: Vector}
---@alias HeatConnection {position: Vector, direction: defines.direction}
---@alias HeatSetting {temperature: double, mode: "at-least" | "at-most" | "exactly" | "add" | "remove"}
---@alias InfinityInventoryFilter {name: string, count: uint, mode: "at-least" | "at-most" | "exactly", index: uint}
---@alias InfinityPipeFilter {name: string, percentage: double, temperature: double, mode: "at-least" | "at-most" | "exactly" | "add" | "remove"}
---@alias Ingredient {type: "item" | "fluid", name: string, amount: double, ignored_by_stats: uint | double}
---@alias InserterCircuitConditions {circuit: CircuitCondition, logistics: CircuitCondition}
---@alias InventoryFilter {index: uint, name: string}
---@alias InventoryPosition {inventory: defines.inventory, stack: ItemStackIndex, count: ItemCountType}
---@alias ItemCountType uint
---@alias ItemCountWithQuality {name: string, count: uint, quality: QualityID}
---@alias ItemFilter {name: ItemID, quality: QualityID, comparator: ComparatorString} | string
---@alias ItemID LuaItemPrototype | LuaItemStack | LuaItem | string
---@alias ItemIDAndQualityIDPair {name: ItemID, quality: QualityID}
---@alias ItemIDFilter {name: string, quality: string, comparator: ComparatorString}
---@alias ItemInventoryPositions {in_inventory: InventoryPosition[], grid_count: ItemCountType}
---@alias ItemLocationData {surface: LuaSurface, entity: LuaEntity, player: LuaPlayer, position: MapPosition, force: LuaForce}
---@alias ItemProduct {type: "item", name: string, amount: uint16, amount_min: uint16, amount_max: uint16, probability: double, ignored_by_stats: uint16, ignored_by_productivity: uint16, extra_count_fraction: float, percent_spoiled: float}
---@alias ItemPrototypeFilter {filter: "tool" | "mergeable" | "hidden" | "hidden-in-factoriopedia" | "is-parameter" | "item-with-inventory" | "selection-tool" | "item-with-label" | "has-rocket-launch-products" | "fuel" | "place-result" | "burnt-result" | "place-as-tile" | "placed-as-equipment-result" | "name" | "type" | "flag" | "subgroup" | "fuel-category" | "stack-size" | "fuel-value" | "fuel-acceleration-multiplier" | "fuel-top-speed-multiplier" | "fuel-emissions-multiplier", mode: "or" | "and", invert: boolean}
---@alias ItemPrototypeFlag "draw-logistic-overlay" | "excluded-from-trash-unrequested" | "always-show" | "hide-from-bonus-gui" | "hide-from-fuel-tooltip" | "not-stackable" | "primary-place-result" | "mod-openable" | "only-in-cursor" | "spawnable" | "spoil-result" | "ignore-spoil-time-modifier"
---@alias ItemPrototypeFlags table<ItemPrototypeFlag, true>
---@alias ItemStackDefinition {name: string, count: ItemCountType, quality: string, health: float, durability: double, ammo: float, tags: string[], custom_description: LocalisedString, spoil_percent: double}
---@alias ItemStackIdentification SimpleItemStack | LuaItemStack
---@alias ItemStackIndex uint16
---@alias ItemStackLocation {inventory: defines.inventory, slot: uint}
---@alias ItemWithQualityID LuaItemStack | LuaItemPrototype | string | ItemIDAndQualityIDPair
---@alias LinkedGameControl "move-up" | "move-down" | "move-left" | "move-right" | "open-character-gui" | "open-gui" | "confirm-gui" | "toggle-free-cursor" | "mine" | "build" | "build-ghost" | "super-forced-build" | "clear-cursor" | "pipette" | "rotate" | "reverse-rotate" | "flip-horizontal" | "flip-vertical" | "pick-items" | "drop-cursor" | "show-info" | "shoot-enemy" | "shoot-selected" | "next-weapon" | "toggle-driving" | "zoom-in" | "zoom-out" | "use-item" | "alternative-use-item" | "toggle-console" | "copy-entity-settings" | "paste-entity-settings" | "controller-gui-logistics-tab" | "controller-gui-character-tab" | "controller-gui-crafting-tab" | "toggle-rail-layer" | "select-for-blueprint" | "select-for-cancel-deconstruct" | "select-for-super-forced-deconstruct" | "reverse-select" | "alt-reverse-select" | "deselect" | "cycle-blueprint-forwards" | "cycle-blueprint-backwards" | "focus-search" | "larger-terrain-building-area" | "smaller-terrain-building-area" | "remove-pole-cables" | "build-with-obstacle-avoidance" | "add-station" | "add-temporary-station" | "rename-all" | "fast-wait-condition" | "drag-map" | "move-tag" | "place-in-chat" | "place-ping" | "pin" | "activate-tooltip" | "next-surface" | "previous-surface" | "cycle-quality-up" | "cycle-quality-down" | "craft" | "craft-5" | "craft-all" | "cancel-craft" | "cancel-craft-5" | "cancel-craft-all" | "pick-item" | "stack-transfer" | "inventory-transfer" | "fast-entity-transfer" | "cursor-split" | "stack-split" | "inventory-split" | "fast-entity-split" | "toggle-filter" | "open-item" | "copy-inventory-filter" | "paste-inventory-filter" | "show-quick-panel" | "next-quick-panel-page" | "previous-quick-panel-page" | "next-quick-panel-tab" | "previous-quick-panel-tab" | "rotate-active-quick-bars" | "next-active-quick-bar" | "previous-active-quick-bar" | "quick-bar-button-1" | "quick-bar-button-2" | "quick-bar-button-3" | "quick-bar-button-4" | "quick-bar-button-5" | "quick-bar-button-6" | "quick-bar-button-7" | "quick-bar-button-8" | "quick-bar-button-9" | "quick-bar-button-10" | "quick-bar-button-1-secondary" | "quick-bar-button-2-secondary" | "quick-bar-button-3-secondary" | "quick-bar-button-4-secondary" | "quick-bar-button-5-secondary" | "quick-bar-button-6-secondary" | "quick-bar-button-7-secondary" | "quick-bar-button-8-secondary" | "quick-bar-button-9-secondary" | "quick-bar-button-10-secondary" | "action-bar-select-page-1" | "action-bar-select-page-2" | "action-bar-select-page-3" | "action-bar-select-page-4" | "action-bar-select-page-5" | "action-bar-select-page-6" | "action-bar-select-page-7" | "action-bar-select-page-8" | "action-bar-select-page-9" | "action-bar-select-page-10" | "copy" | "cut" | "paste" | "cycle-clipboard-forwards" | "cycle-clipboard-backwards" | "undo" | "redo" | "toggle-menu" | "toggle-map" | "close-menu" | "open-technology-gui" | "production-statistics" | "logistic-networks" | "toggle-blueprint-library" | "open-trains-gui" | "open-factoriopedia" | "back" | "forward" | "pause-game" | "confirm-message" | "previous-technology" | "previous-mod" | "connect-train" | "disconnect-train" | "submit-feedback" | "editor-next-variation" | "editor-previous-variation" | "editor-clone-item" | "editor-delete-item" | "editor-toggle-pause" | "editor-tick-once" | "editor-speed-up" | "editor-speed-down" | "editor-reset-speed" | "editor-set-clone-brush-source" | "editor-set-clone-brush-destination" | "editor-switch-to-surface" | "editor-remove-scripting-object" | "debug-toggle-atlas-gui" | "debug-toggle-gui-visibility" | "debug-toggle-debug-settings" | "debug-toggle-basic" | "debug-reset-zoom" | "debug-reset-zoom-2x" | "toggle-gui-debug" | "toggle-gui-style-view" | "toggle-gui-shadows" | "toggle-gui-glows" | "open-prototypes-gui" | "open-prototype-explorer-gui" | "increase-ui-scale" | "decrease-ui-scale" | "reset-ui-scale" | "slash-editor" | "toggle-entity" | "next-player-in-replay" | "move-blueprint-absolute-grid-up" | "move-blueprint-absolute-grid-down" | "move-blueprint-absolute-grid-left" | "move-blueprint-absolute-grid-right" | "move-blueprint-entities-up" | "move-blueprint-entities-down" | "move-blueprint-entities-left" | "move-blueprint-entities-right" | "play-next-track" | "play-previous-track" | "pause-resume-music"
---@alias LocalisedString string | number | boolean | LuaObject | nil | LocalisedString[]
---@alias LogisticFilter {value: SignalFilter, min: int, max: ItemCountType, minimum_delivery_count: ItemCountType, import_from: SpaceLocationID}
---@alias LogisticFilterIndex uint16
---@alias LogisticSection {index: uint8, filters: BlueprintLogisticFilter[], group: string, multiplier: float, active: float}
---@alias LogisticSections {sections: LogisticSection[], trash_not_requested: boolean}
---@alias LogisticsNetworkSupplyCounts {storage: uint, passive__provider: uint, buffer: uint, active__provider: uint}
---@alias LogisticsNetworkSupplyPoints {storage: LuaLogisticPoint[], passive__provider: LuaLogisticPoint[], buffer: LuaLogisticPoint[], active__provider: LuaLogisticPoint[]}
---@alias Loot {item: string, probability: double, count_min: double, count_max: double}
---@alias LuaEntityClonedEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaEntityDamagedEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name" | "original-damage-amount" | "final-damage-amount" | "damage-type" | "final-health", mode: "or" | "and", invert: boolean}
---@alias LuaEntityDeconstructionCancelledEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaEntityDiedEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaEntityMarkedForDeconstructionEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaEntityMarkedForUpgradeEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaObject userdata
---@alias LuaPlatformBuiltEntityEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name" | "force", mode: "or" | "and", invert: boolean}
---@alias LuaPlatformMinedEntityEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaPlayerBuiltEntityEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name" | "force", mode: "or" | "and", invert: boolean}
---@alias LuaPlayerMinedEntityEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaPlayerRepairedEntityEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaPostEntityDiedEventFilter {filter: "ghost", mode: "or" | "and", invert: boolean}
---@alias LuaPreGhostDeconstructedEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaPreGhostUpgradedEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaPrePlatformMinedEntityEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaPrePlayerMinedEntityEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaPreRobotMinedEntityEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaRobotBuiltEntityEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name" | "force", mode: "or" | "and", invert: boolean}
---@alias LuaRobotMinedEntityEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaScriptRaisedBuiltEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaScriptRaisedDestroyEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaScriptRaisedReviveEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaScriptRaisedTeleportedEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaSectorScannedEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias LuaUpgradeCancelledEventFilter {filter: "ghost" | "rail" | "rail-signal" | "rolling-stock" | "robot-with-logistics-interface" | "vehicle" | "turret" | "crafting-machine" | "wall-connectable" | "transport-belt-connectable" | "circuit-network-connectable" | "type" | "name" | "ghost_type" | "ghost_name", mode: "or" | "and", invert: boolean}
---@alias MapAndDifficultySettings {pollution: PollutionMapSettings, enemy_evolution: EnemyEvolutionMapSettings, enemy_expansion: EnemyExpansionMapSettings, unit_group: UnitGroupMapSettings, steering: SteeringMapSettings, path_finder: PathFinderMapSettings, asteroids: AsteroidMapSettings, max_failed_behavior_count: uint, difficulty_settings: MapDifficultySettings}
---@alias MapDifficultySettings {technology_price_multiplier: double, spoil_time_modifier: double}
---@alias MapExchangeStringData {map_settings: MapAndDifficultySettings, map_gen_settings: MapGenSettings}
---@alias MapGenPreset {order: string, default: boolean, basic_settings: MapGenSettings, advanced_settings: AdvancedMapGenSettings}
---@alias MapGenSettings {autoplace_controls: table<string, AutoplaceControl>, default_enable_all_autoplace_controls: boolean, autoplace_settings: table<"entity" | "tile" | "decorative", AutoplaceSettings>, seed: uint, width: uint, height: uint, starting_area: MapGenSize, starting_points: MapPosition[], peaceful_mode: boolean, no_enemies_mode: boolean, property_expression_names: PropertyExpressionNames, cliff_settings: CliffPlacementSettings, territory_settings: TerritorySettings}
---@alias MapGenSize float | "none" | "very-low" | "very-small" | "very-poor" | "low" | "small" | "poor" | "normal" | "medium" | "regular" | "high" | "big" | "good" | "very-high" | "very-big" | "very-good"
---@alias MapPosition {x: double, y: double} | (tuple<double, double>)
---@alias MapTick uint64
---@alias MapViewSettings {show__logistic__network: boolean, show__electric__network: boolean, show__turret__range: boolean, show__pollution: boolean, show__networkless__logistic__members: boolean, show__train__station__names: boolean, show__player__names: boolean, show__tags: boolean, show__worker__robots: boolean, show__rail__signal__states: boolean, show__recipe__icons: boolean, show__pipelines: boolean, show__non__standard__map__info: boolean}
---@alias MarketIngredient {name: string, quality: string, count: ItemCountType}
---@alias MathExpression string
---@alias MineableProperties {minable: boolean, mining_time: double, mining_particle: string, products: Product[], fluid_amount: double, required_fluid: string, mining_trigger: TriggerItem[]}
---@alias ModChangeData {old_version: string, new_version: string}
---@alias ModSetting {value: int | double | boolean | string | Color}
---@alias ModSettingPrototypeFilter {filter: "type" | "mod" | "setting-type", mode: "or" | "and", invert: boolean}
---@alias ModifierType "inserter-stack-size-bonus" | "bulk-inserter-capacity-bonus" | "laboratory-speed" | "character-logistic-trash-slots" | "maximum-following-robots-count" | "worker-robot-speed" | "worker-robot-storage" | "turret-attack" | "ammo-damage" | "give-item" | "gun-speed" | "unlock-recipe" | "character-crafting-speed" | "character-mining-speed" | "character-running-speed" | "character-build-distance" | "character-item-drop-distance" | "character-reach-distance" | "character-resource-reach-distance" | "character-item-pickup-distance" | "character-loot-pickup-distance" | "character-inventory-slots-bonus" | "deconstruction-time-to-live" | "max-failed-attempts-per-tick-per-construction-queue" | "max-successful-attempts-per-tick-per-construction-queue" | "character-health-bonus" | "mining-drill-productivity-bonus" | "train-braking-force-bonus" | "worker-robot-battery" | "laboratory-productivity" | "follower-robot-lifetime" | "artillery-range" | "nothing" | "character-logistic-requests" | "unlock-space-location" | "unlock-quality" | "unlock-space-platforms" | "unlock-circuit-network" | "cargo-landing-pad-count" | "change-recipe-productivity" | "cliff-deconstruction-enabled" | "mining-with-fluid" | "rail-support-on-deep-oil-ocean" | "rail-planner-allow-elevated-rails" | "beacon-distribution" | "create-ghost-on-entity-death" | "belt-stack-size-bonus" | "vehicle-logistics"
---@alias ModuleEffectValue float
---@alias ModuleEffects {consumption: ModuleEffectValue, speed: ModuleEffectValue, productivity: ModuleEffectValue, pollution: ModuleEffectValue, quality: ModuleEffectValue}
---@alias MouseButtonFlags table<"left" | "right" | "middle" | "button-4" | "button-5" | "button-6" | "button-7" | "button-8" | "button-9", true>
---@alias NoiseExpression {type: string}
---@alias NthTickEventData {tick: uint, nth_tick: uint}
---@alias Offer {price: MarketIngredient[], offer: TechnologyModifier}
---@alias OldTileAndPosition {old_tile: LuaTilePrototype, position: TilePosition}
---@alias ParticleID LuaParticlePrototype | string
---@alias PathFinderMapSettings {fwd2bwd_ratio: uint, goal_pressure_ratio: double, use_path_cache: boolean, max_steps_worked_per_tick: double, max_work_done_per_tick: uint, short_cache_size: uint, long_cache_size: uint, short_cache_min_cacheable_distance: double, short_cache_min_algo_steps_to_cache: uint, long_cache_min_cacheable_distance: double, cache_max_connect_to_cache_steps_multiplier: uint, cache_accept_path_start_distance_ratio: double, cache_accept_path_end_distance_ratio: double, negative_cache_accept_path_start_distance_ratio: double, negative_cache_accept_path_end_distance_ratio: double, cache_path_start_distance_rating_multiplier: double, cache_path_end_distance_rating_multiplier: double, stale_enemy_with_same_destination_collision_penalty: double, ignore_moving_enemy_collision_distance: double, enemy_with_different_destination_collision_penalty: double, general_entity_collision_penalty: double, general_entity_subsequent_collision_penalty: double, extended_collision_penalty: double, max_clients_to_accept_any_new_request: uint, max_clients_to_accept_short_new_request: uint, direct_distance_to_consider_short_request: uint, short_request_max_steps: uint, short_request_ratio: double, min_steps_to_check_path_find_termination: uint, start_to_goal_cost_multiplier_to_terminate_path_find: double, overload_levels: uint[], overload_multipliers: double[], negative_path_cache_delay_interval: uint}
---@alias PathfinderFlags {allow_destroy_friendly_entities: boolean, allow_paths_through_own_entities: boolean, cache: boolean, prefer_straight_paths: boolean, low_priority: boolean, no_break: boolean}
---@alias PathfinderWaypoint {position: MapPosition, needs_destroy_to_reach: boolean}
---@alias PipeConnection {flow_direction: "input" | "output" | "input-output", connection_type: "normal" | "underground" | "linked", position: MapPosition, target_position: MapPosition, target: LuaFluidBox, target_fluidbox_index: uint, target_pipe_connection_index: uint}
---@alias PipeConnectionDefinition {positions: MapPosition[], max_underground_distance: uint, flow_direction: "input-output" | "input" | "output", direction: defines.direction}
---@alias PlaceAsTileResult {result: LuaTilePrototype, condition_size: uint, condition: CollisionMask}
---@alias PlatformSchedule {current: uint, records: ScheduleRecord[]}
---@alias PlayerIdentification uint | string | LuaPlayer
---@alias PollutionMapSettings {enabled: boolean, diffusion_ratio: double, min_to_diffuse: double, ageing: double, expected_max_per_chunk: double, min_to_show_per_chunk: double, min_pollution_to_damage_trees: double, pollution_with_max_forest_damage: double, pollution_per_tree_damage: double, pollution_restored_per_tree_damage: double, max_pollution_to_restore_trees: double, enemy_attack_pollution_consumption_modifier: double}
---@alias PrintSettings {color: Color, sound: defines.print_sound, skip: defines.print_skip, sound_path: SoundPath, volume_modifier: float, game_state: boolean}
---@alias Product ItemProduct | FluidProduct | ResearchProgressProduct
---@alias ProgrammableSpeakerAlertParameters {show_alert: boolean, show_on_map: boolean, icon_signal_id: SignalID, alert_message: string}
---@alias ProgrammableSpeakerCircuitParameters {signal_value_is_pitch: boolean, instrument_id: uint, note_id: uint}
---@alias ProgrammableSpeakerInstrument {name: string, notes: string[]}
---@alias ProgrammableSpeakerParameters {playback_volume: float, playback_mode: ProgrammableSpeakerPlaybackMode, allow_polyphony: boolean}
---@alias ProgrammableSpeakerPlaybackMode "local" | "surface" | "global"
---@alias PropertyExpressionNames table<string, string>
---@alias PrototypeFilter (ModSettingPrototypeFilter | TilePrototypeFilter | DecorativePrototypeFilter | RecipePrototypeFilter | AchievementPrototypeFilter | TechnologyPrototypeFilter | AsteroidChunkPrototypeFilter | ItemPrototypeFilter | EquipmentPrototypeFilter | EntityPrototypeFilter | SpaceLocationPrototypeFilter | FluidPrototypeFilter)[]
---@alias PrototypeFilterMode "none" | "whitelist" | "blacklist"
---@alias PrototypeHistory {created: string, changed: string[]}
---@alias QualityCondition {quality: string, comparator: ComparatorString} | string
---@alias QualityID LuaQualityPrototype | string
---@alias RadiusVisualisationSpecification {distance: double, offset: Vector, draw_in_cursor: boolean, draw_on_selection: boolean}
---@alias RailEndGoal {rail: LuaEntity, direction: defines.rail_direction, priority: uint8}
---@alias RailEndStart {rail: LuaEntity, direction: defines.rail_direction, allow_path_within_segment: boolean, is_front: boolean, priority: uint8}
---@alias RailExtensionData {name: string, position: MapPosition, direction: defines.direction, goal: RailLocation}
---@alias RailLocation {position: MapPosition, direction: defines.direction, rail_layer: defines.rail_layer}
---@alias RaiseEventParameters table
---@alias RangeMode "center-to-center" | "bounding-box-to-bounding-box" | "center-to-bounding-box"
---@alias RealOrientation float
---@alias RecipeID LuaRecipePrototype | LuaRecipe | string
---@alias RecipeIDAndQualityIDPair {name: RecipeID, quality: QualityID}
---@alias RecipePrototypeFilter {filter: "enabled" | "hidden" | "hidden-from-flow-stats" | "hidden-from-player-crafting" | "allow-as-intermediate" | "allow-intermediates" | "allow-decomposition" | "always-show-made-in" | "always-show-products" | "show-amount-in-title" | "has-ingredients" | "has-products" | "has-ingredient-item" | "has-ingredient-fluid" | "has-product-item" | "has-product-fluid" | "subgroup" | "category" | "energy" | "emissions-multiplier" | "request-paste-multiplier" | "overload-multiplier", mode: "or" | "and", invert: boolean}
---@alias RegistrationTarget LuaEntity | LuaEquipment | LuaEquipmentGrid | LuaItem | LuaLogisticCell | LuaLogisticNetwork | LuaLogisticSection | LuaPermissionGroup | LuaPlanet | LuaPlayer | LuaRailPath | LuaRenderObject | LuaSpacePlatform | LuaSurface | LuaTrain | LuaCommandable | LuaCustomChartTag | LuaGuiElement
---@alias RenderLayer string | "zero" | "background-transitions" | "under-tiles" | "decals" | "above-tiles" | "ground-layer-1" | "ground-layer-2" | "ground-layer-3" | "ground-layer-4" | "ground-layer-5" | "lower-radius-visualization" | "radius-visualization" | "transport-belt-integration" | "resource" | "building-smoke" | "rail-stone-path-lower" | "rail-stone-path" | "rail-tie" | "decorative" | "ground-patch" | "ground-patch-higher" | "ground-patch-higher2" | "rail-chain-signal-metal" | "rail-screw" | "rail-metal" | "remnants" | "floor" | "transport-belt" | "transport-belt-endings" | "floor-mechanics-under-corpse" | "corpse" | "floor-mechanics" | "item" | "transport-belt-reader" | "lower-object" | "transport-belt-circuit-connector" | "lower-object-above-shadow" | "lower-object-overlay" | "object-under" | "object" | "cargo-hatch" | "higher-object-under" | "higher-object-above" | "train-stop-top" | "item-in-inserter-hand" | "above-inserter" | "wires" | "under-elevated" | "elevated-rail-stone-path-lower" | "elevated-rail-stone-path" | "elevated-rail-tie" | "elevated-rail-screw" | "elevated-rail-metal" | "elevated-lower-object" | "elevated-object" | "elevated-higher-object" | "fluid-visualization" | "wires-above" | "entity-info-icon" | "entity-info-icon-above" | "explosion" | "projectile" | "smoke" | "air-object" | "air-entity-info-icon" | "light-effect" | "selection-box" | "higher-selection-box" | "collision-selection-box" | "arrow" | "cursor"
---@alias ResearchIngredient {name: string, amount: uint16}
---@alias ResearchProgressProduct {type: "research-progress", research_item: string, amount: double}
---@alias ResearchTrigger {type: "craft-item" | "mine-entity" | "craft-fluid" | "send-item-to-orbit" | "capture-spawner" | "build-entity" | "create-space-platform"}
---@alias Resistance {decrease: float, percent: float}
---@alias RidingState {acceleration: defines.riding.acceleration, direction: defines.riding.direction}
---@alias RollingStockDrawData {position: MapPosition, orientation: RealOrientation, slope: float, height: float}
---@alias ScheduleRecord {station: string, rail: LuaEntity, rail_direction: defines.rail_direction, wait_conditions: WaitCondition[], temporary: boolean}
---@alias ScriptArea {area: BoundingBox, name: string, color: Color, id: uint}
---@alias ScriptPosition {position: MapPosition, name: string, color: Color, id: uint}
---@alias ScriptRenderTarget LuaEntity | MapPosition | ScriptRenderTargetTable
---@alias ScriptRenderTargetTable {entity: LuaEntity, offset: Vector, position: MapPosition}
---@alias ScrollPolicy "never" | "dont-show-but-allow-scrolling" | "always" | "auto" | "auto-and-reserve-space"
---@alias SelectedPrototypeData {base_type: string, derived_type: string, name: string}
---@alias SelectionModeFlags table<"blueprint" | "deconstruct" | "cancel-deconstruct" | "items" | "trees" | "buildable-type" | "nothing" | "items-to-place" | "any-entity" | "any-tile" | "same-force" | "not-same-force" | "friend" | "enemy" | "upgrade" | "cancel-upgrade" | "downgrade" | "entity-with-health" | "is-military-target" | "entity-with-owner" | "avoid-rolling-stock" | "avoid-vehicle" | "controllable" | "controllable-add" | "controllable-remove" | "entity-ghost" | "tile-ghost", true>
---@alias SelectorCombinatorParameters {index_signal: SignalID, index_constant: uint, count_signal: SignalID, operation: string, select_max: boolean}
---@alias Signal {signal: SignalID, count: int}
---@alias SignalFilter {type: SignalIDType, name: string, quality: QualityID, comparator: ComparatorString} | string
---@alias SignalID {type: SignalIDType, name: string}
---@alias SignalIDType "item" | "fluid" | "virtual" | "entity" | "recipe" | "space-location" | "asteroid-chunk" | "quality"
---@alias SimpleItemStack string | ItemStackDefinition
---@alias SmokeSource {name: string, frequency: float, offset: float, position: Vector, north_position: Vector, north_east_position: Vector, east_position: Vector, south_east_position: Vector, south_position: Vector, south_west_position: Vector, west_position: Vector, north_west_position: Vector, deviation: MapPosition, starting_frame: uint16, starting_frame_deviation: uint16, height: float, height_deviation: float, starting_vertical_speed: float, starting_vertical_speed_deviation: float, vertical_speed_slowdown: float}
---@alias SoundPath string
---@alias SoundType "game-effect" | "gui-effect" | "ambient" | "environment" | "walking" | "alert" | "wind" | "world-ambient" | "weapon" | "explosion" | "enemy"
---@alias SpaceConnectionAsteroidSpawnDefinition {type: string, asteroid: string, spawn_points: SpaceConnectionAsteroidSpawnPoint[]}
---@alias SpaceConnectionAsteroidSpawnPoint {probability: double, speed: double, distance: double}
---@alias SpaceLocationAsteroidSpawnDefinition {type: string, asteroid: string, probability: double, speed: double}
---@alias SpaceLocationID LuaSpaceLocationPrototype | string
---@alias SpaceLocationPrototypeFilter {filter: "fly-condition" | "type" | "solar-power-in-space", mode: "or" | "and", invert: boolean}
---@alias SpacePlatformIdentification LuaSpacePlatform
---@alias SpawnPointDefinition {evolution_factor: double, weight: double}
---@alias SpoilToTriggerResult {items_per_trigger: uint, trigger: TriggerItem[]}
---@alias SpritePath string
---@alias SteeringMapSetting {radius: double, separation_factor: double, separation_force: double, force_unit_fuzzy_goto_behavior: boolean}
---@alias SteeringMapSettings {default: SteeringMapSetting, moving: SteeringMapSetting}
---@alias SurfaceCondition {property: string, min: double, max: double}
---@alias SurfaceIdentification uint | string | LuaSurface
---@alias SurfacePropertyID LuaSurfacePropertyPrototype | string
---@alias SwitchState "left" | "right" | "none"
---@alias TabAndContent {tab: LuaGuiElement, content: LuaGuiElement}
---@alias Tags table<string, AnyBasic>
---@alias TargetType "entity" | "position" | "direction"
---@alias TechnologyID LuaTechnologyPrototype | LuaTechnology | string
---@alias TechnologyModifier {type: ModifierType}
---@alias TechnologyPrototypeFilter {filter: "enabled" | "hidden" | "upgrade" | "visible-when-disabled" | "has-effects" | "has-prerequisites" | "research-unit-ingredient" | "unlocks-recipe" | "level" | "max-level" | "time", mode: "or" | "and", invert: boolean}
---@alias TerritorySettings {units: string[], territory_index_expression: string, territory_variation_expression: string, minimum_territory_size: uint}
---@alias TextAlign "left" | "right" | "center"
---@alias Tile {position: TilePosition, name: string}
---@alias TileID LuaTilePrototype | LuaTile | string
---@alias TilePosition {x: int, y: int} | (tuple<int, int>)
---@alias TilePrototypeFilter {filter: "minable" | "autoplace" | "blueprintable" | "item-to-place" | "collision-mask" | "walking-speed-modifier" | "vehicle-friction-modifier" | "decorative-removal-probability" | "absorptions-per-second", mode: "or" | "and", invert: boolean}
---@alias TileSearchFilters {area: BoundingBox, position: MapPosition, radius: double, name: TileID | TileID[], limit: uint, has_hidden_tile: boolean, has_double_hidden_tile: boolean, has_tile_ghost: boolean, to_be_deconstructed: boolean, collision_mask: CollisionLayerID | CollisionLayerID[] | (table<CollisionLayerID, true>), force: ForceSet, invert: boolean}
---@alias TrainFilter {train_id: uint, surface: SurfaceIdentification, force: ForceID, stock: EntityID | EntityID[], min_stocks: uint, max_stocks: uint, is_moving: boolean, has_passenger: boolean, is_manual: boolean}
---@alias TrainPathAllGoalsResult {amount_accessible: uint, accessible: boolean[], penalties: double[], steps_count: uint}
---@alias TrainPathFinderGoal TrainStopGoal | RailEndGoal | LuaRailEnd | LuaEntity
---@alias TrainPathFinderOneGoalResult {found_path: boolean, goal_index: uint, start_index: uint, penalty: double, is_front: boolean, total_length: double, path: LuaEntity[], steps_count: uint}
---@alias TrainPathRequestType "path" | "any-goal-accessible" | "all-goals-accessible" | "all-goals-penalties"
---@alias TrainSchedule {current: uint, records: ScheduleRecord[]}
---@alias TrainStopFilter {surface: SurfaceIdentification, force: ForceID, is_full: boolean, is_connected_to_rail: boolean, type: EntityID | EntityID[], station_name: string | string[], limit_set_by_control_behavior: boolean, is_disabled: boolean}
---@alias TrainStopGoal {train_stop: LuaEntity, priority: uint8}
---@alias TriggerDelivery {type: "instant" | "projectile" | "beam" | "stream" | "artillery" | "chain" | "delayed", source_effects: TriggerEffectItem[], target_effects: TriggerEffectItem[]}
---@alias TriggerEffectItem {type: TriggerEffectItemType, repeat_count: uint16, repeat_count_deviation: uint16, probability: float, affects_target: boolean, show_in_tooltip: boolean, damage_type_filters: DamageTypeFilters}
---@alias TriggerEffectItemType "damage" | "create-entity" | "create-explosion" | "create-fire" | "create-smoke" | "create-trivial-smoke" | "create-asteroid-chunk" | "create-particle" | "create-sticker" | "create-decorative" | "nested-result" | "play-sound" | "push-back" | "destroy-cliffs" | "show-explosion-on-chart" | "insert-item" | "script" | "set-tile" | "invoke-tile-trigger" | "destroy-decoratives" | "camera-effect" | "activate-impact"
---@alias TriggerItem {type: "direct" | "area" | "line" | "cluster", action_delivery: TriggerDelivery[], entity_flags: EntityPrototypeFlags, ignore_collision_condition: boolean, collision_mask: CollisionMask, trigger_target_mask: TriggerTargetMask, force: ForceCondition, repeat_count: uint, probability: float}
---@alias TriggerTargetMask table<string, true>
---@alias TrivialSmokeID LuaTrivialSmokePrototype | string
---@alias UndoRedoAction {type: string, tags: Tags}
---@alias UnitGroupMapSettings {min_group_gathering_time: uint, max_group_gathering_time: uint, max_wait_time_for_late_members: uint, min_group_radius: double, max_group_radius: double, max_member_speedup_when_behind: double, max_member_slowdown_when_ahead: double, max_group_slowdown_factor: double, max_group_member_fallback_factor: double, member_disown_distance: double, tick_tolerance_when_member_arrives: uint, max_gathering_unit_groups: uint, max_unit_group_size: uint}
---@alias UnitSpawnDefinition {unit: string, spawn_points: SpawnPointDefinition[]}
---@alias UpgradeMapperDestination {type: string, name: string, quality: string, count: uint}
---@alias UpgradeMapperSource {type: "item" | "entity", name: string, quality: string, comparator: ComparatorString}
---@alias Vector {x: float, y: float} | (tuple<float, float>)
---@alias Vector3D {x: float, y: float, z: float} | (tuple<float, float, float>)
---@alias VehicleAutomaticTargetingParameters {auto_target_without_gunner: boolean, auto_target_with_gunner: boolean}
---@alias VerticalTextAlign "top" | "middle" | "baseline" | "bottom"
---@alias VirtualSignalID LuaVirtualSignalPrototype | string
---@alias WaitCondition {type: WaitConditionType, compare_type: "and" | "or", ticks: uint, condition: CircuitCondition | ItemIDAndQualityIDPair, planet: string, station: string, damage: uint}
---@alias WaitConditionType "time" | "full" | "empty" | "not_empty" | "item_count" | "circuit" | "inactivity" | "robots_inactive" | "fluid_count" | "passenger_present" | "passenger_not_present" | "fuel_item_count_all" | "fuel_item_count_any" | "fuel_full" | "destination_full_or_no_path" | "request_satisfied" | "request_not_satisfied" | "all_requests_satisfied" | "any_request_not_satisfied" | "any_request_zero" | "any_planet_import_zero" | "specific_destination_full" | "specific_destination_not_full" | "at_station" | "not_at_station" | "damage_taken"
---@alias WireConnection {target: LuaWireConnector, origin: defines.wire_origin}
---@alias WorkerRobotOrder {type: defines.robot_order_type, target: LuaEntity, item_to_place: SimpleItemStack, secondary_target: LuaEntity, cliff_explosive_id: LuaItemPrototype, target_item: ItemIDAndQualityIDPair, target_count: ItemCountType}
---@alias double number
---@alias float number
---@alias int number
---@alias int8 number
---@alias uint number
---@alias uint16 number
---@alias uint64 number
---@alias uint8 number


--- classes

---@class LuaAISettings: any @Collection of settings for overriding default ai behavior.
---@field allow_destroy_when_commands_fail boolean @If enabled, units that repeatedly fail to succeed at commands will be destroyed.
---@field allow_try_return_to_spawner boolean @If enabled, units that have nothing else to do will attempt to return to a spawner.
---@field do_separation boolean @If enabled, units will try to separate themselves from nearby friendly units.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field path_resolution_modifier int8 @Defines how coarse the pathfinder's grid is, where smaller values mean a coarser grid. Defaults to `0`, which equals a resolution of `1x1` tiles, centered on tile centers. Values range from `-8` to `8` inclusive, where each integer increment doubles/halves the resolution. So, a resolution of `-8` equals a grid of `256x256` tiles, and a resolution of `8` equals `1/256` of a tile.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAISettings = {}

---@class LuaAccumulatorControlBehavior: LuaControlBehavior @Control behavior for accumulators.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field output_signal SignalID @ nilable
---@field read_charge boolean @`true` if this accumulator sends its charge percent to circuit network.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAccumulatorControlBehavior = {}

---@class LuaAchievementPrototype: LuaPrototypeBase @Prototype of a achievement.
---@field allowed_without_fight boolean
---@field alternative_armor LuaItemPrototype @ nilable
---@field ammo_type LuaItemPrototype @ nilable
---@field amount uint @ nilable
---@field armor LuaItemPrototype @ nilable
---@field count uint @ nilable
---@field damage_dealer LuaEntityPrototype[] @ nilable
---@field damage_type LuaDamagePrototype @ nilable
---@field dont_build LuaEntityPrototype[] @ nilable
---@field dont_research LuaItemPrototype[] @ nilable
---@field excluded LuaEntityPrototype[] @ nilable
---@field fluid_product LuaFluidPrototype @ nilable
---@field in_vehicle boolean @ nilable
---@field included LuaEntityPrototype[] @ nilable
---@field item_product LuaItemPrototype @ nilable
---@field last_hour_only boolean @ nilable
---@field limit_equip_quality LuaQualityPrototype @ nilable
---@field limit_quality LuaQualityPrototype @ nilable
---@field limited_to_one_game boolean @ nilable
---@field minimum_damage float @ nilable
---@field minimum_distance double @ nilable
---@field minimum_energy_produced double @ nilable
---@field module LuaItemPrototype @ nilable
---@field more_than_manually boolean @ nilable
---@field not_to_kill LuaEntityPrototype @ nilable
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field objective_condition string @ nilable
---@field personally boolean @ nilable
---@field quality LuaQualityPrototype @ nilable
---@field research_all boolean @ nilable
---@field research_with LuaItemPrototype[] @ nilable
---@field science_pack LuaItemPrototype @ nilable
---@field should_survive boolean @ nilable
---@field surface string @ nilable
---@field technology LuaTechnologyPrototype @ nilable
---@field to_build LuaEntityPrototype @ nilable
---@field to_kill LuaEntityPrototype[] @ nilable
---@field to_use LuaItemPrototype @ nilable
---@field type_not_to_kill string @ nilable
---@field type_of_dealer string @ nilable
---@field type_to_kill string @ nilable
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field within uint @ nilable
LuaAchievementPrototype = {}

---@class LuaActiveTriggerPrototype: LuaPrototypeBase @Prototype of an Active Trigger.
---@field fork_chance double @The chance that a new fork will spawn after each jump [0,1]. default = 0.
---@field jump_delay_ticks uint @The tick delay between each jump. 0 = all jumps instantaneous. default = 0.
---@field max_forks uint @maximum number of forks allowed to spawn for the entire chain. default = infinity.
---@field max_forks_per_jump uint @The maximum number of forks that can spawn from a single jump. default = 1.
---@field max_jumps uint @The max number of jumps per trigger. default = 5.
---@field max_range double @The max distance jumps are allowed to travel away from the original target. default = infinity.
---@field max_range_per_jump double @The max length of jumps. default = 5.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaActiveTriggerPrototype = {}

---@class LuaAgriculturalTowerControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for agricultural tower
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_contents boolean @`true` if the agricultural tower reads seeds and harvested plants.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAgriculturalTowerControlBehavior = {}

---@class LuaAirbornePollutantPrototype: LuaPrototypeBase @Airborne pollutant prototype.
---@field affects_evolution boolean
---@field chart_color Color
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAirbornePollutantPrototype = {}

---@class LuaAmmoCategoryPrototype: LuaPrototypeBase @Prototype of a ammo category.
---@field bonus_gui_order string
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAmmoCategoryPrototype = {}

---@class LuaArithmeticCombinatorControlBehavior: LuaCombinatorControlBehavior @Control behavior for arithmetic combinators.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field parameters ArithmeticCombinatorParameters @This arithmetic combinator's parameters. Writing `nil` clears the combinator's parameters.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaArithmeticCombinatorControlBehavior = {}

---@class LuaArtilleryTurretControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for artillery turrets.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_ammo boolean @`true` if the turret will send the ammunition or fluid it contains to the circuit network.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaArtilleryTurretControlBehavior = {}

---@class LuaAssemblingMachineControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for assembling machines.
---@field circuit_read_contents boolean @`true` if the assembling machine reads its ingredients contents, product contents, materials in crafting and trash inventories.
---@field circuit_read_ingredients boolean @`true` if the assembling machine outputs ingredients of current recipe as a signals to circuit network.
---@field circuit_read_recipe_finished boolean @`true` if the the assembling machine sends a signal when the recipe finishes.
---@field circuit_read_working boolean @`true` if the the assembling machine sends a signal when it is working.
---@field circuit_recipe_finished_signal SignalID @ nilable; The signal sent when the assembling machine finishes a recipe.
---@field circuit_set_recipe boolean @`true` if the assembling machine sets its recipe from the circuit network.
---@field circuit_working_signal SignalID @ nilable; The signal sent when the assembling machine is working.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAssemblingMachineControlBehavior = {}

---@class LuaAsteroidChunkPrototype: LuaPrototypeBase @Prototype of an asteroid chunk.
---@field collision_box BoundingBox
---@field hide_from_signal_gui boolean
---@field item_signal_alias LuaItemPrototype @ nilable
---@field mineable_properties MineableProperties
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAsteroidChunkPrototype = {}

---@class LuaAsteroidCollectorControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for asteroid collectors.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_content boolean @`true` if this asteroid collector reads its content and sends it to a circuit network
---@field set_filter boolean @`true` if this asteroid collector has filters set from circuit network
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAsteroidCollectorControlBehavior = {}

---@class LuaAutoplaceControlPrototype: LuaPrototypeBase @Prototype of an autoplace control.
---@field can_be_disabled boolean
---@field category "resource" | "terrain" | "cliff" | "enemy" @Category name of this prototype.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field richness boolean
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaAutoplaceControlPrototype = {}

---@class LuaBootstrap: any @Entry point for registering event handlers. It is accessible through the global object named `script`.
---@field active_mods table<string, string> @A dictionary listing the names of all currently active mods and mapping them to their version.
---@field feature_flags {quality: boolean, rail_bridges: boolean, space_travel: boolean, spoiling: boolean, freezing: boolean, segmented_units: boolean, expansion_shaders: boolean} @A dictionary of feature flags mapping to whether they are enabled.
---@field level {is_simulation: boolean, is_tutorial: boolean, campaign_name: string, level_name: string, mod_name: string} @Information about the currently running scenario/campaign/tutorial.
---@field mod_name string @The name of the mod from the environment this is used in.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
LuaBootstrap = {}

--- Generate a new, unique event ID that can be used to raise custom events with [LuaBootstrap::raise_event](runtime:LuaBootstrap::raise_event).
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

--- Register a function to be run when mod configuration changes.
--- This is called when the game version or any mod version changed, when any mod was added or removed, when a startup setting has changed, when any prototypes have been added or removed, or when a migration was applied. It allows the mod to make any changes it deems appropriate to both the data structures in its [storage](runtime:storage) table or to the game state through [LuaGameScript](runtime:LuaGameScript).
--- For more context, refer to the [Data Lifecycle](runtime:data-lifecycle) page.
---@param handler (fun(p0: ConfigurationChangedData)) | nil @The handler for this event. Passing `nil` will unregister it.
function LuaBootstrap.on_configuration_changed(handler) end

--- Register a handler to run on the specified event(s). Each mod can only register once for every event, as any additional registration will overwrite the previous one. This holds true even if different filters are used for subsequent registrations.
---@param event defines.events | string | ((defines.events | string)[]) @The event(s) or custom-input to invoke the handler on.
---@param handler (fun(p0: EventData)) | nil @The handler for this event. Passing `nil` will unregister it.
---@param filters EventFilter|nil @The filters for this event. Can only be used when registering for individual events.
---@overload fun(event: defines.events | string | ((defines.events | string)[]), handler: (fun(p0: EventData)) | nil)
function LuaBootstrap.on_event(event, handler, filters) end

--- Register a function to be run on mod initialization.
--- This is only called when a new save game is created or when a save file is loaded that previously didn't contain the mod. During it, the mod gets the chance to set up initial values that it will use for its lifetime. It has full access to [LuaGameScript](runtime:LuaGameScript) and the [storage](runtime:storage) table and can change anything about them that it deems appropriate. No other events will be raised for the mod until it has finished this step.
--- For more context, refer to the [Data Lifecycle](runtime:data-lifecycle) page.
---@param handler (fun()) | nil @The handler for this event. Passing `nil` will unregister it.
function LuaBootstrap.on_init(handler) end

--- Register a function to be run on save load. This is only called for mods that have been part of the save previously, or for players connecting to a running multiplayer session.
--- It gives the mod the opportunity to rectify potential differences in local state introduced by the save/load cycle. Doing anything other than the following three will lead to desyncs, breaking multiplayer and replay functionality. Access to [LuaGameScript](runtime:LuaGameScript) is not available. The [storage](runtime:storage) table can be accessed and is safe to read from, but not write to, as doing so will lead to an error.
--- The only legitimate uses of this event are these:
--- - Re-setup [metatables](https://www.lua.org/pil/13.html) as they are not persisted through the save/load cycle.
--- - Re-setup conditional event handlers, meaning subscribing to an event only when some condition is met to save processing time.
--- - Create local references to data stored in the [storage](runtime:storage) table.
--- For all other purposes, [LuaBootstrap::on_init](runtime:LuaBootstrap::on_init), [LuaBootstrap::on_configuration_changed](runtime:LuaBootstrap::on_configuration_changed) or [migrations](runtime:migrations) should be used instead.
--- For more context, refer to the [Data Lifecycle](runtime:data-lifecycle) page.
---@param handler (fun()) | nil @The handler for this event. Passing `nil` will unregister it.
function LuaBootstrap.on_load(handler) end

--- Register a handler to run every nth-tick(s). When the game is on tick 0 it will trigger all registered handlers.
---@param tick uint | uint[] | nil @The nth-tick(s) to invoke the handler on. Passing `nil` as the only parameter will unregister all nth-tick handlers.
---@param handler (fun(p0: NthTickEventData)) | nil @The handler to run. Passing `nil` will unregister it for the provided nth-tick(s).
function LuaBootstrap.on_nth_tick(tick, handler) end

---@class LuaBootstrap_raise_biter_base_built_params
---@field entity LuaEntity @The entity that was built.

---@param p LuaBootstrap_raise_biter_base_built_params
function LuaBootstrap.raise_biter_base_built(p) end

---@class LuaBootstrap_raise_console_chat_params
---@field player_index uint @The player doing the chatting.
---@field message string @The chat message to send.

---@param p LuaBootstrap_raise_console_chat_params
function LuaBootstrap.raise_console_chat(p) end

--- Raise an event. Only events generated with [LuaBootstrap::generate_event_name](runtime:LuaBootstrap::generate_event_name) and the following can be raised:
---@param event uint | string @ID or name of the event to raise.
---@param data table @Table with extra data that will be passed to the event handler. Any invalid LuaObjects will silently stop the event from being raised.
function LuaBootstrap.raise_event(event, data) end

---@class LuaBootstrap_raise_market_item_purchased_params
---@field player_index uint @The player who did the purchasing.
---@field market LuaEntity @The market entity.
---@field offer_index uint @The index of the offer purchased.
---@field count uint @The amount of offers purchased.

---@param p LuaBootstrap_raise_market_item_purchased_params
function LuaBootstrap.raise_market_item_purchased(p) end

---@class LuaBootstrap_raise_player_crafted_item_params
---@field item_stack LuaItemStack @The item that has been crafted.
---@field player_index uint @The player doing the crafting.
---@field recipe RecipeID @The recipe used to craft this item.

---@param p LuaBootstrap_raise_player_crafted_item_params
function LuaBootstrap.raise_player_crafted_item(p) end

---@class LuaBootstrap_raise_player_fast_transferred_params
---@field player_index uint @The player transferred from or to.
---@field entity LuaEntity @The entity transferred from or to.
---@field from_player boolean @Whether the transfer was from player to entity. If `false`, the transfer was from entity to player.
---@field is_split boolean @Whether the transfer was a split action (half stack).

---@param p LuaBootstrap_raise_player_fast_transferred_params
function LuaBootstrap.raise_player_fast_transferred(p) end

---@class LuaBootstrap_raise_script_built_params
---@field entity LuaEntity @The entity that has been built.

---@param p LuaBootstrap_raise_script_built_params
function LuaBootstrap.raise_script_built(p) end

---@class LuaBootstrap_raise_script_destroy_params
---@field entity LuaEntity @The entity that was destroyed.

---@param p LuaBootstrap_raise_script_destroy_params
function LuaBootstrap.raise_script_destroy(p) end

---@class LuaBootstrap_raise_script_revive_params
---@field entity LuaEntity @The entity that was revived.
---@field tags Tags|nil @The tags associated with this entity, if any.

---@param p LuaBootstrap_raise_script_revive_params
function LuaBootstrap.raise_script_revive(p) end

---@class LuaBootstrap_raise_script_set_tiles_params
---@field surface_index uint @The surface whose tiles have been changed.
---@field tiles Tile[] @The tiles that have been changed.

---@param p LuaBootstrap_raise_script_set_tiles_params
function LuaBootstrap.raise_script_set_tiles(p) end

---@class LuaBootstrap_raise_script_teleported_params
---@field entity LuaEntity @The entity that was teleported.
---@field old_surface_index uint8 @The entity's surface before the teleportation.
---@field old_position MapPosition @The entity's position before the teleportation.

---@param p LuaBootstrap_raise_script_teleported_params
function LuaBootstrap.raise_script_teleported(p) end

--- Register a metatable to have linkage recorded and restored when saving/loading.
--- The metatable itself will not be saved. Instead, only the linkage to a registered metatable is saved, and the metatable registered under that name will be used when loading the table.
--- `register_metatable()` can not be used in the console, in event listeners or during a `remote.call()`.
--- The metatable first needs to be defined in the mod's root scope, then registered using this method. From then on, it will be properly restored for tables in [storage](runtime:storage).
--- ```
--- local metatable = {
---   __index = function(key)
---     return "no value for key " .. key
---   end
--- }
--- script.register_metatable("my_metatable", metatable)
--- ```
--- This previously defined `metatable` can then be set on any table as usual:
--- ```
--- local table = {key="value"}
--- setmetatable(table, metatable)
--- ```
---@param name string @The name of this metatable. Names must be unique per mod.
---@param metatable table @The metatable to register.
function LuaBootstrap.register_metatable(name, metatable) end

--- Registers an object so that after it's destroyed, [on_object_destroyed](runtime:on_object_destroyed) is called.
--- Once an object is registered, it stays registered until it is actually destroyed, even through save/load cycles. The registration is global across all mods, meaning once one mod registers an object, all mods listening to [on_object_destroyed](runtime:on_object_destroyed) will receive the event when it is destroyed. Registering the same object multiple times will still only fire the destruction event once, and will return the same registration number.
--- Depending on when a given object is destroyed, [on_object_destroyed](runtime:on_object_destroyed) will either be fired at the end of the current tick or at the end of the next tick.
---@param object RegistrationTarget @The object to register.
---@return uint64, uint64, defines.target_type @The registration number. It is used to identify the object in the [on_object_destroyed](runtime:on_object_destroyed) event.; Useful identifier of the object if it has one. This identifier is specific to the object type, for example for trains it is the value [LuaTrain::id](runtime:LuaTrain::id).; Type of the target object.
function LuaBootstrap.register_on_object_destroyed(object) end

--- Sets the filters for the given event. The filters are only retained when set after the actual event registration, because registering for an event with different or no filters will overwrite previously set ones.
--- Limit the [on_marked_for_deconstruction](runtime:on_marked_for_deconstruction) event to only be received when a non-ghost entity is marked for deconstruction.
--- ```
--- script.set_event_filter(defines.events.on_marked_for_deconstruction, {{filter = "ghost", invert = true}})
--- ```
--- Limit the [on_built_entity](runtime:on_built_entity) event to only be received when either a `unit` or a `unit-spawner` is built.
--- ```
--- script.set_event_filter(defines.events.on_built_entity, {{filter = "type", type = "unit"}, {filter = "type", type = "unit-spawner"}})
--- ```
--- Limit the [on_entity_damaged](runtime:on_entity_damaged) event to only be received when a `rail` is damaged by an `acid` attack.
--- ```
--- script.set_event_filter(defines.events.on_entity_damaged, {{filter = "rail"}, {filter = "damage-type", type = "acid", mode = "and"}})
--- ```
---@param event uint @ID of the event to filter.
---@param filters EventFilter|nil @The filters or `nil` to clear them.
---@overload fun(event: uint)
function LuaBootstrap.set_event_filter(event, filters) end

---@class LuaBurner: any @A reference to the burner energy source owned by a specific [LuaEntity](runtime:LuaEntity) or [LuaEquipment](runtime:LuaEquipment).
---@field burnt_result_inventory LuaInventory @The burnt result inventory.
---@field currently_burning ItemIDAndQualityIDPair  | ItemWithQualityID @ nilable; The currently burning item. Writing `nil` will void the currently burning item without producing a [LuaBurner::burnt_result](runtime:LuaBurner::burnt_result). Writing to this automatically handles correcting [LuaBurner::remaining_burning_fuel](runtime:LuaBurner::remaining_burning_fuel).
---@field fuel_categories table<string, true> @The fuel categories this burner uses. The value in the dictionary is meaningless and exists just to allow for easy lookup.
---@field heat double @The current heat (energy) stored in this burner.
---@field heat_capacity double @The maximum heat (maximum energy) that this burner can store.
---@field inventory LuaInventory @The fuel inventory.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field owner LuaEntity | LuaEquipment @The owner of this burner energy source
---@field remaining_burning_fuel double @The amount of energy left in the currently-burning fuel item. Writing to this will silently do nothing if there's no [LuaBurner::currently_burning](runtime:LuaBurner::currently_burning) set.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaBurner = {}

---@class LuaBurnerPrototype: any @Prototype of a burner energy source.
---@field burnt_inventory_size uint
---@field effectivity double
---@field emissions_per_joule table<string, double> @The table of emissions of this energy source in `pollution/Joule`, indexed by pollutant type. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
---@field fuel_categories table<string, true> @The value in the dictionary is meaningless and exists just to allow for easy lookup.
---@field fuel_inventory_size uint
---@field light_flicker {minimum_intensity: float, maximum_intensity: float, derivation_change_frequency: float, derivation_change_deviation: float, border_fix_speed: float, minimum_light_size: float, light_intensity_to_size_coefficient: float, color: Color} @ nilable; The light flicker definition for this burner prototype.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field render_no_network_icon boolean
---@field render_no_power_icon boolean
---@field smoke SmokeSource[] @ nilable; The smoke sources for this burner prototype.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaBurnerPrototype = {}

---@class LuaBurnerUsagePrototype: LuaPrototypeBase @Description of burner usage.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaBurnerUsagePrototype = {}

---@class LuaCargoLandingPadControlBehavior: LuaControlBehavior @Control behavior for cargo landing pad.
---@field circuit_exclusive_mode_of_operation defines.control_behavior.cargo_landing_pad.exclusive_mode @The circuit mode of operations for the cargo landing pad.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaCargoLandingPadControlBehavior = {}

---@class LuaChunkIterator: any @A chunk iterator can be used for iterating chunks coordinates of a surface. The returned type is a [ChunkPositionAndArea](runtime:ChunkPositionAndArea) containing the chunk coordinates and its area.
---@overload fun(): ChunkPositionAndArea|nil
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaChunkIterator = {}

---@class LuaCircuitNetwork: any @A circuit network associated with a given entity, connector, and wire type.
---@field connected_circuit_count uint @The number of circuits connected to this network.
---@field entity LuaEntity @The entity this circuit network reference is associated with.
---@field network_id uint @The circuit networks ID.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field signals Signal[] @ nilable; The circuit network signals last tick. `nil` if there were no signals last tick.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field wire_connector_id defines.wire_connector_id @Wire connector ID on associated entity this network was gotten from.
---@field wire_type defines.wire_type @The wire type this network is associated with.
LuaCircuitNetwork = {}

---@param signal SignalID @The signal to read.
---@return int @The current value of the signal.
function LuaCircuitNetwork.get_signal(signal) end

---@class LuaCollisionLayerPrototype: LuaPrototypeBase @Prototype of a collision layer.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaCollisionLayerPrototype = {}

---@class LuaCombinatorControlBehavior: LuaControlBehavior
---@field signals_last_tick Signal[] @The circuit network signals sent by this combinator last tick.
LuaCombinatorControlBehavior = {}

--- Gets the value of a specific signal sent by this combinator behavior last tick or `nil` if the signal didn't exist.
---@param signal SignalID @The signal to get
---@return int
function LuaCombinatorControlBehavior.get_signal_last_tick(signal) end

---@class LuaCommandProcessor: any @Allows for the registration of custom console commands through the global object named `commands`. Similarly to [event subscriptions](runtime:LuaBootstrap::on_event), these don't persist through a save-and-load cycle.
---@field commands table<string, LocalisedString> @Lists the custom commands registered by scripts through `LuaCommandProcessor`.
---@field game_commands table<string, LocalisedString> @Lists the built-in commands of the core game. The [wiki](https://wiki.factorio.com/Console) has an overview of these.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
LuaCommandProcessor = {}

--- Add a custom console command.
--- Trying to add a command with the `name` of a game command or the name of a custom command that is already in use will result in an error.
--- This example command will register a custom event called `print_tick` that prints the current tick to either the player issuing the command or to everyone on the server, depending on the command parameter:
--- ```
--- commands.add_command("print_tick", nil, function(command)
---   if command.player_index ~= nil and command.parameter == "me" then
---     game.get_player(command.player_index).print(command.tick)
---   else
---     game.print(command.tick)
---   end
--- end)
--- ```
--- This shows the usage of the table that gets passed to any function handling a custom command. This specific example makes use of the `tick` and the optional `player_index` and `parameter` fields. The user is supposed to either call it without any parameter (`"/print_tick"`) or with the `"me"` parameter (`"/print_tick me"`).
---@param name string @The desired name of the command (case sensitive).
---@param help LocalisedString @The localised help message. It will be shown to players using the `/help` command.
---@param func fun(p0: CustomCommandData) @The function that will be called when this command is invoked.
function LuaCommandProcessor.add_command(name, help, func) end

--- Remove a custom console command.
---@param name string @The name of the command to remove (case sensitive).
---@return boolean @Whether the command was successfully removed. Returns `false` if the command didn't exist.
function LuaCommandProcessor.remove_command(name) end

---@class LuaCommandable: any @AI object which can be ordered commands. This can represent a UnitGroup (a set of multiple commandables) or can be a single Unit, SpiderUnit or other commandable entity.
---@field command Command @ nilable; The command of this commandable, if any.
---@field commandable_members LuaCommandable[] @Non recursively returns all members of this unit group.
---@field distraction_command Command @ nilable; The distraction command of this commandable, if any.
---@field entity LuaEntity @Returns entity object for this commandable.
---@field force LuaForce @The force of this commandable.
---@field has_command boolean @If this commandable has a command assigned.
---@field is_entity boolean @If this commandable is Entity.
---@field is_script_driven boolean @Whether this unit group is controlled by a script or by the game engine. This can be changed using [LuaCommandable::set_autonomous](runtime:LuaCommandable::set_autonomous).
---@field is_unit_group boolean @If this commandable is UnitGroup.
---@field members LuaEntity[] @All entity members of this unit group, recursive (if unit group is member of this unit group, its members will be returned here).
---@field moving_state defines.moving_state @Current moving state of the commandable's behavior
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field parent_group LuaCommandable @ nilable; The unit group this commandable is a member of, if any.
---@field position MapPosition @Current position of this commandable. If commandable is a UnitGroup, this can have different meanings depending on the group state. When the group is gathering, the position is the place of gathering. When the group is moving, the position is the expected position of its members along the path. When the group is attacking, it is the average position of its members.
---@field spawner LuaEntity @ nilable; The spawner associated with this commandable, if any.
---@field state defines.group_state @Whether this group is gathering, moving or attacking.
---@field surface LuaSurface @Surface this commandable is on.
---@field unique_id uint @Unique identifier of this commandable.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaCommandable = {}

--- Adds a member to this UnitGroup. Has the same effect as setting defines.command.group command on the member to join the group.
--- The member must have the same force be on the same surface as the group.
---@param member LuaCommandable | LuaEntity
function LuaCommandable.add_member(member) end

--- Destroys this commandable. If it is a unit group, members will not be destroyed, they will be merely unlinked from the group.
function LuaCommandable.destroy() end

--- Release the commandable from the spawner. This allows the spawner to continue spawning additional units.
function LuaCommandable.release_from_spawner() end

--- Make this group autonomous. Autonomous groups will automatically attack polluted areas. Autonomous groups aren't considered to be [script-driven](runtime:LuaCommandable::is_script_driven).
function LuaCommandable.set_autonomous() end

--- Give this commandable a command.
---@param command Command
function LuaCommandable.set_command(command) end

--- Give this commandable a distraction command.
---@param command Command
function LuaCommandable.set_distraction_command(command) end

--- Make the group start moving even if some of its members haven't yet arrived.
function LuaCommandable.start_moving() end

---@class LuaConstantCombinatorControlBehavior: LuaControlBehavior @Control behavior for constant combinators.
---@field enabled boolean @Turns this constant combinator on and off.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field sections LuaLogisticSection[] @All logistic sections of this constant combinator.
---@field sections_count uint @Amount of logistic sections this constant combinator has.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaConstantCombinatorControlBehavior = {}

--- Adds a new logistic section to this constant combinator if possible.
---@param group string|nil @The group to assign this section to.
---@overload fun(): LuaLogisticSection
---@return LuaLogisticSection @Logistic section if added.
function LuaConstantCombinatorControlBehavior.add_section(group) end

--- Gets section on the selected index, if it exists.
---@param section_index uint @Index of the section.
---@return LuaLogisticSection
function LuaConstantCombinatorControlBehavior.get_section(section_index) end

--- Removes the given logistic section if possible. Removal may fail if the section index is out of range or the section is not [manual](runtime:LuaLogisticSection::is_manual).
---@param section_index uint @Index of the section.
---@return boolean @Whether section was removed.
function LuaConstantCombinatorControlBehavior.remove_section(section_index) end

---@class LuaContainerControlBehavior: LuaControlBehavior @Control behavior for container entities.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_contents boolean @`true` if this container is sending its content to a circuit network
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaContainerControlBehavior = {}

---@class LuaControl: any @This is an abstract base class containing the common functionality between [LuaPlayer](runtime:LuaPlayer) and entities (see [LuaEntity](runtime:LuaEntity)). When accessing player-related functions through a [LuaEntity](runtime:LuaEntity), it must refer to a character entity.
---@field build_distance uint @The build distance of this character or max uint when not a character or player connected to a character.
---@field character_additional_mining_categories string[] @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_build_distance_bonus uint @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_crafting_speed_modifier double @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_health_bonus float @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_inventory_slots_bonus uint @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_item_drop_distance_bonus uint @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_item_pickup_distance_bonus uint @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_loot_pickup_distance_bonus uint @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_maximum_following_robot_count_bonus uint @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_mining_progress double @The current mining progress between 0 and 1 of this character, or 0 if they aren't mining.
---@field character_mining_speed_modifier double @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_reach_distance_bonus uint @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_resource_reach_distance_bonus uint @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_running_speed double @The current movement speed of this character, including effects from exoskeletons, tiles, stickers and shooting.
---@field character_running_speed_modifier double @Modifies the running speed of this character by the given value as a percentage. Setting the running modifier to `0.5` makes the character run 50% faster. The minimum value of `-1` reduces the movement speed by 100%, resulting in a speed of `0`. When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field character_trash_slot_count_bonus uint @When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field cheat_mode boolean @When `true` hand crafting is free and instant.
---@field crafting_queue CraftingQueueItem[] @The current crafting queue items.
---@field crafting_queue_progress double @The crafting queue progress in the range `[0-1]`. `0` when no recipe is being crafted.
---@field crafting_queue_size uint @Size of the crafting queue.
---@field cursor_ghost ItemIDAndQualityIDPair  | ItemWithQualityID @ nilable; The ghost prototype in the player's cursor. Items in the cursor stack will take priority over the cursor ghost.
---@field cursor_record LuaRecord @ nilable; The blueprint record in the player's cursor.
---@field cursor_stack LuaItemStack @ nilable; The player's cursor stack. `nil` if the player controller is a spectator.
---@field driving boolean @`true` if the player is in a vehicle. Writing to this attribute puts the player in or out of a vehicle.
---@field drop_item_distance uint @The item drop distance of this character or max uint when not a character or player connected to a character.
---@field following_robots LuaEntity[] @The current combat robots following the character. When called on a [LuaPlayer](runtime:LuaPlayer), it must be associated with a character (see [LuaPlayer::character](runtime:LuaPlayer::character)).
---@field force LuaForce  | ForceID @The force of this entity. Reading will always give a [LuaForce](runtime:LuaForce), but it is possible to assign either [string](runtime:string), [uint8](runtime:uint8) or [LuaForce](runtime:LuaForce) to this attribute to change the force.
---@field force_index uint @Unique [index](runtime:LuaForce::index) (ID) associated with the force of this entity.
---@field in_combat boolean @Whether this character entity is in combat.
---@field item_pickup_distance double @The item pickup distance of this character or max double when not a character or player connected to a character.
---@field loot_pickup_distance double @The loot pickup distance of this character or max double when not a character or player connected to a character.
---@field mining_state {mining: boolean, position: MapPosition} @Current mining state. When the player isn't mining tiles the player will mine whatever entity is currently selected. See [LuaControl::selected](runtime:LuaControl::selected) and [LuaControl::update_selected_entity](runtime:LuaControl::update_selected_entity).
---@field opened LuaEntity | LuaItemStack | LuaEquipment | LuaEquipmentGrid | LuaPlayer | LuaGuiElement | LuaInventory | defines.gui_type @ nilable; The GUI the player currently has open. This is the GUI that will asked to close (by firing the [on_gui_closed](runtime:on_gui_closed) event) when the `Esc` or `E` keys are pressed. If this attribute is non-nil, then writing `nil` or a new GUI to it will ask the existing GUI to close. Write supports any of the types. Read will return the `entity`, `equipment`, `equipment-grid`, `player`, `element`, `inventory` or `nil`.
---@field opened_gui_type defines.gui_type @ nilable
---@field picking_state boolean @Current item-picking state.
---@field position MapPosition @The current position of the entity.
---@field reach_distance uint @The reach distance of this character or max uint when not a character or player connected to a character.
---@field repair_state {repairing: boolean, position: MapPosition} @Current repair state.
---@field resource_reach_distance double @The resource reach distance of this character or max double when not a character or player connected to a character.
---@field riding_state RidingState @Current riding state of this car, or of the car this player is riding in.
---@field selected LuaEntity @ nilable; The currently selected entity. Assigning an entity will select it if is selectable, otherwise the selection is cleared.
---@field shooting_state {state: defines.shooting, position: MapPosition} @Current shooting state.
---@field surface LuaSurface @The surface this entity is currently on.
---@field surface_index uint @Unique [index](runtime:LuaSurface::index) (ID) associated with the surface this entity is currently on.
---@field vehicle LuaEntity @ nilable; The vehicle the player is currently sitting in.
---@field walking_state {walking: boolean, direction: defines.direction} @Current walking state.
LuaControl = {}

---@class LuaControl_begin_crafting_params
---@field count uint @The count to craft.
---@field recipe RecipeID @The recipe to craft.
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

---@class LuaControl_cancel_crafting_params
---@field index uint @The crafting queue index.
---@field count uint @The count to cancel crafting.

--- Cancels crafting the given count of the given crafting queue index.
---@param p LuaControl_cancel_crafting_params
function LuaControl.cancel_crafting(p) end

--- Removes the arrow created by `set_gui_arrow`.
function LuaControl.clear_gui_arrow() end

--- Remove all items from this entity.
function LuaControl.clear_items_inside() end

--- Unselect any selected entity.
function LuaControl.clear_selected_entity() end

--- Disable the flashlight.
function LuaControl.disable_flashlight() end

--- Enable the flashlight.
function LuaControl.enable_flashlight() end

--- Gets the count of the given recipe that can be crafted.
---@param recipe RecipeID @The recipe.
---@return uint @The count that can be crafted.
function LuaControl.get_craftable_count(recipe) end

--- Get an inventory belonging to this entity. This can be either the "main" inventory or some auxiliary one, like the module slots or logistic trash slots.
--- A given [defines.inventory](runtime:defines.inventory) is only meaningful for the corresponding LuaObject type. EG: get_inventory(defines.inventory.character_main) is only meaningful if 'this' is a player character. You may get a value back but if the type of 'this' isn't the type referred to by the [defines.inventory](runtime:defines.inventory) it's almost guaranteed to not be the inventory asked for.
---@param inventory defines.inventory
---@return LuaInventory @The inventory or `nil` if none with the given index was found.
function LuaControl.get_inventory(inventory) end

--- Get the number of all or some items in this entity.
---@param item ItemID|nil @Prototype name of the item to count. If not specified, count all items.
---@overload fun(): uint
---@return uint
function LuaControl.get_item_count(item) end

--- Gets the main inventory for this character or player if this is a character or player.
---@return LuaInventory @The inventory or `nil` if this entity is not a character or player.
function LuaControl.get_main_inventory() end

--- The highest index of all inventories this entity can use. Allows iteration over all of them if desired.
---@return defines.inventory
function LuaControl.get_max_inventory_index() end

--- Gets the requester logistic point for this entity if it has one.
---@return LuaLogisticPoint
function LuaControl.get_requester_point() end

--- Does this entity have any item inside it?
---@return boolean
function LuaControl.has_items_inside() end

--- Insert items into this entity. This works the same way as inserters or shift-clicking: the "best" inventory is chosen automatically.
---@param items ItemStackIdentification @The items to insert.
---@return uint @The number of items that were actually inserted.
function LuaControl.insert(items) end

--- Returns whether the player is holding a blueprint. This takes both blueprint items as well as blueprint records from the blueprint library into account.
--- Note that both this method refers to the currently selected blueprint, which means that a blueprint book with a selected blueprint will return the information as well.
---@return boolean
function LuaControl.is_cursor_blueprint() end

--- Returns whether the player is holding something in the cursor. Takes into account items from the blueprint library, as well as items and ghost cursor.
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
---@param technology TechnologyID|nil @The technology to select after opening the GUI.
---@overload fun()
function LuaControl.open_technology_gui(technology) end

--- Remove items from this entity.
---@param items ItemStackIdentification @The items to remove.
---@return uint @The number of items that were actually removed.
function LuaControl.remove_item(items) end

---@class LuaControl_set_gui_arrow_params
---@field margin uint
---@field type GuiArrowType @Where to point to. This field determines what other fields are mandatory.

--- Create an arrow which points at this entity. This is used in the tutorial. For examples, see `control.lua` in the campaign missions.
---@param p LuaControl_set_gui_arrow_params
function LuaControl.set_gui_arrow(p) end

--- Teleport the entity to a given position, possibly on another surface.
--- Some entities may not be teleported. For instance, transport belts won't allow teleportation and this method will always return `false` when used on any such entity.
--- You can also pass 1 or 2 numbers as the parameters and they will be used as relative teleport coordinates `'teleport(0, 1)'` to move the entity 1 tile positive y. `'teleport(4)'` to move the entity 4 tiles to the positive x.
--- `script_raised_teleported` will not be raised if teleporting a player with no character.
---@param position MapPosition @Where to teleport to.
---@param surface SurfaceIdentification|nil @Surface to teleport to. If not given, will teleport to the entity's current surface. Only players, cars, and spidertrons can be teleported cross-surface.
---@param raise_teleported boolean|nil @If true, [defines.events.script_raised_teleported](runtime:defines.events.script_raised_teleported) will be fired on successful entity teleportation.
---@param snap_to_grid boolean|nil @If false the exact position given is used to instead of snapping to the normal entity grid. This only applies if the entity normally snaps to the grid.
---@overload fun(position: MapPosition, surface: SurfaceIdentification|nil, raise_teleported: boolean|nil): boolean
---@overload fun(position: MapPosition, surface: SurfaceIdentification|nil): boolean
---@overload fun(position: MapPosition): boolean
---@return boolean @`true` if the entity was successfully teleported.
function LuaControl.teleport(position, surface, raise_teleported, snap_to_grid) end

--- Select an entity, as if by hovering the mouse above it.
---@param position MapPosition @Position of the entity to select.
function LuaControl.update_selected_entity(position) end

---@class LuaControlBehavior: any @The control behavior for an entity. Inserters have logistic network and circuit network behavior logic, lamps have circuit logic and so on. This is an abstract base class that concrete control behaviors inherit. An control reference becomes invalid once the control behavior is removed or the entity (see [LuaEntity](runtime:LuaEntity)) it resides in is destroyed.
---@field entity LuaEntity @The entity this control behavior belongs to.
---@field type defines.control_behavior.type @The concrete type of this control behavior.
LuaControlBehavior = {}

---@param wire_connector_id defines.wire_connector_id @Wire connector to get circuit network for.
---@return LuaCircuitNetwork @The circuit network or nil.
function LuaControlBehavior.get_circuit_network(wire_connector_id) end

---@class LuaCustomChartTag: any @A custom tag that shows on the map view.
---@field force LuaForce @The force this tag belongs to.
---@field icon SignalID @This tag's icon, if it has one. Writing `nil` removes it.
---@field last_user LuaPlayer @ nilable; The player who last edited this tag.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field position MapPosition @The position of this tag.
---@field surface LuaSurface @The surface this tag belongs to.
---@field tag_number uint @The unique ID for this tag on this force.
---@field text string
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaCustomChartTag = {}

--- Destroys this tag.
function LuaCustomChartTag.destroy() end

---@class LuaCustomEventPrototype: LuaPrototypeBase @Prototype of a custom event.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaCustomEventPrototype = {}

---@class LuaCustomInputPrototype: LuaPrototypeBase @Prototype of a custom input.
---@field action string @The action that happens when this custom input is triggered.
---@field alternative_key_sequence string @ nilable; The default alternative key sequence for this custom input, if any
---@field consuming "none" | "game-only" @The consuming type.
---@field controller_alternative_key_sequence string @ nilable; The default controller alternative key sequence for this custom input, if any
---@field controller_key_sequence string @ nilable; The default controller key sequence for this custom input, if any
---@field enabled boolean @Whether this custom input is enabled. Disabled custom inputs exist but are not used by the game.
---@field enabled_while_in_cutscene boolean @Whether this custom input is enabled while using the cutscene controller.
---@field enabled_while_spectating boolean @Whether this custom input is enabled while using the spectator controller.
---@field include_selected_prototype boolean @Whether this custom input will include the selected prototype (if any) when triggered.
---@field item_to_spawn LuaItemPrototype @ nilable; The item that gets spawned when this custom input is fired, if any.
---@field key_sequence string @The default key sequence for this custom input.
---@field linked_game_control LinkedGameControl @ nilable; The linked game control name, if any.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaCustomInputPrototype = {}

---@class LuaCustomTable: any @Lazily evaluated table. For performance reasons, we sometimes return a custom table-like type instead of a native Lua table. This custom type lazily constructs the necessary Lua wrappers of the corresponding C++ objects, therefore preventing their unnecessary construction in some cases. There are some notable consequences to the usage of a custom table type rather than the native Lua table type: Iterating a custom table is only possible using the `pairs` Lua function; `ipairs` won't work. Another key difference is that custom tables cannot be serialised into a game save file -- if saving the game would require serialisation of a custom table, an error will be displayed and the game will not be saved. In previous versions of Factorio, this would create a [LuaPlayer](runtime:LuaPlayer) instance for every player in the game, even though only one such wrapper is needed. In the current version, accessing [game.players](runtime:LuaGameScript::players) by itself does not create any [LuaPlayer](runtime:LuaPlayer) instances; they are created lazily when accessed. Therefore, this example only constructs one [LuaPlayer](runtime:LuaPlayer) instance, no matter how many elements there are in `game.players`. ``` game.players["Oxyd"].character.die() ``` This statement will execute successfully and `storage.p` will be useable as one might expect. However, as soon as the user tries to save the game, a "LuaCustomTable cannot be serialized" error will be shown. The game will remain unsaveable so long as `storage.p` refers to an instance of a custom table. ``` storage.p = game.players -- This has high potential to make the game unsaveable ``` The following will produce no output because `ipairs` is not supported with custom tables. ``` for _, p in ipairs(game.players) do game.player.print(p.name); end -- incorrect; use pairs instead ```
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaCustomTable = {}

---@class LuaDamagePrototype: LuaPrototypeBase @Prototype of a damage.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaDamagePrototype = {}

---@class LuaDeciderCombinatorControlBehavior: LuaCombinatorControlBehavior @Control behavior for decider combinators.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field parameters DeciderCombinatorParameters @This decider combinator's parameters. Writing `nil` clears the combinator's parameters.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaDeciderCombinatorControlBehavior = {}

--- Adds a new condition.
---@param condition DeciderCombinatorCondition @New condition to insert.
---@param index uint|nil @Index to insert new condition at. If not specified, appends to the end.
---@overload fun(condition: DeciderCombinatorCondition)
function LuaDeciderCombinatorControlBehavior.add_condition(condition, index) end

--- Adds a new output.
---@param output DeciderCombinatorOutput @New output to insert.
---@param index uint|nil @Index to insert new output at. If not specified, appends to the end.
---@overload fun(output: DeciderCombinatorOutput)
function LuaDeciderCombinatorControlBehavior.add_output(output, index) end

--- Gets the condition at `index`.
---@param index uint @Index of condition to get.
---@return DeciderCombinatorCondition
function LuaDeciderCombinatorControlBehavior.get_condition(index) end

--- Gets the output at `index`.
---@param index uint @Index of output to get.
---@return DeciderCombinatorOutput
function LuaDeciderCombinatorControlBehavior.get_output(index) end

--- Removes the condition at `index`.
---@param index uint @Index of condition to remove.
function LuaDeciderCombinatorControlBehavior.remove_condition(index) end

--- Removes the output at `index`.
---@param index uint @Index of output to remove.
function LuaDeciderCombinatorControlBehavior.remove_output(index) end

--- Sets the condition at `index`.
---@param index uint @Index of condition to modify.
---@param condition DeciderCombinatorCondition @Data to set selected condition to.
function LuaDeciderCombinatorControlBehavior.set_condition(index, condition) end

--- Sets the output at `index`.
---@param index uint @Index of output to modify.
---@param output DeciderCombinatorOutput @Data to set selected output to.
function LuaDeciderCombinatorControlBehavior.set_output(index, output) end

---@class LuaDecorativePrototype: LuaPrototypeBase @Prototype of an optimized decorative.
---@field autoplace_specification AutoplaceSpecification @ nilable; Autoplace specification for this decorative prototype, if any.
---@field collision_box BoundingBox @The bounding box used for collision checking.
---@field collision_mask CollisionMask @The collision masks this decorative uses
---@field decal boolean
---@field grows_through_rail_path boolean
---@field minimal_separation double
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field placed_effect TriggerEffectItem[] @ nilable
---@field render_layer string
---@field target_count uint
---@field trigger_effect TriggerEffectItem[] @ nilable
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaDecorativePrototype = {}

---@class LuaDisplayPanelControlBehavior: LuaControlBehavior @Control behavior for display panels.
---@field messages DisplayPanelMessageDefinition[] @The full list of configured messages.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaDisplayPanelControlBehavior = {}

--- Get a specific message definition
---@param index uint @Message index.
---@return DisplayPanelMessageDefinition @The message definition at the specified index.
function LuaDisplayPanelControlBehavior.get_message(index) end

--- Set the message at the specified index
---@param index uint @Message index. Use `-1` to append new element.
---@param message DisplayPanelMessageDefinition @The message definition for the specified index. Specify `nil` to remove the message.
function LuaDisplayPanelControlBehavior.set_message(index, message) end

---@class LuaElectricEnergySourcePrototype: any @Prototype of an electric energy source.
---@field buffer_capacity double
---@field drain double
---@field emissions_per_joule table<string, double> @The table of emissions of this energy source in `pollution/Joule`, indexed by pollutant type. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field render_no_network_icon boolean
---@field render_no_power_icon boolean
---@field usage_priority string
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaElectricEnergySourcePrototype = {}

---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaElectricEnergySourcePrototype.get_input_flow_limit(quality) end

---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaElectricEnergySourcePrototype.get_output_flow_limit(quality) end

---@class LuaEntity: LuaControl @The primary interface for interacting with entities through the Lua API. Entities are everything that exists on the map except for tiles (see [LuaTile](runtime:LuaTile)). Most functions on LuaEntity also work when the entity is contained in a ghost.
---@field absorbed_pollution double
---@field active boolean @Deactivating an entity will stop all its operations (car will stop moving, inserters will stop working, fish will stop moving etc). Entities that are not active naturally can't be set to be active (setting it to be active will do nothing) Ghosts, simple smoke, and corpses can't be modified at this time. It is even possible to set the character to not be active, so he can't move and perform most of the tasks.
---@field ai_settings LuaAISettings @The ai settings of this unit.
---@field alert_parameters ProgrammableSpeakerAlertParameters
---@field allow_dispatching_robots boolean @Whether this character's personal roboports are allowed to dispatch robots.
---@field always_on boolean @If the lamp is always on when not driven by control behavior.
---@field amount uint @Count of resource units contained.
---@field armed boolean @Whether this land mine is armed.
---@field artillery_auto_targeting boolean @If this artillery auto-targets enemies.
---@field associated_player LuaPlayer | PlayerIdentification @ nilable; The player this character is associated with, if any. Set to `nil` to clear. The player will be automatically disassociated when a controller is set on the character. Also, all characters associated to a player will be logged off when the player logs off in multiplayer. Reading this property will return a [LuaPlayer](runtime:LuaPlayer), while [PlayerIdentification](runtime:PlayerIdentification) can be used when writing. A character associated with a player is not directly controlled by any player.
---@field autopilot_destination MapPosition @ nilable; Destination of this spidertron's autopilot, if any. Writing `nil` clears all destinations.
---@field autopilot_destinations MapPosition[] @The queued destination positions of spidertron's autopilot.
---@field backer_name string @ nilable; The backer name assigned to this entity. Entities that support backer names are labs, locomotives, radars, roboports, and train stops. `nil` if this entity doesn't support backer names. While train stops get the name of a backer when placed down, players can rename them if they want to. In this case, `backer_name` returns the player-given name of the entity.
---@field beacons_count uint @ nilable; Number of beacons affecting this effect receiver. Can only be used when the entity has an effect receiver (AssemblingMachine, Furnace, Lab, MiningDrills)
---@field belt_neighbours {inputs: LuaEntity[], outputs: LuaEntity[]} @The belt connectable neighbours of this belt connectable entity. Only entities that input to or are outputs of this entity. Does not contain the other end of an underground belt, see [LuaEntity::neighbours](runtime:LuaEntity::neighbours) for that.
---@field belt_shape "straight" | "left" | "right" @Gives what is the current shape of a transport-belt. Can also be used on entity ghost if it contains transport-belt.
---@field belt_to_ground_type "input" | "output" @Whether this underground belt goes into or out of the ground.
---@field bonus_mining_progress double @ nilable; The bonus mining progress for this mining drill. Read yields a number in range [0, mining_target.prototype.mineable_properties.mining_time]. `nil` if this isn't a mining drill.
---@field bonus_progress double @The current productivity bonus progress, as a number in range `[0, 1]`.
---@field bounding_box BoundingBox @[LuaEntityPrototype::collision_box](runtime:LuaEntityPrototype::collision_box) around entity's given position and respecting the current entity orientation.
---@field burner LuaBurner @ nilable; The burner energy source for this entity, if any.
---@field cargo_pod LuaEntity @ nilable; Gets the cargo pod attached to this rocket silo rocket if one exists.
---@field chain_signal_state defines.chain_signal_state @The state of this chain signal.
---@field character_corpse_death_cause LocalisedString @The reason this character corpse character died. `""` if there is no reason.
---@field character_corpse_player_index uint @The player index associated with this character corpse. The index is not guaranteed to be valid so it should always be checked first if a player with that index actually exists.
---@field character_corpse_tick_of_death uint @The tick this character corpse died at.
---@field cliff_orientation CliffOrientation @The orientation of this cliff.
---@field color Color @ nilable; The color of this character, rolling stock, train stop, car, spider-vehicle, flying text, corpse or simple-entity-with-owner. `nil` if this entity doesn't use custom colors. Car color is overridden by the color of the current driver/passenger, if there is one.
---@field combat_robot_owner LuaEntity @ nilable; The owner of this combat robot, if any.
---@field combinator_description string @The description on this combinator
---@field commandable LuaCommandable @ nilable; Returns a LuaCommandable for this entity or nil if entity is not commandable.
---@field connected_rail LuaEntity @ nilable; The rail entity this train stop is connected to, if any.
---@field connected_rail_direction defines.rail_direction @Rail direction to which this train stop is binding. This returns a value even when no rails are present.
---@field consumption_bonus double @The consumption bonus of this entity.
---@field consumption_modifier float @Multiplies the energy consumption.
---@field copy_color_from_train_stop boolean @If this RollingStock has 'copy color from train stop' enabled.
---@field corpse_expires boolean @Whether this corpse will ever fade away.
---@field corpse_immune_to_entity_placement boolean @If true, corpse won't be destroyed when entities are placed over it. If false, whether corpse will be removed or not depends on value of [CorpsePrototype::remove_on_entity_placement](prototype:CorpsePrototype::remove_on_entity_placement).
---@field crafting_progress float @The current crafting progress, as a number in range `[0, 1]`.
---@field crafting_speed double @The current crafting speed, including speed bonuses from modules and beacons.
---@field crane_destination MapPosition @Destination of the crane of this entity. Throws when trying to set the destination out of range.
---@field crane_destination_3d Vector3D @Destination of the crane of this entity in 3D. Throws when trying to set the destination out of range.
---@field crane_grappler_destination MapPosition @Will set destination for the grappler of crane of this entity. The crane grappler will start moving to reach the destination, but the rest of the arm will remain stationary. Throws when trying to set the destination out of range.
---@field crane_grappler_destination_3d Vector3D @Will set destination in 3D for the grappler of crane of this entity. The crane grappler will start moving to reach the destination, but the rest of the arm will remain stationary. Throws when trying to set the destination out of range.
---@field custom_status CustomEntityStatus @ nilable; A custom status for this entity that will be displayed in the GUI.
---@field damage_dealt double @The damage dealt by this turret, artillery turret, or artillery wagon.
---@field destructible boolean @If set to `false`, this entity can't be damaged and won't be attacked automatically. It can however still be mined. Entities that are indestructible naturally (they have no health, like smoke, resource etc) can't be set to be destructible.
---@field direction defines.direction @The current direction this entity is facing.
---@field draw_data RollingStockDrawData @Gives a draw data of the given entity if it supports such data.
---@field driver_is_gunner boolean @ nilable; Whether the driver of this car or spidertron is the gunner. If `false`, the passenger is the gunner. `nil` if this is neither a car or a spidertron.
---@field drop_position MapPosition @Position where the entity puts its stuff. Mining drills and crafting machines can't have their drop position changed; inserters must have `allow_custom_vectors` set to true on their prototype to allow changing the drop position. Meaningful only for entities that put stuff somewhere, such as mining drills, crafting machines with a drop target or inserters.
---@field drop_target LuaEntity @ nilable; The entity this entity is putting its items to. If there are multiple possible entities at the drop-off point, writing to this attribute allows a mod to choose which one to drop off items to. The entity needs to collide with the tile box under the drop-off position. `nil` if there is no entity to put items to, or if this is not an entity that puts items somewhere.
---@field effective_speed float @ nilable; The current speed of this unit in tiles per tick, taking into account any walking speed modifier given by the tile the unit is standing on. `nil` if this is not a unit.
---@field effectivity_modifier float @Multiplies the acceleration the vehicle can create for one unit of energy. Defaults to `1`.
---@field effects ModuleEffects @ nilable; The effects being applied to this entity, if any. For beacons, this is the effect the beacon is broadcasting.
---@field electric_buffer_size double @ nilable; The buffer size for the electric energy source. `nil` if the entity doesn't have an electric energy source. Write access is limited to the ElectricEnergyInterface type.
---@field electric_drain double @ nilable; The electric drain for the electric energy source. `nil` if the entity doesn't have an electric energy source.
---@field electric_emissions_per_joule table<string, double> @ nilable; The table of emissions of this energy source in `pollution/Joule`, indexed by pollutant type. `nil` if the entity doesn't have an electric energy source. Multiplying values in the returned table by energy consumption in `Watt` gives `pollution/second`.
---@field electric_network_id uint @ nilable; Returns the id of the electric network that this entity is connected to, if any.
---@field electric_network_statistics LuaFlowStatistics @The electric network statistics for this electric pole.
---@field enable_logistics_while_moving boolean @Whether equipment grid logistics are enabled while this vehicle is moving.
---@field energy double @Energy stored in the entity's energy buffer (energy stored in electrical devices etc.). Always 0 for entities that don't have the concept of energy stored inside.
---@field energy_generated_last_tick double @How much energy this generator generated in the last tick.
---@field entity_label string @ nilable; The label on this spider-vehicle entity, if any. `nil` if this is not a spider-vehicle.
---@field filter_slot_count uint @The number of filter slots this inserter, loader, mining drill or logistic storage container has. 0 if not one of those entities.
---@field fluidbox LuaFluidBox @Fluidboxes of this entity.
---@field fluids_count uint @Returns count of fluid storages. This includes fluid storages provided by FluidBoxes but also covers other fluid storages like FluidTurret's internal buffer and FluidWagon's fluid since they are not FluidBox and cannot be exposed through [LuaFluidBox](runtime:LuaFluidBox).
---@field follow_offset Vector @ nilable; The follow offset of this spidertron, if any entity is being followed. This is randomized each time the follow entity is set.
---@field follow_target LuaEntity @ nilable; The follow target of this spidertron, if any.
---@field friction_modifier float @Multiplies the car friction rate.
---@field ghost_localised_description LocalisedString
---@field ghost_localised_name LocalisedString @Localised name of the entity or tile contained in this ghost.
---@field ghost_name string @Name of the entity or tile contained in this ghost
---@field ghost_prototype LuaEntityPrototype | LuaTilePrototype @The prototype of the entity or tile contained in this ghost.
---@field ghost_type string @The prototype type of the entity or tile contained in this ghost.
---@field ghost_unit_number uint @ nilable; The [unit_number](runtime:LuaEntity::unit_number) of the entity contained in this ghost. It is the same as the unit number of the [EntityWithOwnerPrototype](prototype:EntityWithOwnerPrototype) that was destroyed to create this ghost. If it was created by other means, or if the inner entity does not support unit numbers, this property is `nil`.
---@field gps_tag string @Returns a [rich text](https://wiki.factorio.com/Rich_text) string containing this entity's position and surface name as a gps tag. [Printing](runtime:LuaGameScript::print) it will ping the location of the entity.
---@field graphics_variation uint8 @ nilable; The graphics variation for this entity. `nil` if this entity doesn't use graphics variations.
---@field grid LuaEquipmentGrid @ nilable; This entity's equipment grid, if any.
---@field health float @ nilable; The current health of the entity, if any. Health is automatically clamped to be between `0` and max health (inclusive). Entities with a health of `0` can not be attacked. To get the maximum possible health of this entity, see [LuaEntity::max_health](runtime:LuaEntity::max_health).
---@field held_stack LuaItemStack @The item stack currently held in an inserter's hand.
---@field held_stack_position MapPosition @Current position of the inserter's "hand".
---@field highlight_box_blink_interval uint @The blink interval of this highlight box entity. `0` indicates no blink.
---@field highlight_box_type CursorBoxRenderType @The highlight box type of this highlight box entity.
---@field ignore_unprioritised_targets boolean @Whether this turret shoots at targets that are not on its priority list.
---@field infinity_container_filters InfinityInventoryFilter[] @The filters for this infinity container.
---@field initial_amount uint @ nilable; Count of initial resource units contained. `nil` if this is not an infinite resource. If this is not an infinite resource, writing will produce an error.
---@field insert_plan BlueprintInsertPlan[] @The insert plan for this ghost or item request proxy.
---@field inserter_filter_mode "whitelist" | "blacklist" @ nilable; The filter mode for this filter inserter. `nil` if this inserter doesn't use filters.
---@field inserter_stack_size_override uint @Sets the stack size limit on this inserter. If the stack size is > than the force stack size limit the value is ignored. Set to `0` to reset.
---@field inserter_target_pickup_count uint @Returns the current target pickup count of the inserter. This considers the circuit network, manual override and the inserter stack size limit based on technology.
---@field is_entity_with_health boolean @If this entity is EntityWithHealth
---@field is_entity_with_owner boolean @If this entity is EntityWithOwner
---@field is_headed_to_trains_front boolean @If the rolling stock is facing train's front.
---@field is_military_target boolean @Whether this entity is a MilitaryTarget. Can be written to if [LuaEntityPrototype::allow_run_time_change_of_is_military_target](runtime:LuaEntityPrototype::allow_run_time_change_of_is_military_target) returns `true`.
---@field item_requests ItemCountWithQuality[] @Items this ghost will request when revived or items this item request proxy is requesting.
---@field kills uint @The number of units killed by this turret, artillery turret, or artillery wagon.
---@field last_user LuaPlayer | PlayerIdentification @ nilable; The last player that changed any setting on this entity. This includes building the entity, changing its color, or configuring its circuit network. `nil` if the last user is not part of the save anymore. Reading this property will return a [LuaPlayer](runtime:LuaPlayer), while [PlayerIdentification](runtime:PlayerIdentification) can be used when writing.
---@field link_id uint @The link ID this linked container is using.
---@field linked_belt_neighbour LuaEntity @ nilable; Neighbour to which this linked belt is connected to, if any. Can also be used on entity ghost if it contains linked-belt. May return entity ghost which contains linked belt to which connection is made.
---@field linked_belt_type "input" | "output" @Type of linked belt. Changing type will also flip direction so the belt is out of the same side. Can only be changed when linked belt is disconnected (has no neighbour set). Can also be used on entity ghost if it contains linked-belt.
---@field loader_container LuaEntity @ nilable; The container entity this loader is pointing at/pulling from depending on the [LuaEntity::loader_type](runtime:LuaEntity::loader_type), if any.
---@field loader_type "input" | "output" @Whether this loader gets items from or puts item into a container.
---@field localised_description LocalisedString
---@field localised_name LocalisedString @Localised name of the entity.
---@field logistic_cell LuaLogisticCell @The logistic cell this entity is a part of. Will be `nil` if this entity is not a part of any logistic cell.
---@field logistic_network LuaLogisticNetwork @The logistic network this entity is a part of, or `nil` if this entity is not a part of any logistic network.
---@field max_health float @Max health of this entity. Quality of entity is taken into account.
---@field minable boolean @Not minable entities can still be destroyed. Entities that are not minable naturally (like smoke, character, enemy units etc) can't be set to minable.
---@field mining_drill_filter_mode "whitelist" | "blacklist" @ nilable; The filter mode for this mining drill. `nil` if this mining drill doesn't have filters.
---@field mining_progress double @ nilable; The mining progress for this mining drill. Is a number in range [0, mining_target.prototype.mineable_properties.mining_time]. `nil` if this isn't a mining drill.
---@field mining_target LuaEntity @ nilable; The mining target, if any.
---@field mirroring boolean @If the entity is currently mirrored.
---@field name string @Name of the entity prototype. E.g. "inserter" or "fast-inserter".
---@field name_tag string @Name tag of this entity. Returns `nil` if entity has no name tag. When name tag is already used by other entity, the name will be removed from the other entity. Entity name tags can also be set in the entity "extra settings" GUI in the map editor.
---@field neighbour_bonus double @The current total neighbour bonus of this reactor.
---@field neighbours (table<string, LuaEntity[]>) | LuaEntity[][] | LuaEntity @ nilable; A list of neighbours for certain types of entities. Applies to underground belts, walls, gates, reactors, cliffs, and pipe-connectable entities.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field operable boolean @Player can't open gui of this entity and he can't quick insert/input stuff in to the entity when it is not operable.
---@field orientation RealOrientation @The smooth orientation of this entity.
---@field parameters ProgrammableSpeakerParameters
---@field pickup_position MapPosition @Where the inserter will pick up items from. Inserters must have `allow_custom_vectors` set to true on their prototype to allow changing the pickup position.
---@field pickup_target LuaEntity @ nilable; The entity this inserter will attempt to pick up items from. If there are multiple possible entities at the pick-up point, writing to this attribute allows a mod to choose which one to pick up items from. The entity needs to collide with the tile box under the pick-up position. `nil` if there is no entity to pull items from.
---@field player LuaPlayer @ nilable; The player connected to this character, if any.
---@field pollution_bonus double @The pollution bonus of this entity.
---@field power_production double @The power production specific to the ElectricEnergyInterface entity type.
---@field power_switch_state boolean @The state of this power switch.
---@field power_usage double @The power usage specific to the ElectricEnergyInterface entity type.
---@field previous_recipe RecipeIDAndQualityIDPair @ nilable; The previous recipe this furnace was using, if any.
---@field procession_tick MapTick @how far into the current procession the cargo pod is.
---@field productivity_bonus double @The productivity bonus of this entity. This includes force based bonuses as well as beacon/module bonuses.
---@field products_finished uint @The number of products this machine finished crafting in its lifetime.
---@field prototype LuaEntityPrototype @The entity prototype of this entity.
---@field proxy_target LuaEntity @ nilable; The target entity for this item-request-proxy, if any.
---@field pump_rail_target LuaEntity @ nilable; The rail target of this pump, if any.
---@field quality LuaQualityPrototype @The quality of this entity. Not all entities support quality and will give the "normal" quality back if they don't.
---@field radar_scan_progress float @The current radar scan progress, as a number in range `[0, 1]`.
---@field rail_layer defines.rail_layer @Gets rail layer of a given signal
---@field recipe_locked boolean @When locked; the recipe in this assembling machine can't be changed by the player.
---@field relative_turret_orientation RealOrientation @ nilable; The relative orientation of the vehicle turret, artillery turret, artillery wagon. `nil` if this entity isn't a vehicle with a vehicle turret or artillery turret/wagon. Writing does nothing if the vehicle doesn't have a turret.
---@field removal_plan BlueprintInsertPlan[] @The removal plan for this item request proxy.
---@field remove_unfiltered_items boolean @Whether items not included in this infinity container filters should be removed from the container.
---@field render_player LuaPlayer | PlayerIdentification @ nilable; The player that this `simple-entity-with-owner`, `simple-entity-with-force`, or `highlight-box` is visible to. `nil` when this entity is rendered for all players. Reading this property will return a [LuaPlayer](runtime:LuaPlayer), while [PlayerIdentification](runtime:PlayerIdentification) can be used when writing.
---@field render_to_forces ForceSet @ nilable; The forces that this `simple-entity-with-owner` or `simple-entity-with-force` is visible to. `nil` or an empty array when this entity is rendered for all forces. Reading will always give an array of [LuaForce](runtime:LuaForce)
---@field request_from_buffers boolean @Whether this requester chest is set to also request from buffer chests. Useable only on entities that have requester slots.
---@field result_quality LuaQualityPrototype  | QualityID @ nilable; The quality produced when this crafting machine finishes crafting. `nil` when crafting is not in progress. Note: Writing `nil` is not allowed.
---@field robot_order_queue WorkerRobotOrder[] @Get the current queue of robot orders.
---@field rocket_parts uint @Number of rocket parts in the silo.
---@field rocket_silo_status defines.rocket_silo_status @The status of this rocket silo entity.
---@field rotatable boolean @When entity is not to be rotatable (inserter, transport belt etc), it can't be rotated by player using the R key. Entities that are not rotatable naturally (like chest or furnace) can't be set to be rotatable.
---@field secondary_bounding_box BoundingBox @ nilable; The secondary bounding box of this entity or `nil` if it doesn't have one. This only exists for curved rails, and is automatically determined by the game.
---@field secondary_selection_box BoundingBox @ nilable; The secondary selection box of this entity or `nil` if it doesn't have one. This only exists for curved rails, and is automatically determined by the game.
---@field selected_gun_index uint @ nilable; Index of the currently selected weapon slot of this character, car, or spidertron. `nil` if this entity doesn't have guns.
---@field selection_box BoundingBox @[LuaEntityPrototype::selection_box](runtime:LuaEntityPrototype::selection_box) around entity's given position and respecting the current entity orientation.
---@field shooting_target LuaEntity @ nilable; The shooting target for this turret, if any. Can't be set to `nil` via script.
---@field signal_state defines.signal_state @The state of this rail signal.
---@field spawn_shift double
---@field spawning_cooldown double
---@field speed float @ nilable; The current speed if this is a car, rolling stock, projectile or spidertron, or the maximum speed if this is a unit. The speed is in tiles per tick. `nil` if this is not a car, rolling stock, unit, projectile or spidertron. Only the speed of units, cars, and projectiles are writable.
---@field speed_bonus double @The speed bonus of this entity. This includes force based bonuses as well as beacon/module bonuses.
---@field splitter_filter ItemFilter @ nilable; The filter for this splitter, if any is set.
---@field splitter_input_priority "left" | "none" | "right" @The input priority for this splitter.
---@field splitter_output_priority "left" | "none" | "right" @The output priority for this splitter.
---@field stack LuaItemStack
---@field status defines.entity_status @ nilable; The status of this entity, if any. This is always the actual status of the entity, even if [LuaEntity::custom_status](runtime:LuaEntity::custom_status) is set.
---@field sticked_to LuaEntity @The entity this sticker is sticked to.
---@field sticker_vehicle_modifiers {speed_modifier: double, speed_max: double, friction_modifier: double} @ nilable; The vehicle modifiers applied to this entity through the attached stickers.
---@field stickers LuaEntity[] @ nilable; The sticker entities attached to this entity, if any.
---@field storage_filter LuaItemPrototype @ nilable; The storage filter for this logistic storage container. Useable only on logistic containers with the `"storage"` [logistic_mode](runtime:LuaEntityPrototype::logistic_mode).
---@field supports_direction boolean @Whether the entity has direction. When it is false for this entity, it will always return north direction when asked for.
---@field tags Tags @ nilable; The tags associated with this entity ghost. `nil` if this is not an entity ghost.
---@field temperature double @ nilable; The temperature of this entity's heat energy source. `nil` if this entity does not use a heat energy source.
---@field tick_grown MapTick @The tick when this plant is fully grown.
---@field tick_of_last_attack uint @The last tick this character entity was attacked.
---@field tick_of_last_damage uint @The last tick this character entity was damaged.
---@field tile_height uint @Specifies the tiling size of the entity, is used to decide, if the center should be in the center of the tile (odd tile size dimension) or on the tile border (even tile size dimension). Uses the current direction of the entity.
---@field tile_width uint @Specifies the tiling size of the entity, is used to decide, if the center should be in the center of the tile (odd tile size dimension) or on the tile border (even tile size dimension). Uses the current direction of the entity.
---@field time_to_live uint64 @The ticks left before a combat robot, highlight box, smoke, or sticker entity is destroyed.
---@field time_to_next_effect uint @The ticks until the next trigger effect of this smoke-with-trigger.
---@field timeout uint @The timeout that's left on this landmine in ticks. It describes the time between the landmine being placed and it being armed.
---@field to_be_looted boolean @Will this item entity be picked up automatically when the player walks over it?
---@field torso_orientation RealOrientation @The torso orientation of this spider vehicle.
---@field train LuaTrain @ nilable; The train this rolling stock belongs to, if any. `nil` if this is not a rolling stock.
---@field train_stop_priority uint8 @Priority of this train stop.
---@field trains_count uint @Amount of trains related to this particular train stop. Includes train stopped at this train stop (until it finds a path to next target) and trains having this train stop as goal or waypoint. Train may be included multiple times when braking distance covers this train stop multiple times. Value may be read even when train stop has no control behavior.
---@field trains_in_block uint @The number of trains in this rail block for this rail entity.
---@field trains_limit uint @Amount of trains above which no new trains will be sent to this train stop. Writing nil will disable the limit (will set a maximum possible value). When a train stop has a control behavior with wire connected and set_trains_limit enabled, this value will be overwritten by it.
---@field tree_color_index uint8 @Index of the tree color.
---@field tree_color_index_max uint8 @Maximum index of the tree colors.
---@field tree_gray_stage_index uint8 @Index of the tree gray stage
---@field tree_gray_stage_index_max uint8 @Maximum index of the tree gray stages.
---@field tree_stage_index uint8 @Index of the tree stage.
---@field tree_stage_index_max uint8 @Maximum index of the tree stages.
---@field type string @The entity prototype type of this entity.
---@field unit_number uint @ nilable; A unique number identifying this entity for the lifetime of the save. These are allocated sequentially, and not re-used (until overflow). Only entities inheriting from [EntityWithOwnerPrototype](prototype:EntityWithOwnerPrototype), as well as [ItemRequestProxyPrototype](prototype:ItemRequestProxyPrototype) and [EntityGhostPrototype](prototype:EntityGhostPrototype) are assigned a unit number. Returns `nil` otherwise.
---@field units LuaEntity[] @The units associated with this spawner entity.
---@field use_filters boolean @If set to 'true', this inserter will use filtering logic. This has no effect if the prototype does not support filters.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field vehicle_automatic_targeting_parameters VehicleAutomaticTargetingParameters @Read when this spidertron auto-targets enemies
LuaEntity = {}

--- Adds the given position to this spidertron's autopilot's queue of destinations.
---@param position MapPosition @The position the spidertron should move to.
function LuaEntity.add_autopilot_destination(position) end

--- Offer a thing on the market.
---@param offer Offer
function LuaEntity.add_market_item(offer) end

--- Whether the entity can be destroyed
---@return boolean
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
---@param force ForceID @The force who did the deconstruction order.
---@param player PlayerIdentification|nil @The player to set the `last_user` to if any.
---@overload fun(force: ForceID)
function LuaEntity.cancel_deconstruction(force, player) end

--- Cancels upgrade if it is scheduled, does nothing otherwise.
---@param force ForceID @The force who did the upgrade order.
---@param player PlayerIdentification|nil @The player to set the last_user to if any.
---@overload fun(force: ForceID): boolean
---@return boolean @Whether the cancel was successful.
function LuaEntity.cancel_upgrade(force, player) end

--- Remove all fluids from this entity.
function LuaEntity.clear_fluid_inside() end

--- Removes all offers from a market.
function LuaEntity.clear_market_items() end

---@class LuaEntity_clone_params
---@field position MapPosition @The destination position
---@field surface LuaSurface|nil @The destination surface
---@field force ForceID|nil
---@field create_build_effect_smoke boolean|nil @If false, the building effect smoke will not be shown around the new entity.

--- Clones this entity.
---@param p LuaEntity_clone_params
---@return LuaEntity @The cloned entity or `nil` if this entity can't be cloned/can't be cloned to the given location.
function LuaEntity.clone(p) end

--- Connects current linked belt with another one.
--- Neighbours have to be of different type. If given linked belt is connected to something else it will be disconnected first. If provided neighbour is connected to something else it will also be disconnected first. Automatically updates neighbour to be connected back to this one.
--- Can also be used on entity ghost if it contains linked-belt.
---@param neighbour LuaEntity|nil @Another linked belt or entity ghost containing linked belt to connect or nil to disconnect
---@overload fun()
function LuaEntity.connect_linked_belts(neighbour) end

--- Connects the rolling stock in the given direction.
---@param direction defines.rail_direction
---@return boolean @Whether any connection was made
function LuaEntity.connect_rolling_stock(direction) end

--- Copies settings from the given entity onto this entity.
---@param entity LuaEntity
---@param by_player PlayerIdentification|nil @If provided, the copying is done 'as' this player and [on_entity_settings_pasted](runtime:on_entity_settings_pasted) is triggered.
---@overload fun(entity: LuaEntity): ItemCountWithQuality[]
---@return ItemCountWithQuality[] @Any items removed from this entity as a result of copying the settings.
function LuaEntity.copy_settings(entity, by_player) end

--- Creates the same smoke that is created when you place a building by hand.
--- You can play the building sound to go with it by using [LuaSurface::play_sound](runtime:LuaSurface::play_sound), eg: `entity.surface.play_sound{path="entity-build/"..entity.prototype.name, position=entity.position}`
function LuaEntity.create_build_effect_smoke() end

--- Damages the entity.
---@param damage float @The amount of damage to be done.
---@param force ForceID @The force that will be doing the damage.
---@param type DamageTypeID|nil @The type of damage to be done, defaults to `"impact"`.
---@param source LuaEntity|nil @The entity that is directly dealing the damage (e.g. the projectile, flame, sticker, grenade, laser beam, etc.). Needs to be on the same surface as the entity being damaged.
---@param cause LuaEntity|nil @The entity that originally triggered the events that led to this damage being dealt (e.g. the character, turret, enemy, etc. that pulled the trigger). Does not need to be on the same surface as the entity being damaged.
---@overload fun(damage: float, force: ForceID, type: DamageTypeID|nil, source: LuaEntity|nil): float
---@overload fun(damage: float, force: ForceID, type: DamageTypeID|nil): float
---@overload fun(damage: float, force: ForceID): float
---@return float @the total damage actually applied after resistances.
function LuaEntity.damage(damage, force, type, source, cause) end

--- Depletes and destroys this resource entity.
function LuaEntity.deplete() end

---@class LuaEntity_destroy_params
---@field do_cliff_correction boolean|nil @Whether neighbouring cliffs should be corrected. Defaults to `false`.
---@field raise_destroy boolean|nil @If `true`, [script_raised_destroy](runtime:script_raised_destroy) will be called. Defaults to `false`.
---@field player PlayerIdentification|nil @The player whose undo queue this action should be added to.
---@field item_index uint|nil @The index of the undo item to add this action to. An index of `0` creates a new undo item for it. Defaults to putting it into the appropriate undo item automatically if not specified.

--- Destroys the entity.
--- Not all entities can be destroyed - things such as rails under trains cannot be destroyed until the train is moved or destroyed.
---@param p LuaEntity_destroy_params
---@return boolean @Returns `false` if the entity was valid and destruction failed, `true` in all other cases.
function LuaEntity.destroy(p) end

--- Immediately kills the entity. Does nothing if the entity doesn't have health.
--- Unlike [LuaEntity::destroy](runtime:LuaEntity::destroy), `die` will trigger the [on_entity_died](runtime:on_entity_died) event and the entity will produce a corpse and drop loot if it has any.
---@param force ForceID|nil @The force to attribute the kill to.
---@param cause LuaEntity|nil @The cause to attribute the kill to.
---@overload fun(force: ForceID|nil): boolean
---@overload fun(): boolean
---@return boolean @Whether the entity was successfully killed.
function LuaEntity.die(force, cause) end

--- Disconnects linked belt from its neighbour.
--- Can also be used on entity ghost if it contains linked-belt
function LuaEntity.disconnect_linked_belts() end

--- Tries to disconnect this rolling stock in the given direction.
---@param direction defines.rail_direction
---@return boolean @If anything was disconnected
function LuaEntity.disconnect_rolling_stock(direction) end

--- Take an ascending cargo pod and safely make it skip all animation and immediately switch surface.
function LuaEntity.force_finish_ascending() end

--- Take a descending cargo pod and safely make it arrive and deposit cargo.
function LuaEntity.force_finish_descending() end

--- Returns a table with all entities affected by this beacon
---@return LuaEntity[]
function LuaEntity.get_beacon_effect_receivers() end

--- Returns a table with all beacons affecting this effect receiver. Can only be used when the entity has an effect receiver (AssemblingMachine, Furnace, Lab, MiningDrills)
---@return LuaEntity[]
function LuaEntity.get_beacons() end

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

---@param wire_connector_id defines.wire_connector_id @Wire connector to get circuit network for.
---@return LuaCircuitNetwork @The circuit network or nil.
function LuaEntity.get_circuit_network(wire_connector_id) end

---@class LuaEntity_get_connected_rail_params
---@field rail_direction defines.rail_direction
---@field rail_connection_direction defines.rail_connection_direction

---@param p LuaEntity_get_connected_rail_params
---@return LuaEntity, defines.rail_direction, defines.rail_connection_direction @Rail connected in the specified manner to this one, `nil` if unsuccessful.; Rail direction of the returned rail which points to origin rail; Turn to be taken when going back from returned rail to origin rail
function LuaEntity.get_connected_rail(p) end

--- Get the rails that this signal is connected to.
---@return LuaEntity[]
function LuaEntity.get_connected_rails() end

--- Gets rolling stock connected to the given end of this stock.
---@param direction defines.rail_direction
---@return LuaEntity, defines.rail_direction @The rolling stock connected at the given end, `nil` if none is connected there.; The rail direction of the connected rolling stock if any.
function LuaEntity.get_connected_rolling_stock(direction) end

--- Gets the control behavior of the entity (if any).
---@return LuaControlBehavior @The control behavior or `nil`.
function LuaEntity.get_control_behavior() end

--- Returns the amount of damage to be taken by this entity.
---@return float @`nil` if this entity does not have health.
function LuaEntity.get_damage_to_be_taken() end

--- Gets the driver of this vehicle if any.
---@return LuaEntity | LuaPlayer @`nil` if the vehicle contains no driver. To check if there's a passenger see [LuaEntity::get_passenger](runtime:LuaEntity::get_passenger).
function LuaEntity.get_driver() end

--- The input flow limit for the electric energy source. `nil` if the entity doesn't have an electric energy source.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntity.get_electric_input_flow_limit(quality) end

--- The output flow limit for the electric energy source. `nil` if the entity doesn't have an electric energy source.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntity.get_electric_output_flow_limit(quality) end

--- Get the filter for a slot in an inserter, loader, or logistic storage container. The entity must allow filters.
---@param slot_index uint @Index of the slot to get the filter for.
---@return ItemFilter @The filter, or `nil` if the given slot has no filter.
function LuaEntity.get_filter(slot_index) end

--- Gets fluid of the i-th fluid storage.
---@param index uint @Fluid storage index. Valid values are from 1 up to [LuaEntity::fluids_count](runtime:LuaEntity::fluids_count).
---@return Fluid @Fluid in this storage. nil if fluid storage is empty.
function LuaEntity.get_fluid(index) end

--- Get amounts of all fluids in this entity.
--- If information about fluid temperatures is required, [LuaEntity::fluidbox](runtime:LuaEntity::fluidbox) should be used instead.
---@return table<string, double> @The amounts, indexed by fluid names.
function LuaEntity.get_fluid_contents() end

--- Get the amount of all or some fluid in this entity.
--- If information about fluid temperatures is required, [LuaEntity::fluidbox](runtime:LuaEntity::fluidbox) should be used instead.
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

--- Get an item insert specification onto a belt connectable: for a given map position provides into which line at what position item should be inserted to be closest to the provided position.
---@param position MapPosition @Position where the item is to be inserted.
---@return uint, float @Index of the transport line that is closest to the provided map position.; Position along the transport line where item should be dropped.
function LuaEntity.get_item_insert_specification(position) end

--- Get a map position related to a position on a transport line.
---@param index uint @Index of the transport line. Transport lines are 1-indexed.
---@param position float @Linear position along the transport line. Clamped to the transport line range.
---@return MapPosition
function LuaEntity.get_line_item_position(index, position) end

--- Gets all the `LuaLogisticPoint`s that this entity owns. Optionally returns only the point specified by the index parameter.
--- When `index` is not given, this will be a single `LuaLogisticPoint` for most entities. For some (such as the player character), it can be zero or more.
---@param index defines.logistic_member_index|nil @If provided, only returns the `LuaLogisticPoint` specified by this index.
---@overload fun(): LuaLogisticPoint | (table<defines.logistic_member_index, LuaLogisticPoint>)
---@return LuaLogisticPoint | (table<defines.logistic_member_index, LuaLogisticPoint>)
function LuaEntity.get_logistic_point(index) end

--- Get all offers in a market as an array.
---@return Offer[]
function LuaEntity.get_market_items() end

--- Get the maximum transport line index of a belt or belt connectable entity.
---@return uint
function LuaEntity.get_max_transport_line_index() end

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
--- This differs over [LuaEntity::get_driver](runtime:LuaEntity::get_driver) in that the passenger can't drive the car.
---@return LuaEntity | LuaPlayer @`nil` if the vehicle contains no passenger. To check if there's a driver see [LuaEntity::get_driver](runtime:LuaEntity::get_driver).
function LuaEntity.get_passenger() end

--- Get the entity ID name at the specified position in the turret's priority list.
---@param index uint @The index of the entry to fetch.
---@return string @The name of the entity prototype.
function LuaEntity.get_priority_target(index) end

--- The radius of this entity.
---@return double
function LuaEntity.get_radius() end

--- Gets a LuaRailEnd object for specified end of this rail
---@param direction defines.rail_direction
---@return LuaRailEnd
function LuaEntity.get_rail_end(direction) end

--- Get the rail at the end of the rail segment this rail is in.
--- A rail segment is a continuous section of rail with no branches, signals, nor train stops.
---@param direction defines.rail_direction
---@return LuaEntity, defines.rail_direction @The rail entity.; A rail direction pointing out of the rail segment from the end rail.
function LuaEntity.get_rail_segment_end(direction) end

--- Get the length of the rail segment this rail is in.
--- A rail segment is a continuous section of rail with no branches, signals, nor train stops.
---@return double
function LuaEntity.get_rail_segment_length() end

--- Get a rail from each rail segment that overlaps with this rail's rail segment.
--- A rail segment is a continuous section of rail with no branches, signals, nor train stops.
---@return LuaEntity[]
function LuaEntity.get_rail_segment_overlaps() end

--- Get all rails of a rail segment this rail is in
--- A rail segment is a continuous section of rail with no branches, signals, nor train stops.
---@param direction defines.rail_direction @Selects end of this rail that points to a rail segment end from which to start returning rails
---@return LuaEntity[] @Rails of this rail segment
function LuaEntity.get_rail_segment_rails(direction) end

--- Get the rail signal at the start/end of the rail segment this rail is in.
--- A rail segment is a continuous section of rail with no branches, signals, nor train stops.
---@param direction defines.rail_direction @The direction of travel relative to this rail.
---@param in_else_out boolean @If true, gets the signal at the entrance of the rail segment, otherwise gets the signal at the exit of the rail segment.
---@return LuaEntity @`nil` if the rail segment doesn't start/end with a signal.
function LuaEntity.get_rail_segment_signal(direction, in_else_out) end

--- Get train stop at the start/end of the rail segment this rail is in.
--- A rail segment is a continuous section of rail with no branches, signals, nor train stops.
---@param direction defines.rail_direction @The direction of travel relative to this rail.
---@return LuaEntity @`nil` if the rail segment doesn't start/end with a train stop.
function LuaEntity.get_rail_segment_stop(direction) end

--- Current recipe being assembled by this machine, if any.
---@return LuaRecipe, LuaQualityPrototype
function LuaEntity.get_recipe() end

--- Read a single signal from the selected wire connector
---@param signal SignalID @The signal to read.
---@param wire_connector_id defines.wire_connector_id @Wire connector ID from which to get the signal
---@param extra_wire_connector_id defines.wire_connector_id|nil @Additional wire connector ID. If specified, signal will be added to the result
---@overload fun(signal: SignalID, wire_connector_id: defines.wire_connector_id): int
---@return int @The current value of the signal.
function LuaEntity.get_signal(signal, wire_connector_id, extra_wire_connector_id) end

--- Read all signals from the selected wire connector.
---@param wire_connector_id defines.wire_connector_id @Wire connector ID from which to get the signal
---@param extra_wire_connector_id defines.wire_connector_id|nil @Additional wire connector ID. If specified, signals will be added to the result
---@overload fun(wire_connector_id: defines.wire_connector_id): Signal[]
---@return Signal[] @Current values of all signals.
function LuaEntity.get_signals(wire_connector_id, extra_wire_connector_id) end

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

--- Returns the new entity prototype and its quality.
---@return LuaEntityPrototype, LuaQualityPrototype @`nil` if this entity is not marked for upgrade.; `nil` if this entity is not marked for upgrade.
function LuaEntity.get_upgrade_target() end

--- Gets a single wire connector of this entity
---@param wire_connector_id defines.wire_connector_id @Identifier of a specific connector to get
---@param or_create boolean @If true and connector does not exist, it will be allocated if possible
---@return LuaWireConnector
function LuaEntity.get_wire_connector(wire_connector_id, or_create) end

--- Gets all wire connectors of this entity
---@param or_create boolean @If true, it will try to create all connectors possible
---@return table<defines.wire_connector_id, LuaWireConnector>
function LuaEntity.get_wire_connectors(or_create) end

--- Same as [LuaEntity::has_flag](runtime:LuaEntity::has_flag), but targets the inner entity on a entity ghost.
---@param flag EntityPrototypeFlag @The flag to test.
---@return boolean @`true` if the entity has the given flag set.
function LuaEntity.ghost_has_flag(flag) end

--- Test whether this entity's prototype has a certain flag set.
--- `entity.has_flag(f)` is a shortcut for `entity.prototype.has_flag(f)`.
---@param flag EntityPrototypeFlag @The flag to test.
---@return boolean @`true` if this entity has the given flag set.
function LuaEntity.has_flag(flag) end

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
---@param force ForceID @The force construction manager to check.
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

---@class LuaEntity_mine_params
---@field inventory LuaInventory|nil @If provided the item(s) will be transferred into this inventory. If provided, this must be an inventory created with [LuaGameScript::create_inventory](runtime:LuaGameScript::create_inventory) or be a basic inventory owned by some entity.
---@field force boolean|nil @If true, when the item(s) don't fit into the given inventory the entity is force mined. If false, the mining operation fails when there isn't enough room to transfer all of the items into the inventory. Defaults to false. This is ignored and acts as `true` if no inventory is provided.
---@field raise_destroyed boolean|nil @If true, [script_raised_destroy](runtime:script_raised_destroy) will be raised. Defaults to `true`.
---@field ignore_minable boolean|nil @If true, the minable state of the entity is ignored. Defaults to `false`. If false, an entity that isn't minable (set as not-minable in the prototype or isn't minable for other reasons) will fail to be mined.

--- Mines this entity.
--- 'Standard' operation is to keep calling `LuaEntity.mine` with an inventory until all items are transferred and the items dealt with.
--- The result of mining the entity (the item(s) it produces when mined) will be dropped on the ground if they don't fit into the provided inventory. If no inventory is provided, the items will be destroyed.
---@param p LuaEntity_mine_params
---@return boolean @Whether mining succeeded.
function LuaEntity.mine(p) end

--- Sets the entity to be deconstructed by construction robots.
---@param force ForceID @The force whose robots are supposed to do the deconstruction.
---@param player PlayerIdentification|nil @The player to set the last_user to, if any. Also the player whose undo queue this action should be added to.
---@param item_index uint|nil @The index of the undo item to add this action to. An index of `0` creates a new undo item for it. An index of `1` adds the action to the latest undo action on the stack. Defaults to putting it into the appropriate undo item automatically if one is not specified.
---@overload fun(force: ForceID, player: PlayerIdentification|nil): boolean
---@overload fun(force: ForceID): boolean
---@return boolean @if the entity was marked for deconstruction.
function LuaEntity.order_deconstruction(force, player, item_index) end

---@class LuaEntity_order_upgrade_params
---@field target EntityWithQualityID @The prototype of the entity to upgrade to.
---@field force ForceID @The force whose robots are supposed to do the upgrade.
---@field player PlayerIdentification|nil @The player whose undo queue this action should be added to.
---@field item_index uint|nil @The index of the undo item to add this action to. An index of `0` creates a new undo item for it. Defaults to putting it into the appropriate undo item automatically if not specified.

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

---@class LuaEntity_remove_fluid_params
---@field name string @Fluid prototype name.
---@field amount double @Amount to remove
---@field minimum_temperature double|nil
---@field maximum_temperature double|nil
---@field temperature double|nil

--- Remove fluid from this entity.
--- If temperature is given only fluid matching that exact temperature is removed. If minimum and maximum is given fluid within that range is removed.
---@param p LuaEntity_remove_fluid_params
---@return double @Amount of fluid actually removed.
function LuaEntity.remove_fluid(p) end

--- Remove an offer from a market.
--- The other offers are moved down to fill the gap created by removing the offer, which decrements the overall size of the offer array.
---@param offer uint @Index of offer to remove.
---@return boolean @`true` if the offer was successfully removed; `false` when the given index was not valid.
function LuaEntity.remove_market_item(offer) end

---@param force ForceID @The force that requests the gate to be closed.
function LuaEntity.request_to_close(force) end

---@param force ForceID @The force that requests the gate to be open.
---@param extra_time uint|nil @Extra ticks to stay open.
---@overload fun(force: ForceID)
function LuaEntity.request_to_open(force, extra_time) end

---@class LuaEntity_revive_params
---@field return_item_request_proxy boolean|nil @If `true` the function will return item request proxy as the third return value.
---@field raise_revive boolean|nil @If true, and an entity ghost; [script_raised_revive](runtime:script_raised_revive) will be called. Else if true, and a tile ghost; [script_raised_set_tiles](runtime:script_raised_set_tiles) will be called.

--- Revive a ghost, which turns it from a ghost into a real entity or tile.
---@param p LuaEntity_revive_params
---@return table<string, uint>, LuaEntity, LuaEntity @Any items the new real entity collided with or `nil` if the ghost could not be revived.; The revived entity if an entity ghost was successfully revived.; The item request proxy if it was requested with `return_item_request_proxy`.
function LuaEntity.revive(p) end

---@class LuaEntity_rotate_params
---@field reverse boolean|nil @If `true`, rotate the entity in the counter-clockwise direction.
---@field by_player PlayerIdentification|nil

--- Rotates this entity as if the player rotated it.
---@param p LuaEntity_rotate_params
---@return boolean @Whether the rotation was successful.
function LuaEntity.rotate(p) end

--- Set the source of this beam.
---@param source LuaEntity | MapPosition
function LuaEntity.set_beam_source(source) end

--- Set the target of this beam.
---@param target LuaEntity | MapPosition
function LuaEntity.set_beam_target(target) end

--- Sets the driver of this vehicle.
--- This differs from [LuaEntity::set_passenger](runtime:LuaEntity::set_passenger) in that the passenger can't drive the vehicle.
---@param driver (LuaEntity | PlayerIdentification)|nil @The new driver. Writing `nil` ejects the current driver, if any.
---@overload fun()
function LuaEntity.set_driver(driver) end

--- Set the filter for a slot in an inserter (ItemFilter), loader (ItemFilter), mining drill (EntityID) or logistic storage container (ItemWithQualityID). The entity must allow filters.
---@param index uint @Index of the slot to set the filter for.
---@param filter (ItemFilter | ItemWithQualityID | EntityID)|nil @The item or entity to filter, or `nil` to clear the filter.
---@overload fun(index: uint)
function LuaEntity.set_filter(index, filter) end

--- Sets fluid to the i-th fluid storage.
--- Fluid storages that are part of FluidBoxes (also available through [LuaFluidBox](runtime:LuaFluidBox)) may reject some fluids if they do not match filters or are above the FluidBox volume. To verify how much fluid was set a return value can be used which is the same as value that would be returned by [LuaEntity::get_fluid](runtime:LuaEntity::get_fluid).
---@param index uint @Fluid storage index. Valid values are from 1 up to [LuaEntity::fluids_count](runtime:LuaEntity::fluids_count).
---@param fluid Fluid|nil @Fluid to set. Fluid storage will be cleared if this is not provided.
---@overload fun(index: uint): Fluid
---@return Fluid @Fluid in this storage after it was set. nil if fluid storage is empty.
function LuaEntity.set_fluid(index, fluid) end

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
--- This differs from [LuaEntity::get_driver](runtime:LuaEntity::get_driver) in that the passenger can't drive the car.
---@param passenger (LuaEntity | PlayerIdentification)|nil @The new passenger. Writing `nil` ejects the current passenger, if any.
---@overload fun()
function LuaEntity.set_passenger(passenger) end

--- Set the entity ID name at the specified position in the turret's priority list.
---@param index uint @The index of the entry to set.
---@param entity_id EntityID|nil @The name of the entity prototype, or `nil` to clear the entry.
---@overload fun(index: uint)
function LuaEntity.set_priority_target(index, entity_id) end

--- Sets the given recipe in this assembly machine.
---@param recipe RecipeID|nil @The new recipe. Writing `nil` clears the recipe, if any.
---@param quality QualityID|nil @The quality. If not provided `normal` is used.
---@overload fun(recipe: RecipeID|nil): ItemCountWithQuality[]
---@overload fun(): ItemCountWithQuality[]
---@return ItemCountWithQuality[] @Any items removed from this entity as a result of setting the recipe.
function LuaEntity.set_recipe(recipe, quality) end

---@class LuaEntity_silent_revive_params
---@field raise_revive boolean|nil @If true, and an entity ghost; [script_raised_revive](runtime:script_raised_revive) will be called. Else if true, and a tile ghost; [script_raised_set_tiles](runtime:script_raised_set_tiles) will be called.

--- Revives a ghost silently, so the revival makes no sound and no smoke is created.
---@param p LuaEntity_silent_revive_params
---@return ItemCountWithQuality[], LuaEntity, LuaEntity @Any items the new real entity collided with or `nil` if the ghost could not be revived.; The revived entity if an entity ghost was successfully revived.; The item request proxy.
function LuaEntity.silent_revive(p) end

--- Triggers spawn_decoration actions defined in the entity prototype or does nothing if entity is not "turret" or "unit-spawner".
function LuaEntity.spawn_decorations() end

--- Only works if the entity is a speech-bubble, with an "effect" defined in its wrapper_flow_style. Starts animating the opacity of the speech bubble towards zero, and destroys the entity when it hits zero.
function LuaEntity.start_fading_out() end

--- Sets the [speed](runtime:LuaEntity::speed) of the given SpiderVehicle to zero. Notably does not clear its [autopilot_destination](runtime:LuaEntity::autopilot_destination), which it will continue moving towards if set.
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
--- This property can also be read and written on the equipment grid of this entity.
function LuaEntity.toggle_equipment_movement_bonus() end

--- Reconnect loader, beacon, cliff and mining drill connections to entities that might have been teleported out or in by the script. The game doesn't do this automatically as we don't want to lose performance by checking this in normal games.
function LuaEntity.update_connections() end

---@class LuaEntityPrototype: LuaPrototypeBase @Prototype of an entity.
---@field absorptions_to_join_attack table<string, float> @ nilable; A table of pollutions amounts that has to be absorbed by the unit's spawner before the unit will leave the spawner and attack the source of the pollution, indexed by the name of each absorbed pollution type.
---@field active_energy_usage double @ nilable; The active energy usage of this rocket silo or combinator prototype.
---@field additional_pastable_entities LuaEntityPrototype[] @Entities this entity can be pasted onto in addition to the normal allowed ones.
---@field affected_by_tiles boolean @ nilable; Whether this unit prototype is affected by tile walking speed modifiers.
---@field air_resistance double @ nilable; The air resistance of this rolling stock prototype.
---@field alert_icon_scale float @The alert icon scale of this entity prototype.
---@field alert_icon_shift Vector @The alert icon shift of this entity prototype.
---@field alert_when_attacking boolean @ nilable; Whether this turret raises an alert when attacking
---@field alert_when_damaged boolean @ nilable; Whether this entity raises an alert when damaged.
---@field allow_access_to_all_forces boolean @ nilable; Whether this market allows access to all forces or just friendly ones.
---@field allow_burner_leech boolean @ nilable; Whether this inserter allows burner leeching.
---@field allow_copy_paste boolean @When false copy-paste is not allowed for this entity.
---@field allow_custom_vectors boolean @ nilable; Whether this inserter allows custom pickup and drop vectors.
---@field allow_passengers boolean @ nilable; Whether this vehicle allows passengers.
---@field allow_run_time_change_of_is_military_target boolean @ nilable; True if this entity-with-owner's is_military_target can be changed run-time (on the entity, not on the prototype itself)
---@field allowed_effects table<string, boolean> @ nilable; The allowed module effects for this entity, if any.
---@field allowed_module_categories table<string, true> @ nilable; The allowed module categories for this entity, if any.
---@field always_on boolean @ nilable; Whether the lamp is always on (except when out of power or turned off by the circuit network).
---@field ammo_category string @ nilable; Name of the ammo category of this land mine.
---@field animation_speed_coefficient double @ nilable; The animation speed coefficient of this belt connectable prototype.
---@field attack_parameters AttackParameters @ nilable; The attack parameters for this entity, if any.
---@field attack_result TriggerItem[] @ nilable; The attack result of this entity, if any.
---@field automated_ammo_count uint @ nilable; The amount of ammo that inserters automatically insert into this ammo-turret or artillery-turret.
---@field automatic_weapon_cycling boolean @ nilable; Whether this spider vehicle prototype automatically cycles weapons.
---@field autoplace_specification AutoplaceSpecification @ nilable; Autoplace specification for this entity prototype, if any.
---@field beacon_counter "total" | "same_type" @ nilable; The beacon counter used by effect receiver when deciding which sample to take from beacon profile.
---@field belt_distance double @ nilable
---@field belt_length double @ nilable
---@field belt_speed double @ nilable; The speed of this transport belt.
---@field boiler_mode "heat-fluid-inside" | "output-to-separate-pipe" @ nilable; The boiler operation mode of this boiler prototype.
---@field braking_force double @ nilable; The braking force of this vehicle prototype.
---@field build_base_evolution_requirement double @The evolution requirement to build this entity as a base when expanding enemy bases.
---@field build_distance uint @ nilable
---@field building_grid_bit_shift uint @The log2 of grid size of the building
---@field bulk boolean @ nilable; Whether this inserter is a bulk-type.
---@field burner_prototype LuaBurnerPrototype @ nilable; The burner energy source prototype this entity uses, if any.
---@field burns_fluid boolean @ nilable; Whether this generator prototype burns fluid.
---@field call_for_help_radius double @ nilable
---@field can_open_gates boolean @ nilable; Whether this unit prototype can open gates.
---@field chain_shooting_cooldown_modifier double @ nilable; The chain shooting cooldown modifier of this spider vehicle prototype.
---@field character_corpse LuaEntityPrototype @ nilable
---@field chunk_exploration_radius double @ nilable; The chunk exploration radius of this spider vehicle prototype.
---@field cliff_explosive_prototype string @ nilable; The item prototype name used to destroy this cliff.
---@field collision_box BoundingBox @The bounding box used for collision checking.
---@field collision_mask CollisionMask @The collision masks this entity uses
---@field collision_mask_collides_with_self boolean @Does this prototype collision mask collide with itself?
---@field collision_mask_collides_with_tiles_only boolean @Does this prototype collision mask collide with tiles only?
---@field collision_mask_considers_tile_transitions boolean @Does this prototype collision mask consider tile transitions?
---@field color Color @ nilable; The color of the prototype, if any.
---@field connection_distance double @ nilable
---@field construction_radius double @ nilable; The construction radius for this roboport prototype.
---@field consumption double @ nilable; The energy consumption of this car prototype.
---@field container_distance double @ nilable
---@field corpses table<string, LuaEntityPrototype> @ nilable; Corpses used when this entity is destroyed. It is a dictionary indexed by the corpse's prototype name.
---@field count_as_rock_for_filtered_deconstruction boolean @ nilable; If this simple-entity is counted as a rock for the deconstruction planner "trees and rocks only" filter.
---@field crafting_categories table<string, true> @ nilable; The [crafting categories](runtime:LuaRecipeCategoryPrototype) this entity prototype supports. The value in the dictionary is meaningless and exists just to allow for easy lookup.
---@field create_ghost_on_death boolean @If this prototype will attempt to create a ghost of itself on death. If this is false then a ghost will never be made, if it's true a ghost may be made.
---@field created_effect TriggerItem[] @ nilable; The trigger to run when this entity is created, if any.
---@field created_smoke {smoke_name: string, offsets: Vector[], offset_deviation: BoundingBox, initial_height: float, max_radius: float, speed: Vector, speed_multiplier: float, speed_multiplier_deviation: float, starting_frame: float, starting_frame_deviation: float, speed_from_center: float, speed_from_center_deviation: float} @ nilable; The smoke trigger run when this entity is built, if any.
---@field damage_hit_tint Color @ nilable
---@field darkness_for_all_lamps_off float @ nilable; Value between 0 and 1 darkness where all lamps of this lamp prototype are off.
---@field darkness_for_all_lamps_on float @ nilable; Value between 0 and 1 darkness where all lamps of this lamp prototype are on.
---@field destroy_non_fuel_fluid boolean @ nilable; Whether this generator prototype destroys non-fuel fluids.
---@field distraction_cooldown uint @ nilable; The distraction cooldown of this unit prototype.
---@field distribution_effectivity double @ nilable; The distribution effectivity for this beacon prototype.
---@field distribution_effectivity_bonus_per_quality_level double @ nilable; The distribution effectivity bonus per quality level for this beacon prototype.
---@field door_opening_speed double @ nilable; The door opening speed for this rocket silo prototype.
---@field draw_cargo boolean @ nilable; Whether this logistics or construction robot renders its cargo when flying.
---@field drawing_box_vertical_extension double @Extra vertical space needed to see the whole entity in GUIs. This is used to calculate the correct zoom and positioning in the entity info gui, for example in the entity tooltip.
---@field drop_item_distance uint @ nilable
---@field dying_speed float @ nilable; The dying time of this corpse prototype.
---@field effect_receiver EffectReceiver @ nilable; Effect receiver prototype of this crafting machine, lab, or mining drill.
---@field effectivity double @ nilable; The effectivity of this car prototype, generator prototype.
---@field electric_energy_source_prototype LuaElectricEnergySourcePrototype @ nilable; The electric energy source prototype this entity uses, if any.
---@field emissions_per_second table<string, double> @A table of pollution emissions per second the entity will create, grouped by the name of the pollution type.
---@field enemy_map_color Color @The enemy map color used when charting this entity.
---@field energy_per_hit_point double @ nilable; The energy used per hit point taken for this vehicle during collisions.
---@field energy_per_move double @ nilable; The energy consumed per tile moved for this flying robot.
---@field energy_per_tick double @ nilable; The energy consumed per tick for this flying robot.
---@field energy_usage double @ nilable; The direct energy usage of this entity, if any.
---@field engine_starting_speed double @ nilable; The engine starting speed for this rocket silo rocket prototype.
---@field enter_vehicle_distance double @ nilable
---@field explosion_beam double @ nilable; Whether this explosion has a beam.
---@field explosion_rotate double @ nilable; Whether this explosion rotates.
---@field fast_replaceable_group string @ nilable; The group of mutually fast-replaceable entities, if any.
---@field filter_count uint @ nilable; The filter count of this inserter, loader, mining drill or logistic chest. For logistic containers, `nil` means no limit.
---@field final_attack_result TriggerItem[] @ nilable; The final attack result for this projectile.
---@field fixed_recipe string @ nilable; The fixed recipe name for this assembling machine prototype, if any.
---@field flags EntityPrototypeFlags @The flags for this entity prototype.
---@field fluid_capacity double @The fluid capacity of this entity or 0 if this entity doesn't support fluids. Crafting machines will report 0 due to their fluid capacity being whatever a given recipe needs.
---@field fluid_energy_source_prototype LuaFluidEnergySourcePrototype @ nilable; The fluid energy source prototype this entity uses, if any.
---@field fluid_usage_per_tick double @ nilable; The fluid usage of this generator prototype.
---@field fluidbox_prototypes LuaFluidBoxPrototype[] @The fluidbox prototypes for this entity.
---@field flying_acceleration double @ nilable; The flying acceleration for this rocket silo rocket prototype.
---@field flying_speed double @ nilable; The flying speed for this rocket silo rocket prototype.
---@field friction_force double @ nilable; The friction of this vehicle prototype.
---@field friendly_map_color Color @The friendly map color used when charting this entity.
---@field grid_prototype LuaEquipmentGridPrototype @ nilable; The equipment grid prototype for this entity, if any.
---@field growth_grid_tile_size uint @ nilable
---@field growth_ticks uint @ nilable
---@field guns table<string, LuaItemPrototype> @ nilable; A mapping of the gun name to the gun prototype this prototype uses. `nil` if this entity prototype doesn't use guns.
---@field harvest_emissions table<string, double> @ nilable; A table of pollutants that this plant will release when it is harvested.
---@field has_belt_immunity boolean @ nilable; Whether this unit, car, or character prototype has belt immunity.
---@field healing_per_tick float @ nilable; Amount this entity can heal per tick, if any.
---@field heat_buffer_prototype LuaHeatBufferPrototype @ nilable; The heat buffer prototype this entity uses, if any.
---@field heat_energy_source_prototype LuaHeatEnergySourcePrototype @ nilable; The heat energy source prototype this entity uses, if any.
---@field height double @ nilable; The height of this spider vehicle prototype.
---@field indexed_guns LuaItemPrototype[] @ nilable; A vector of the gun prototypes of this car, spider vehicle, artillery wagon, or turret.
---@field infinite_depletion_resource_amount uint @ nilable; Every time this infinite resource 'ticks' down, it is reduced by this amount. Meaningless if this isn't an infinite resource.
---@field infinite_resource boolean @ nilable; Whether this resource is infinite.
---@field ingredient_count uint @ nilable; The max number of ingredients this crafting machine prototype supports.
---@field inserter_chases_belt_items boolean @ nilable; True if this inserter chases items on belts for pickup.
---@field inserter_drop_position Vector @ nilable; The drop position for this inserter.
---@field inserter_pickup_position Vector @ nilable; The pickup position for this inserter.
---@field inserter_stack_size_bonus uint @ nilable; The built-in stack size bonus of this inserter prototype.
---@field instruments ProgrammableSpeakerInstrument[] @ nilable; The instruments for this programmable speaker.
---@field inventory_type "normal" | "with_bar" | "with_filters_and_bar" @ nilable; The inventory type this container or linked container uses.
---@field is_building boolean
---@field is_entity_with_owner boolean @True if this is entity-with-owner
---@field is_military_target boolean @ nilable; True if this entity-with-owner is military target
---@field item_pickup_distance double @ nilable
---@field items_to_place_this ItemStackDefinition[] @ nilable; Items that when placed will produce this entity, if any. Construction bots will choose the first item in the list to build this entity.
---@field joint_distance double @ nilable
---@field lab_inputs string[] @ nilable; The item prototype names that are the inputs of this lab prototype.
---@field lamp_energy_usage double @ nilable; The lamp energy usage of this rocket silo prototype.
---@field launch_wait_time uint8 @ nilable; The rocket launch delay for this rocket silo prototype.
---@field light_blinking_speed double @ nilable; The light blinking speed for this rocket silo prototype.
---@field logistic_mode "requester" | "active-provider" | "passive-provider" | "buffer" | "storage" | "none" @ nilable; The logistic mode of this logistic container.
---@field logistic_parameters {spawn_and_station_height: float, spawn_and_station_shadow_height_offset: float, stationing_render_layer_swap_height: float, charge_approach_distance: float, logistic_radius: float, construction_radius: float, charging_station_count: uint, charging_distance: float, charging_station_shift: Vector, charging_energy: double, charging_threshold_distance: float, robot_vertical_acceleration: float, stationing_offset: Vector, robot_limit: uint, logistics_connection_distance: float, robots_shrink_when_entering_and_exiting: boolean} @ nilable; The logistic parameters for this roboport.
---@field logistic_radius double @ nilable; The logistic radius for this roboport prototype.
---@field loot Loot[] @ nilable; Loot that will be dropped when this entity is killed, if any.
---@field loot_pickup_distance double @ nilable
---@field manual_range_modifier double @ nilable; The manual range modifier for this artillery turret or wagon prototype.
---@field map_color Color @ nilable; The map color used when charting this entity if a friendly or enemy color isn't defined, if any.
---@field map_generator_bounding_box BoundingBox @The bounding box used for map generator collision checking.
---@field max_count_of_owned_units double @ nilable; Count of enemies this spawner can sustain.
---@field max_darkness_to_spawn float @ nilable; The maximum darkness at which this unit spawner can spawn entities.
---@field max_friends_around_to_spawn double @ nilable; How many friendly units are required within the spawning_radius of this spawner for it to stop producing more units.
---@field max_payload_size uint @ nilable; The max payload size of this logistics or construction robot.
---@field max_polyphony uint @ nilable; The maximum polyphony for this programmable speaker.
---@field max_power_output double @ nilable; The default maximum power output of this generator prototype.
---@field max_pursue_distance double @ nilable; The maximum pursue distance of this unit prototype.
---@field max_speed double @ nilable; The max speed of this projectile or flying robot prototype.
---@field max_to_charge float @ nilable; The maximum energy for this flying robot above which it won't try to recharge when stationing.
---@field max_underground_distance uint8 @ nilable; The max underground distance for underground belts and underground pipes.
---@field maximum_corner_sliding_distance double @ nilable
---@field maximum_temperature double @ nilable; The maximum fluid temperature of this generator prototype.
---@field min_darkness_to_spawn float @ nilable; The minimum darkness at which this unit spawner can spawn entities.
---@field min_pursue_time uint @ nilable; The minimum pursue time of this unit prototype.
---@field min_to_charge float @ nilable; The minimum energy for this flying robot before it tries to recharge.
---@field mineable_properties MineableProperties @Whether this entity is minable and what can be obtained by mining it.
---@field minimum_resource_amount uint @ nilable; Minimum amount of this resource.
---@field mining_drill_radius double @ nilable; The mining radius of this mining drill prototype.
---@field mining_speed double @ nilable; The mining speed of this mining drill/character prototype.
---@field module_inventory_size uint @ nilable; The module inventory size. `nil` if this entity doesn't support modules.
---@field move_while_shooting boolean @ nilable; Whether this unit prototype can move while shooting.
---@field neighbour_bonus double @ nilable
---@field next_upgrade LuaEntityPrototype @ nilable; The next upgrade for this entity, if any.
---@field normal_resource_amount uint @ nilable; The normal amount for this resource.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field profile double[] @ nilable; The beacon profile: extra multiplier applied to the effects received from beacon by the effect receiver based on amount of beacons that reach that effect receiver
---@field protected_from_tile_building boolean @True if this entity prototype should be included during tile collision checks with [LuaTilePrototype::check_collision_with_entities](runtime:LuaTilePrototype::check_collision_with_entities) enabled.
---@field pumping_speed double @ nilable; The pumping speed of this offshore or normal pump.
---@field radar_range uint @ nilable; The radar range of this unit prototype.
---@field radius double @The radius of this entity prototype.
---@field radius_visualisation_specification RadiusVisualisationSpecification @ nilable
---@field reach_distance uint @ nilable
---@field reach_resource_distance double @ nilable
---@field related_underground_belt LuaEntityPrototype @ nilable
---@field remains_when_mined LuaEntityPrototype[] @The remains left behind when this entity is mined.
---@field remove_decoratives "automatic" | "true" | "false" @Whether this entity should remove decoratives that collide with it when this entity is built.
---@field repair_speed_modifier float @ nilable; Repair-speed modifier for this entity, if any. Actual repair speed will be `tool_repair_speed * entity_repair_speed_modifier`.
---@field resistances table<string, Resistance> @ nilable; List of resistances towards each damage type. It is a dictionary indexed by damage type names (see `data/base/prototypes/damage-type.lua`).
---@field resource_categories table<string, true> @ nilable; The [resource categories](runtime:LuaResourceCategoryPrototype) this character or mining drill supports. The value in the dictionary is meaningless and exists just to allow for easy lookup.
---@field resource_category string @ nilable; Name of the category of this resource. During data stage, this property is named "category".
---@field resource_drain_rate_percent uint8 @ nilable; The resource drain rate percent of this mining drill prototype.
---@field respawn_time uint @ nilable
---@field result_units UnitSpawnDefinition[] @ nilable; The result units and spawn points with weight and evolution factor for a biter spawner entity.
---@field rising_speed double @ nilable; The rising speed for this rocket silo rocket prototype.
---@field rocket_entity_prototype LuaEntityPrototype @ nilable; The rocket entity prototype associated with this rocket silo prototype.
---@field rocket_parts_required uint @ nilable; The rocket parts required for this rocket silo prototype.
---@field rocket_rising_delay uint8 @ nilable; The rocket rising delay for this rocket silo prototype.
---@field rotation_speed double @ nilable; The rotation speed of this car prototype.
---@field running_speed double @ nilable; The movement speed of this character prototype.
---@field scale_fluid_usage boolean @ nilable; Whether this generator prototype scales fluid usage.
---@field secondary_collision_box BoundingBox @ nilable; The secondary bounding box used for collision checking, if any. This is only used in rails and rail remnants.
---@field selectable_in_game boolean @Is this entity selectable?
---@field selection_box BoundingBox @The bounding box used for drawing selection.
---@field selection_priority uint @The selection priority of this entity - a value between `0` and `255`.
---@field shooting_cursor_size float @The cursor size used when shooting at this entity.
---@field spawn_cooldown {min: double, max: double} @ nilable; The spawning cooldown for this enemy spawner prototype.
---@field spawn_decoration TriggerEffectItem[] @ nilable
---@field spawn_decorations_on_expansion boolean @ nilable
---@field spawning_radius double @ nilable; How far from the spawner can the units be spawned.
---@field spawning_spacing double @ nilable; What spaces should be between the spawned units.
---@field spawning_time_modifier double @ nilable; The spawning time modifier of this unit prototype.
---@field speed double @ nilable; The default speed of this flying robot, rolling stock or unit. For rolling stocks, this is their `max_speed`.
---@field speed_multiplier_when_out_of_energy float @ nilable; The speed multiplier when this flying robot is out of energy.
---@field sticker_box BoundingBox @The bounding box used to attach sticker type entities.
---@field supports_direction boolean @Whether this entity prototype could possibly ever be rotated.
---@field surface_conditions SurfaceCondition[] @ nilable; The surface conditions required to build this entity.
---@field tank_driving boolean @ nilable; If this car prototype uses tank controls to drive.
---@field target_temperature double @ nilable; The target temperature of this boiler prototype.
---@field terrain_friction_modifier float @ nilable; The terrain friction modifier for this vehicle.
---@field ticks_to_keep_aiming_direction uint @ nilable
---@field ticks_to_keep_gun uint @ nilable
---@field ticks_to_stay_in_combat uint @ nilable
---@field tile_height uint @Specifies the tiling size of the entity, is used to decide, if the center should be in the center of the tile (odd tile size dimension) or on the tile border (even tile size dimension)
---@field tile_width uint @Specifies the tiling size of the entity, is used to decide, if the center should be in the center of the tile (odd tile size dimension) or on the tile border (even tile size dimension)
---@field time_to_live uint @The time to live for this prototype or `0` if prototype doesn't have time_to_live or time_before_removed.
---@field timeout uint @ nilable; The time it takes this land mine to arm.
---@field torso_bob_speed double @ nilable; The torso bob speed of this spider vehicle prototype.
---@field torso_rotation_speed double @ nilable; The torso rotation speed of this spider vehicle prototype.
---@field tree_color_count uint8 @ nilable; If it is a tree, return the number of colors it supports.
---@field trigger_collision_mask CollisionMask @ nilable; The collision mask entities must collide with to make this landmine blow up.
---@field trigger_target_mask table<string, boolean> @The trigger target mask for this entity prototype type. The values in the dictionary are meaningless and exists just to allow the dictionary type for easy lookup.
---@field turret_range uint @ nilable; The range of this turret.
---@field turret_rotation_speed float @ nilable; The turret rotation speed of this car prototype.
---@field use_exact_mode boolean @ nilable; Whether this logistic container prototype uses exact mode
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field vector_to_place_result Vector @ nilable
---@field vertical_selection_shift double @ nilable; Vertical selection shift used by rolling stocks. It affects selection box vertical position but is also used to shift rolling stock graphics along the rails to fine tune train's look.
---@field vision_distance double @ nilable; The vision distance of this unit prototype.
---@field void_energy_source_prototype LuaVoidEnergySourcePrototype @ nilable; The void energy source prototype this entity uses, if any.
---@field weight double @ nilable; The weight of this vehicle prototype.
LuaEntityPrototype = {}

--- The crafting speed of this crafting-machine.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntityPrototype.get_crafting_speed(quality) end

--- The extension speed of this inserter.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntityPrototype.get_inserter_extension_speed(quality) end

--- The rotation speed of this inserter.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntityPrototype.get_inserter_rotation_speed(quality) end

--- Gets the base size of the given inventory on this entity or `nil` if the given inventory doesn't exist.
---@param index defines.inventory
---@return uint
function LuaEntityPrototype.get_inventory_size(index) end

--- The maximum circuit wire distance for this entity. 0 if the entity doesn't support circuit wires.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntityPrototype.get_max_circuit_wire_distance(quality) end

--- The radius of the area constantly revealed by this radar, or cargo landing pad, in chunks.
---@param quality QualityID|nil
---@overload fun(): uint
---@return uint
function LuaEntityPrototype.get_max_distance_of_nearby_sector_revealed(quality) end

--- The radius of the area this radar can chart, in chunks.
---@param quality QualityID|nil
---@overload fun(): uint
---@return uint
function LuaEntityPrototype.get_max_distance_of_sector_revealed(quality) end

--- The max energy for this flying robot prototype.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntityPrototype.get_max_energy(quality) end

--- The theoretical maximum energy production for this entity.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntityPrototype.get_max_energy_production(quality) end

--- The theoretical maximum energy usage for this entity.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntityPrototype.get_max_energy_usage(quality) end

--- Max health of this entity. Will be `0` if this is not an entity with health.
---@param quality QualityID|nil
---@overload fun(): float
---@return float
function LuaEntityPrototype.get_max_health(quality) end

--- The maximum wire distance for this entity. 0 if the entity doesn't support wires.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntityPrototype.get_max_wire_distance(quality) end

--- The base researching speed of this lab prototype.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntityPrototype.get_researching_speed(quality) end

--- The supply area of this electric pole or beacon prototype.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEntityPrototype.get_supply_area_distance(quality) end

--- Test whether this entity prototype has a certain flag set.
---@param flag EntityPrototypeFlag @The flag to test.
---@return boolean @`true` if this prototype has the given flag set.
function LuaEntityPrototype.has_flag(flag) end

---@class LuaEquipment: any @An item in a [LuaEquipmentGrid](runtime:LuaEquipmentGrid), for example a fusion reactor placed in one's power armor. An equipment reference becomes invalid once the equipment is removed or the equipment grid it resides in is destroyed.
---@field burner LuaBurner @ nilable; The burner energy source for this equipment, if any.
---@field energy double @Current available energy.
---@field generator_power double @Energy generated per tick.
---@field ghost_name string @Name of the equipment contained in this ghost
---@field ghost_prototype LuaEquipmentPrototype @The prototype of the equipment contained in this ghost.
---@field ghost_type string @Type of the equipment contained in this ghost.
---@field max_energy double @Maximum amount of energy that can be stored in this equipment.
---@field max_shield double @Maximum shield value.
---@field max_solar_power double @Maximum solar power generated.
---@field movement_bonus double @Movement speed bonus.
---@field name string @Name of this equipment.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field position EquipmentPosition @Position of this equipment in the equipment grid.
---@field prototype LuaEquipmentPrototype
---@field quality LuaQualityPrototype @Quality of this equipment.
---@field shape {width: uint, height: uint} @Shape of this equipment.
---@field shield double @Current shield value of the equipment. Can't be set higher than [LuaEquipment::max_shield](runtime:LuaEquipment::max_shield).
---@field to_be_removed boolean @If this equipment is marked to be removed.
---@field type string @Type of this equipment.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaEquipment = {}

---@class LuaEquipmentCategoryPrototype: LuaPrototypeBase @Prototype of an equipment category.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaEquipmentCategoryPrototype = {}

---@class LuaEquipmentGrid: any @An equipment grid is for example the inside of a power armor.
---@field available_in_batteries double @The total energy stored in all batteries in the equipment grid.
---@field battery_capacity double @Total energy storage capacity of all batteries in the equipment grid.
---@field entity_owner LuaEntity @ nilable; The entity that this equipment grid is owned by (in some inventory or item stack.) If the owning entity is a character owned by some player and the player is disconnected this will return `nil`.
---@field equipment LuaEquipment[] @All the equipment in this grid.
---@field height uint @Height of the equipment grid.
---@field inhibit_movement_bonus boolean @Whether this grid's equipment movement bonus is active.
---@field max_shield float @The maximum amount of shields this equipment grid has.
---@field max_solar_energy double @Maximum energy per tick that can be created by any solar panels in the equipment grid. Actual generated energy varies depending on the daylight levels.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field player_owner LuaPlayer @ nilable; The player that this equipment grid is owned by (in some inventory or item stack.)
---@field prototype LuaEquipmentGridPrototype
---@field shield float @The amount of shields this equipment grid has.
---@field unique_id uint @Unique identifier of this equipment grid.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field width uint @Width of the equipment grid.
LuaEquipmentGrid = {}

---@class LuaEquipmentGrid_can_move_params
---@field equipment LuaEquipment @The equipment to move
---@field position EquipmentPosition @Where to put it

--- Check whether moving an equipment would succeed.
---@param p LuaEquipmentGrid_can_move_params
---@return boolean
function LuaEquipmentGrid.can_move(p) end

--- Cancels removal for the given equipment.
---@param equipment LuaEquipment
---@return boolean @If the equipment removal was successfully cancelled.
function LuaEquipmentGrid.cancel_removal(equipment) end

--- Clear all equipment from the grid, removing it without actually returning it.
---@param by_player PlayerIdentification|nil @If provided, the action is done 'as' this player and [on_player_removed_equipment](runtime:on_player_removed_equipment) is triggered.
---@overload fun()
function LuaEquipmentGrid.clear(by_player) end

--- Get the number of all or some equipment in this grid.
---@param equipment string|nil @Prototype name of the equipment to count. If not specified, count all equipment.
---@overload fun(): uint
---@return uint
function LuaEquipmentGrid.count(equipment) end

--- Find equipment by name.
---@param equipment EquipmentWithQualityID @Prototype of the equipment to find.
---@param search_ghosts boolean|nil @If ghosts inner equipment should be searched. Defaults to `false`
---@overload fun(equipment: EquipmentWithQualityID): LuaEquipment
---@return LuaEquipment @The first found equipment, or `nil` if equipment could not be found.
function LuaEquipmentGrid.find(equipment, search_ghosts) end

--- Find equipment in the Equipment Grid based off a position.
---@param position EquipmentPosition @The position
---@return LuaEquipment @The found equipment, or `nil` if equipment could not be found at the given position.
function LuaEquipmentGrid.get(position) end

--- Get counts of all equipment in this grid.
---@return table<string, uint> @The counts, indexed by equipment names.
function LuaEquipmentGrid.get_contents() end

--- Total energy per tick generated by the equipment inside this grid.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEquipmentGrid.get_generator_energy(quality) end

---@class LuaEquipmentGrid_move_params
---@field equipment LuaEquipment @The equipment to move
---@field position EquipmentPosition @Where to put it

--- Move an equipment within this grid.
---@param p LuaEquipmentGrid_move_params
---@return boolean @`true` if the equipment was successfully moved.
function LuaEquipmentGrid.move(p) end

--- Marks the given equipment for removal. If the given equipment is a ghost it is removed.
---@param equipment LuaEquipment
---@return boolean @If the equipment was successfully marked for removal (or in the case of a ghost; removed.)
function LuaEquipmentGrid.order_removal(equipment) end

---@class LuaEquipmentGrid_put_params
---@field name EquipmentID @Equipment prototype name
---@field quality QualityID|nil @The quality, `nil` for any or if not provided `normal` is used.
---@field position EquipmentPosition|nil @Grid position to put the equipment in.
---@field by_player PlayerIdentification|nil @If provided the action is done 'as' this player and [on_player_placed_equipment](runtime:on_player_placed_equipment) is triggered.
---@field ghost boolean|nil @If true, place the equipment as a ghost.

--- Insert an equipment into the grid.
---@param p LuaEquipmentGrid_put_params
---@return LuaEquipment @The newly-added equipment, or `nil` if the equipment could not be added.
function LuaEquipmentGrid.put(p) end

--- Revives the given equipment ghost if possible.
---@param equipment LuaEquipment @The equipment ghost to revive.
---@return LuaEquipment
function LuaEquipmentGrid.revive(equipment) end

---@class LuaEquipmentGrid_take_params
---@field position EquipmentPosition|nil @Take the equipment that contains this position in the grid.
---@field equipment LuaEquipment|nil @Take this exact equipment.
---@field by_player PlayerIdentification|nil @If provided the action is done 'as' this player and [on_player_removed_equipment](runtime:on_player_removed_equipment) is triggered.

--- Remove an equipment from the grid.
---@param p LuaEquipmentGrid_take_params
---@return SimpleItemStack @The removed equipment, or `nil` if no equipment was removed.
function LuaEquipmentGrid.take(p) end

--- Remove all equipment from the grid.
---@param by_player PlayerIdentification|nil @If provided, the action is done 'as' this player and [on_player_removed_equipment](runtime:on_player_removed_equipment) is triggered.
---@overload fun(): ItemCountWithQuality[]
---@return ItemCountWithQuality[] @List of the equipment that has been removed.
function LuaEquipmentGrid.take_all(by_player) end

---@class LuaEquipmentGridPrototype: LuaPrototypeBase @Prototype of an equipment grid.
---@field equipment_categories string[] @Equipment category names for the [categories](runtime:LuaEquipmentPrototype::equipment_categories) that may be inserted into this equipment grid. The grid will accept any equipment that has at least one category in this list.
---@field height uint
---@field locked boolean @If the player can move equipment into or out of this grid.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field width uint
LuaEquipmentGridPrototype = {}

---@class LuaEquipmentPrototype: LuaPrototypeBase @Prototype of a modular equipment.
---@field attack_parameters AttackParameters @ nilable; The equipment attack parameters.
---@field automatic boolean @Whether this active defense equipment is automatic. Returns false if not active defense equipment.
---@field background_color Color @The background color of this equipment prototype.
---@field burner_prototype LuaBurnerPrototype @ nilable; The burner energy source prototype this equipment uses, if any.
---@field electric_energy_source_prototype LuaElectricEnergySourcePrototype @ nilable; The electric energy source prototype this equipment uses, if any.
---@field energy_per_shield double @The energy per shield point restored. 0 for non-shield equipment.
---@field energy_production double @The max power generated by this equipment.
---@field energy_source LuaElectricEnergySourcePrototype @The energy source prototype for the equipment.
---@field equipment_categories string[] @Category names for this equipment. These [categories](runtime:LuaEquipmentGridPrototype::equipment_categories) will be used to determine whether this equipment is allowed in a particular equipment grid.
---@field logistic_parameters {spawn_and_station_height: float, spawn_and_station_shadow_height_offset: float, stationing_render_layer_swap_height: float, charge_approach_distance: float, logistic_radius: float, construction_radius: float, charging_station_count: uint, charging_distance: float, charging_station_shift: Vector, charging_energy: double, charging_threshold_distance: float, robot_vertical_acceleration: float, stationing_offset: Vector, robot_limit: uint, logistics_connection_distance: float, robots_shrink_when_entering_and_exiting: boolean} @ nilable; The logistic parameters for this roboport equipment.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field shape {width: uint, height: uint, points: EquipmentPoint[]} @Shape of this equipment prototype.
---@field take_result LuaItemPrototype @ nilable; The result item when taking this equipment out of an equipment grid, if any.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaEquipmentPrototype = {}

---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaEquipmentPrototype.get_energy_consumption(quality) end

---@param quality QualityID|nil
---@overload fun(): float
---@return float
function LuaEquipmentPrototype.get_movement_bonus(quality) end

--- The shield value of this equipment. 0 for non-shield equipment.
---@param quality QualityID|nil
---@overload fun(): float
---@return float
function LuaEquipmentPrototype.get_shield(quality) end

---@class LuaFlowStatistics: any @Encapsulates statistic data for different parts of the game. In the context of flow statistics, `input`, `output` and `storage` describe in which position of the associated GUI the values are shown. Input values are shown on the far left side, output values to the immediate right, and storage values (if present) to the far right. - The item production GUI shows "consumption" on the right, thus `output` describes the item consumption numbers. The same goes for fluid consumption. - The kills GUI shows "losses" on the right, so `output` describes how many of the force's entities were killed by enemies. - The electric network GUI shows "power consumption" on the left side, so in this case `input` describes the power consumption numbers. In addition, electric networks are currently the only ones that utilize the `storage` part of their statistics, showing accumulator charges to the far right of the GUI.
---@field force LuaForce @ nilable; The force these statistics belong to. `nil` for pollution statistics.
---@field input_counts table<string, uint64 | double> @List of input counts indexed by prototype name. Represents the data that is shown on the left side of the GUI for the given statistics.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field output_counts table<string, uint64 | double> @List of output counts indexed by prototype name. Represents the data that is shown in the middle of the GUI for electric networks and on the right side for all other statistics types.
---@field storage_counts table<string, uint64 | double> @List of storage counts indexed by prototype name. Represents the data that is shown on the right side of the GUI for electric networks. For other statistics types these values are currently unused and hidden.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFlowStatistics = {}

--- Reset all the statistics data to 0.
function LuaFlowStatistics.clear() end

---@class LuaFlowStatistics_get_flow_count_params
---@field name string @The prototype name.
---@field category string @The statistics category to read from. Valid choices are `"input"`, `"output"` and `"storage"`.
---@field precision_index defines.flow_precision_index @The precision to read.
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

--- Gets the total storage count for a given prototype.
---@param name string @The prototype name.
---@return uint64 | double
function LuaFlowStatistics.get_storage_count(name) end

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

--- Sets the total storage count for a given prototype.
---@param name string @The prototype name.
---@param count uint64 | double @The new count. The type depends on the instance of the statistics.
function LuaFlowStatistics.set_storage_count(name, count) end

---@class LuaFluidBox: any @An array of fluid boxes of an entity. Entities may contain more than one fluid box, and some can change the number of fluid boxes -- for instance, an assembling machine will change its number of fluid boxes depending on its active recipe. See [Fluid](runtime:Fluid). Do note that reading from a [LuaFluidBox](runtime:LuaFluidBox) creates a new table and writing will copy the given fields from the table into the engine's own fluid box structure. Therefore, the correct way to update a fluidbox of an entity is to read it first, modify the table, then write the modified table back. Directly accessing the returned table's attributes won't have the desired effect.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field owner LuaEntity @The entity that owns this fluidbox.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFluidBox = {}

--- Registers a linked connection between this entity and other entity. Because entity may have multiple fluidboxes, each with multiple connections that could be linked, a unique value for this and other linked_connection_id may need to be given.
--- It may happen a linked connection is not established immediately due to crafting machines being possible to not have certain fluidboxes exposed at a given point in time, but once they appear (due to recipe changes that would use them) they will be linked. Linked connections are persisted as (this_entity, this_linked_connection_id, other_entity, other_linked_connection_id) so if a pipe connection definition's value of linked_connection_id changes existing connections may not restore correct connections.
--- Every fluidbox connection that was defined in prototypes as connection_type=="linked" may be linked to at most 1 other fluidbox. When trying to connect already used connection, previous connection will be removed.
--- Linked connections cannot go to the same entity even if they would be part of other fluidbox.
---@param this_linked_connection_id uint
---@param other_entity LuaEntity
---@param other_linked_connection_id uint
function LuaFluidBox.add_linked_connection(this_linked_connection_id, other_entity, other_linked_connection_id) end

--- Flushes all fluid from this fluidbox and its fluid system.
---@param index uint
---@param fluid FluidID|nil @If provided, only this fluid is flushed.
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

--- Gets counts of all fluids in the fluid segment. May return `nil` for fluid wagon, fluid turret's internal buffer, or a fluidbox which does not belong to a fluid segment.
---@param index uint
---@return table<string, uint> @The counts, indexed by fluid name.
function LuaFluidBox.get_fluid_segment_contents(index) end

--- Gets the unique ID of the fluid segment this fluid box belongs to. May return `nil` for fluid wagon, fluid turret's internal buffer or a fluidbox which does not belong to a fluid segment.
---@param index uint
---@return uint
function LuaFluidBox.get_fluid_segment_id(index) end

--- Returns other end of a linked connection.
---@param this_linked_connection_id uint
---@return LuaEntity, uint @Other entity to which a linked connection was made; linked_connection_id on other entity
function LuaFluidBox.get_linked_connection(this_linked_connection_id) end

--- Returns list of all linked connections registered for this entity.
---@return FluidBoxConnectionRecord[]
function LuaFluidBox.get_linked_connections() end

--- Returns the fluid the fluidbox is locked onto
---@param index uint
---@return string @`nil` if the fluidbox is not locked to any fluid.
function LuaFluidBox.get_locked_fluid(index) end

--- Get the fluid box's connections and associated data.
---@param index uint
---@return PipeConnection[]
function LuaFluidBox.get_pipe_connections(index) end

--- The prototype of this fluidbox index. If this is used on a fluidbox of a crafting machine which due to recipe was created by merging multiple prototypes, a table of prototypes that were merged will be returned instead
---@param index uint
---@return LuaFluidBoxPrototype | LuaFluidBoxPrototype[]
function LuaFluidBox.get_prototype(index) end

--- Removes linked connection record. If connected, other end will be also removed.
---@param this_linked_connection_id uint
function LuaFluidBox.remove_linked_connection(this_linked_connection_id) end

--- Set a fluid box filter.
--- Some entities cannot have their fluidbox filter set, notably fluid wagons and crafting machines.
---@param index uint @The index of the filter to set.
---@param filter FluidBoxFilterSpec | nil @The filter to set. Setting `nil` clears the filter.
---@return boolean @Whether the filter was set successfully.
function LuaFluidBox.set_filter(index, filter) end

---@class LuaFluidBoxPrototype: any @A prototype of a fluidbox owned by some [LuaEntityPrototype](runtime:LuaEntityPrototype).
---@field entity LuaEntityPrototype @The entity that this belongs to.
---@field filter LuaFluidPrototype @ nilable; The filter, if any is set.
---@field index uint @The index of this fluidbox prototype in the owning entity.
---@field maximum_temperature double @ nilable; The maximum temperature, if any is set.
---@field minimum_temperature double @ nilable; The minimum temperature, if any is set.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field pipe_connections PipeConnectionDefinition[] @The pipe connection points.
---@field production_type "input" | "input-output" | "output" | "none" @The production type.
---@field render_layer string @The render layer.
---@field secondary_draw_orders int[] @The secondary draw orders for the 4 possible connection directions.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field volume double
LuaFluidBoxPrototype = {}

---@class LuaFluidEnergySourcePrototype: any @Prototype of a fluid energy source.
---@field burns_fluid boolean
---@field destroy_non_fuel_fluid boolean
---@field effectivity double
---@field emissions_per_joule table<string, double> @The table of emissions of this energy source in `pollution/Joule`, indexed by pollutant type. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
---@field fluid_box LuaFluidBoxPrototype @The fluid box for this energy source.
---@field fluid_usage_per_tick double
---@field maximum_temperature double
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field render_no_network_icon boolean
---@field render_no_power_icon boolean
---@field scale_fluid_usage boolean
---@field smoke SmokeSource[] @The smoke sources for this prototype, if any.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFluidEnergySourcePrototype = {}

---@class LuaFluidPrototype: LuaPrototypeBase @Prototype of a fluid.
---@field base_color Color
---@field default_temperature double @Default temperature of this fluid.
---@field emissions_multiplier double @A multiplier on the amount of emissions produced when this fluid is burnt in a generator. A value above `1.0` increases emissions and vice versa. The multiplier can't be negative.
---@field flow_color Color
---@field fuel_value double @The amount of energy in Joules one unit of this fluid will produce when burnt in a generator. A value of `0` means this fluid can't be used for energy generation. The value can't be negative.
---@field gas_temperature double @The temperature above which this fluid will be shown as gaseous inside tanks and pipes.
---@field heat_capacity double @The amount of energy in Joules required to heat one unit of this fluid by 1°C.
---@field max_temperature double @Maximum temperature this fluid can reach.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFluidPrototype = {}

---@class LuaFontPrototype: any @Prototype of a font.
---@field border boolean
---@field border_color Color @ nilable; The border color, if any.
---@field filtered boolean
---@field from string
---@field name string @Name of this prototype.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field size int
---@field spacing float
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFontPrototype = {}

---@class LuaForce: any @`LuaForce` encapsulates data local to each "force" or "faction" of the game. Default forces are player, enemy and neutral. Players and mods can create additional forces (up to 64 total).
---@field ai_controllable boolean @Enables some higher-level AI behaviour for this force. When set to `true`, biters belonging to this force will automatically expand into new territories, build new spawners, and form unit groups. By default, this value is `true` for the enemy force and `false` for all others. Setting this to `false` does not turn off biters' AI. They will still move around and attack players who come close. It is necessary for a force to be AI controllable in order to be able to create unit groups or build bases from scripts.
---@field artillery_range_modifier double
---@field beacon_distribution_modifier double
---@field belt_stack_size_bonus uint @Belt stack size bonus.
---@field bulk_inserter_capacity_bonus uint @Number of items that can be transferred by bulk inserters. When writing to this value, it must be >= 0 and <= 254.
---@field character_build_distance_bonus uint
---@field character_health_bonus double
---@field character_inventory_slots_bonus uint @The number of additional inventory slots the character main inventory has.
---@field character_item_drop_distance_bonus uint
---@field character_item_pickup_distance_bonus double
---@field character_logistic_requests boolean @`true` if character requester logistics is enabled.
---@field character_loot_pickup_distance_bonus double
---@field character_reach_distance_bonus uint
---@field character_resource_reach_distance_bonus double
---@field character_running_speed_modifier double @Modifies the running speed of all characters in this force by the given value as a percentage. Setting the running modifier to `0.5` makes the character run 50% faster. The minimum value of `-1` reduces the movement speed by 100%, resulting in a speed of `0`.
---@field character_trash_slot_count double @Number of character trash slots.
---@field color Color @Effective color of this force.
---@field connected_players LuaPlayer[] @The connected players belonging to this force. This is primarily useful when you want to do some action against all online players of this force. This does *not* index using player index. See [LuaPlayer::index](runtime:LuaPlayer::index) on each player instance for the player index.
---@field create_ghost_on_entity_death boolean @When an entity dies, a ghost will be placed for automatic reconstruction.
---@field current_research LuaTechnology @ nilable; The currently ongoing technology research, if any.
---@field custom_color Color @ nilable; Custom color for this force. If specified, will take priority over other sources of the force color. Writing `nil` clears custom color. Will return `nil` if it was not specified or if was set to `{0,0,0,0}`.
---@field deconstruction_time_to_live uint @The time, in ticks, before a deconstruction order is removed.
---@field following_robots_lifetime_modifier double @Additional lifetime for following robots.
---@field friendly_fire boolean @If friendly fire is enabled for this force.
---@field index uint @This force's index in [LuaGameScript::forces](runtime:LuaGameScript::forces) (unique ID). It is assigned when a force is created, and remains so until it is [merged](runtime:on_forces_merged) (ie. deleted). Indexes of merged forces can be reused.
---@field inserter_stack_size_bonus double @The inserter stack size bonus for non stack inserters
---@field items_launched ItemCountWithQuality[] @All of the items that have been launched in rockets.
---@field laboratory_productivity_bonus double
---@field laboratory_speed_modifier double
---@field logistic_networks table<string, LuaLogisticNetwork[]> @List of logistic networks, grouped by surface.
---@field manual_crafting_speed_modifier double @Multiplier of the manual crafting speed. Default value is `0`. The actual crafting speed will be multiplied by `1 + manual_crafting_speed_modifier`.
---@field manual_mining_speed_modifier double @Multiplier of the manual mining speed. Default value is `0`. The actual mining speed will be multiplied by `1 + manual_mining_speed_modifier`.
---@field max_failed_attempts_per_tick_per_construction_queue uint
---@field max_successful_attempts_per_tick_per_construction_queue uint
---@field maximum_following_robot_count uint @Maximum number of follower robots.
---@field mining_drill_productivity_bonus double
---@field name string @Name of the force.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field platforms table<uint, LuaSpacePlatform> @The space platforms that belong to this force mapped by their index value. This will include platforms that are pending deletion.
---@field players LuaPlayer[] @Players belonging to this force.
---@field previous_research LuaTechnology @ nilable; The previous research, if any.
---@field recipes table<string, LuaRecipe> @Recipes available to this force, indexed by `name`.
---@field research_enabled boolean @Whether research is enabled for this force, see [LuaForce::enable_research](runtime:LuaForce::enable_research) and [LuaForce::disable_research](runtime:LuaForce::disable_research).
---@field research_progress double @Progress of current research, as a number in range `[0, 1]`.
---@field research_queue TechnologyID[] @The research queue of this force. The first technology in the array is the currently active one. Reading this attribute gives an array of [LuaTechnology](runtime:LuaTechnology). To write to this, the entire table must be written. Providing an empty table or `nil` will empty the research queue and cancel the current research. Writing to this when the research queue is disabled will simply set the last research in the table as the current research. This only allows mods to queue research that this force is able to research in the first place. As an example, an already researched technology or one whose prerequisites are not fulfilled will not be queued, but dropped silently instead.
---@field rockets_launched uint @The number of rockets launched.
---@field share_chart boolean @If sharing chart data is enabled for this force.
---@field technologies table<string, LuaTechnology> @Technologies owned by this force, indexed by `name`.
---@field train_braking_force_bonus double
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field worker_robots_battery_modifier double
---@field worker_robots_speed_modifier double
---@field worker_robots_storage_bonus double
LuaForce = {}

--- Adds a custom chart tag to the given surface and returns the new tag or `nil` if the given position isn't valid for a chart tag.
--- The chunk must be charted for a tag to be valid at that location.
---@param surface SurfaceIdentification @Which surface to add the tag to.
---@param tag ChartTagSpec @The tag to add.
---@return LuaCustomChartTag
function LuaForce.add_chart_tag(surface, tag) end

--- Add this technology to the back of the research queue if the queue is enabled. Otherwise, set this technology to be researched now.
---@param technology TechnologyID
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

--- Copies the given surface's chart from the given force to this force.
---@param source_force ForceID @The force to copy from
---@param source_surface SurfaceIdentification @The surface to copy from.
---@param destination_surface SurfaceIdentification @The surface to copy to.
function LuaForce.copy_chart(source_force, source_surface, destination_surface) end

--- Copies all of the given changeable values (except charts) from the given force to this force.
---@param force ForceID @The force to copy from.
function LuaForce.copy_from(force) end

---@class LuaForce_create_space_platform_params
---@field name string|nil @The platform name. If not provided, a random name will be used.
---@field planet SpaceLocationID @The planet that the platform will orbit.
---@field starter_pack ItemID @The starter pack required to build the platform.

--- Creates a new space platform on this force.
---@param p LuaForce_create_space_platform_params
---@return LuaSpacePlatform
function LuaForce.create_space_platform(p) end

--- Disable all recipes and technologies. Only recipes and technologies enabled explicitly will be useable from this point.
function LuaForce.disable_all_prototypes() end

--- Disable research for this force.
function LuaForce.disable_research() end

--- Enables all recipes and technologies. The opposite of [LuaForce::disable_all_prototypes](runtime:LuaForce::disable_all_prototypes).
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
---@param other ForceID
---@return boolean
function LuaForce.get_cease_fire(other) end

--- The entity build statistics for this force (built and mined) for the given surface.
---@param surface SurfaceIdentification
---@return LuaFlowStatistics
function LuaForce.get_entity_build_count_statistics(surface) end

--- Count entities of given type.
--- This function has O(1) time complexity as entity counts are kept and maintained in the game engine.
---@param name EntityID @Prototype name of the entity.
---@return uint @Number of entities of given prototype belonging to this force.
function LuaForce.get_entity_count(name) end

--- Fetches the evolution factor of this force on the given surface.
---@param surface SurfaceIdentification|nil @Defaults to "nauvis".
---@overload fun(): double
---@return double
function LuaForce.get_evolution_factor(surface) end

--- Fetches the spawner kill part of the evolution factor of this force on the given surface.
---@param surface SurfaceIdentification|nil @Defaults to "nauvis".
---@overload fun(): double
---@return double
function LuaForce.get_evolution_factor_by_killing_spawners(surface) end

--- Fetches the pollution part of the evolution factor of this force on the given surface.
---@param surface SurfaceIdentification|nil @Defaults to "nauvis".
---@overload fun(): double
---@return double
function LuaForce.get_evolution_factor_by_pollution(surface) end

--- Fetches the time part of the evolution factor of this force on the given surface.
---@param surface SurfaceIdentification|nil @Defaults to "nauvis".
---@overload fun(): double
---@return double
function LuaForce.get_evolution_factor_by_time(surface) end

--- The fluid production statistics for this force for the given surface.
---@param surface SurfaceIdentification
---@return LuaFlowStatistics
function LuaForce.get_fluid_production_statistics(surface) end

--- Is `other` force in this force's friends list.
---@param other ForceID
---@return boolean
function LuaForce.get_friend(other) end

---@param ammo string @Ammo category
---@return double
function LuaForce.get_gun_speed_modifier(ammo) end

--- Gets if the given recipe is explicitly disabled from being hand crafted.
---@param recipe RecipeID
---@return boolean
function LuaForce.get_hand_crafting_disabled_for_recipe(recipe) end

--- Gets the count of a given item launched in rockets.
---@param item ItemID @The item to get
---@return uint @The count of the item that has been launched.
function LuaForce.get_item_launched(item) end

--- The item production statistics for this force for the given surface.
---@param surface SurfaceIdentification
---@return LuaFlowStatistics
function LuaForce.get_item_production_statistics(surface) end

--- The kill counter statistics for this force for the given surface.
---@param surface SurfaceIdentification
---@return LuaFlowStatistics
function LuaForce.get_kill_count_statistics(surface) end

--- Gets the linked inventory for the given prototype and link ID if it exists or `nil`.
---@param prototype EntityID
---@param link_id uint
---@return LuaInventory
function LuaForce.get_linked_inventory(prototype, link_id) end

---@param surface SurfaceIdentification
---@return MapPosition
function LuaForce.get_spawn_position(surface) end

---@param surface SurfaceIdentification
---@return boolean
function LuaForce.get_surface_hidden(surface) end

---@param turret EntityID @Turret prototype name
---@return double
function LuaForce.get_turret_attack_modifier(turret) end

--- Has a chunk been charted?
---@param surface SurfaceIdentification
---@param position ChunkPosition @Position of the chunk.
---@return boolean
function LuaForce.is_chunk_charted(surface, position) end

--- Has a chunk been requested for charting?
---@param surface SurfaceIdentification
---@param position ChunkPosition @Position of the chunk.
---@return boolean
function LuaForce.is_chunk_requested_for_charting(surface, position) end

--- Is the given chunk currently charted and visible (not covered by fog of war) on the map.
---@param surface SurfaceIdentification
---@param position ChunkPosition
---@return boolean
function LuaForce.is_chunk_visible(surface, position) end

--- Is this force an enemy? This differs from `get_cease_fire` in that it is always false for neutral force. This is equivalent to checking the `enemy` ForceCondition.
---@param other ForceID
---@return boolean
function LuaForce.is_enemy(other) end

--- Is this force a friend? This differs from `get_friend` in that it is always true for neutral force. This is equivalent to checking the `friend` ForceCondition.
---@param other ForceID
---@return boolean
function LuaForce.is_friend(other) end

--- Is pathfinder busy? When the pathfinder is busy, it won't accept any more pathfinding requests.
---@return boolean
function LuaForce.is_pathfinder_busy() end

--- Is the specified quality unlocked for this force?
---@param quality QualityID @Name of the quality.
function LuaForce.is_quality_unlocked(quality) end

--- Is the specified planet unlocked for this force?
---@param name SpaceLocationID @Name of the planet.
function LuaForce.is_space_location_unlocked(name) end

--- Are the space platforms unlocked? This basically just controls the availability of the space platforms button.
---@return boolean
function LuaForce.is_space_platforms_unlocked() end

--- Kill all units and flush the pathfinder.
function LuaForce.kill_all_units() end

--- Locks the quality to not be accessible to this force.
---@param quality QualityID @Name of the quality.
function LuaForce.lock_quality(quality) end

--- Locks the planet to not be accessible to this force.
---@param name SpaceLocationID @Name of the planet.
function LuaForce.lock_space_location(name) end

--- Locks the space platforms, which disables the space platforms button
function LuaForce.lock_space_platforms() end

---@class LuaForce_play_sound_params
---@field path SoundPath @The sound to play.
---@field position MapPosition|nil @Where the sound should be played. If not given, it's played at the current position of each player.
---@field volume_modifier double|nil @The volume of the sound to play. Must be between 0 and 1 inclusive.
---@field override_sound_type SoundType|nil @The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.

--- Play a sound for every player in this force.
--- The sound is not played if its location is not [charted](runtime:LuaForce::chart) for this force.
---@param p LuaForce_play_sound_params
function LuaForce.play_sound(p) end

--- Print text to the chat console of all players on this force.
--- By default, messages that are identical to a message sent in the last 60 ticks are not printed again.
---@param message LocalisedString
---@param print_settings PrintSettings|nil
---@overload fun(message: LocalisedString)
function LuaForce.print(message, print_settings) end

--- Force a rechart of the whole chart.
---@param surface SurfaceIdentification|nil @Which surface to rechart or all if not given.
---@overload fun()
function LuaForce.rechart(surface) end

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
---@param other ForceID
---@param cease_fire boolean
function LuaForce.set_cease_fire(other, cease_fire) end

--- Sets the evolution factor of this force on the given surface.
---@param factor double
---@param surface SurfaceIdentification|nil @Defaults to "nauvis".
---@overload fun(factor: double)
function LuaForce.set_evolution_factor(factor, surface) end

--- Sets the spawner kill part of the evolution factor of this force on the given surface.
---@param factor double
---@param surface SurfaceIdentification|nil @Defaults to "nauvis".
---@overload fun(factor: double)
function LuaForce.set_evolution_factor_by_killing_spawners(factor, surface) end

--- Sets the pollution part of the evolution factor of this force on the given surface.
---@param factor double
---@param surface SurfaceIdentification|nil @Defaults to "nauvis".
---@overload fun(factor: double)
function LuaForce.set_evolution_factor_by_pollution(factor, surface) end

--- Sets the time part of the evolution factor of this force on the given surface.
---@param factor double
---@param surface SurfaceIdentification|nil @Defaults to "nauvis".
---@overload fun(factor: double)
function LuaForce.set_evolution_factor_by_time(factor, surface) end

--- Add `other` force to this force's friends list. Friends have unrestricted access to buildings and turrets won't fire at them.
---@param other ForceID
---@param friend boolean
function LuaForce.set_friend(other, friend) end

---@param ammo string @Ammo category
---@param modifier double
function LuaForce.set_gun_speed_modifier(ammo, modifier) end

--- Sets if the given recipe can be hand-crafted. This is used to explicitly disable hand crafting a recipe - it won't allow hand-crafting otherwise not hand-craftable recipes.
---@param recipe RecipeID
---@param hand_crafting_disabled boolean
function LuaForce.set_hand_crafting_disabled_for_recipe(recipe, hand_crafting_disabled) end

--- Sets the count of a given item launched in rockets.
---@param item ItemID @The item to set
---@param count uint @The count to set
function LuaForce.set_item_launched(item, count) end

---@param position MapPosition @The new position on the given surface.
---@param surface SurfaceIdentification @Surface to set the spawn position for.
function LuaForce.set_spawn_position(position, surface) end

---@param surface SurfaceIdentification @Surface to set hidden for.
---@param hidden boolean @Whether to hide the surface or not.
function LuaForce.set_surface_hidden(surface, hidden) end

---@param turret EntityID @Turret prototype name
---@param modifier double
function LuaForce.set_turret_attack_modifier(turret, modifier) end

---@param position ChunkPosition @The chunk position to unchart.
---@param surface SurfaceIdentification @Surface to unchart on.
function LuaForce.unchart_chunk(position, surface) end

--- Unlocks the quality to be accessible to this force.
---@param quality QualityID @Name of the quality.
function LuaForce.unlock_quality(quality) end

--- Unlocks the planet to be accessible to this force.
---@param name SpaceLocationID @Name of the planet.
function LuaForce.unlock_space_location(name) end

--- Unlocks the space platforms, which enables the space platforms button
function LuaForce.unlock_space_platforms() end

---@class LuaFuelCategoryPrototype: LuaPrototypeBase @Prototype of a fuel category.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaFuelCategoryPrototype = {}

---@class LuaGameScript: any @Main toplevel type, provides access to most of the API though its members. An instance of LuaGameScript is available as the global object named `game`.
---@field autosave_enabled boolean @True by default. Can be used to disable autosaving. Make sure to turn it back on soon after.
---@field backer_names table<uint, string> @Array of the names of all the backers that supported the game development early on. These are used as names for labs, locomotives, radars, roboports, and train stops.
---@field blueprints LuaRecord[] @Records contained in the "game blueprints" tab of the blueprint library.
---@field connected_players LuaPlayer[] @The players that are currently online. This does *not* index using player index. See [LuaPlayer::index](runtime:LuaPlayer::index) on each player instance for the player index. This is primarily useful when you want to do some action against all online players.
---@field console_command_used boolean @Whether a console command has been used.
---@field default_map_gen_settings MapGenSettings @The default map gen settings for this save.
---@field difficulty defines.difficulty @Current scenario difficulty.
---@field difficulty_settings DifficultySettings @The currently active set of difficulty settings. Even though this property is marked as read-only, the members of the dictionary that is returned can be modified mid-game. This is however not recommended as different difficulties can have differing technology and recipe trees, which can cause problems for players.
---@field draw_resource_selection boolean @True by default. Can be used to disable the highlighting of resource patches when they are hovered on the map.
---@field enemy_has_vision_on_land_mines boolean @Determines if enemy land mines are completely invisible or not.
---@field finished boolean @True while the victory screen is shown.
---@field finished_but_continuing boolean @True after players finished the game and clicked "continue".
---@field forces table<uint | string, LuaForce> @Get a table of all the forces that currently exist. This sparse table allows you to find forces by indexing it with either their `name` or `index`. Iterating this table with `pairs()` will provide the `name`s as the keys. Iterating with `ipairs()` will not work at all.
---@field map_settings MapSettings @The currently active set of map settings. Even though this property is marked as read-only, the members of the dictionary that is returned can be modified mid-game. This does not contain difficulty settings, use [LuaGameScript::difficulty_settings](runtime:LuaGameScript::difficulty_settings) instead.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field permissions LuaPermissionGroups
---@field planets table<string, LuaPlanet>
---@field player LuaPlayer @ nilable; This property is only populated inside [custom command](runtime:LuaCommandProcessor) handlers and when writing [Lua console commands](https://wiki.factorio.com/Console#Scripting_and_cheat_commands). Returns the player that is typing the command, `nil` in all other instances. See [LuaGameScript::players](runtime:LuaGameScript::players) for accessing all players.
---@field players table<uint | string, LuaPlayer> @Get a table of all the players that currently exist. This sparse table allows you to find players by indexing it with either their `name` or `index`. Iterating this table with `pairs()` will provide the `index`es as the keys. Iterating with `ipairs()` will not work at all. If only a single player is required, [LuaGameScript::get_player](runtime:LuaGameScript::get_player) should be used instead, as it avoids the unnecessary overhead of passing the whole table to Lua.
---@field simulation LuaSimulation @Simulation-related functions, or `nil` if the current game is not a simulation.
---@field speed float @Speed to update the map at. 1.0 is normal speed -- 60 UPS. Minimum value is 0.01.
---@field surfaces table<uint | string, LuaSurface> @Get a table of all the surfaces that currently exist. This sparse table allows you to find surfaces by indexing it with either their `name` or `index`. Iterating this table with `pairs()` will provide the `name`s as the keys. Iterating with `ipairs()` will not work at all.
---@field technology_notifications_enabled boolean @True by default. Can be used to prevent the game engine from printing certain messages.
---@field tick uint @Current map tick.
---@field tick_paused boolean @If the tick has been paused. This means that entity update has been paused.
---@field ticks_played uint @The number of ticks since this game was created using either "new game" or "new game from scenario". Notably, this number progresses even when the game is [tick_paused](runtime:LuaGameScript::tick_paused). This differs from [LuaGameScript::tick](runtime:LuaGameScript::tick) in that creating a game from a scenario always starts with this value at `0`, even if the scenario has its own level data where the `tick` has progressed past `0`.
---@field ticks_to_run uint @The number of ticks to be run while the tick is paused. When [LuaGameScript::tick_paused](runtime:LuaGameScript::tick_paused) is true, ticks_to_run behaves the following way: While this is > 0, the entity update is running normally and this value is decremented every tick. When this reaches 0, the game will pause again.
---@field train_manager LuaTrainManager
LuaGameScript = {}

--- Instruct the game to perform an auto-save.
--- Only the server will save in multiplayer. In single player a standard auto-save is triggered.
---@param name string|nil @The autosave name if any. Saves will be named _autosave-*name* when provided.
---@overload fun()
function LuaGameScript.auto_save(name) end

--- Bans the given player from this multiplayer game. Does nothing if this is a single player game of if the player running this isn't an admin.
---@param player PlayerIdentification | string @The player to ban.
---@param reason string|nil @The reason given if any.
---@overload fun(player: PlayerIdentification | string)
function LuaGameScript.ban_player(player, reason) end

--- Run internal consistency checks. Allegedly prints any errors it finds.
--- Exists mainly for debugging reasons.
function LuaGameScript.check_consistency() end

--- Create a new force.
--- The game currently supports a maximum of 64 forces, including the three built-in forces. This means that a maximum of 61 new forces may be created. Force names must be unique.
---@param force string @Name of the new force
---@return LuaForce @The force that was just created
function LuaGameScript.create_force(force) end

--- Creates an inventory that is not owned by any game object.
--- It can be resized later with [LuaInventory::resize](runtime:LuaInventory::resize).
--- Make sure to destroy it when you are done with it using [LuaInventory::destroy](runtime:LuaInventory::destroy).
---@param size uint16 @The number of slots the inventory initially has.
---@param gui_title LocalisedString|nil @The title of the GUI that is shown when this inventory is opened.
---@overload fun(size: uint16): LuaInventory
---@return LuaInventory
function LuaGameScript.create_inventory(size, gui_title) end

--- Creates a [LuaProfiler](runtime:LuaProfiler), which is used for measuring script performance.
--- LuaProfiler cannot be serialized.
---@param stopped boolean|nil @Create the timer stopped
---@overload fun(): LuaProfiler
---@return LuaProfiler
function LuaGameScript.create_profiler(stopped) end

--- Creates a deterministic standalone random generator with the given seed or if a seed is not provided the initial map seed is used.
--- *Make sure* you actually want to use this over math.random(...) as this provides entirely different functionality over math.random(...).
---@param seed uint|nil
---@overload fun(): LuaRandomGenerator
---@return LuaRandomGenerator
function LuaGameScript.create_random_generator(seed) end

--- Create a new surface.
--- The game currently supports a maximum of 4 294 967 295 surfaces, including the default surface. Surface names must be unique.
---@param name string @Name of the new surface.
---@param settings MapGenSettings|nil @Map generation settings.
---@overload fun(name: string): LuaSurface
---@return LuaSurface @The surface that was just created.
function LuaGameScript.create_surface(name, settings) end

--- Deletes the given surface and all entities on it if possible.
---@param surface SurfaceIdentification @The surface to be deleted. Currently the primary surface (1, 'nauvis') cannot be deleted.
---@return boolean @If the surface was queued to be deleted.
function LuaGameScript.delete_surface(surface) end

--- Disables replay saving for the current save file. Once done there's no way to re-enable replay saving for the save file without loading an old save.
function LuaGameScript.disable_replay() end

--- Enables tip triggers in custom scenarios, that unlock new tips and show notices about unlocked tips.
function LuaGameScript.enable_tip_triggers_in_custom_scenarios() end

--- Force a CRC check. Tells all peers to calculate their current CRC, which are then compared to each other. If a mismatch is detected, the game desyncs and some peers are forced to reconnect.
function LuaGameScript.force_crc() end

--- Gets an entity by its [name tag](runtime:LuaEntity::name_tag). Entity name tags can also be set in the entity "extra settings" GUI in the map editor.
---@param tag string
---@return LuaEntity
function LuaGameScript.get_entity_by_tag(tag) end

--- Returns entity with a specified unit number or nil if entity with such number was not found or prototype does not have [EntityPrototypeFlags::get-by-unit-number](prototype:EntityPrototypeFlags::get_by_unit_number) flag set.
---@param unit_number uint
---@return LuaEntity
function LuaGameScript.get_entity_by_unit_number(unit_number) end

--- Gets the map exchange string for the map generation settings that were used to create this map.
---@return string
function LuaGameScript.get_map_exchange_string() end

--- Gets the given player or returns `nil` if no player is found.
---@param player uint | string @The player index or name.
---@return LuaPlayer
function LuaGameScript.get_player(player) end

--- The pollution statistics for this the given surface.
---@param surface SurfaceIdentification
---@return LuaFlowStatistics
function LuaGameScript.get_pollution_statistics(surface) end

--- Gets the inventories created through [LuaGameScript::create_inventory](runtime:LuaGameScript::create_inventory).
--- Inventories created through console commands will be owned by `"core"`.
---@param mod string|nil @The mod whose inventories to get. If not provided all inventories are returned.
---@overload fun(): table<string, LuaInventory[]>
---@return table<string, LuaInventory[]> @A mapping of mod name to array of inventories owned by that mod.
function LuaGameScript.get_script_inventories(mod) end

--- Gets the given surface or returns `nil` if no surface is found.
--- This is a shortcut for [LuaGameScript::surfaces](runtime:LuaGameScript::surfaces).
---@param surface uint | string @The surface index or name.
---@return LuaSurface
function LuaGameScript.get_surface(surface) end

---@class LuaGameScript_get_vehicles_params
---@field unit_number uint|nil
---@field force ForceID|nil
---@field surface SurfaceIdentification|nil @)
---@field type (EntityID | EntityID[])|nil
---@field is_moving boolean|nil
---@field has_passenger boolean|nil

--- Returns vehicles in game
---@param p LuaGameScript_get_vehicles_params
---@return LuaEntity[]
function LuaGameScript.get_vehicles(p) end

--- Is this the demo version of Factorio?
---@return boolean
function LuaGameScript.is_demo() end

--- Whether the save is loaded as a multiplayer map.
---@return boolean
function LuaGameScript.is_multiplayer() end

--- Kicks the given player from this multiplayer game. Does nothing if this is a single player game or if the player running this isn't an admin.
---@param player PlayerIdentification @The player to kick.
---@param reason string|nil @The reason given if any.
---@overload fun(player: PlayerIdentification)
function LuaGameScript.kick_player(player, reason) end

--- Marks two forces to be merged together. All players and entities in the source force will be reassigned to the target force. The source force will then be destroyed. Importantly, this does not merge technologies or bonuses, which are instead retained from the target force.
--- The three built-in forces (player, enemy and neutral) can't be destroyed, meaning they can't be used as the source argument to this function.
--- The source force is not removed until the end of the current tick, or if called during the [on_forces_merging](runtime:on_forces_merging) or [on_forces_merged](runtime:on_forces_merged) event, the end of the next tick.
---@param source ForceID @The force to remove.
---@param destination ForceID @The force to reassign all entities to.
function LuaGameScript.merge_forces(source, destination) end

--- Mutes the given player. Does nothing if the player running this isn't an admin.
---@param player PlayerIdentification @The player to mute.
function LuaGameScript.mute_player(player) end

---@class LuaGameScript_play_sound_params
---@field path SoundPath @The sound to play.
---@field position MapPosition|nil @Where the sound should be played. If not given, it's played at the current position of each player.
---@field volume_modifier double|nil @The volume of the sound to play. Must be between 0 and 1 inclusive.
---@field override_sound_type SoundType|nil @The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.

--- Play a sound for every player in the game.
--- The sound is not played if its location is not [charted](runtime:LuaForce::chart) for that player.
---@param p LuaGameScript_play_sound_params
function LuaGameScript.play_sound(p) end

--- Print text to the chat console all players.
--- By default, messages that are identical to a message sent in the last 60 ticks are not printed again.
---@param message LocalisedString
---@param print_settings PrintSettings|nil
---@overload fun(message: LocalisedString)
function LuaGameScript.print(message, print_settings) end

--- Purges the given players messages from the game. Does nothing if the player running this isn't an admin.
---@param player PlayerIdentification @The player to purge.
function LuaGameScript.purge_player(player) end

--- Regenerate autoplacement of some entities on all surfaces. This can be used to autoplace newly-added entities.
--- All specified entity prototypes must be autoplacable.
---@param entities string | string[] @Prototype names of entity or entities to autoplace.
function LuaGameScript.regenerate_entity(entities) end

--- Forces a reload of all mods.
--- This will act like saving and loading from the mod(s) perspective.
--- This will do nothing if run in multiplayer.
--- This disables the replay if replay is enabled.
function LuaGameScript.reload_mods() end

--- Forces a reload of the scenario script from the original scenario location.
--- This disables the replay if replay is enabled.
function LuaGameScript.reload_script() end

--- Remove players who are currently not connected from the map.
---@param players PlayerIdentification[]|nil @List of players to remove. If not specified, remove all offline players.
---@overload fun()
function LuaGameScript.remove_offline_players(players) end

--- Reset scenario state (game_finished, player_won, etc.).
function LuaGameScript.reset_game_state() end

--- Resets the amount of time played for this map.
function LuaGameScript.reset_time_played() end

--- Saves the current configuration of Atlas to a file. This will result in huge file containing all of the game graphics moved to as small space as possible.
--- Exists mainly for debugging reasons.
function LuaGameScript.save_atlas() end

--- Instruct the server to save the map. Only actually saves when in multiplayer.
---@param name string|nil @Save file name. If not specified, the currently running save is overwritten. If there is no current save, no save is made.
---@overload fun()
function LuaGameScript.server_save(name) end

---@class LuaGameScript_set_game_state_params
---@field game_finished boolean|nil
---@field player_won boolean|nil
---@field next_level string|nil
---@field can_continue boolean|nil

--- Set scenario state. Any parameters not provided do not change the current state.
---@param p LuaGameScript_set_game_state_params
function LuaGameScript.set_game_state(p) end

---@class LuaGameScript_set_lose_ending_info_params
---@field title LocalisedString
---@field message LocalisedString|nil
---@field bullet_points LocalisedString[]|nil
---@field final_message LocalisedString|nil
---@field image_path string|nil

--- Set losing ending information for the current scenario.
---@param p LuaGameScript_set_lose_ending_info_params
function LuaGameScript.set_lose_ending_info(p) end

--- Forces the screenshot saving system to wait until all queued screenshots have been written to disk.
function LuaGameScript.set_wait_for_screenshots_to_finish() end

---@class LuaGameScript_set_win_ending_info_params
---@field title LocalisedString
---@field message LocalisedString|nil
---@field bullet_points LocalisedString[]|nil
---@field final_message LocalisedString|nil
---@field image_path string|nil

--- Set winning ending information for the current scenario.
---@param p LuaGameScript_set_win_ending_info_params
function LuaGameScript.set_win_ending_info(p) end

---@class LuaGameScript_show_message_dialog_params
---@field text LocalisedString @What the dialog should say
---@field image string|nil @Path to an image to show on the dialog
---@field point_to GuiArrowSpecification|nil @If specified, dialog will show an arrow pointing to this place. When not specified, the arrow will point to the player's position. (Use `point_to={type="nowhere"}` to remove the arrow entirely.) The dialog itself will be placed near the arrow's target.
---@field style string|nil @The gui style to use for this speech bubble. Must be of type speech_bubble.
---@field wrapper_frame_style string|nil @Must be of type flow_style.

--- Show an in-game message dialog.
--- Can only be used when the map contains exactly one player.
---@param p LuaGameScript_show_message_dialog_params
function LuaGameScript.show_message_dialog(p) end

---@class LuaGameScript_take_screenshot_params
---@field player PlayerIdentification|nil @The player to focus on. Defaults to the local player.
---@field by_player PlayerIdentification|nil @If defined, the screenshot will only be taken for this player.
---@field surface SurfaceIdentification|nil @If defined, the screenshot will be taken on this surface.
---@field position MapPosition|nil @If defined, the screenshot will be centered on this position. Otherwise, the screenshot will center on `player`.
---@field resolution TilePosition|nil @The maximum allowed resolution is 16384x16384 (8192x8192 when `anti_alias` is `true`), but the maximum recommended resolution is 4096x4096 (resp. 2048x2048). The `x` value of the position is used as the width, the `y` value as the height.
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
--- If Factorio is running headless, this function will do nothing.
---@param p LuaGameScript_take_screenshot_params
function LuaGameScript.take_screenshot(p) end

---@class LuaGameScript_take_technology_screenshot_params
---@field path string|nil @The name of the image file. It should include a file extension indicating the desired format. Supports `.png`, `.jpg` /`.jpeg`, `.tga` and `.bmp`. Providing a directory path (ex. `"save/here/screenshot.png"`) will create the necessary folder structure in `script-output`. Defaults to `"technology-screenshot.png"`.
---@field player PlayerIdentification @The screenshot will be taken for this player.
---@field selected_technology TechnologyID|nil @The technology to highlight.
---@field skip_disabled boolean|nil @If `true`, disabled technologies will be skipped. Their successors will be attached to the disabled technology's parents. Defaults to `false`.
---@field quality int|nil @The `.jpg` render quality as a percentage (from 0% to 100% inclusive), if used. A lower value means a more compressed image. Defaults to `80`.

--- Take a screenshot of the technology screen and save it to the `script-output` folder, located in the game's [user data directory](https://wiki.factorio.com/User_data_directory). The name of the image file can be specified via the `path` parameter.
---@param p LuaGameScript_take_technology_screenshot_params
function LuaGameScript.take_technology_screenshot(p) end

--- Unbans the given player from this multiplayer game. Does nothing if this is a single player game of if the player running this isn't an admin.
---@param player PlayerIdentification | string @The player to unban.
function LuaGameScript.unban_player(player) end

--- Unmutes the given player. Does nothing if the player running this isn't an admin.
---@param player PlayerIdentification @The player to unmute.
function LuaGameScript.unmute_player(player) end

---@class LuaGenericOnOffControlBehavior: LuaControlBehavior @An abstract base class for behaviors that support switching the entity on or off based on some condition.
---@field circuit_condition CircuitConditionDefinition @The circuit condition. Writing `nil` clears the circuit condition.
---@field circuit_enable_disable boolean @`true` if this entity enable/disable state is controlled by circuit condition
---@field connect_to_logistic_network boolean @`true` if this should connect to the logistic network.
---@field disabled boolean @If the entity is currently disabled because of the control behavior.
---@field logistic_condition CircuitConditionDefinition @The logistic condition. Writing `nil` clears the logistic condition.
LuaGenericOnOffControlBehavior = {}

---@class LuaGroup: any @Item group or subgroup.
---@field group LuaGroup @The parent group.
---@field localised_name LocalisedString @Localised name of the group.
---@field name string
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field order string @The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
---@field order_in_recipe string @The additional order value used in recipe ordering.
---@field subgroups LuaGroup[] @Subgroups of this group.
---@field type string
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaGroup = {}

---@class LuaGui: any @The root of the GUI. This type houses the root elements, `top`, `left`, `center`, `goal`, and `screen`, to which other elements can be added to be displayed on screen. Every player can have a different GUI state.
---@field center LuaGuiElement @The center part of the GUI. It is a flow element.
---@field children table<string, LuaGuiElement> @The children GUI elements mapped by name <> element.
---@field goal LuaGuiElement @The flow used in the objectives window. It is a flow element. The objectives window is only visible when the flow is not empty or the objective text is set.
---@field left LuaGuiElement @The left part of the GUI. It is a flow element inside a scroll pane element.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field player LuaPlayer @The player who owns this gui.
---@field relative LuaGuiElement @For showing a GUI somewhere relative to one of the game GUIs. It is an empty-widget element.
---@field screen LuaGuiElement @For showing a GUI somewhere on the entire screen. It is an empty-widget element.
---@field top LuaGuiElement @The top part of the GUI. It is a flow element inside a scroll pane element.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaGui = {}

---@class LuaGuiElement: any @An element of a custom GUI. This type is used to represent [any kind](runtime:GuiElementType) of a GUI element - labels, buttons and frames are all instances of this type. Just like [LuaEntity](runtime:LuaEntity), different kinds of elements support different attributes; attempting to access an attribute on an element that doesn't support it (for instance, trying to access the `column_count` of a `textfield`) will result in a runtime error. For information on all supported GUI elements, see [GuiElementType](runtime:GuiElementType). Each GUI element allows access to its children by having them as attributes. Thus, one can use the `parent.child` syntax to refer to children. Lua also supports the `parent["child"]` syntax to refer to the same element. This can be used in cases where the child has a name that isn't a valid Lua identifier.
---@field allow_decimal boolean @Whether this textfield (when in numeric mode) allows decimal numbers.
---@field allow_negative boolean @Whether this textfield (when in numeric mode) allows negative numbers.
---@field allow_none_state boolean @Whether the `"none"` state is allowed for this switch. This can't be set to false if the current switch_state is 'none'.
---@field anchor GuiAnchor @ nilable; The anchor for this relative widget, if any. Setting `nil` clears the anchor.
---@field auto_center boolean @Whether this frame auto-centers on window resize when stored in [LuaGui::screen](runtime:LuaGui::screen).
---@field auto_toggle boolean @Whether this button will automatically toggle when clicked.
---@field badge_text LocalisedString @The text to display after the normal tab text (designed to work with numbers)
---@field caption LocalisedString @The text displayed on this element. For frames, this is the "heading". For other elements, like buttons or labels, this is the content. Whilst this attribute may be used on all elements without producing an error, it doesn't make sense for tables and flows as they won't display it.
---@field children LuaGuiElement[] @The child-elements of this GUI element.
---@field children_names string[] @Names of all the children of this element. These are the identifiers that can be used to access the child as an attribute of this element.
---@field clicked_sprite SpritePath @The sprite to display on this sprite-button when it is clicked.
---@field column_count uint @The number of columns in this table.
---@field direction GuiDirection @Direction of this element's layout.
---@field drag_target LuaGuiElement @ nilable; The `frame` that is being moved when dragging this GUI element, if any. This element needs to be a child of the `drag_target` at some level. Only top-level elements in [LuaGui::screen](runtime:LuaGui::screen) can be `drag_target`s.
---@field draw_horizontal_line_after_headers boolean @Whether this table should draw a horizontal grid line below the first table row.
---@field draw_horizontal_lines boolean @Whether this table should draw horizontal grid lines.
---@field draw_vertical_lines boolean @Whether this table should draw vertical grid lines.
---@field elem_filters PrototypeFilter @ nilable; The elem filters of this choose-elem-button, if any. The compatible type of filter is determined by `elem_type`. Writing to this field does not change or clear the currently selected element.
---@field elem_tooltip ElemID @ nilable; The element tooltip to display when hovering over this element, or `nil`.
---@field elem_type ElemType @The elem type of this choose-elem-button.
---@field elem_value string | SignalID | table @ nilable; The elem value of this choose-elem-button, if any. The `"signal"` type operates with [SignalID](runtime:SignalID). The `"with-quality"` types operate with `"name"` and optional `"quality"` The remaining types use strings.
---@field enabled boolean @Whether this GUI element is enabled. Disabled GUI elements don't trigger events when clicked.
---@field entity LuaEntity @ nilable; The entity associated with this entity-preview, camera, minimap, if any.
---@field force string @ nilable; The force this minimap is using, if any.
---@field game_controller_interaction defines.game_controller_interaction @How this element should interact with game controllers.
---@field gui LuaGui @The GUI this element is a child of.
---@field horizontal_scroll_policy ScrollPolicy @Policy of the horizontal scroll bar.
---@field hovered_sprite SpritePath @The sprite to display on this sprite-button when it is hovered.
---@field ignored_by_interaction boolean @Whether this GUI element is ignored by interaction. This makes clicks on this element 'go through' to the GUI element or even the game surface below it.
---@field index uint @The index of this GUI element (unique amongst the GUI elements of a LuaPlayer).
---@field is_password boolean @Whether this textfield displays as a password field, which renders all characters as `*`.
---@field items LocalisedString[] @The items in this dropdown or listbox.
---@field left_label_caption LocalisedString @The text shown for the left switch label.
---@field left_label_tooltip LocalisedString @The tooltip shown on the left switch label.
---@field location GuiLocation @ nilable; The location of this widget when stored in [LuaGui::screen](runtime:LuaGui::screen). `nil` if not set or not in [LuaGui::screen](runtime:LuaGui::screen).
---@field locked boolean @Whether this choose-elem-button can be changed by the player.
---@field lose_focus_on_confirm boolean @Whether this textfield loses focus after [defines.events.on_gui_confirmed](runtime:defines.events.on_gui_confirmed) is fired.
---@field minimap_player_index uint @The player index this minimap is using.
---@field mouse_button_filter MouseButtonFlags @The mouse button filters for this button or sprite-button.
---@field name string @The name of this element. `""` if no name was set.
---@field number double @ nilable; The number to be shown in the bottom right corner of this sprite-button, or `nil` to show nothing.
---@field numeric boolean @Whether this textfield is limited to only numeric characters.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field parent LuaGuiElement @ nilable; The direct parent of this element. `nil` if this is a top-level element.
---@field player_index uint @Index into [LuaGameScript::players](runtime:LuaGameScript::players) specifying the player who owns this element.
---@field position MapPosition @The position this camera or minimap is focused on, if any.
---@field raise_hover_events boolean @Whether this element will raise [on_gui_hover](runtime:on_gui_hover) and [on_gui_leave](runtime:on_gui_leave).
---@field read_only boolean @Whether this text-box is read-only. Defaults to `false`.
---@field resize_to_sprite boolean @Whether the sprite widget should resize according to the sprite in it. Defaults to `true`.
---@field right_label_caption LocalisedString @The text shown for the right switch label.
---@field right_label_tooltip LocalisedString @The tooltip shown on the right switch label.
---@field selectable boolean @Whether the contents of this text-box are selectable. Defaults to `true`.
---@field selected_index uint @The selected index for this dropdown or listbox. Returns `0` if none is selected.
---@field selected_tab_index uint @ nilable; The selected tab index for this tabbed pane, if any.
---@field show_percent_for_small_numbers boolean @Related to the number to be shown in the bottom right corner of this sprite-button. When set to `true`, numbers that are non-zero and smaller than one are shown as a percentage rather than the value. For example, `0.5` will be shown as `50%` instead.
---@field slider_value double @The value of this slider element.
---@field sprite SpritePath @The sprite to display on this sprite-button or sprite in the default state.
---@field state boolean @Is this checkbox or radiobutton checked?
---@field style LuaStyle | string @The style of this element. When read, this evaluates to a [LuaStyle](runtime:LuaStyle). For writing, it only accepts a string that specifies the textual identifier (prototype name) of the desired style.
---@field surface_index uint @The surface index this camera or minimap is using.
---@field switch_state SwitchState @The switch state for this switch. If [LuaGuiElement::allow_none_state](runtime:LuaGuiElement::allow_none_state) is false this can't be set to `"none"`.
---@field tabs TabAndContent[] @The tabs and contents being shown in this tabbed-pane.
---@field tags Tags @The tags associated with this LuaGuiElement.
---@field text string @The text contained in this textfield or text-box.
---@field toggled boolean @Whether this button is currently toggled. When a button is toggled, it will use the `selected_graphical_set` and `selected_font_color` defined in its style.
---@field tooltip LocalisedString @The text to display when hovering over this element. Writing `""` or `nil` will disable the tooltip.
---@field type GuiElementType @The type of this GUI element.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field value double @How much this progress bar is filled. It is a value in the range `[0, 1]`.
---@field vertical_centering boolean @Whether the content of this table should be vertically centered. Overrides [LuaStyle::column_alignments](runtime:LuaStyle::column_alignments). Defaults to `true`.
---@field vertical_scroll_policy ScrollPolicy @Policy of the vertical scroll bar.
---@field visible boolean @Sets whether this GUI element is visible or completely hidden, taking no space in the layout.
---@field word_wrap boolean @Whether this text-box will word-wrap automatically. Defaults to `false`.
---@field zoom double @The zoom this camera or minimap is using. This value must be positive.
LuaGuiElement = {}

---@class LuaGuiElement_add_params
---@field type GuiElementType @The kind of element to add, which potentially has its own attributes as listed below.
---@field name string|nil @Name of the child element. It must be unique within the parent element.
---@field caption LocalisedString|nil @Text displayed on the child element. For frames, this is their title. For other elements, like buttons or labels, this is the content. Whilst this attribute may be used on all elements, it doesn't make sense for tables and flows as they won't display it.
---@field tooltip LocalisedString|nil @Tooltip of the child element.
---@field elem_tooltip ElemID|nil @Elem tooltip of the child element. Will be displayed above `tooltip`.
---@field enabled boolean|nil @Whether the child element is enabled. Defaults to `true`.
---@field visible boolean|nil @Whether the child element is visible. Defaults to `true`.
---@field ignored_by_interaction boolean|nil @Whether the child element is ignored by interaction. Defaults to `false`.
---@field style string|nil @The name of the style prototype to apply to the new element.
---@field tags Tags|nil @[Tags](runtime:Tags) associated with the child element.
---@field index uint|nil @Location in its parent that the child element should slot into. By default, the child will be appended onto the end.
---@field anchor GuiAnchor|nil @Where to position the child element when in the `relative` element.
---@field game_controller_interaction defines.game_controller_interaction|nil @How the element should interact with game controllers. Defaults to [defines.game_controller_interaction.normal](runtime:defines.game_controller_interaction.normal).
---@field raise_hover_events boolean|nil @Whether this element will raise [on_gui_hover](runtime:on_gui_hover) and [on_gui_leave](runtime:on_gui_leave). Defaults to `false`.

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
--- Only works for elements in [LuaGui::screen](runtime:LuaGui::screen).
function LuaGuiElement.bring_to_front() end

--- Remove children of this element. Any [LuaGuiElement](runtime:LuaGuiElement) objects referring to the destroyed elements become invalid after this operation.
function LuaGuiElement.clear() end

--- Removes the items in this dropdown or listbox.
function LuaGuiElement.clear_items() end

--- Closes the dropdown list if this is a dropdown and it is open.
function LuaGuiElement.close_dropdown() end

--- Remove this element, along with its children. Any [LuaGuiElement](runtime:LuaGuiElement) objects referring to the destroyed elements become invalid after this operation.
--- The top-level GUI elements - [LuaGui::top](runtime:LuaGui::top), [LuaGui::left](runtime:LuaGui::left), [LuaGui::center](runtime:LuaGui::center) and [LuaGui::screen](runtime:LuaGui::screen) - can't be destroyed.
function LuaGuiElement.destroy() end

--- Focuses this GUI element if possible.
function LuaGuiElement.focus() end

--- Forces this frame to re-auto-center. Only works on frames stored directly in [LuaGui::screen](runtime:LuaGui::screen).
function LuaGuiElement.force_auto_center() end

--- Gets the index that this element has in its parent element.
--- This iterates through the children of the parent of this element, meaning this has a non-free cost to get, but is faster than doing the equivalent in Lua.
---@return uint
function LuaGuiElement.get_index_in_parent() end

--- Gets the item at the given index from this dropdown or listbox.
---@param index uint @The index to get
---@return LocalisedString
function LuaGuiElement.get_item(index) end

--- The mod that owns this Gui element or `nil` if it's owned by the scenario script.
--- This has a not-super-expensive, but non-free cost to get.
---@return string
function LuaGuiElement.get_mod() end

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

--- Removes the item at the given index from this dropdown or listbox.
---@param index uint @The index
function LuaGuiElement.remove_item(index) end

--- Removes the given tab and its associated content from this tabbed pane.
--- Removing a tab does not destroy the tab or the tab contents. It just removes them from the view. When removing tabs, [LuaGuiElement::selected_tab_index](runtime:LuaGuiElement::selected_tab_index) needs to be manually updated.
---@param tab LuaGuiElement|nil @The tab to remove or `nil` to remove all tabs.
---@overload fun()
function LuaGuiElement.remove_tab(tab) end

--- Scrolls this scroll bar to the bottom.
function LuaGuiElement.scroll_to_bottom() end

--- Scrolls this scroll bar such that the specified GUI element is visible to the player.
---@param element LuaGuiElement @The element to scroll to.
---@param scroll_mode ("in-view" | "top-third")|nil @Where the element should be positioned in the scroll-pane. Defaults to `"in-view"`.
---@overload fun(element: LuaGuiElement)
function LuaGuiElement.scroll_to_element(element, scroll_mode) end

--- Scrolls the scroll bar such that the specified listbox item is visible to the player.
---@param index int @The item index to scroll to.
---@param scroll_mode ("in-view" | "top-third")|nil @Where the item should be positioned in the list-box. Defaults to `"in-view"`.
---@overload fun(index: int)
function LuaGuiElement.scroll_to_item(index, scroll_mode) end

--- Scrolls this scroll bar to the left.
function LuaGuiElement.scroll_to_left() end

--- Scrolls this scroll bar to the right.
function LuaGuiElement.scroll_to_right() end

--- Scrolls this scroll bar to the top.
function LuaGuiElement.scroll_to_top() end

--- Selects a range of text in this textbox.
---@param start_index int @The index of the first character to select
---@param end_index int @The index of the last character to select
function LuaGuiElement.select(start_index, end_index) end

--- Selects all the text in this textbox.
function LuaGuiElement.select_all() end

--- Sets the given string at the given index in this dropdown or listbox.
---@param index uint @The index whose text to replace.
---@param string LocalisedString @The text to set at the given index.
function LuaGuiElement.set_item(index, string) end

--- Sets whether this slider only allows discrete values.
---@param value boolean
function LuaGuiElement.set_slider_discrete_values(value) end

--- Sets this sliders minimum and maximum values. The minimum can't be >= the maximum.
---@param minimum double
---@param maximum double
function LuaGuiElement.set_slider_minimum_maximum(minimum, maximum) end

--- Sets the minimum distance this slider can move. The minimum distance can't be > (max - min).
---@param value double
function LuaGuiElement.set_slider_value_step(value) end

--- Swaps the children at the given indices in this element.
---@param index_1 uint @The index of the first child.
---@param index_2 uint @The index of the second child.
function LuaGuiElement.swap_children(index_1, index_2) end

---@class LuaHeatBufferPrototype: any @Prototype of a heat buffer.
---@field connections HeatConnection[]
---@field default_temperature double
---@field max_temperature double
---@field max_transfer double
---@field min_temperature_gradient double
---@field min_working_temperature double
---@field minimum_glow_temperature double
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field specific_heat double
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaHeatBufferPrototype = {}

---@class LuaHeatEnergySourcePrototype: any @Prototype of a heat energy source.
---@field connections HeatConnection[]
---@field default_temperature double
---@field emissions_per_joule table<string, double> @The table of emissions of this energy source in `pollution/Joule`, indexed by pollutant type. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
---@field heat_buffer_prototype LuaHeatBufferPrototype
---@field max_temperature double
---@field max_transfer double
---@field min_temperature_gradient double
---@field min_working_temperature double
---@field minimum_glow_temperature double
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field render_no_network_icon boolean
---@field render_no_power_icon boolean
---@field specific_heat double
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaHeatEnergySourcePrototype = {}

---@class LuaHelpers: any @Provides various helper and utility functions. It is accessible through the global object named `helpers`.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
LuaHelpers = {}

--- Goes over all items, entities, tiles, recipes, technologies among other things and logs if the locale is incorrect.
--- Also prints true/false if called from the console.
function LuaHelpers.check_prototype_translations() end

--- Creates a [LuaProfiler](runtime:LuaProfiler), which is used for measuring script performance.
--- LuaProfiler cannot be serialized.
---@param stopped boolean|nil @Create the timer stopped
---@overload fun(): LuaProfiler
---@return LuaProfiler
function LuaHelpers.create_profiler(stopped) end

--- Base64 decodes and inflates the given string.
---@param string string @The string to decode.
---@return string @The decoded string or `nil` if the decode failed.
function LuaHelpers.decode_string(string) end

--- Converts the given direction into the string version of the direction.
---@param direction defines.direction
---@return string
function LuaHelpers.direction_to_string(direction) end

--- Deflates and base64 encodes the given string.
---@param string string @The string to encode.
---@return string @The encoded string or `nil` if the encode failed.
function LuaHelpers.encode_string(string) end

--- Evaluate an expression, substituting variables as provided.
---@param expression MathExpression @The expression to evaluate.
---@param variables (table<string, double>)|nil @Variables to be substituted.
---@overload fun(expression: MathExpression): double
---@return double
function LuaHelpers.evaluate_expression(expression, variables) end

--- Checks if the given SoundPath is valid.
---@param sound_path SoundPath @Path to the sound.
---@return boolean
function LuaHelpers.is_valid_sound_path(sound_path) end

--- Checks if the given SpritePath is valid and contains a loaded sprite. The existence of the image is not checked for paths of type `file`.
---@param sprite_path SpritePath @Path to the image.
---@return boolean
function LuaHelpers.is_valid_sprite_path(sprite_path) end

--- Convert a JSON string to a table.
---@param json string @The string to convert.
---@return AnyBasic @The returned object, or `nil` if the JSON string was invalid.
function LuaHelpers.json_to_table(json) end

--- Convert a map exchange string to map gen settings and map settings.
---@param map_exchange_string string
---@return MapExchangeStringData
function LuaHelpers.parse_map_exchange_string(map_exchange_string) end

--- Remove a file or directory in the `script-output` folder, located in the game's [user data directory](https://wiki.factorio.com/User_data_directory). Can be used to remove files created by [LuaHelpers::write_file](runtime:LuaHelpers::write_file).
---@param path string @The path to the file or directory to remove, relative to `script-output`.
function LuaHelpers.remove_path(path) end

--- Convert a table to a JSON string
---@param data table
---@return string
function LuaHelpers.table_to_json(data) end

--- Write a file to the `script-output` folder, located in the game's [user data directory](https://wiki.factorio.com/User_data_directory). The name and file extension of the file can be specified via the `filename` parameter.
---@param filename string @The name of the file. Providing a directory path (ex. `"save/here/example.txt"`) will create the necessary folder structure in `script-output`.
---@param data LocalisedString @The content to write to the file.
---@param append boolean|nil @If `true`, `data` will be appended to the end of the file. Defaults to `false`, which will overwrite any pre-existing file with the new `data`.
---@param for_player uint|nil @If given, the file will only be written for this `player_index`. Providing `0` will only write to the server's output if present.
---@overload fun(filename: string, data: LocalisedString, append: boolean|nil)
---@overload fun(filename: string, data: LocalisedString)
function LuaHelpers.write_file(filename, data, append, for_player) end

---@class LuaInserterControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for inserters.
---@field circuit_hand_read_mode defines.control_behavior.inserter.hand_read_mode @The hand read mode for the inserter.
---@field circuit_read_hand_contents boolean @`true` if the contents of the inserter hand should be sent to the circuit network
---@field circuit_set_filters boolean @`true` if filters are set from circuit network
---@field circuit_set_stack_size boolean @If the stack size of the inserter is set through the circuit network or not.
---@field circuit_stack_control_signal SignalID @ nilable; The signal used to set the stack size of the inserter.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaInserterControlBehavior = {}

---@class LuaInventory: any @A storage of item stacks.
---@field entity_owner LuaEntity @ nilable; The entity that owns this inventory, if any.
---@field equipment_owner LuaEquipment @ nilable; The equipment that owns this inventory, if any.
---@field index defines.inventory @ nilable; The inventory index this inventory uses, if any.
---@field mod_owner string @ nilable; The mod that owns this inventory, if any.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field player_owner LuaPlayer @ nilable; The player that owns this inventory, if any.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaInventory = {}

--- Can at least some items be inserted?
---@param items ItemStackIdentification @Items that would be inserted.
---@return boolean @`true` if at least a part of the given items could be inserted into this inventory.
function LuaInventory.can_insert(items) end

--- If the given inventory slot filter can be set to the given filter.
---@param index uint @The item stack index
---@param filter ItemFilter @The item filter
---@return boolean
function LuaInventory.can_set_filter(index, filter) end

--- Make this inventory empty.
function LuaInventory.clear() end

--- Counts the number of empty stacks.
---@param include_filtered boolean|nil @If true, filtered slots will be included. Defaults to false.
---@param include_bar boolean|nil @If true, slots blocked by the current bar will be included. Defaults to true.
---@overload fun(include_filtered: boolean|nil): uint
---@overload fun(): uint
---@return uint
function LuaInventory.count_empty_stacks(include_filtered, include_bar) end

--- Destroys this inventory.
--- Only inventories created by [LuaGameScript::create_inventory](runtime:LuaGameScript::create_inventory) can be destroyed this way.
function LuaInventory.destroy() end

--- Finds the first empty stack. Filtered slots are excluded unless a filter item is given.
---@param item ItemWithQualityID|nil @If given, empty stacks that are filtered for this item will be included.
---@overload fun(): LuaItemStack, uint
---@return LuaItemStack, uint @The first empty stack, or `nil` if there aren't any empty stacks.; The stack index of the matching stack, if any is found.
function LuaInventory.find_empty_stack(item) end

--- Finds the first LuaItemStack in the inventory that matches the given item name.
---@param item ItemWithQualityID @The item to find
---@return LuaItemStack, uint @The first matching stack, or `nil` if none match.; The stack index of the matching stack, if any is found.
function LuaInventory.find_item_stack(item) end

--- Get the current bar. This is the index at which the red area starts.
--- Only useable if this inventory supports having a bar.
---@return uint
function LuaInventory.get_bar() end

--- Get counts of all items in this inventory.
---@return ItemCountWithQuality[] @List of all items in the inventory.
function LuaInventory.get_contents() end

--- Gets the filter for the given item stack index.
---@param index uint @The item stack index
---@return ItemFilter @The current filter or `nil` if none.
function LuaInventory.get_filter(index) end

--- Gets the number of the given item that can be inserted into this inventory.
--- This is a "best guess" number; things like assembling machine filtered slots, module slots, items with durability, and items with mixed health will cause the result to be inaccurate. The main use for this is in checking how many of a basic item can fit into a basic inventory.
--- This accounts for the 'bar' on the inventory.
---@param item ItemWithQualityID @The item to check.
---@return uint
function LuaInventory.get_insertable_count(item) end

--- Get the number of all or some items in this inventory.
---@param item ItemWithQualityID|nil @The item to count. If not specified, count all items.
---@overload fun(): uint
---@return uint
function LuaInventory.get_item_count(item) end

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

--- Is every stack in this inventory full? Ignores stacks blocked by the current bar.
---@return boolean
function LuaInventory.is_full() end

--- Remove items from this inventory.
---@param items ItemStackIdentification @Items to remove.
---@return uint @Number of items actually removed.
function LuaInventory.remove(items) end

--- Resizes the inventory.
--- Items in slots beyond the new capacity are deleted.
--- Only inventories created by [LuaGameScript::create_inventory](runtime:LuaGameScript::create_inventory) can be resized.
---@param size uint16 @New size of a inventory
function LuaInventory.resize(size) end

--- Set the current bar.
--- Only useable if this inventory supports having a bar.
---@param bar uint|nil @The new limit. Omitting this parameter will clear the limit.
---@overload fun()
function LuaInventory.set_bar(bar) end

--- Sets the filter for the given item stack index.
--- Some inventory slots don't allow some filters (gun ammo can't be filtered for non-ammo).
---@param index uint @The item stack index.
---@param filter ItemFilter | nil @The new filter. `nil` erases any existing filter.
---@return boolean @If the filter was allowed to be set.
function LuaInventory.set_filter(index, filter) end

--- Sorts and merges the items in this inventory.
function LuaInventory.sort_and_merge() end

--- Does this inventory support a bar? Bar is the draggable red thing, found for example on chests, that limits the portion of the inventory that may be manipulated by machines.
--- "Supporting a bar" doesn't mean that the bar is set to some nontrivial value. Supporting a bar means the inventory supports having this limit at all. The character's inventory is an example of an inventory without a bar; the wooden chest's inventory is an example of one with a bar.
---@return boolean
function LuaInventory.supports_bar() end

--- If this inventory supports filters.
---@return boolean
function LuaInventory.supports_filters() end

---@class LuaItem: LuaItemCommon @A reference to an item with data. In contrast to LuaItemStack, this is binding to a specific item data even if it would move between entities or inventories.
---@field item_stack LuaItemStack @ nilable; Object representing the item stack this item is located in right now. If its not possible to locate the item stack holding this item, a nil will be returned
---@field name string @Name of the item prototype
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field prototype LuaItemPrototype @Item prototype of this item
---@field quality LuaQualityPrototype @The quality of this item.
---@field type string @Type of the item prototype
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaItem = {}

---@class LuaItemCommon: any @Common methods related to usage of item with data. It is useful when LuaItemStack contains item with data or in general with LuaItem as it can only point at an item with data.
---@field active_index uint @ nilable; The active blueprint index for this blueprint book. `nil` if this blueprint book is empty.
---@field allow_manual_label_change boolean @Whether the label for this item can be manually changed. When false the label can only be changed through the API.
---@field ammo uint @Number of bullets left in the magazine.
---@field blueprint_absolute_snapping boolean @If absolute snapping is enabled on this blueprint item.
---@field blueprint_position_relative_to_grid TilePosition @ nilable; The offset from the absolute grid. `nil` if absolute snapping is not enabled.
---@field blueprint_snap_to_grid TilePosition @ nilable; The snapping grid size in this blueprint item. `nil` if snapping is not enabled.
---@field cost_to_build ItemCountWithQuality[] @List of raw materials required to build this blueprint.
---@field custom_description LocalisedString @The custom description this item-with-tags. This is shown over the normal item description if this is set to a non-empty value.
---@field default_icons BlueprintSignalIcon[] @The default icons for a blueprint item.
---@field durability double @Durability of the contained item. Automatically capped at the item's maximum durability.
---@field entity_color Color @ nilable; If this is an item with entity data, get the stored entity color.
---@field entity_filter_count uint @The number of entity filters this deconstruction item supports.
---@field entity_filter_mode defines.deconstruction_item.entity_filter_mode @The blacklist/whitelist entity filter mode for this deconstruction item.
---@field entity_filters string[] @The entity filters for this deconstruction item. The attribute is a sparse array with the keys representing the index of the filter. All strings in this array must be entity prototype names that don't have the `"not-deconstructable"` flag set and are either a `cliff` or marked as `minable`.
---@field entity_label string @ nilable; If this is an item with entity data, get the stored entity label.
---@field grid LuaEquipmentGrid @ nilable; The equipment grid of this item, if any.
---@field is_ammo boolean @If this is an ammo item.
---@field is_armor boolean @If this is an armor item.
---@field is_blueprint boolean @If this is a blueprint item.
---@field is_blueprint_book boolean @If this is a blueprint book item.
---@field is_deconstruction_item boolean @If this is a deconstruction tool item.
---@field is_item_with_entity_data boolean @If this is an item with entity data item.
---@field is_item_with_inventory boolean @If this is an item with inventory item.
---@field is_item_with_label boolean @If this is an item with label item.
---@field is_item_with_tags boolean @If this is an item with tags item.
---@field is_repair_tool boolean @If this is a repair tool item.
---@field is_selection_tool boolean @If this is a selection tool item.
---@field is_tool boolean @If this is a tool item.
---@field is_upgrade_item boolean @If this is a upgrade item.
---@field item_number uint @ nilable; The unique identifier for this item, if any. Note that this ID stays the same no matter where the item is moved to.
---@field label string @ nilable; The current label for this item, if any.
---@field label_color Color @ nilable; The current label color for this item, if any.
---@field mapper_count uint @The current count of mappers in the upgrade item.
---@field owner_location ItemLocationData @The location of this item if it can be found.
---@field preview_icons BlueprintSignalIcon[] @ nilable; Icons of this blueprint item, blueprint book, deconstruction item or upgrade planner. An item that doesn't have icons returns `nil` on read and throws error on write.
---@field tags Tags
---@field tile_filter_count uint @The number of tile filters this deconstruction item supports.
---@field tile_filter_mode defines.deconstruction_item.tile_filter_mode @The blacklist/whitelist tile filter mode for this deconstruction item.
---@field tile_filters TileID[] @The tile filters for this deconstruction item. The attribute is a sparse array with the keys representing the index of the filter. Reading filters always returns an array of strings which are the tile prototype names.
---@field tile_selection_mode defines.deconstruction_item.tile_selection_mode @The tile selection mode for this deconstruction item.
---@field trees_and_rocks_only boolean @If this deconstruction item is set to allow trees and rocks only.
LuaItemCommon = {}

---@class LuaItemCommon_build_blueprint_params
---@field surface SurfaceIdentification @Surface to build on
---@field force ForceID @Force to use for the building
---@field position MapPosition @The position to build at
---@field direction defines.direction|nil @The direction to use when building
---@field build_mode defines.build_mode|nil @If `normal`, blueprint will not be built if any one thing can't be built. If `forced`, anything that can be built is built and obstructing nature entities will be deconstructed. If `superforced`, all obstructions will be deconstructed and the blueprint will be built.
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
---@field by_player PlayerIdentification|nil @The player to use if any. If provided [defines.events.on_built_entity](runtime:defines.events.on_built_entity) will also be fired on successful entity creation.
---@field raise_built boolean|nil @If true; [defines.events.script_raised_built](runtime:defines.events.script_raised_built) will be fired on successful entity creation. Note: this is ignored if by_player is provided.

--- Build this blueprint at the given location.
--- Built entities can be come invalid between the building of the blueprint and the function returning if by_player or raise_built is used and one of those events invalidates the entity.
---@param p LuaItemCommon_build_blueprint_params
---@return LuaEntity[] @Array of created ghosts
function LuaItemCommon.build_blueprint(p) end

---@class LuaItemCommon_cancel_deconstruct_area_params
---@field surface SurfaceIdentification @Surface to cancel deconstruct on
---@field force ForceID @Force to use for canceling deconstruction
---@field area BoundingBox @The area to deconstruct
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped. Defaults to `false`.
---@field by_player PlayerIdentification|nil @The player to use if any.
---@field super_forced boolean|nil @If the cancel deconstruction is super-forced. Defaults to `false`.

--- Cancel deconstruct the given area with this deconstruction item.
---@param p LuaItemCommon_cancel_deconstruct_area_params
function LuaItemCommon.cancel_deconstruct_area(p) end

--- Clears this blueprint item.
function LuaItemCommon.clear_blueprint() end

--- Clears all settings/filters on this deconstruction item resetting it to default values.
function LuaItemCommon.clear_deconstruction_item() end

--- Clears all settings/filters on this upgrade item resetting it to default values.
function LuaItemCommon.clear_upgrade_item() end

---@class LuaItemCommon_create_blueprint_params
---@field surface SurfaceIdentification @Surface to create from
---@field force ForceID @Force to use for the creation
---@field area BoundingBox @The bounding box
---@field always_include_tiles boolean|nil @When true, blueprintable tiles are always included in the blueprint. When false they're only included if no entities exist in the setup area.
---@field include_entities boolean|nil @When true, entities are included in the blueprint. Defaults to true.
---@field include_modules boolean|nil @When true, modules are included in the blueprint. Defaults to true.
---@field include_station_names boolean|nil @When true, station names are included in the blueprint. Defaults to false.
---@field include_trains boolean|nil @When true, trains are included in the blueprint. Defaults to false.
---@field include_fuel boolean|nil @When true, train fuel is included in the blueprint, Defaults to true.

--- Sets up this blueprint using the found blueprintable entities/tiles on the surface.
---@param p LuaItemCommon_create_blueprint_params
---@return table<uint, LuaEntity> @The blueprint entity index to source entity mapping.
function LuaItemCommon.create_blueprint(p) end

---@class LuaItemCommon_deconstruct_area_params
---@field surface SurfaceIdentification @Surface to deconstruct on
---@field force ForceID @Force to use for the deconstruction
---@field area BoundingBox @The area to deconstruct
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped. Defaults to `false`.
---@field by_player PlayerIdentification|nil @The player to use if any.
---@field super_forced boolean|nil @If the deconstruction is super-forced. Defaults to `false`.

--- Deconstruct the given area with this deconstruction item.
---@param p LuaItemCommon_deconstruct_area_params
function LuaItemCommon.deconstruct_area(p) end

--- The entities in this blueprint.
---@return BlueprintEntity[]
function LuaItemCommon.get_blueprint_entities() end

--- Gets the number of entities in this blueprint item.
---@return uint
function LuaItemCommon.get_blueprint_entity_count() end

--- Gets the given tag on the given blueprint entity index in this blueprint item.
---@param index uint @The entity index.
---@param tag string @The tag to get.
---@return AnyBasic
function LuaItemCommon.get_blueprint_entity_tag(index, tag) end

--- Gets the tags for the given blueprint entity index in this blueprint item.
---@param index uint
---@return Tags
function LuaItemCommon.get_blueprint_entity_tags(index) end

--- A list of the tiles in this blueprint.
---@return Tile[]
function LuaItemCommon.get_blueprint_tiles() end

--- Gets the entity filter at the given index for this deconstruction item.
---@param index uint
---@return string
function LuaItemCommon.get_entity_filter(index) end

--- Access the inner inventory of an item.
---@param inventory defines.inventory @Index of the inventory to access, which can only be [defines.inventory.item_main](runtime:defines.inventory.item_main).
---@return LuaInventory @`nil` if there is no inventory with the given index.
function LuaItemCommon.get_inventory(inventory) end

--- Gets the filter at the given index for this upgrade item.
--- In contrast to [LuaItemCommon::set_mapper](runtime:LuaItemCommon::set_mapper), indices past the upgrade item's current size are considered to be out of bounds.
---@param index uint @The index of the mapper to read.
---@param type "from" | "to"
---@return UpgradeMapperSource | UpgradeMapperDestination
function LuaItemCommon.get_mapper(index, type) end

--- Gets the tag with the given name or returns `nil` if it doesn't exist.
---@param tag_name string
---@return AnyBasic
function LuaItemCommon.get_tag(tag_name) end

--- Gets the tile filter at the given index for this deconstruction item.
---@param index uint
---@return string
function LuaItemCommon.get_tile_filter(index) end

--- Is this blueprint item setup? I.e. is it a non-empty blueprint?
---@return boolean
function LuaItemCommon.is_blueprint_setup() end

--- Removes a tag with the given name.
---@param tag string
---@return boolean @If the tag existed and was removed.
function LuaItemCommon.remove_tag(tag) end

--- Set new entities to be a part of this blueprint.
---@param entities BlueprintEntity[] @The new blueprint entities.
function LuaItemCommon.set_blueprint_entities(entities) end

--- Sets the given tag on the given blueprint entity index in this blueprint item.
---@param index uint @The entity index.
---@param tag string @The tag to set.
---@param value AnyBasic @The tag value to set or `nil` to clear the tag.
function LuaItemCommon.set_blueprint_entity_tag(index, tag, value) end

--- Sets the tags on the given blueprint entity index in this blueprint item.
---@param index uint @The entity index
---@param tags Tags
function LuaItemCommon.set_blueprint_entity_tags(index, tags) end

--- Set specific tiles in this blueprint.
---@param tiles Tile[] @Tiles to be a part of the blueprint.
function LuaItemCommon.set_blueprint_tiles(tiles) end

--- Sets the entity filter at the given index for this deconstruction item.
---@param index uint
---@param filter string | LuaEntityPrototype | LuaEntity | nil @Writing `nil` removes the filter.
---@return boolean @Whether the new filter was successfully set (meaning it was valid).
function LuaItemCommon.set_entity_filter(index, filter) end

--- Sets the module filter at the given index for this upgrade item.
--- In contrast to [LuaItemCommon::get_mapper](runtime:LuaItemCommon::get_mapper), indices past the upgrade item's current size are valid and expand the list of mappings accordingly, if within reasonable bounds.
---@param index uint @The index of the mapper to set.
---@param type "from" | "to"
---@param mapper UpgradeMapperSource | UpgradeMapperDestination | nil @The mapper to set or `nil`
function LuaItemCommon.set_mapper(index, type, mapper) end

--- Sets the tag with the given name and value.
---@param tag_name string
---@param tag AnyBasic
function LuaItemCommon.set_tag(tag_name, tag) end

--- Sets the tile filter at the given index for this deconstruction item.
---@param index uint
---@param filter string | LuaTilePrototype | LuaTile | nil @Writing `nil` removes the filter.
---@return boolean @Whether the new filter was successfully set (meaning it was valid).
function LuaItemCommon.set_tile_filter(index, filter) end

---@class LuaItemPrototype: LuaPrototypeBase @Prototype of an item. For example, an item prototype can be obtained from [LuaGameScript::item_prototypes](runtime:LuaGameScript::item_prototypes) by its name: `prototypes.item["iron-plate"]`.
---@field always_include_tiles boolean @ nilable; If tiles area always included when doing selection with this selection tool prototype.
---@field ammo_category LuaAmmoCategoryPrototype @ nilable
---@field attack_parameters AttackParameters @ nilable; The gun attack parameters.
---@field beacon_tint Color[] @ nilable
---@field burnt_result LuaItemPrototype @ nilable; The result of burning this item as fuel, if any.
---@field can_be_mod_opened boolean @If this item can be mod-opened.
---@field capsule_action CapsuleAction @ nilable; The capsule action for this capsule item prototype.
---@field category string @ nilable; The name of a [LuaModuleCategoryPrototype](runtime:LuaModuleCategoryPrototype). Used when upgrading modules: Ctrl + click modules into an entity and it will replace lower tier modules of the same category with higher tier modules.
---@field collision_box BoundingBox @ nilable; The collision box used by character entities when wearing this armor.
---@field default_import_location LuaSpaceLocationPrototype
---@field default_label_color Color @ nilable; The default label color used for this item with label, if any.
---@field destroyed_by_dropping_trigger TriggerItem[] @ nilable
---@field draw_label_for_cursor_render boolean @ nilable; If true, and this item with label has a label it is drawn in place of the normal number when held in the cursor.
---@field drawing_box BoundingBox @ nilable; The drawing box used by character entities when wearing this armor.
---@field durability_description_key string @ nilable; The durability message key used when displaying the durability of this tool.
---@field durability_description_value string @ nilable; The durability message value used when displaying the durability of this tool.
---@field entity_filter_slots uint @ nilable; The number of entity filters this deconstruction item has.
---@field equipment_grid LuaEquipmentGridPrototype @ nilable; The prototype of this armor's equipment grid, if any.
---@field filter_mode "none" | "whitelist" | "blacklist" @ nilable; The filter mode used by this item with inventory.
---@field flags ItemPrototypeFlags @The flags for this item prototype.
---@field fuel_acceleration_multiplier double @The acceleration multiplier when this item is used as fuel in a vehicle.
---@field fuel_acceleration_multiplier_quality_bonus double @Additional fuel acceleration multiplier per quality level.
---@field fuel_category string @ nilable; The fuel category, if any.
---@field fuel_emissions_multiplier double @The emissions multiplier if this is used as fuel.
---@field fuel_glow_color Color @ nilable
---@field fuel_top_speed_multiplier double @The fuel top speed multiplier when this item is used as fuel in a vehicle.
---@field fuel_top_speed_multiplier_quality_bonus double @Additional fuel top speed multiplier per quality level.
---@field fuel_value float @Fuel value when burned.
---@field infinite boolean @ nilable; If this tool item has infinite durability.
---@field ingredient_to_weight_coefficient double
---@field inventory_size uint @ nilable; The main inventory size for item-with-inventory-prototype.
---@field item_filters LuaItemPrototype[] @ nilable
---@field item_group_filters LuaGroup[] @ nilable
---@field item_subgroup_filters LuaGroup[] @ nilable
---@field localised_filter_message LocalisedString @ nilable; The localised string used when the player attempts to put items into this item with inventory that aren't allowed.
---@field magazine_size float @ nilable; Size of full magazine.
---@field manual_length_limit double @ nilable
---@field module_effects ModuleEffects @ nilable; Effects of this module.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field place_as_equipment_result LuaEquipmentPrototype @ nilable; Prototype of the equipment that will be created by placing this item in an equipment grid, if any.
---@field place_as_tile_result PlaceAsTileResult @ nilable; The place-as-tile result if one is defined, if any.
---@field place_result LuaEntityPrototype @ nilable; Prototype of the entity that will be created by placing this item, if any.
---@field plant_result LuaEntityPrototype @ nilable; The result entity when planting this item as a seed.
---@field provides_flight boolean @ nilable; If this armor provides flight to character entities when worm.
---@field radius_color Color @ nilable
---@field rails LuaEntityPrototype[] @ nilable; Prototypes of all rails possible to be used by this rail planner prototype.
---@field reload_time float @ nilable; Amount of extra time (in ticks) it takes to reload the weapon after depleting the magazine.
---@field requires_beacon_alt_mode boolean @ nilable
---@field resistances table<string, Resistance> @ nilable; Resistances of this armor item, if any, indexed by damage type name.
---@field rocket_launch_products Product[] @The results of launching this item in a rocket.
---@field skip_fog_of_war boolean @ nilable; If this selection tool skips things covered by fog of war.
---@field speed float @ nilable; The repairing speed if this is a repairing tool.
---@field spoil_result LuaItemPrototype @ nilable; The spoil result of this item, if any
---@field spoil_to_trigger_result SpoilToTriggerResult @ nilable
---@field stack_size uint @Maximum stack size of the item specified by this prototype.
---@field stackable boolean @Is this item allowed to stack at all?
---@field support LuaEntityPrototype @ nilable; The rail support used by this rail planner.
---@field tier uint @ nilable; Tier of the module inside its category. Used when upgrading modules: Ctrl + click modules into an entity and it will replace lower tier modules with higher tier modules if they have the same category.
---@field tile_filter_slots uint @ nilable; The number of tile filters this deconstruction item has.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field weight double @Weight of this item
LuaItemPrototype = {}

--- The type of this ammo prototype.
---@param ammo_source_type ("default" | "player" | "turret" | "vehicle")|nil @Defaults to `"default"`.
---@overload fun(): AmmoType
---@return AmmoType
function LuaItemPrototype.get_ammo_type(ammo_source_type) end

---@param selection_mode defines.selection_mode
---@return CursorBoxRenderType
function LuaItemPrototype.get_cursor_box_type(selection_mode) end

--- The durability of this tool item prototype.
---@param quality QualityID|nil
---@overload fun(): double
---@return double
function LuaItemPrototype.get_durability(quality) end

--- The entity filter mode used by this selection tool.
---@param selection_mode defines.selection_mode
---@return PrototypeFilterMode
function LuaItemPrototype.get_entity_filter_mode(selection_mode) end

--- The entity filters used by this selection tool.
---@param selection_mode defines.selection_mode
---@return LuaEntityPrototype[]
function LuaItemPrototype.get_entity_filters(selection_mode) end

--- The entity type filters used by this selection tool indexed by entity type.
--- The boolean value is meaningless and is used to allow easy lookup if a type exists in the dictionary.
---@param selection_mode defines.selection_mode
---@return table<string, true>
function LuaItemPrototype.get_entity_type_filters(selection_mode) end

--- The inventory size bonus for this armor prototype.
---@param quality QualityID|nil
---@overload fun(): uint
---@return uint
function LuaItemPrototype.get_inventory_size_bonus(quality) end

--- The color used when doing normal selection with this selection tool prototype.
---@param selection_mode defines.selection_mode
---@return Color
function LuaItemPrototype.get_selection_border_color(selection_mode) end

--- Flags that affect which entities will be selected.
---@param selection_mode defines.selection_mode
---@return SelectionModeFlags
function LuaItemPrototype.get_selection_mode_flags(selection_mode) end

--- The number of ticks before this item spoils, or `0` if it does not spoil.
---@param quality QualityID|nil
---@overload fun(): uint
---@return uint
function LuaItemPrototype.get_spoil_ticks(quality) end

--- The tile filter mode used by this selection tool.
---@param selection_mode defines.selection_mode
---@return PrototypeFilterMode
function LuaItemPrototype.get_tile_filter_mode(selection_mode) end

--- The tile filters used by this selection tool.
---@param selection_mode defines.selection_mode
---@return LuaTilePrototype[]
function LuaItemPrototype.get_tile_filters(selection_mode) end

--- Test whether this item prototype has a certain flag set.
---@param flag ItemPrototypeFlag @The flag to test.
---@return boolean
function LuaItemPrototype.has_flag(flag) end

---@class LuaItemStack: LuaItemCommon @A reference to an item and count owned by some external entity. In most instances this is a simple reference as in: it points at a specific slot in an inventory and not the item in the slot. In the instance this references an item on a [LuaTransportLine](runtime:LuaTransportLine) the reference is only guaranteed to stay valid (and refer to the same item) as long as nothing changes the transport line.
---@field count uint @Number of items in this stack.
---@field health float @How much health the item has, as a number in range `[0, 1]`.
---@field is_module boolean @If this is a module
---@field item LuaItem @ nilable; If the item has additional data, returns LuaItem pointing at the extra data, otherwise returns nil.
---@field name string @Prototype name of the item held in this stack.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field prototype LuaItemPrototype @Prototype of the item held in this stack.
---@field quality LuaQualityPrototype @The quality of this item.
---@field spoil_percent double @The percent spoiled this item is if it spoils. `0` in the case of the item not spoiling.
---@field spoil_tick uint @The tick this item spoils, or `0` if it does not spoil. When writing, setting to anything < the current game tick will spoil the item instantly.
---@field type string @Type of the item prototype.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field valid_for_read boolean @Is this valid for reading? Differs from the usual `valid` in that `valid` will be `true` even if the item stack is blank but the entity that holds it is still valid.
LuaItemStack = {}

--- Add ammo to this ammo item.
---@param amount float @Amount of ammo to add.
function LuaItemStack.add_ammo(amount) end

--- Add durability to this tool item.
---@param amount double @Amount of durability to add.
function LuaItemStack.add_durability(amount) end

--- Would a call to [LuaItemStack::set_stack](runtime:LuaItemStack::set_stack) succeed?
---@param stack ItemStackIdentification|nil @Stack that would be set, possibly `nil`.
---@overload fun(): boolean
---@return boolean
function LuaItemStack.can_set_stack(stack) end

--- Clear this item stack.
function LuaItemStack.clear() end

--- Creates the equipment grid for this item if it doesn't exist and this is an item-with-entity-data that supports equipment grids.
---@return LuaEquipmentGrid
function LuaItemStack.create_grid() end

--- Remove ammo from this ammo item.
---@param amount float @Amount of ammo to remove.
function LuaItemStack.drain_ammo(amount) end

--- Remove durability from this tool item.
---@param amount double @Amount of durability to remove.
function LuaItemStack.drain_durability(amount) end

--- Export a supported item (blueprint, blueprint-book, deconstruction-planner, upgrade-planner, item-with-tags) to a string.
---@return string @The exported string
function LuaItemStack.export_stack() end

--- Import a supported item (blueprint, blueprint-book, deconstruction-planner, upgrade-planner, item-with-tags) from a string.
---@param data string @The string to import
---@return int @0 if the import succeeded with no errors. -1 if the import succeeded with errors. 1 if the import failed.
function LuaItemStack.import_stack(data) end

--- Set this item stack to another item stack.
---@param stack ItemStackIdentification|nil @Item stack to set it to. Omitting this parameter or passing `nil` will clear this item stack, as if [LuaItemStack::clear](runtime:LuaItemStack::clear) was called.
---@overload fun(): boolean
---@return boolean @Whether the stack was set successfully. Returns `false` if this stack was not [valid for write](runtime:LuaItemStack::can_set_stack).
function LuaItemStack.set_stack(stack) end

--- Spoils this item if the item can spoil.
function LuaItemStack.spoil() end

--- Swaps this item stack with the given item stack if allowed.
---@param stack LuaItemStack
---@return boolean @Whether the 2 stacks were swapped successfully.
function LuaItemStack.swap_stack(stack) end

--- Transfers the given item stack into this item stack.
---@param stack ItemStackIdentification
---@return boolean @`true` if the full stack was transferred.
function LuaItemStack.transfer_stack(stack) end

--- Use the capsule item with the entity as the source, targeting the given position.
---@param entity LuaEntity @The entity to use the capsule item with.
---@param target_position MapPosition @The position to use the capsule item with.
---@return LuaEntity[] @Array of the entities that were created by the capsule action.
function LuaItemStack.use_capsule(entity, target_position) end

---@class LuaLampControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for lamps.
---@field blue_signal SignalID @ nilable
---@field color Color @ nilable; The color the lamp is showing, if any.
---@field color_mode defines.control_behavior.lamp.color_mode
---@field green_signal SignalID @ nilable
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field red_signal SignalID @ nilable
---@field rgb_signal SignalID @ nilable
---@field use_colors boolean @`true` if the lamp should set the color from the circuit network signals.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLampControlBehavior = {}

---@class LuaLazyLoadedValue: any @A lazily loaded value. For performance reasons, we sometimes return a custom lazily-loaded value type instead of the native Lua value. This custom type lazily constructs the necessary value when [LuaLazyLoadedValue::get](runtime:LuaLazyLoadedValue::get) is called, therefore preventing its unnecessary construction in some cases. An instance of LuaLazyLoadedValue is only valid during the event it was created from and cannot be saved.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLazyLoadedValue = {}

--- Gets the value of this lazy loaded value.
---@return Any
function LuaLazyLoadedValue.get() end

---@class LuaLoaderControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for loaders.
---@field circuit_read_transfers boolean @`true` if the transfers between loader's belt and container should be pulsed to the circuit network
---@field circuit_set_filters boolean @`true` if filters are set from circuit network
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLoaderControlBehavior = {}

---@class LuaLogisticCell: any @Logistic cell of a particular [LuaEntity](runtime:LuaEntity). A "Logistic Cell" is the given name for settings and properties used by what would normally be seen as a "Roboport". A logistic cell however doesn't have to be attached to the roboport entity (the character has one for the personal roboport).
---@field charge_approach_distance float @Radius at which the robots hover when waiting to be charged.
---@field charging_robot_count uint @Number of robots currently charging.
---@field charging_robots LuaEntity[] @Robots currently being charged.
---@field construction_radius float @Construction radius of this cell.
---@field logistic_network LuaLogisticNetwork @ nilable; The network that owns this cell, if any.
---@field logistic_radius float @Logistic radius of this cell.
---@field logistics_connection_distance float @Logistic connection distance of this cell.
---@field mobile boolean @`true` if this is a mobile cell. In vanilla, only the logistic cell created by a character's personal roboport is mobile.
---@field neighbours LuaLogisticCell[] @Neighbouring cells.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field owner LuaEntity @This cell's owner.
---@field stationed_construction_robot_count uint @Number of stationed construction robots in this cell.
---@field stationed_logistic_robot_count uint @Number of stationed logistic robots in this cell.
---@field to_charge_robot_count uint @Number of robots waiting to charge.
---@field to_charge_robots LuaEntity[] @Robots waiting to charge.
---@field transmitting boolean @`true` if this cell is active.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLogisticCell = {}

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
---@field circuit_condition CircuitConditionDefinition @The circuit condition for the logistic container.
---@field circuit_condition_enabled boolean @Whether the circuit condition is in effect
---@field circuit_exclusive_mode_of_operation defines.control_behavior.logistic_container.exclusive_mode @The circuit mode of operations for the logistic container. Can only be set on containers whose [logistic_mode](runtime:LuaEntityPrototype::logistic_mode) is set to `"requester"` or `"buffer"`.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLogisticContainerControlBehavior = {}

---@class LuaLogisticNetwork: any @A single logistic network of a given force on a given surface.
---@field active_provider_points LuaLogisticPoint[] @All active provider points in this network.
---@field all_construction_robots uint @The total number of construction robots in the network (idle and active + in roboports).
---@field all_logistic_robots uint @The total number of logistic robots in the network (idle and active + in roboports).
---@field available_construction_robots uint @Number of construction robots available for a job.
---@field available_logistic_robots uint @Number of logistic robots available for a job.
---@field cells LuaLogisticCell[] @All cells in this network.
---@field construction_robots LuaEntity[] @All construction robots in this logistic network.
---@field empty_provider_points LuaLogisticPoint[] @All things that have empty provider points in this network.
---@field empty_providers LuaEntity[] @All entities that have empty logistic provider points in this network.
---@field force LuaForce @The force this logistic network belongs to.
---@field logistic_members LuaEntity[] @All other entities that have logistic points in this network (inserters mostly).
---@field logistic_robots LuaEntity[] @All logistic robots in this logistic network.
---@field network_id uint @The unique logistic network ID.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field passive_provider_points LuaLogisticPoint[] @All passive provider points in this network.
---@field provider_points LuaLogisticPoint[] @All things that have provider points in this network.
---@field providers LuaEntity[] @All entities that have logistic provider points in this network.
---@field requester_points LuaLogisticPoint[] @All things that have requester points in this network.
---@field requesters LuaEntity[] @All entities that have logistic requester points in this network.
---@field robot_limit uint @Maximum number of robots the network can work with. Currently only used for the personal roboport.
---@field robots LuaEntity[] @All robots in this logistic network.
---@field storage_points LuaLogisticPoint[] @All things that have storage points in this network.
---@field storages LuaEntity[] @All entities that have logistic storage points in this network.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLogisticNetwork = {}

--- Can the network satisfy a request for a given item and count.
---@param item ItemWithQualityID @Item name to check.
---@param count uint|nil @Count to check. Defaults to 1.
---@param include_buffers boolean|nil @Should buffers be considered? Defaults to false.
---@overload fun(item: ItemWithQualityID, count: uint|nil): boolean
---@overload fun(item: ItemWithQualityID): boolean
---@return boolean @Whether the network can satisfy the request.
function LuaLogisticNetwork.can_satisfy_request(item, count, include_buffers) end

--- Find logistic cell closest to a given position.
---@param position MapPosition
---@return LuaLogisticCell @`nil` if no cell was found.
function LuaLogisticNetwork.find_cell_closest_to(position) end

--- Get item counts for the entire network, similar to how [LuaInventory::get_contents](runtime:LuaInventory::get_contents) does.
---@return ItemCountWithQuality[] @List of all items in the network.
function LuaLogisticNetwork.get_contents() end

--- Count given or all items in the network or given members.
---@param item ItemWithQualityID|nil @Item name to count. If not given, gives counts of all items in the network.
---@param member ("storage" | "providers")|nil @Logistic members to check. If not given, gives count in the entire network.
---@overload fun(item: ItemWithQualityID|nil): int
---@overload fun(): int
---@return int
function LuaLogisticNetwork.get_item_count(item, member) end

--- Get the amount of items of the given type indexed by the storage member.
---@param item ItemWithQualityID @Item name to check.
---@return LogisticsNetworkSupplyCounts
function LuaLogisticNetwork.get_supply_counts(item) end

--- Gets the logistic points with of the given type indexed by the storage member.
---@param item ItemWithQualityID @Item name to check.
---@return LogisticsNetworkSupplyPoints
function LuaLogisticNetwork.get_supply_points(item) end

--- Insert items into the logistic network. This will actually insert the items into some logistic chests.
---@param item ItemStackIdentification @What to insert.
---@param members ("storage" | "storage-empty" | "storage-empty-slot" | "requester")|nil @Which logistic members to insert the items to. `"storage-empty"` inserts into storage chests that are completely empty, `"storage-empty-slot"` inserts into storage chests that have an empty slot. If not specified, inserts items into the logistic network in the usual order.
---@overload fun(item: ItemStackIdentification): uint
---@return uint @Number of items actually inserted.
function LuaLogisticNetwork.insert(item, members) end

--- Remove items from the logistic network. This will actually remove the items from some logistic chests.
---@param item ItemStackIdentification @What to remove.
---@param members ("active-provider" | "passive-provider" | "buffer" | "storage")|nil @Which logistic members to remove from. If not specified, removes from the network in the usual order.
---@overload fun(item: ItemStackIdentification): uint
---@return uint @Number of items removed.
function LuaLogisticNetwork.remove_item(item, members) end

---@class LuaLogisticNetwork_select_drop_point_params
---@field stack ItemStackIdentification @Name of the item to drop off.
---@field members ("storage" | "storage-empty" | "storage-empty-slot" | "requester")|nil @When given, it will find from only the specific type of member. If not specified, selects with normal priorities.

--- Find a logistic point to drop the specific item stack.
---@param p LuaLogisticNetwork_select_drop_point_params
---@return LuaLogisticPoint @`nil` if no point was found.
function LuaLogisticNetwork.select_drop_point(p) end

---@class LuaLogisticNetwork_select_pickup_point_params
---@field name ItemWithQualityID @Name of the item to pick up.
---@field position MapPosition|nil @When given, it will find the storage 'best' storage point from this position.
---@field include_buffers boolean|nil @Whether to consider buffer chests or not. Defaults to false. Only considered if selecting with position.
---@field members ("active-provider" | "passive-provider" | "buffer" | "storage")|nil @When given, it will find from only the specific type of member. If not specified, selects with normal priorities. Not considered if position is specified.

--- Find the 'best' logistic point with this item ID and from the given position or from given chest type.
---@param p LuaLogisticNetwork_select_pickup_point_params
---@return LuaLogisticPoint @`nil` if no point was found.
function LuaLogisticNetwork.select_pickup_point(p) end

---@class LuaLogisticPoint: any @Logistic point of a particular [LuaEntity](runtime:LuaEntity). A "Logistic point" is the name given for settings and properties used by requester, provider, and storage points in a given logistic network. These "points" don't have to be a logistic container but often are. One other entity that can own several points is the "character" character type entity.
---@field enabled boolean @Whether this logistic point is active, related to disabling logistics on player/spidertron. When the logistic point is disabled it won't request and auto trash will do nothing.
---@field exact boolean @If this logistic point is using the exact mode. In exact mode robots never over-deliver requests.
---@field filters CompiledLogisticFilter[] @ nilable; The logistic filters for this logistic point, if this uses any. The returned array will always have an entry for each filter and will be indexed in sequence when not `nil`.
---@field force LuaForce @The force of this logistic point. This will always be the same as the [LuaLogisticPoint::owner](runtime:LuaLogisticPoint::owner) force.
---@field logistic_member_index uint @The Logistic member index of this logistic point.
---@field logistic_network LuaLogisticNetwork
---@field mode defines.logistic_mode @The logistic mode.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field owner LuaEntity @The [LuaEntity](runtime:LuaEntity) owner of this LuaLogisticPoint.
---@field sections LuaLogisticSection[] @All logistic sections of this logistic point.
---@field sections_count uint @Amount of logistic sections this logistic point has.
---@field targeted_items_deliver table<string, uint> @Items targeted to be dropped off into this logistic point by robots. The attribute is a dictionary mapping the item prototype names to their item counts.
---@field targeted_items_pickup table<string, uint> @Items targeted to be picked up from this logistic point by robots. The attribute is a dictionary mapping the item prototype names to their item counts.
---@field trash_not_requested boolean @Whether this logistic point is set to trash unrequested items.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLogisticPoint = {}

--- Adds a new logistic section to this logistic point if possible.
---@param group string|nil @The group to assign this section to.
---@overload fun(): LuaLogisticSection
---@return LuaLogisticSection @The added logistic section.
function LuaLogisticPoint.add_section(group) end

--- Gets section on the selected index, if it exists
---@param section_index uint @Index of the section
---@return LuaLogisticSection
function LuaLogisticPoint.get_section(section_index) end

--- Removes the given logistic section if possible. Removal may fail if the section index is out of range or the section is not [manual](runtime:LuaLogisticSection::is_manual).
---@param section_index uint @Index of the section
---@return boolean @Whether section was removed.
function LuaLogisticPoint.remove_section(section_index) end

---@class LuaLogisticSection: any @Logistic section of a particular [LuaLogisticPoint](runtime:LuaLogisticPoint) or [LuaConstantCombinatorControlBehavior](runtime:LuaConstantCombinatorControlBehavior).
---@field active boolean @Whether this section is active. This can only be written to when the section [is manual](runtime:LuaLogisticSection::is_manual).
---@field filters LogisticFilter[] @The logistic filters for this section. This can only be written to when the section [is manual](runtime:LuaLogisticSection::is_manual).
---@field filters_count uint @Amount of filters this section has
---@field group string @The group this section belongs to. An empty string when in no group. This can only be written to when the section [is manual](runtime:LuaLogisticSection::is_manual).
---@field index uint @The section index of this section.
---@field is_manual boolean @Shortcut to check whether [LuaLogisticSection::type](runtime:LuaLogisticSection::type) is equal to [manual](runtime:defines.logistic_section_type.manual).
---@field multiplier float @Multiplier applied to all filters before they are used by game. This can only be written to when the section [is manual](runtime:LuaLogisticSection::is_manual).
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field owner LuaEntity @The [LuaEntity](runtime:LuaEntity) owner of this LuaLogisticSection.
---@field type defines.logistic_section_type @The type of this logistic section. Sections that are not manual are controlled by game itself and may not be allowed to be changed by script.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaLogisticSection = {}

--- Clears the logistic request and auto-trash from the given slot.
--- This can only be called when the section [is manual](runtime:LuaLogisticSection::is_manual).
---@param slot_index LogisticFilterIndex @Index of a slot to clear.
function LuaLogisticSection.clear_slot(slot_index) end

--- Gets current settings of logistic request and auto-trash from the given slot.
---@param slot_index LogisticFilterIndex @Index of a slot to read.
---@return LogisticFilter
function LuaLogisticSection.get_slot(slot_index) end

--- Sets logistic request and auto-trash slot to the given value.
--- This will silently fail if personal logistics are not researched yet.
--- This can only be called when the section [is manual](runtime:LuaLogisticSection::is_manual).
---@param slot_index LogisticFilterIndex @Index of a slot to set.
---@param filter LogisticFilter @The details of the filter to set.
function LuaLogisticSection.set_slot(slot_index, filter) end

---@class LuaMiningDrillControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for mining drills.
---@field circuit_read_resources boolean @`true` if this drill should send the resources in the field to the circuit network. Which resources depends on [LuaMiningDrillControlBehavior::resource_read_mode](runtime:LuaMiningDrillControlBehavior::resource_read_mode)
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field resource_read_mode defines.control_behavior.mining_drill.resource_read_mode @If the mining drill should send just the resources in its area or the entire field it's on to the circuit network.
---@field resource_read_targets LuaEntity[] @The resource entities that the mining drill will send information about to the circuit network or an empty array.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaMiningDrillControlBehavior = {}

---@class LuaModSettingPrototype: LuaPrototypeBase @Prototype of a mod setting.
---@field allow_blank boolean @ nilable; Whether this string setting allows blank values. `nil` if not a string setting.
---@field allowed_values string[] | int[] | double[] @ nilable; The allowed values for this setting. `nil` if this setting doesn't use the a fixed set of values.
---@field auto_trim boolean @ nilable; Whether this string setting auto-trims values. `nil` if not a string setting
---@field default_value boolean | double | int | string | Color @The default value of this setting.
---@field maximum_value double | int @ nilable; The maximum value for this setting. `nil` if this setting type doesn't support a maximum.
---@field minimum_value double | int @ nilable; The minimum value for this setting. `nil` if this setting type doesn't support a minimum.
---@field mod string @The mod that owns this setting.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field setting_type "startup" | "runtime-global" | "runtime-per-user"
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaModSettingPrototype = {}

---@class LuaModuleCategoryPrototype: LuaPrototypeBase @Prototype of a module category.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaModuleCategoryPrototype = {}

---@class LuaNamedNoiseExpression: LuaPrototypeBase @Prototype of a named noise expression.
---@field expression string @The expression itself.
---@field intended_property string @Name of the property that this expression is intended to provide a value for, if any.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaNamedNoiseExpression = {}

---@class LuaNamedNoiseFunction: LuaPrototypeBase @Prototype of a named noise function.
---@field expression string
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaNamedNoiseFunction = {}

---@class LuaParticlePrototype: LuaPrototypeBase @Prototype of an optimized particle.
---@field ended_in_water_trigger_effect TriggerEffectItem
---@field ended_on_ground_trigger_effect TriggerEffectItem
---@field fade_out_time uint
---@field life_time uint
---@field mining_particle_frame_speed float
---@field movement_modifier float
---@field movement_modifier_when_on_ground float
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field regular_trigger_effect TriggerEffectItem
---@field regular_trigger_effect_frequency uint
---@field render_layer RenderLayer
---@field render_layer_when_on_ground RenderLayer
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field vertical_acceleration float
LuaParticlePrototype = {}

---@class LuaPermissionGroup: any @A permission group that defines what players in this group are allowed to do.
---@field group_id uint @The group ID
---@field name string @The name of this group. Setting the name to `nil` or an empty string sets the name to the default value.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field players LuaPlayer[] @The players in this group.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaPermissionGroup = {}

--- Adds the given player to this group.
---@param player PlayerIdentification
---@return boolean @Whether the player was added.
function LuaPermissionGroup.add_player(player) end

--- Whether this group allows the given action.
---@param action defines.input_action @The action in question.
---@return boolean
function LuaPermissionGroup.allows_action(action) end

--- Destroys this group.
---@return boolean @Whether the group was successfully destroyed.
function LuaPermissionGroup.destroy() end

--- Removes the given player from this group.
---@param player PlayerIdentification
---@return boolean @Whether the player was removed.
function LuaPermissionGroup.remove_player(player) end

--- Sets whether this group allows the performance the given action.
---@param action defines.input_action @The action in question.
---@param allow_action boolean @Whether to allow the specified action.
---@return boolean @Whether the value was successfully applied.
function LuaPermissionGroup.set_allows_action(action, allow_action) end

---@class LuaPermissionGroups: any @All permission groups.
---@field groups LuaPermissionGroup[] @All of the permission groups.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
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

---@class LuaPlanet: any @The runtime values of a planet
---@field name string @The planets name.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field prototype LuaSpaceLocationPrototype
---@field surface LuaSurface @The surface for this planet if one currently exists. Planets do not default generate their surface. [LuaPlanet::create_surface](runtime:LuaPlanet::create_surface) can be used to force the surface to exist. [LuaPlanet::associate_surface](runtime:LuaPlanet::associate_surface) can be used to create an association with an existing surface.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaPlanet = {}

--- Associates the given surface with this planet. Surface must not already be associated with a planet and the planet must not already have an associated surface.
--- Planet must not be using [entities_require_heating](runtime:LuaSpaceLocationPrototype::entities_require_heating).
---@param surface SurfaceIdentification @The surface to be associated.
function LuaPlanet.associate_surface(surface) end

--- Creates the associated surface if one doesn't already exist.
---@return LuaSurface
function LuaPlanet.create_surface() end

--- Resets the map gen settings on this planet to the default from-prototype state.
function LuaPlanet.reset_map_gen_settings() end

---@class LuaPlayer: LuaControl @A player in the game. Pay attention that a player may or may not have a character, which is the [LuaEntity](runtime:LuaEntity) of the little guy running around the world doing things.
---@field admin boolean @`true` if the player is an admin. Trying to change player admin status from the console when you aren't an admin does nothing.
---@field afk_time uint @How many ticks since the last action of this player.
---@field auto_sort_main_inventory boolean @If the main inventory will be auto sorted.
---@field blueprint_to_setup LuaItemStack @The item stack containing a blueprint to be setup.
---@field blueprints LuaRecord[] @Records contained in the player's blueprint library.
---@field centered_on LuaEntity @ nilable; The entity being centered on in remote view. When writing, the player will be switched to remote view (if not already in it) and centered on the given entity.
---@field character LuaEntity @ nilable; The character attached to this player, if any. Returns `nil` when the player is disconnected (see [LuaPlayer::connected](runtime:LuaPlayer::connected)).
---@field chat_color Color @The color used when this player talks in game.
---@field color Color @The color associated with the player. This will be used to tint the player's character as well as their buildings and vehicles.
---@field connected boolean @`true` if the player is currently connected to the game.
---@field controller_type defines.controllers
---@field cursor_stack_temporary boolean @Returns true if the current item stack in cursor will be destroyed after clearing the cursor. Manually putting it into inventory still preserves the item. If the cursor stack is not one of the supported types (blueprint, blueprint-book, deconstruction-planner, upgrade-planner), write operation will be silently ignored.
---@field cutscene_character LuaEntity @ nilable; When in a cutscene; the character this player would be using once the cutscene is over, if any. Returns `nil` when the player is disconnected (see [LuaPlayer::connected](runtime:LuaPlayer::connected)).
---@field display_density_scale double @The display density scale for this player. The display density scale is the factor of [LuaPlayer::display_scale](runtime:LuaPlayer::display_scale) that is determined by the physical DPI of the screen that Factorio is running on. In most cases, the default value is 1. If the player is playing on a high-density display, this value may be 2 or greater. During [on_player_created](runtime:on_player_created), this attribute will always return a scale of `1`. To get the actual scale, listen to the [on_player_display_density_scale_changed](runtime:on_player_display_density_scale_changed) event raised shortly afterwards.
---@field display_resolution DisplayResolution @The display resolution for this player. During [on_player_created](runtime:on_player_created), this attribute will always return a resolution of `{width=1920, height=1080}`. To get the actual resolution, listen to the [on_player_display_resolution_changed](runtime:on_player_display_resolution_changed) event raised shortly afterwards.
---@field display_scale double @The display scale for this player. During [on_player_created](runtime:on_player_created), this attribute will always return a scale of `1`. To get the actual scale, listen to the [on_player_display_scale_changed](runtime:on_player_display_scale_changed) event raised shortly afterwards.
---@field drag_target DragTarget @ nilable; The wire drag target for this player, if any.
---@field entity_copy_source LuaEntity @ nilable; The source entity used during entity settings copy-paste, if any.
---@field game_view_settings GameViewSettings @The player's game view settings.
---@field gui LuaGui
---@field hand_location ItemStackLocation @ nilable; The original location of the item in the cursor, marked with a hand. `nil` if the cursor stack is empty. When writing, the specified inventory slot must be empty and the cursor stack must not be empty.
---@field index uint @This player's index in [LuaGameScript::players](runtime:LuaGameScript::players) (unique ID). It is assigned when a player is created, and remains so (even when the player is not [connected](runtime:LuaPlayer::connected)) until the player is irreversibly [removed](runtime:on_player_removed). Indexes of removed players can be reused.
---@field infinity_inventory_filters InfinityInventoryFilter[] @The filters for this map editor infinity inventory settings.
---@field input_method defines.input_method @The input method of the player, mouse and keyboard or game controller
---@field last_online uint @At what tick this player was last online.
---@field locale string @The active locale for this player. During [on_player_created](runtime:on_player_created), this attribute will be `en`. To get the actual value, listen to the [on_player_locale_changed](runtime:on_player_locale_changed) event raised shortly afterwards.
---@field map_view_settings MapViewSettings @The player's map view settings. To write to this, use a table containing the fields that should be changed.
---@field minimap_enabled boolean @`true` if the minimap is visible.
---@field mod_settings table<string, ModSetting> @The current per-player settings for the this player, indexed by prototype name. Returns the same structure as [LuaSettings::get_player_settings](runtime:LuaSettings::get_player_settings). This table becomes invalid if its associated player does. Even though this attribute is marked as read-only, individual settings can be changed by overwriting their [ModSetting](runtime:ModSetting) table. Mods can only change their own settings. Using the in-game console, all player settings can be changed.
---@field name string @The player's username.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field online_time uint @How many ticks did this player spend playing this save (all sessions combined).
---@field opened_self boolean @`true` if the player opened itself. I.e. if they opened the character or god-controller GUI.
---@field permission_group LuaPermissionGroup @ nilable; The permission group this player is part of, if any.
---@field physical_position MapPosition @The current position of this players physical controller.
---@field physical_surface LuaSurface @The surface this players physical controller is on.
---@field physical_surface_index uint @Unique ID associated with the surface this players physical controller is currently on.
---@field physical_vehicle MapPosition @The current vehicle of this players physical controller.
---@field remove_unfiltered_items boolean @If items not included in this map editor infinity inventory filters should be removed.
---@field render_mode defines.render_mode @The render mode of the player, like map or zoom to world. The render mode can be set using [LuaPlayer::open_map](runtime:LuaPlayer::open_map), [LuaPlayer::zoom_to_world](runtime:LuaPlayer::zoom_to_world) and [LuaPlayer::close_map](runtime:LuaPlayer::close_map).
---@field show_on_map boolean @If `true`, circle and name of given player is rendered on the map/chart.
---@field spectator boolean @If `true`, zoom-to-world noise effect will be disabled and environmental sounds will be based on zoom-to-world view instead of position of player's character.
---@field spidertron_remote_selection LuaEntity[] @ nilable; All SpiderVehicles currently selected by the player, if they are holding a spidertron remote.
---@field stashed_controller_type defines.controllers @ nilable; The stashed controller type, if any. This is mainly useful when a player is in the map editor.
---@field tag string @The tag that is shown after the player in chat, on the map and above multiplayer selection rectangles.
---@field ticks_to_respawn uint @ nilable; The number of ticks until this player will respawn. `nil` if this player is not waiting to respawn. Set to `nil` to immediately respawn the player. Set to any positive value to trigger the respawn state for this player.
---@field undo_redo_stack LuaUndoRedoStack @The undo and redo stack for this player.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field zoom double @The player's zoom-level.
LuaPlayer = {}

--- Gets a copy of the currently selected blueprint in the clipboard queue into the player's cursor, as if the player activated Paste.
function LuaPlayer.activate_paste() end

--- Adds an alert to this player for the given entity of the given alert type.
---@param entity LuaEntity
---@param type defines.alert_type
function LuaPlayer.add_alert(entity, type) end

--- Adds a custom alert to this player.
---@param entity LuaEntity @If the alert is clicked, the map will open at the position of this entity.
---@param icon SignalID
---@param message LocalisedString
---@param show_on_map boolean
function LuaPlayer.add_custom_alert(entity, icon, message, show_on_map) end

--- Adds the given recipe to the list of recipe notifications for this player.
---@param recipe RecipeID @Recipe to add.
function LuaPlayer.add_recipe_notification(recipe) end

--- Adds the given blueprint to this player's clipboard queue.
---@param blueprint LuaItemStack @The blueprint to add.
function LuaPlayer.add_to_clipboard(blueprint) end

--- Associates a character with this player.
--- The character must not be connected to any controller.
--- If this player is currently disconnected (see [LuaPlayer::connected](runtime:LuaPlayer::connected)) the character will be immediately "logged off".
--- See [LuaPlayer::get_associated_characters](runtime:LuaPlayer::get_associated_characters) for more information.
---@param character LuaEntity @The character entity.
function LuaPlayer.associate_character(character) end

---@class LuaPlayer_build_from_cursor_params
---@field position MapPosition @Where the entity would be placed
---@field direction defines.direction|nil @Direction the entity would be placed
---@field mirror boolean|nil @Whether to mirror the entity
---@field build_mode defines.build_mode|nil @Which build mode should be used instead of normal build. Defaults to normal.
---@field terrain_building_size uint|nil @The size for building terrain if building terrain. Defaults to 2.
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.

--- Builds whatever is in the cursor on the surface the player is on. The cursor stack will automatically be reduced as if the player built normally.
---@param p LuaPlayer_build_from_cursor_params
function LuaPlayer.build_from_cursor(p) end

---@class LuaPlayer_can_build_from_cursor_params
---@field position MapPosition @Where the entity would be placed
---@field direction defines.direction|nil @Direction the entity would be placed
---@field build_mode defines.build_mode|nil @Which build mode should be used instead of normal build. Defaults to normal.
---@field terrain_building_size uint|nil @The size for building terrain if building terrain. Defaults to 2.
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.

--- Checks if this player can build what ever is in the cursor on the surface the player is on.
---@param p LuaPlayer_can_build_from_cursor_params
---@return boolean
function LuaPlayer.can_build_from_cursor(p) end

---@class LuaPlayer_can_place_entity_params
---@field name EntityID @Name of the entity to check.
---@field position MapPosition @Where the entity would be placed.
---@field direction defines.direction|nil @Direction the entity would be placed. Defaults to `north`.

--- Checks if this player can build the given entity at the given location on the surface the player is on.
---@param p LuaPlayer_can_place_entity_params
---@return boolean
function LuaPlayer.can_place_entity(p) end

--- Clear the chat console.
function LuaPlayer.clear_console() end

--- Invokes the "clear cursor" action on the player as if the user pressed it.
---@return boolean @Whether the cursor is now empty.
function LuaPlayer.clear_cursor() end

--- Clears the blinking of the inventory based on insertion of items
function LuaPlayer.clear_inventory_highlights() end

--- Clear any active flying texts for this player.
function LuaPlayer.clear_local_flying_texts() end

--- Clears all recipe notifications for this player.
function LuaPlayer.clear_recipe_notifications() end

--- Clears the players selection tool selection position.
function LuaPlayer.clear_selection() end

---@class LuaPlayer_connect_to_server_params
---@field address string @The server (address:port) if port is not given the default Factorio port is used.
---@field name LocalisedString|nil @The name of the server.
---@field description LocalisedString|nil
---@field password string|nil @The password if different from the one used to join this game. Note, if the current password is not empty but the one required to join the new server is an empty string should be given for this field.

--- Asks the player if they would like to connect to the given server.
--- This only does anything when used on a multiplayer peer. Single player and server hosts will ignore the prompt.
---@param p LuaPlayer_connect_to_server_params
function LuaPlayer.connect_to_server(p) end

--- Creates and attaches a character entity to this player.
--- The player must not have a character already connected and must be online (see [LuaPlayer::connected](runtime:LuaPlayer::connected)).
---@param character EntityWithQualityID|nil @The character to create else the default is used.
---@overload fun(): boolean
---@return boolean @Whether the character was created.
function LuaPlayer.create_character(character) end

---@class LuaPlayer_create_local_flying_text_params
---@field text LocalisedString @The flying text to show.
---@field position MapPosition|nil @The location on the map at which to show the flying text.
---@field create_at_cursor boolean|nil @If `true`, the flying text is created at the player's cursor. Defaults to `false`.
---@field color Color|nil @The color of the flying text. Defaults to white text.
---@field time_to_live uint|nil @The amount of ticks that the flying text will be shown for. Defaults to `80`.
---@field speed double|nil @The speed at which the text rises upwards in tiles/second. Can't be a negative value.

--- Spawn flying text that is only visible to this player. Either `position` or `create_at_cursor` are required. When `create_at_cursor` is `true`, all parameters other than `text` are ignored.
--- If no custom `speed` is set and the text is longer than 25 characters, its `time_to_live` and `speed` are dynamically adjusted to give players more time to read it.
--- Local flying text is not saved, which means it will disappear after a save/load-cycle.
---@param p LuaPlayer_create_local_flying_text_params
function LuaPlayer.create_local_flying_text(p) end

--- Disables alerts for the given alert category.
---@param alert_type defines.alert_type
---@return boolean @Whether the alert type was disabled (false if it was already disabled).
function LuaPlayer.disable_alert(alert_type) end

--- Disable recipe groups.
function LuaPlayer.disable_recipe_groups() end

--- Disable recipe subgroups.
function LuaPlayer.disable_recipe_subgroups() end

--- Disassociates a character from this player. This is functionally the same as setting [LuaEntity::associated_player](runtime:LuaEntity::associated_player) to `nil`.
--- See [LuaPlayer::get_associated_characters](runtime:LuaPlayer::get_associated_characters) for more information.
---@param character LuaEntity @The character entity
function LuaPlayer.disassociate_character(character) end

---@class LuaPlayer_drag_wire_params
---@field position MapPosition @Position at which cursor was clicked. Used only to decide which side of arithmetic combinator, decider combinator or power switch is to be connected. Entity itself to be connected is based on the player's selected entity.

--- Start/end wire dragging at the specified location, wire type is based on the cursor contents
---@param p LuaPlayer_drag_wire_params
---@return boolean @`true` if the action did something
function LuaPlayer.drag_wire(p) end

--- Enables alerts for the given alert category.
---@param alert_type defines.alert_type
---@return boolean @Whether the alert type was enabled (false if it was already enabled).
function LuaPlayer.enable_alert(alert_type) end

--- Enable recipe groups.
function LuaPlayer.enable_recipe_groups() end

--- Enable recipe subgroups.
function LuaPlayer.enable_recipe_subgroups() end

--- Enters the given space platform if possible.
---@param space_platform SpacePlatformIdentification
---@return boolean @If the player entered the platform.
function LuaPlayer.enter_space_platform(space_platform) end

--- Exit the current cutscene. Errors if not in a cutscene.
function LuaPlayer.exit_cutscene() end

--- Gets which quick bar page is being used for the given screen page or `nil` if not known.
---@param index uint @The screen page. Index 1 is the top row in the gui. Index can go beyond the visible number of bars on the screen to account for the interface config setting change.
---@return uint8
function LuaPlayer.get_active_quick_bar_page(index) end

---@class LuaPlayer_get_alerts_params
---@field entity LuaEntity|nil
---@field prototype LuaEntityPrototype|nil
---@field position MapPosition|nil
---@field type defines.alert_type|nil
---@field surface SurfaceIdentification|nil

--- Get all alerts matching the given filters, or all alerts if no filters are given.
---@param p LuaPlayer_get_alerts_params
---@return table<uint, table<defines.alert_type, Alert[]>> @A mapping of surface index to an array of arrays of [alerts](runtime:Alert) indexed by the [alert type](runtime:defines.alert_type).
function LuaPlayer.get_alerts(p) end

--- The characters associated with this player.
--- The array will always be empty when the player is disconnected (see [LuaPlayer::connected](runtime:LuaPlayer::connected)) regardless of there being associated characters.
--- Characters associated with this player will be logged off when this player disconnects but are not controlled by any player.
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

--- If the given alert type is currently enabled.
---@param alert_type defines.alert_type
---@return boolean
function LuaPlayer.is_alert_enabled(alert_type) end

--- If the given alert type is currently muted.
---@param alert_type defines.alert_type
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

--- Ejects this player from the current space platform and lands on the current planet.
---@return boolean @If the player successfully landed on the planet.
function LuaPlayer.land_on_planet() end

--- Ejects this player from the current space platform if in a platform. The player is left on the platform at the position of the hub.
function LuaPlayer.leave_space_platform() end

--- Mutes alerts for the given alert category.
---@param alert_type defines.alert_type
---@return boolean @Whether the alert type was muted (false if it was already muted).
function LuaPlayer.mute_alert(alert_type) end

--- Invokes the "smart pipette" action on the player as if the user pressed it.
---@param entity EntityWithQualityID
---@param allow_ghost boolean|nil @Defaults to false.
---@overload fun(entity: EntityWithQualityID): boolean
---@return boolean @Whether the smart pipette found something to place.
function LuaPlayer.pipette_entity(entity, allow_ghost) end

---@class LuaPlayer_play_sound_params
---@field path SoundPath @The sound to play.
---@field position MapPosition|nil @Where the sound should be played. If not given, it's played at the current position of the player.
---@field volume_modifier double|nil @The volume of the sound to play. Must be between 0 and 1 inclusive.
---@field override_sound_type SoundType|nil @The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.

--- Play a sound for this player.
--- The sound is not played if its location is not [charted](runtime:LuaForce::chart) for this player.
---@param p LuaPlayer_play_sound_params
function LuaPlayer.play_sound(p) end

--- Print text to the chat console.
--- By default, messages that are identical to a message sent in the last 60 ticks are not printed again.
---@param message LocalisedString
---@param print_settings PrintSettings|nil
---@overload fun(message: LocalisedString)
function LuaPlayer.print(message, print_settings) end

--- Print entity statistics to the player's console.
---@param entities EntityWithQualityID[]|nil @Entity prototypes to get statistics for. If not specified or empty, display statistics for all entities.
---@overload fun()
function LuaPlayer.print_entity_statistics(entities) end

--- Print LuaObject counts per mod.
function LuaPlayer.print_lua_object_statistics() end

--- Print construction robot job counts to the players console.
function LuaPlayer.print_robot_jobs() end

---@class LuaPlayer_remove_alert_params
---@field entity LuaEntity|nil
---@field prototype EntityID|nil
---@field position MapPosition|nil
---@field type defines.alert_type|nil
---@field surface SurfaceIdentification|nil
---@field icon SignalID|nil
---@field message LocalisedString|nil

--- Removes all alerts matching the given filters or if an empty filters table is given all alerts are removed.
---@param p LuaPlayer_remove_alert_params
function LuaPlayer.remove_alert(p) end

--- Requests a translation for the given localised string. If the request is successful, the [on_string_translated](runtime:on_string_translated) event will be fired with the results.
--- Does nothing if this player is not connected (see [LuaPlayer::connected](runtime:LuaPlayer::connected)).
---@param localised_string LocalisedString
---@return uint @The unique ID for the requested translation.
function LuaPlayer.request_translation(localised_string) end

--- Requests translation for the given set of localised strings. If the request is successful, a [on_string_translated](runtime:on_string_translated) event will be fired for each string with the results.
--- Does nothing if this player is not connected (see [LuaPlayer::connected](runtime:LuaPlayer::connected)).
---@param localised_strings LocalisedString[]
---@return uint[] @The unique IDs for the requested translations.
function LuaPlayer.request_translations(localised_strings) end

--- Sets which quick bar page is being used for the given screen page.
---@param screen_index uint @The screen page. Index 1 is the top row in the gui. Index can go beyond the visible number of bars on the screen to account for the interface config setting change.
---@param page_index uint @The new quick bar page.
function LuaPlayer.set_active_quick_bar_page(screen_index, page_index) end

---@class LuaPlayer_set_controller_params
---@field type defines.controllers @Which controller to use.
---@field character LuaEntity|nil @Entity to control. Mandatory when `type` is [defines.controllers.character](runtime:defines.controllers.character), ignored otherwise.
---@field waypoints CutsceneWaypoint|nil @List of waypoints for the cutscene controller. This parameter is mandatory when `type` is [defines.controllers.cutscene](runtime:defines.controllers.cutscene).
---@field start_position MapPosition|nil @If specified and `type` is [defines.controllers.cutscene](runtime:defines.controllers.cutscene), the cutscene will start at this position. If not given the start position will be the player position.
---@field start_zoom double|nil @If specified and `type` is [defines.controllers.cutscene](runtime:defines.controllers.cutscene), the cutscene will start at this zoom level. If not given the start zoom will be the players zoom.
---@field final_transition_time uint|nil @If specified and `type` is [defines.controllers.cutscene](runtime:defines.controllers.cutscene), it is the time in ticks it will take for the camera to pan from the final waypoint back to the starting position. If not given the camera will not pan back to the start position/zoom.
---@field chart_mode_cutoff double|nil @If specified and `type` is [defines.controllers.cutscene](runtime:defines.controllers.cutscene), the game will switch to chart-mode (map zoomed out) rendering when the zoom level is less than this value.
---@field position MapPosition|nil @If specified and `type` is [defines.controllers.remote](runtime:defines.controllers.remote), the position the remote controller will be centered on.
---@field surface SurfaceIdentification|nil @If specified and `type` is [defines.controllers.remote](runtime:defines.controllers.remote), the surface the remote controller will be put on.

--- Set the controller type of the player.
--- Setting a player to [defines.controllers.editor](runtime:defines.controllers.editor) auto promotes the player to admin and enables cheat mode. Setting a player to [defines.controllers.editor](runtime:defines.controllers.editor) also requires the calling player be an admin.
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

--- Sets the quick bar filter for the given slot. If a [LuaItemStack](runtime:LuaItemStack) is provided, the slot will be set to that particular item instance if it has extra data, for example a specific blueprint or spidertron remote. Otherwise, it will be set to all items of that prototype, for example iron plates.
---@param index uint @The slot index. 1 for the first slot of page one, 2 for slot two of page one, 11 for the first slot of page 2, etc.
---@param filter LuaItemStack | ItemWithQualityID | nil @The filter or `nil` to clear it.
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
---@param selection_mode defines.selection_mode @The type of selection to start.
function LuaPlayer.start_selection(position, selection_mode) end

--- Toggles this player into or out of the map editor. Does nothing if this player isn't an admin or if the player doesn't have permission to use the map editor.
function LuaPlayer.toggle_map_editor() end

--- Unlock the achievements of the given player. This has any effect only when this is the local player, the achievement isn't unlocked so far and the achievement is of the type "achievement".
---@param name string @name of the achievement to unlock
function LuaPlayer.unlock_achievement(name) end

--- Unmutes alerts for the given alert category.
---@param alert_type defines.alert_type
---@return boolean @Whether the alert type was unmuted (false if it was wasn't muted).
function LuaPlayer.unmute_alert(alert_type) end

--- Uses the current item in the cursor if it's a capsule or does nothing if not.
---@param position MapPosition @Where the item would be used.
function LuaPlayer.use_from_cursor(position) end

---@class LuaProcessionLayerInheritanceGroupPrototype: LuaPrototypeBase @Prototype of a procession inheritance group which synchronizes offsets between procession steps.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaProcessionLayerInheritanceGroupPrototype = {}

---@class LuaProcessionPrototype: LuaPrototypeBase @Prototype of a procession.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaProcessionPrototype = {}

---@class LuaProfiler: any @An object used to measure script performance. Since performance is non-deterministic, these objects don't allow reading the raw time values from Lua. They can be used anywhere a [LocalisedString](runtime:LocalisedString) is used, except for [LuaGuiElement::add](runtime:LuaGuiElement::add)'s LocalisedString arguments, [LuaSurface::create_entity](runtime:LuaSurface::create_entity)'s `text` argument, and [LuaEntity::add_market_item](runtime:LuaEntity::add_market_item).
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaProfiler = {}

--- Add the duration of another timer to this timer. Useful to reduce start/stop overhead when accumulating time onto many timers at once.
--- If other is running, the time to now will be added.
---@param other LuaProfiler @The timer to add to this timer.
function LuaProfiler.add(other) end

--- Divides the current duration by a set value. Useful for calculating the average of many iterations.
--- Does nothing if this isn't stopped.
---@param number double @The number to divide by. Must be > 0.
function LuaProfiler.divide(number) end

--- Resets the clock, also restarting it.
function LuaProfiler.reset() end

--- Start the clock again, without resetting it.
function LuaProfiler.restart() end

--- Stops the clock.
function LuaProfiler.stop() end

---@class LuaProgrammableSpeakerControlBehavior: LuaControlBehavior @Control behavior for programmable speakers.
---@field circuit_condition CircuitConditionDefinition
---@field circuit_parameters ProgrammableSpeakerCircuitParameters
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaProgrammableSpeakerControlBehavior = {}

---@class LuaPrototypeBase: any @Base for all prototype classes.
---@field group LuaGroup @Group of this prototype.
---@field hidden boolean
---@field hidden_in_factoriopedia boolean
---@field localised_description LocalisedString
---@field localised_name LocalisedString
---@field name string @Name of this prototype.
---@field order string @The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
---@field parameter boolean
---@field subgroup LuaGroup @Subgroup of this prototype.
---@field type string @Type of this prototype.
LuaPrototypeBase = {}

---@class LuaPrototypes: any @Provides read-only access to prototypes. It is accessible through the global object named `prototypes`.
---@field achievement table<string, LuaAchievementPrototype> @A dictionary containing every LuaAchievementPrototype indexed by `name`.
---@field active_trigger table<string, LuaActiveTriggerPrototype> @A dictionary containing every LuaActiveTriggerPrototype indexed by `name`.
---@field airborne_pollutant table<string, LuaAirbornePollutantPrototype> @A dictionary containing every LuaAirbornePollutantPrototype indexed by `name`.
---@field ammo_category table<string, LuaAmmoCategoryPrototype> @A dictionary containing every LuaAmmoCategoryPrototype indexed by `name`.
---@field asteroid_chunk table<string, LuaAsteroidChunkPrototype> @A dictionary containing every LuaAsteroidChunkPrototype indexed by `name`.
---@field autoplace_control table<string, LuaAutoplaceControlPrototype> @A dictionary containing every LuaAutoplaceControlPrototype indexed by `name`.
---@field burner_usage table<string, LuaBurnerUsagePrototype> @A dictionary containing every LuaBurnerUsagePrototype indexed by `name`.
---@field collision_layer table<string, LuaCollisionLayerPrototype> @A dictionary containing every LuaCollisionLayerPrototype indexed by `name`.
---@field custom_event table<string, LuaCustomEventPrototype> @A dictionary containing every defined custom event, indexed by `name`.
---@field custom_input table<string, LuaCustomInputPrototype> @A dictionary containing every LuaCustomInputPrototype indexed by `name`.
---@field damage table<string, LuaDamagePrototype> @A dictionary containing every LuaDamagePrototype indexed by `name`.
---@field decorative table<string, LuaDecorativePrototype> @A dictionary containing every LuaDecorativePrototype indexed by `name`.
---@field entity table<string, LuaEntityPrototype> @A dictionary containing every LuaEntityPrototype indexed by `name`.
---@field equipment table<string, LuaEquipmentPrototype> @A dictionary containing every LuaEquipmentPrototype indexed by `name`.
---@field equipment_category table<string, LuaEquipmentCategoryPrototype> @A dictionary containing every LuaEquipmentCategoryPrototype indexed by `name`.
---@field equipment_grid table<string, LuaEquipmentGridPrototype> @A dictionary containing every LuaEquipmentGridPrototype indexed by `name`.
---@field fluid table<string, LuaFluidPrototype> @A dictionary containing every LuaFluidPrototype indexed by `name`.
---@field font table<string, LuaFontPrototype> @A dictionary containing every LuaFontPrototype indexed by `name`.
---@field fuel_category table<string, LuaFuelCategoryPrototype> @A dictionary containing every LuaFuelCategoryPrototype indexed by `name`.
---@field item table<string, LuaItemPrototype> @A dictionary containing every LuaItemPrototype indexed by `name`.
---@field item_group table<string, LuaGroup> @A dictionary containing every ItemGroup indexed by `name`.
---@field item_subgroup table<string, LuaGroup> @A dictionary containing every ItemSubgroup indexed by `name`.
---@field map_gen_preset table<string, MapGenPreset> @A dictionary containing every MapGenPreset indexed by `name`. A MapGenPreset is an exact copy of the prototype table provided from the data stage.
---@field max_beacon_supply_area_distance uint
---@field max_electric_pole_connection_distance double
---@field max_electric_pole_supply_area_distance float
---@field max_force_distraction_chunk_distance uint
---@field max_force_distraction_distance double
---@field max_gate_activation_distance double
---@field max_inserter_reach_distance double
---@field max_pipe_to_ground_distance uint8
---@field max_underground_belt_distance uint8
---@field mod_setting table<string, LuaModSettingPrototype> @A dictionary containing every LuaModSettingPrototype indexed by `name`.
---@field module_category table<string, LuaModuleCategoryPrototype> @A dictionary containing every LuaModuleCategoryPrototype indexed by `name`.
---@field named_noise_expression table<string, LuaNamedNoiseExpression> @A dictionary containing every LuaNamedNoiseExpression indexed by `name`.
---@field named_noise_function table<string, LuaNamedNoiseFunction> @A dictionary containing every LuaNamedNoiseFunction indexed by `name`.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field particle table<string, LuaParticlePrototype> @A dictionary containing every LuaParticlePrototype indexed by `name`.
---@field procession table<string, LuaProcessionPrototype> @A dictionary containing every LuaProcessionPrototype indexed by `name`.
---@field procession_layer_inheritance_group table<string, LuaProcessionLayerInheritanceGroupPrototype> @A dictionary containing every LuaProcessionLayerInheritanceGroupPrototype indexed by `name`.
---@field quality table<string, LuaQualityPrototype>
---@field recipe table<string, LuaRecipePrototype> @A dictionary containing every LuaRecipePrototype indexed by `name`.
---@field recipe_category table<string, LuaRecipeCategoryPrototype> @A dictionary containing every LuaRecipeCategoryPrototype indexed by `name`.
---@field resource_category table<string, LuaResourceCategoryPrototype> @A dictionary containing every LuaResourceCategoryPrototype indexed by `name`.
---@field shortcut table<string, LuaShortcutPrototype> @A dictionary containing every LuaShortcutPrototype indexed by `name`.
---@field space_connection table<string, LuaSpaceConnectionPrototype>
---@field space_location table<string, LuaSpaceLocationPrototype>
---@field style table<string, string> @A map of styles that [LuaGuiElement](runtime:LuaGuiElement) can use. Maps from the style's name to its type, as seen on [StyleSpecification](prototype:StyleSpecification).
---@field surface table<string, LuaSurfacePrototype> @A dictionary containing every LuaSurfacePrototype indexed by `name`.
---@field surface_property table<string, LuaSurfacePropertyPrototype>
---@field technology table<string, LuaTechnologyPrototype> @A dictionary containing every [LuaTechnologyPrototype](runtime:LuaTechnologyPrototype) indexed by `name`.
---@field tile table<string, LuaTilePrototype> @A dictionary containing every LuaTilePrototype indexed by `name`.
---@field trivial_smoke table<string, LuaTrivialSmokePrototype> @A dictionary containing every LuaTrivialSmokePrototype indexed by `name`.
---@field virtual_signal table<string, LuaVirtualSignalPrototype> @A dictionary containing every LuaVirtualSignalPrototype indexed by `name`.
LuaPrototypes = {}

--- Returns a dictionary of all LuaAchievementPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters AchievementPrototypeFilter[]
---@return table<string, LuaAchievementPrototype>
function LuaPrototypes.get_achievement_filtered(filters) end

--- Returns a dictionary of all LuaDecorativePrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters DecorativePrototypeFilter[]
---@return table<string, LuaDecorativePrototype>
function LuaPrototypes.get_decorative_filtered(filters) end

--- Returns a dictionary of all LuaEntityPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters EntityPrototypeFilter[]
---@return table<string, LuaEntityPrototype>
function LuaPrototypes.get_entity_filtered(filters) end

--- Returns a dictionary of all LuaEquipmentPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters EquipmentPrototypeFilter[]
---@return table<string, LuaEquipmentPrototype>
function LuaPrototypes.get_equipment_filtered(filters) end

--- Returns a dictionary of all LuaFluidPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters FluidPrototypeFilter[]
---@return table<string, LuaFluidPrototype>
function LuaPrototypes.get_fluid_filtered(filters) end

--- Gets the prototype history for the given type and name.
---@param type string
---@param name string
---@return PrototypeHistory
function LuaPrototypes.get_history(type, name) end

--- Returns a dictionary of all LuaItemPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters ItemPrototypeFilter[]
---@return table<string, LuaItemPrototype>
function LuaPrototypes.get_item_filtered(filters) end

--- Returns a dictionary of all LuaModSettingPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters ModSettingPrototypeFilter[]
---@return table<string, LuaModSettingPrototype>
function LuaPrototypes.get_mod_setting_filtered(filters) end

--- Returns a dictionary of all LuaRecipePrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters RecipePrototypeFilter[]
---@return table<string, LuaRecipePrototype>
function LuaPrototypes.get_recipe_filtered(filters) end

--- Returns a dictionary of all LuaTechnologyPrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters TechnologyPrototypeFilter[]
---@return table<string, LuaTechnologyPrototype>
function LuaPrototypes.get_technology_filtered(filters) end

--- Returns a dictionary of all LuaTilePrototypes that fit the given filters. The prototypes are indexed by `name`.
---@param filters TilePrototypeFilter[]
---@return table<string, LuaTilePrototype>
function LuaPrototypes.get_tile_filtered(filters) end

---@class LuaPumpControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for pumps.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field set_filter boolean @`true` if the pump should set its fluid filter from the circuit network signals.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaPumpControlBehavior = {}

---@class LuaQualityPrototype: LuaPrototypeBase @Prototype of a quality.
---@field beacon_power_usage_multiplier float
---@field draw_sprite_by_default boolean
---@field level uint @Level basically specifies the stat-increasing value of this quality level
---@field mining_drill_resource_drain_multiplier float
---@field next LuaQualityPrototype @The next higher level of the quality
---@field next_probability double @The probability multiplier of getting the next level of quality
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaQualityPrototype = {}

---@class LuaRCON: any @An interface to send messages to the calling RCON interface through the global object named `rcon`.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
LuaRCON = {}

--- Print text to the calling RCON interface if any.
---@param message LocalisedString
function LuaRCON.print(message) end

---@class LuaRadarControlBehavior: LuaControlBehavior @Control behavior for radars
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRadarControlBehavior = {}

---@class LuaRailEnd: any @Utility object that binds to a rail entity and rail_direction to allow easier traversal over rails
---@field alternative_in_signal_location RailLocation @ nilable; Location of the alternative incoming signal, which goes to the right relative to the rail end movement. Not all places have alternative incoming signal spot, so when it is not available, a nil will be given instead
---@field alternative_out_signal_location RailLocation @ nilable; Location of the alternative outgoing signal, which goes to the right relative to the rail end movement. Not all places have alternative outgoing signal spot, so when it is not available, a nil will be given instead
---@field direction defines.rail_direction @Which end of the rail this RailEnd is binding to.
---@field in_signal_location RailLocation @Location of an incoming signal, which goes to the left relative to the rail end movement.
---@field location RailLocation @Location of the rail end
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field out_signal_location RailLocation @Location of an outgoing signal, which goes to the right relative to the rail end movement.
---@field rail LuaEntity @Rail to which this RailEnd is binding to.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRailEnd = {}

--- Moves to opposite end on the rail this object points to
function LuaRailEnd.flip_direction() end

--- Returns all possible rail extensions from this position as defined by the planner item.
---@param planner_item ItemID @Rail planner that defines possible rail extensions
---@return RailExtensionData[]
function LuaRailEnd.get_rail_extensions(planner_item) end

--- Creates a copy of this LuaRailEnd object.
---@return LuaRailEnd
function LuaRailEnd.make_copy() end

--- Moves forward by 1 rail to the specified connection direction
---@param connection_direction defines.rail_connection_direction
---@return boolean @If the move was successful. False if there is no rail connected in given connection_direction
function LuaRailEnd.move_forward(connection_direction) end

--- Moves forward by 1 rail in the natural direction. Natural direction is a move in the direction taken by the train over rail connection related to this rail end. If there are no trains, the natural direction is straight if straight connected rail exists, otherwise it is right if right connected rail exists, otherwise it is left if left connected rail exists. Natural direction is not defined if there are no rails connected to this end and this method will fail.
---@return boolean @If the move was successful. False only when there are no rails connected on this end
function LuaRailEnd.move_natural() end

--- Moves forward until a rail segment boundary is reached. If this rail end is at the segment boundary, it will not move at all. When a rail segment is cyclical, it will reach the rail segment boundary at some arbitrary position unless the segment boundary is well defined by presence of rail signals, train stop or other rails connecting to the rails loop.
function LuaRailEnd.move_to_segment_end() end

---@class LuaRailPath: any @A rail path.
---@field current uint @The current rail index.
---@field is_front boolean @If the path goes from the front of the train
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field rails table<uint, LuaEntity> @Array of the rails that this path travels over.
---@field size uint @The total number of rails in this path.
---@field total_distance double @The total path distance.
---@field travelled_distance double @The total distance traveled.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRailPath = {}

---@class LuaRailSignalBaseControlBehavior: LuaControlBehavior @Control behavior for rail signals and rail chain signals.
---@field blue_signal SignalID @ nilable
---@field circuit_condition CircuitConditionDefinition @The circuit condition when controlling the signal through the circuit network.
---@field close_signal boolean @If this will close the rail signal based off the circuit condition.
---@field green_signal SignalID @ nilable
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field orange_signal SignalID @ nilable
---@field read_signal boolean @If this will read the rail signal state.
---@field red_signal SignalID @ nilable
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRailSignalBaseControlBehavior = {}

---@class LuaRandomGenerator: any @A deterministic random generator independent from the core games random generator that can be seeded and re-seeded at will. This random generator can be saved and loaded and will maintain its state. Note this is entirely different from calling [math.random](libraries.html)() and you should be sure you actually want to use this over calling `math.random()`. If you aren't sure if you need to use this over calling `math.random()` then you probably don't need to use this.
---@overload fun(lower: int|nil, upper: int|nil): double
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRandomGenerator = {}

--- Re-seeds the random generator with the given value.
--- Seeds that are close together will produce similar results. Seeds from 0 to 341 will produce the same results.
---@param seed uint
function LuaRandomGenerator.re_seed(seed) end

---@class LuaReactorControlBehavior: LuaControlBehavior @Control behavior for Reactor
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_fuel boolean @If this will read fuel inventory and currently burning fuel
---@field read_temperature boolean @If this will read temperature of the reactor
---@field temperature_signal SignalID @ nilable
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaReactorControlBehavior = {}

---@class LuaRecipe: any @A crafting recipe. Recipes belong to forces (see [LuaForce](runtime:LuaForce)) because some recipes are unlocked by research, and researches are per-force.
---@field category string @Category of the recipe.
---@field enabled boolean @Can the recipe be used?
---@field energy double @Energy required to execute this recipe. This directly affects the crafting time: Recipe's energy is exactly its crafting time in seconds, when crafted in an assembling machine with crafting speed exactly equal to one.
---@field force LuaForce @The force that owns this recipe.
---@field group LuaGroup @Group of this recipe.
---@field hidden boolean @Is the recipe hidden? Hidden recipes don't show up in the crafting menu.
---@field hidden_from_flow_stats boolean @Is the recipe hidden from flow statistics?
---@field ingredients Ingredient[] @The ingredients to this recipe.
---@field localised_description LocalisedString
---@field localised_name LocalisedString @Localised name of the recipe.
---@field name string @Name of the recipe. This can be different than the name of the result items as there could be more recipes to make the same item.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field order string @The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
---@field productivity_bonus float @The productivity bonus for this recipe.
---@field products Product[] @The results/products of this recipe.
---@field prototype LuaRecipePrototype @The prototype for this recipe.
---@field subgroup LuaGroup @Subgroup of this recipe.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRecipe = {}

--- Reload the recipe from the prototype.
function LuaRecipe.reload() end

---@class LuaRecipeCategoryPrototype: LuaPrototypeBase @Prototype of a recipe category.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRecipeCategoryPrototype = {}

---@class LuaRecipePrototype: LuaPrototypeBase @A crafting recipe prototype.
---@field allow_as_intermediate boolean @If this recipe is enabled for the purpose of intermediate hand-crafting.
---@field allow_decomposition boolean @Is this recipe allowed to be broken down for the recipe tooltip "Total raw" calculations?
---@field allow_inserter_overload boolean @If the recipe is allowed to have the extra inserter overload bonus applied (4 * stack inserter stack size).
---@field allow_intermediates boolean @If this recipe is allowed to use intermediate recipes when hand-crafting.
---@field allowed_effects table<string, boolean> @ nilable; The allowed module effects for this recipe, if any.
---@field allowed_module_categories table<string, true> @ nilable; The allowed module categories for this recipe, if any.
---@field alternative_unlock_methods LuaTechnologyPrototype[] @ nilable; Alternative technologies that can unlocked this recipe.
---@field always_show_made_in boolean @Should this recipe always show "Made in" in the tooltip?
---@field always_show_products boolean @If the products are always shown in the recipe tooltip.
---@field category string @Category of the recipe.
---@field crafting_machine_tints Color[]
---@field effect_limitation_messages LocalisedString[] @ nilable
---@field emissions_multiplier double @The emissions multiplier for this recipe.
---@field enabled boolean @If this recipe prototype is enabled by default (enabled at the beginning of a game).
---@field energy double @Energy required to execute this recipe. This directly affects the crafting time: Recipe's energy is exactly its crafting time in seconds, when crafted in an assembling machine with crafting speed exactly equal to one.
---@field hidden_from_flow_stats boolean @Is the recipe hidden from flow statistics (item/fluid production statistics)?
---@field hidden_from_player_crafting boolean @Is the recipe hidden from player crafting? The recipe will still show up for selection in machines.
---@field hide_from_flow_stats boolean
---@field hide_from_player_crafting boolean
---@field hide_from_signal_gui boolean @Is this recipe is marked to be hidden from the signal GUI.
---@field ingredients Ingredient[] @The ingredients to this recipe.
---@field is_parameter boolean
---@field main_product Product @ nilable; The main product of this recipe, if any.
---@field maximum_productivity double @The maximal productivity bonus that can be achieved with this recipe.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field overload_multiplier uint @Used to determine how many extra items are put into an assembling machine before it's considered "full enough".
---@field preserve_products_in_machine_output boolean
---@field products Product[] @The results/products of this recipe.
---@field request_paste_multiplier uint @The multiplier used when this recipe is copied from an assembling machine to a requester chest. For each item in the recipe the item count * this value is set in the requester chest.
---@field show_amount_in_title boolean @If the amount is shown in the recipe tooltip title when the recipe produces more than 1 product.
---@field surface_conditions SurfaceCondition[] @ nilable; The surface conditions required to craft this recipe.
---@field trash LuaItemPrototype[] @ nilable; The 'trash' items that this recipe might produce as a result of spoiling.
---@field unlock_results boolean @Is this recipe unlocks the result item(s) so they're shown in filter-select GUIs.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRecipePrototype = {}

---@class LuaRecord: any @A reference to a record in the blueprint library. Records in the "my blueprints" shelf are read-only, but records in the "game blueprints" shelf are read/write.
---@field blueprint_absolute_snapping boolean @If absolute snapping is enabled on this blueprint.
---@field blueprint_position_relative_to_grid TilePosition @ nilable; The offset from the absolute grid. `nil` if absolute snapping is not enabled.
---@field blueprint_snap_to_grid TilePosition @ nilable; The snapping grid size in this blueprint. `nil` if snapping is not enabled.
---@field contents LuaRecord[] @The contents of this BlueprintBookRecord.
---@field cost_to_build ItemCountWithQuality[] @List of raw materials required to build this blueprint.
---@field default_icons BlueprintSignalIcon[] @The default icons for a blueprint blueprint.
---@field entity_filter_count uint @The number of entity filters this deconstruction planner supports.
---@field entity_filter_mode defines.deconstruction_item.entity_filter_mode @The blacklist/whitelist entity filter mode for this deconstruction planner,.
---@field entity_filters string[] @The entity filters for this deconstruction planner. The attribute is a sparse array with the keys representing the index of the filter. All strings in this array must be entity prototype names that don't have the `"not-deconstructable"` flag set and are either a `cliff` or marked as `minable`.
---@field is_blueprint_preview boolean @Is this blueprint record a preview? A preview record must be synced by the player before entity and tile data can be read.
---@field mapper_count uint @The current count of mappers in the upgrade item.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field tile_filter_count uint @The number of tile filters this deconstruction planner supports.
---@field tile_filter_mode defines.deconstruction_item.tile_filter_mode @The blacklist/whitelist tile filter mode for this deconstruction planner,.
---@field tile_filters TileID[] @The tile filters for this deconstruction planner,. The attribute is a sparse array with the keys representing the index of the filter. Reading filters always returns an array of strings which are the tile prototype names.
---@field tile_selection_mode defines.deconstruction_item.tile_selection_mode @The tile selection mode for this deconstruction planner,.
---@field trees_and_rocks_only boolean @If this deconstruction planner, is set to allow trees and rocks only.
---@field type "blueprint" | "blueprint-book" | "deconstruction-planner" | "upgrade-planner" @The type of this blueprint record.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field valid_for_write boolean @Is this record valid for writing? A record is invalid for write if it is a BlueprintRecord preview or if it is in the "My blueprints" shelf.
LuaRecord = {}

---@class LuaRecord_build_blueprint_params
---@field surface SurfaceIdentification @Surface to build on
---@field force ForceID @Force to use for the building
---@field position MapPosition @The position to build at
---@field direction defines.direction|nil @The direction to use when building
---@field build_mode defines.build_mode|nil @If `normal`, blueprint will not be built if any one thing can't be built. If `forced`, anything that can be built is built and obstructing nature entities will be deconstructed. If `superforced`, all obstructions will be deconstructed and the blueprint will be built.
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
---@field by_player PlayerIdentification|nil @The player to use if any. If provided [defines.events.on_built_entity](runtime:defines.events.on_built_entity) will also be fired on successful entity creation.
---@field raise_built boolean|nil @If true; [defines.events.script_raised_built](runtime:defines.events.script_raised_built) will be fired on successful entity creation. Note: this is ignored if by_player is provided.

--- Build this blueprint at the given location.
--- Built entities can be come invalid between the building of the blueprint and the function returning if by_player or raise_built is used and one of those events invalidates the entity.
---@param p LuaRecord_build_blueprint_params
---@return LuaEntity[] @Array of created ghosts
function LuaRecord.build_blueprint(p) end

---@class LuaRecord_cancel_deconstruct_area_params
---@field surface SurfaceIdentification @Surface to cancel deconstruct on
---@field force ForceID @Force to use for canceling deconstruction
---@field area BoundingBox @The area to deconstruct
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped. Defaults to `false`.
---@field by_player PlayerIdentification|nil @The player to use if any.
---@field super_forced boolean|nil @If the cancel deconstruction is super-forced. Defaults to `false`.

--- Cancel deconstruct the given area with this deconstruction planner,.
---@param p LuaRecord_cancel_deconstruct_area_params
function LuaRecord.cancel_deconstruct_area(p) end

--- Clears this blueprint.
function LuaRecord.clear_blueprint() end

--- Clears all settings/filters on this deconstruction planner, resetting it to default values.
function LuaRecord.clear_deconstruction_data() end

--- Clears all settings/filters on this upgrade planner, resetting it to default values.
function LuaRecord.clear_upgrade_data() end

---@class LuaRecord_create_blueprint_params
---@field surface SurfaceIdentification @Surface to create from
---@field force ForceID @Force to use for the creation
---@field area BoundingBox @The bounding box
---@field always_include_tiles boolean|nil @When true, blueprintable tiles are always included in the blueprint. When false they're only included if no entities exist in the setup area.
---@field include_entities boolean|nil @When true, entities are included in the blueprint. Defaults to true.
---@field include_modules boolean|nil @When true, modules are included in the blueprint. Defaults to true.
---@field include_station_names boolean|nil @When true, station names are included in the blueprint. Defaults to false.
---@field include_trains boolean|nil @When true, trains are included in the blueprint. Defaults to false.
---@field include_fuel boolean|nil @When true, train fuel is included in the blueprint, Defaults to true.

--- Sets up this blueprint using the found blueprintable entities/tiles on the surface.
---@param p LuaRecord_create_blueprint_params
---@return table<uint, LuaEntity> @The blueprint entity index to source entity mapping.
function LuaRecord.create_blueprint(p) end

---@class LuaRecord_deconstruct_area_params
---@field surface SurfaceIdentification @Surface to deconstruct on
---@field force ForceID @Force to use for the deconstruction
---@field area BoundingBox @The area to deconstruct
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped. Defaults to `false`.
---@field by_player PlayerIdentification|nil @The player to use if any.
---@field super_forced boolean|nil @If the deconstruction is super-forced. Defaults to `false`.

--- Deconstruct the given area with this deconstruction planner,.
---@param p LuaRecord_deconstruct_area_params
function LuaRecord.deconstruct_area(p) end

--- The entities in this blueprint.
---@return BlueprintEntity[]
function LuaRecord.get_blueprint_entities() end

--- Gets the number of entities in this blueprint blueprint.
---@return uint
function LuaRecord.get_blueprint_entity_count() end

--- Gets the given tag on the given blueprint entity index in this blueprint blueprint.
---@param index uint @The entity index.
---@param tag string @The tag to get.
---@return AnyBasic
function LuaRecord.get_blueprint_entity_tag(index, tag) end

--- Gets the tags for the given blueprint entity index in this blueprint.
---@param index uint
---@return Tags
function LuaRecord.get_blueprint_entity_tags(index) end

--- A list of the tiles in this blueprint.
---@return Tile[]
function LuaRecord.get_blueprint_tiles() end

--- Gets the entity filter at the given index for this deconstruction planner,.
---@param index uint
---@return string
function LuaRecord.get_entity_filter(index) end

--- Gets the filter at the given index for this upgrade item.
--- In contrast to [LuaRecord::set_mapper](runtime:LuaRecord::set_mapper), indices past the upgrade item's current size are considered to be out of bounds.
---@param index uint @The index of the mapper to read.
---@param type string @`"from"` or `"to"`.
---@return UpgradeMapperSource | UpgradeMapperDestination
function LuaRecord.get_mapper(index, type) end

--- Gets the tile filter at the given index for this deconstruction planner,.
---@param index uint
---@return string
function LuaRecord.get_tile_filter(index) end

--- Is this blueprint setup? I.e. is it a non-empty blueprint?
---@return boolean
function LuaRecord.is_blueprint_setup() end

--- Set new entities to be a part of this blueprint.
---@param entities BlueprintEntity[] @The new blueprint entities.
function LuaRecord.set_blueprint_entities(entities) end

--- Sets the given tag on the given blueprint entity index in this blueprint blueprint.
---@param index uint @The entity index.
---@param tag string @The tag to set.
---@param value AnyBasic @The tag value to set or `nil` to clear the tag.
function LuaRecord.set_blueprint_entity_tag(index, tag, value) end

--- Sets the tags on the given blueprint entity index in this blueprint.
---@param index uint @The entity index
---@param tags Tags
function LuaRecord.set_blueprint_entity_tags(index, tags) end

--- Set specific tiles in this blueprint.
---@param tiles Tile[] @Tiles to be a part of the blueprint.
function LuaRecord.set_blueprint_tiles(tiles) end

--- Sets the entity filter at the given index for this deconstruction planner,.
---@param index uint
---@param filter string | LuaEntityPrototype | LuaEntity | nil @Writing `nil` removes the filter.
---@return boolean @Whether the new filter was successfully set (ie. was valid).
function LuaRecord.set_entity_filter(index, filter) end

--- Sets the module filter at the given index for this upgrade item.
--- In contrast to [LuaRecord::get_mapper](runtime:LuaRecord::get_mapper), indices past the upgrade item's current size are valid and expand the list of mappings accordingly, if within reasonable bounds.
---@param index uint @The index of the mapper to set.
---@param type string @`"from"` or `"to"`.
---@param mapper UpgradeMapperSource | UpgradeMapperDestination @The mapper to set or `nil`
function LuaRecord.set_mapper(index, type, mapper) end

--- Sets the tile filter at the given index for this deconstruction planner,.
---@param index uint
---@param filter string | LuaTilePrototype | LuaTile @Setting to nil erases the filter.
---@return boolean @Whether the new filter was successfully set (ie. was valid).
function LuaRecord.set_tile_filter(index, filter) end

---@class LuaRemote: any @Registry of interfaces between scripts. An interface is simply a dictionary mapping names to functions. A script or mod can then register an interface with [LuaRemote](runtime:LuaRemote), after that any script can call the registered functions, provided it knows the interface name and the desired function name. An instance of LuaRemote is available through the global object named `remote`.
---@field interfaces table<string, table<string, true>> @List of all registered interfaces. For each interface name, `remote.interfaces[name]` is a dictionary mapping the interface's registered functions to `true`.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
LuaRemote = {}

--- Add a remote interface.
---@param name string @Name of the interface. If the name matches any existing interface, an error is thrown.
---@param functions table<string, fun()> @List of functions that are members of the new interface.
function LuaRemote.add_interface(name, functions) end

--- Call a function of an interface.
--- Providing an unknown interface or function name will result in a script error.
---@param interface string @Interface to look up `function` in.
---@param func string @Function name that belongs to the `interface`.
---@return Any
function LuaRemote.call(interface, func) end

--- Removes an interface with the given name.
---@param name string @Name of the interface.
---@return boolean @Whether the interface was removed. `false` if the interface didn't exist.
function LuaRemote.remove_interface(name) end

---@class LuaRenderObject: any @Reference to a single LuaRendering object.
---@field alignment TextAlign @Alignment of this text.
---@field angle float @Angle of this arc. Angle in radian.
---@field animation string @Animation prototype name of this animation.
---@field animation_offset double @Animation offset of this animation. Animation offset in frames.
---@field animation_speed double @Animation speed of this animation. Animation speed in frames per tick.
---@field color Color @Color or tint of the object.
---@field dash_length double @Dash length of this line.
---@field draw_on_ground boolean @If this object is being drawn on the ground, under most entities and sprites.
---@field filled boolean @If this circle or rectangle is filled.
---@field font string @Font of this text.
---@field forces LuaForce[] | ForceSet @ nilable; Forces for which this object is rendered or `nil` if visible to all forces. Writing nil or empty array will make object to be visible to all forces.
---@field from ScriptRenderTarget @Where this line is drawn from.
---@field gap_length double @Length of the gaps in this line.
---@field id uint64 @Unique identifier of this render object.
---@field intensity float @Intensity of this light.
---@field left_top ScriptRenderTarget @Where top left corner of this rectangle is drawn.
---@field max_radius double @Radius of the outer edge of this arc.
---@field min_radius double @Radius of the inner edge of this arc.
---@field minimum_darkness float @Minimum darkness at which this light is rendered.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field only_in_alt_mode boolean @If this object is only rendered in alt-mode.
---@field orientation RealOrientation @Orientation of this object. Polygon vertices that are set to an entity will ignore this.
---@field orientation_target ScriptRenderTarget @ nilable; Target to which this object rotates so that it faces the target. Note that `orientation` is still applied to the object. Writing `nil` will clear the orientation_target. `nil` if no target. Polygon vertices that are set to an entity will ignore this.
---@field oriented boolean @If this light is rendered with the same orientation as the target entity. Note that `orientation` is still applied to the sprite.
---@field oriented_offset Vector @Offsets the center of the sprite or animation if `orientation_target` is given. This offset will rotate together with the sprite or animation.
---@field players LuaPlayer[] | PlayerIdentification[] @ nilable; Players for which this object is visible or `nil` if visible to all players.
---@field radius double @Radius of this circle.
---@field render_layer RenderLayer @Render layer of this sprite or animation.
---@field right_bottom ScriptRenderTarget @Where bottom right corner of this rectangle is drawn.
---@field scale double @Scale of the text or light.
---@field scale_with_zoom boolean @If this text scales with player zoom.
---@field sprite SpritePath @Sprite of the sprite or light.
---@field start_angle float @Where this arc starts. Angle in radian.
---@field surface LuaSurface @Surface this object is rendered on.
---@field target ScriptRenderTarget @Where this object is drawn. Polygon vertices that are set to an entity will ignore this.
---@field text LocalisedString @Text that is displayed by this text object.
---@field time_to_live uint @Time to live of this object. This will be 0 if the object does not expire.
---@field to ScriptRenderTarget @Where this line is drawn to.
---@field type "text" | "line" | "circle" | "rectangle" | "arc" | "polygon" | "sprite" | "light" | "animation" @Type of this object.
---@field use_rich_text boolean @If this text parses rich text tags.
---@field use_target_orientation boolean @If this object uses the target orientation.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field vertical_alignment VerticalTextAlign @Vertical alignment of this text.
---@field vertices ScriptRenderTarget[] @Vertices of this polygon.
---@field visible boolean @If this object is rendered to anyone at all.
---@field width float @Width of the object. Value is in pixels (32 per tile).
---@field x_scale double @Horizontal scale of this sprite or animation.
---@field y_scale double @Vertical scale of this sprite or animation.
LuaRenderObject = {}

--- Reorder this object so that it is drawn in front of the already existing objects.
function LuaRenderObject.bring_to_front() end

--- Destroys this object. Does not error when the object is invalid.
function LuaRenderObject.destroy() end

--- Reorder this object so that it is drawn in the back of the already existing objects.
function LuaRenderObject.move_to_back() end

--- Set the corners of the rectangle with this id.
---@param left_top ScriptRenderTarget
---@param right_bottom ScriptRenderTarget
function LuaRenderObject.set_corners(left_top, right_bottom) end

--- Set the length of the dashes and the length of the gaps in this line.
---@param dash_length double
---@param gap_length double
function LuaRenderObject.set_dashes(dash_length, gap_length) end

---@class LuaRendering: any @Allows rendering of geometric shapes, text and sprites in the game world through the global object named `rendering`. Each render object is identified by an id that is universally unique for the lifetime of a whole game. If an entity target of an object is destroyed or changes surface, then the object is also destroyed.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
LuaRendering = {}

--- Destroys all render objects.
---@param mod_name string|nil @If provided, only the render objects created by this mod are destroyed. An empty string (`""`) refers to all objects not belonging to a mod, such as those created using console commands.
---@overload fun()
function LuaRendering.clear(mod_name) end

---@class LuaRendering_draw_animation_params
---@field animation string @Name of an [AnimationPrototype](prototype:AnimationPrototype).
---@field orientation RealOrientation|nil @The orientation of the animation. Default is 0.
---@field x_scale double|nil @Horizontal scale of the animation. Default is 1.
---@field y_scale double|nil @Vertical scale of the animation. Default is 1.
---@field tint Color|nil
---@field render_layer RenderLayer|nil @Render layer of the animation. Defaults to `"arrow"`.
---@field animation_speed double|nil @How many frames the animation goes forward per tick. Default is 1.
---@field animation_offset double|nil @Offset of the animation in frames. Default is 0.
---@field orientation_target ScriptRenderTarget|nil @If given, the animation rotates so that it faces this target. Note that `orientation` is still applied to the animation.
---@field use_target_orientation boolean|nil @Only used if `orientation_target` is a LuaEntity.
---@field oriented_offset Vector|nil @Offsets the center of the animation if `orientation_target` is given. This offset will rotate together with the animation.
---@field target ScriptRenderTarget @Center of the animation.
---@field surface SurfaceIdentification
---@field time_to_live uint|nil @In ticks. Defaults to living forever.
---@field forces ForceSet|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create an animation.
---@param p LuaRendering_draw_animation_params
---@return LuaRenderObject
function LuaRendering.draw_animation(p) end

---@class LuaRendering_draw_arc_params
---@field color Color
---@field max_radius double @The radius of the outer edge of the arc, in tiles.
---@field min_radius double @The radius of the inner edge of the arc, in tiles.
---@field start_angle float @Where the arc starts, in radian.
---@field angle float @The angle of the arc, in radian.
---@field target ScriptRenderTarget
---@field surface SurfaceIdentification
---@field time_to_live uint|nil @In ticks. Defaults to living forever.
---@field forces ForceSet|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities. Defaults to false.
---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create an arc.
---@param p LuaRendering_draw_arc_params
---@return LuaRenderObject
function LuaRendering.draw_arc(p) end

---@class LuaRendering_draw_circle_params
---@field color Color
---@field radius double @In tiles.
---@field width float|nil @Width of the outline, used only if filled = false. Value is in pixels (32 per tile). Defaults to 1.
---@field filled boolean|nil @If the circle should be filled. Defaults to false.
---@field target ScriptRenderTarget
---@field surface SurfaceIdentification
---@field time_to_live uint|nil @In ticks. Defaults to living forever.
---@field forces ForceSet|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities. Defaults to false.
---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a circle.
---@param p LuaRendering_draw_circle_params
---@return LuaRenderObject
function LuaRendering.draw_circle(p) end

---@class LuaRendering_draw_light_params
---@field sprite SpritePath
---@field orientation RealOrientation|nil @The orientation of the light. Default is 0.
---@field scale float|nil @Default is 1.
---@field intensity float|nil @Default is 1.
---@field minimum_darkness float|nil @The minimum darkness at which this light is rendered. Default is 0.
---@field oriented boolean|nil @If this light has the same orientation as the entity target, default is false. Note that `orientation` is still applied to the sprite.
---@field color Color|nil @Defaults to white (no tint).
---@field target ScriptRenderTarget @Center of the light.
---@field surface SurfaceIdentification
---@field time_to_live uint|nil @In ticks. Defaults to living forever.
---@field forces ForceSet|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a light.
--- The base game uses the utility sprites `light_medium` and `light_small` for lights.
---@param p LuaRendering_draw_light_params
---@return LuaRenderObject
function LuaRendering.draw_light(p) end

---@class LuaRendering_draw_line_params
---@field color Color
---@field width float @In pixels (32 per tile).
---@field gap_length double|nil @Length of the gaps that this line has, in tiles. Default is 0.
---@field dash_length double|nil @Length of the dashes that this line has. Used only if gap_length > 0. Default is 0.
---@field dash_offset double|nil @Starting offset to apply to dashes. Cannot be greater than dash_length + gap_length. Default is 0.
---@field from ScriptRenderTarget
---@field to ScriptRenderTarget
---@field surface SurfaceIdentification
---@field time_to_live uint|nil @In ticks. Defaults to living forever.
---@field forces ForceSet|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities. Defaults to false.
---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a line.
---@param p LuaRendering_draw_line_params
---@return LuaRenderObject
function LuaRendering.draw_line(p) end

---@class LuaRendering_draw_polygon_params
---@field color Color
---@field vertices ScriptRenderTarget[]
---@field target ScriptRenderTarget|nil @Acts like an offset applied to all vertices that are not set to an entity.
---@field orientation RealOrientation|nil @The orientation applied to all vertices. Default is 0.
---@field orientation_target ScriptRenderTarget|nil @If given, the vertices (that are not set to an entity) rotate so that it faces this target. Note that `orientation` is still applied.
---@field use_target_orientation boolean|nil @Only used if `orientation_target` is a LuaEntity.
---@field surface SurfaceIdentification
---@field time_to_live uint|nil @In ticks. Defaults to living forever.
---@field forces ForceSet|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities. Defaults to false.
---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a triangle mesh defined by a triangle strip.
---@param p LuaRendering_draw_polygon_params
---@return LuaRenderObject
function LuaRendering.draw_polygon(p) end

---@class LuaRendering_draw_rectangle_params
---@field color Color
---@field width float|nil @Width of the outline, used only if filled = false. Value is in pixels (32 per tile). Defaults to 1.
---@field filled boolean|nil @If the rectangle should be filled. Defaults to false.
---@field left_top ScriptRenderTarget
---@field right_bottom ScriptRenderTarget
---@field surface SurfaceIdentification
---@field time_to_live uint|nil @In ticks. Defaults to living forever.
---@field forces ForceSet|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities. Defaults to false.
---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a rectangle.
---@param p LuaRendering_draw_rectangle_params
---@return LuaRenderObject
function LuaRendering.draw_rectangle(p) end

---@class LuaRendering_draw_sprite_params
---@field sprite SpritePath
---@field orientation RealOrientation|nil @The orientation of the sprite. Default is 0.
---@field x_scale double|nil @Horizontal scale of the sprite. Default is 1.
---@field y_scale double|nil @Vertical scale of the sprite. Default is 1.
---@field tint Color|nil
---@field render_layer RenderLayer|nil @Render layer of the sprite. Defaults to `"arrow"`.
---@field orientation_target ScriptRenderTarget|nil @If given, the sprite rotates so that it faces this target. Note that `orientation` is still applied to the sprite.
---@field use_target_orientation boolean|nil @Only used if `orientation_target` is a LuaEntity.
---@field oriented_offset Vector|nil @Offsets the center of the sprite if `orientation_target` is given. This offset will rotate together with the sprite.
---@field target ScriptRenderTarget @Center of the sprite.
---@field surface SurfaceIdentification
---@field time_to_live uint|nil @In ticks. Defaults to living forever.
---@field forces ForceSet|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.

--- Create a sprite.
---@param p LuaRendering_draw_sprite_params
---@return LuaRenderObject
function LuaRendering.draw_sprite(p) end

---@class LuaRendering_draw_text_params
---@field text LocalisedString @The text to display.
---@field surface SurfaceIdentification
---@field target ScriptRenderTarget
---@field color Color
---@field scale double|nil
---@field font string|nil @Name of font to use. Defaults to the same font as flying-text.
---@field time_to_live uint|nil @In ticks. Defaults to living forever.
---@field forces ForceSet|nil @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@field players PlayerIdentification[]|nil @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@field visible boolean|nil @If this is rendered to anyone at all. Defaults to true.
---@field draw_on_ground boolean|nil @If this should be drawn below sprites and entities. Rich text does not support this option. Defaults to false.
---@field orientation RealOrientation|nil @The orientation of the text. Default is 0.
---@field alignment TextAlign|nil @Defaults to "left".
---@field vertical_alignment VerticalTextAlign|nil @Defaults to "top".
---@field scale_with_zoom boolean|nil @Defaults to false. If true, the text scales with player zoom, resulting in it always being the same size on screen, and the size compared to the game world changes.
---@field only_in_alt_mode boolean|nil @If this should only be rendered in alt mode. Defaults to false.
---@field use_rich_text boolean|nil @If rich text rendering is enabled. Defaults to false.

--- Create a text.
--- Not all fonts support scaling.
---@param p LuaRendering_draw_text_params
---@return LuaRenderObject
function LuaRendering.draw_text(p) end

--- Gets an array of all valid objects.
---@param mod_name string|nil @If provided, get only the render objects created by this mod. An empty string (`""`) refers to all objects not belonging to a mod, such as those created using console commands.
---@overload fun(): LuaRenderObject[]
---@return LuaRenderObject[]
function LuaRendering.get_all_objects(mod_name) end

--- Gives LuaRenderObject for given object ID. May return nil if object does not exist or is invalid.
---@param object_id uint64
---@return LuaRenderObject
function LuaRendering.get_object_by_id(object_id) end

---@class LuaResourceCategoryPrototype: LuaPrototypeBase @Prototype of a resource category.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaResourceCategoryPrototype = {}

---@class LuaRoboportControlBehavior: LuaControlBehavior @Control behavior for roboports.
---@field available_construction_output_signal SignalID @ nilable
---@field available_logistic_output_signal SignalID @ nilable
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_items_mode defines.control_behavior.roboport.read_items_mode @Selects contents that are to be read from the roboport
---@field read_logistics boolean @Legacy field, please use LuaRoboportControlBehavior::read_items_mode instead. `true` if the roboport should report the logistics network content to the circuit network.
---@field read_robot_stats boolean @`true` if the roboport should report the robot statistics to the circuit network.
---@field roboport_count_output_signal SignalID @ nilable
---@field total_construction_output_signal SignalID @ nilable
---@field total_logistic_output_signal SignalID @ nilable
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRoboportControlBehavior = {}

---@class LuaRocketSiloControlBehavior: LuaControlBehavior @Control behavior for rocket silos.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_mode defines.control_behavior.rocket_silo.read_mode @The items read mode for the rocket silo.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaRocketSiloControlBehavior = {}

---@class LuaSelectorCombinatorControlBehavior: LuaCombinatorControlBehavior @Control behavior for selector combinators.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field parameters SelectorCombinatorParameters @The selector combinator parameters. `parameters` may be `nil` in order to clear the parameters.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaSelectorCombinatorControlBehavior = {}

---@class LuaSettings: any @Object containing mod settings of three distinct types: `startup`, `global`, and `player`. An instance of LuaSettings is available through the global object named `settings`.
---@field global table<string, ModSetting> @The current global mod settings, indexed by prototype name. Even though this attribute is marked as read-only, individual settings can be changed by overwriting their [ModSetting](runtime:ModSetting) table. Mods can only change their own settings. Using the in-game console, all player settings can be changed.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field player_default table<string, ModSetting> @The **default** player mod settings for this map, indexed by prototype name. Changing these settings only affects the default settings for future players joining the game. Individual settings can be changed by overwriting their [ModSetting](runtime:ModSetting) table. Mods can only change their own settings. Using the in-game console, all player settings can be changed.
---@field startup table<string, ModSetting> @The startup mod settings, indexed by prototype name.
LuaSettings = {}

--- Gets the current per-player settings for the given player, indexed by prototype name. Returns the same structure as [LuaPlayer::mod_settings](runtime:LuaPlayer::mod_settings). This table becomes invalid if its associated player does.
--- Even though this attribute is a getter, individual settings can be changed by overwriting their [ModSetting](runtime:ModSetting) table. Mods can only change their own settings. Using the in-game console, all player settings can be changed.
---@param player PlayerIdentification
---@return table<string, ModSetting>
function LuaSettings.get_player_settings(player) end

---@class LuaShortcutPrototype: LuaPrototypeBase @Prototype of a shortcut.
---@field action string
---@field associated_control_input string @ nilable; The control input that is associated with this shortcut, if any.
---@field item_to_spawn LuaItemPrototype @ nilable; The item to create when this shortcut is used, if any.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field technology_to_unlock LuaTechnologyPrototype @ nilable; The technology that needs to be researched once (in any save) for this shortcut to be unlocked (in all saves).
---@field toggleable boolean
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaShortcutPrototype = {}

---@class LuaSimulation: any @Functions for use during simulations. This object cannot be saved, and cannot be used outside of a simulation. The simulation object instance can be obtained from [LuaGameScript::simulation](runtime:LuaGameScript::simulation).
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaSimulation = {}

---@class LuaSpaceConnectionPrototype: LuaPrototypeBase @Prototype of a space connection.
---@field asteroid_spawn_definitions SpaceConnectionAsteroidSpawnDefinition[] @ nilable
---@field from LuaSpaceLocationPrototype
---@field length uint
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field to LuaSpaceLocationPrototype
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaSpaceConnectionPrototype = {}

---@class LuaSpaceLocationPrototype: LuaPrototypeBase @Prototype of a space location, such as a planet.
---@field asteroid_spawn_definitions SpaceLocationAsteroidSpawnDefinition[] @ nilable
---@field asteroid_spawn_influence double
---@field entities_require_heating boolean @ nilable
---@field map_gen_settings MapGenSettings @ nilable
---@field map_seed_offset uint @ nilable
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field player_effects TriggerItem[] @ nilable
---@field pollutant_type LuaAirbornePollutantPrototype @ nilable
---@field position MapPosition
---@field solar_power_in_space double
---@field surface_properties table<string, double> @ nilable; A mapping of the surface property name to the value.
---@field ticks_between_player_effects uint @ nilable
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaSpaceLocationPrototype = {}

---@class LuaSpacePlatform: any @A space platform.
---@field damaged_tiles {position: TilePosition, damage: float}[] @The damaged tiles on this platform.
---@field force LuaForce @The force of this space platform.
---@field hub LuaEntity @ nilable; The hub on this platform. `nil` if the platform has not had the starter pack applied or hub was destroyed but the platform not yet deleted. If the hub is destroyed the platform will be deleted at the end of the tick but is otherwise valid to use until that point.
---@field index uint @The unique index of this space platform.
---@field name string @The name of this space platform.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field schedule PlatformSchedule @ nilable; This platform's current schedule, if any. Set to `nil` to clear. The schedule can't be changed by modifying the returned table. Instead, changes must be made by assigning a new table to this attribute.
---@field scheduled_for_deletion uint @If this platform is scheduled for deletion. Returns how many ticks are left before the platform will be deleted. 0 if not scheduled for deletion.
---@field space_location LuaSpaceLocationPrototype @The space location this space platform is stopped at or `nil`.
---@field speed double
---@field starter_pack LuaItemPrototype @The starter pack used to create this space platform.
---@field state defines.space_platform_state @The current state of this space platform.
---@field surface LuaSurface @The surface that belongs to this platform (if it has been created yet).
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field weight uint @The total weight of the platform.
LuaSpacePlatform = {}

--- Applies the starter pack for this platform if it hasn't already been applied.
---@return LuaEntity @The platform hub.
function LuaSpacePlatform.apply_starter_pack() end

--- Cancels deletion of this space platform if it was scheduled for deletion.
function LuaSpacePlatform.cancel_deletion() end

--- Creates the given asteroid chunks on this platform.
---@param asteroid_chunks AsteroidChunk[]
function LuaSpacePlatform.create_asteroid_chunks(asteroid_chunks) end

---@class LuaSpacePlatform_damage_tile_params
---@field position TilePosition
---@field damage float
---@field cause LuaEntity|nil

--- Damages the given tile if it exists, the chunk is generated, and it is a platform foundation tile.
---@param p LuaSpacePlatform_damage_tile_params
function LuaSpacePlatform.damage_tile(p) end

--- Schedules this space platform for deletion.
---@param ticks uint|nil @The number of ticks from now when this platform will be deleted.
---@overload fun()
function LuaSpacePlatform.destroy(ticks) end

---@class LuaSpacePlatform_destroy_asteroid_chunks_params
---@field area BoundingBox|nil
---@field position MapPosition|nil
---@field name (AsteroidChunkID | AsteroidChunkID[])|nil
---@field limit uint|nil
---@field invert boolean|nil @If the filters should be inverted.

--- Destroys all asteroid chunks from the given area. If no area and no position are given, then the entire surface is searched.
---@param p LuaSpacePlatform_destroy_asteroid_chunks_params
function LuaSpacePlatform.destroy_asteroid_chunks(p) end

---@class LuaSpacePlatform_find_asteroid_chunks_filtered_params
---@field area BoundingBox|nil
---@field position MapPosition|nil
---@field name (AsteroidChunkID | AsteroidChunkID[])|nil
---@field limit uint|nil
---@field invert boolean|nil @If the filters should be inverted.

--- Find asteroid chunks of a given name in a given area.
--- If no filters are given, returns all asteroid chunks in the search area. If multiple filters are specified, returns only asteroid chunks matching every given filter. If no area and no position are given, the entire surface is searched.
---@param p LuaSpacePlatform_find_asteroid_chunks_filtered_params
---@return AsteroidChunk[]
function LuaSpacePlatform.find_asteroid_chunks_filtered(p) end

--- Repairs the given tile if it's damaged.
---@param position TilePosition
---@param amount float|nil
---@overload fun(position: TilePosition)
function LuaSpacePlatform.repair_tile(position, amount) end

---@class LuaSpacePlatformHubControlBehavior: LuaControlBehavior @Control behavior for space platform hubs
---@field damage_taken_signal SignalID @ nilable; Signal to be transmitted with platform's damage taken value.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_contents boolean @`true` if this hub is sending its content to a circuit network
---@field read_damage_taken boolean @Whether damage taken by the space platform is sent to circuit network.
---@field read_moving_from boolean @Whether current connection "from" end is sent to circuit network.
---@field read_moving_to boolean @Whether current connection "to" end is sent to circuit network.
---@field read_speed boolean @Whether current speed of space platform is sent to circuit network.
---@field send_to_platform boolean @Whether the signals are used for circuit conditions in the platform's schedule
---@field speed_signal SignalID @ nilable; Signal to be transmitted with platform's current speed.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaSpacePlatformHubControlBehavior = {}

---@class LuaStorageTankControlBehavior: LuaControlBehavior @Control behavior for storage tanks.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_contents boolean @If the storage tank content is sent to circuit network
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaStorageTankControlBehavior = {}

---@class LuaStyle: any @Style of a GUI element. All of the attributes listed here may be `nil` if not available for a particular GUI element.
---@field badge_font string
---@field badge_horizontal_spacing int
---@field bar_width uint
---@field bottom_cell_padding int @Space between the table cell contents bottom and border.
---@field bottom_margin int
---@field bottom_padding int
---@field cell_padding int @Space between the table cell contents and border. Sets top/right/bottom/left cell paddings to this value.
---@field clicked_font_color Color
---@field clicked_vertical_offset int
---@field color Color
---@field column_alignments table<uint, Alignment> @Array containing the alignment for every column of this table element. Even though this property is marked as read-only, the alignment can be changed by indexing the LuaCustomTable, like so:
---@field default_badge_font_color Color
---@field disabled_badge_font_color Color
---@field disabled_font_color Color
---@field draw_grayscale_picture boolean
---@field extra_bottom_margin_when_activated int
---@field extra_bottom_padding_when_activated int
---@field extra_left_margin_when_activated int
---@field extra_left_padding_when_activated int
---@field extra_margin_when_activated int | int[] @Sets `extra_top/right/bottom/left_margin_when_activated` to this value. An array with two values sets top/bottom margin to the first value and left/right margin to the second value. An array with four values sets top, right, bottom, left margin respectively.
---@field extra_padding_when_activated int | int[] @Sets `extra_top/right/bottom/left_padding_when_activated` to this value. An array with two values sets top/bottom padding to the first value and left/right padding to the second value. An array with four values sets top, right, bottom, left padding respectively.
---@field extra_right_margin_when_activated int
---@field extra_right_padding_when_activated int
---@field extra_top_margin_when_activated int
---@field extra_top_padding_when_activated int
---@field font string
---@field font_color Color
---@field gui LuaGui @Gui of the [LuaGuiElement](runtime:LuaGuiElement) of this style.
---@field height int @Sets both minimal and maximal height to the given value.
---@field horizontal_align "left" | "center" | "right" @ nilable; Horizontal align of the inner content of the widget, if any.
---@field horizontal_spacing int @Horizontal space between individual cells.
---@field horizontally_squashable boolean @ nilable; Whether the GUI element can be squashed (by maximal width of some parent element) horizontally. `nil` if this element does not support squashing. This is mainly meant to be used for scroll-pane. The default value is false.
---@field horizontally_stretchable boolean @ nilable; Whether the GUI element stretches its size horizontally to other elements. `nil` if this element does not support stretching.
---@field hovered_font_color Color
---@field left_cell_padding int @Space between the table cell contents left and border.
---@field left_margin int
---@field left_padding int
---@field margin int | int[] @Sets top/right/bottom/left margins to this value. An array with two values sets top/bottom margin to the first value and left/right margin to the second value. An array with four values sets top, right, bottom, left margin respectively.
---@field maximal_height int @Maximal height ensures, that the widget will never be bigger than than that size. It can't be stretched to be bigger.
---@field maximal_width int @Maximal width ensures, that the widget will never be bigger than than that size. It can't be stretched to be bigger.
---@field minimal_height int @Minimal height ensures, that the widget will never be smaller than than that size. It can't be squashed to be smaller.
---@field minimal_width int @Minimal width ensures, that the widget will never be smaller than than that size. It can't be squashed to be smaller.
---@field name string @Name of this style.
---@field natural_height int @Natural height specifies the height of the element tries to have, but it can still be squashed/stretched to have a smaller or bigger size.
---@field natural_width int @Natural width specifies the width of the element tries to have, but it can still be squashed/stretched to have a smaller or bigger size.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field padding int | int[] @Sets top/right/bottom/left paddings to this value. An array with two values sets top/bottom padding to the first value and left/right padding to the second value. An array with four values sets top, right, bottom, left padding respectively.
---@field pie_progress_color Color
---@field rich_text_setting defines.rich_text_setting @How this GUI element handles rich text.
---@field right_cell_padding int @Space between the table cell contents right and border.
---@field right_margin int
---@field right_padding int
---@field selected_badge_font_color Color
---@field selected_clicked_font_color Color
---@field selected_font_color Color
---@field selected_hovered_font_color Color
---@field single_line boolean
---@field size int | int[] @Sets both width and height to the given value. Also accepts an array with two values, setting width to the first and height to the second one.
---@field stretch_image_to_widget_size boolean
---@field strikethrough_color Color
---@field top_cell_padding int @Space between the table cell contents top and border.
---@field top_margin int
---@field top_padding int
---@field use_header_filler boolean
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field vertical_align "top" | "center" | "bottom" @ nilable; Vertical align of the inner content of the widget, if any.
---@field vertical_spacing int @Vertical space between individual cells.
---@field vertically_squashable boolean @ nilable; Whether the GUI element can be squashed (by maximal height of some parent element) vertically. `nil` if this element does not support squashing. This is mainly meant to be used for scroll-pane. The default (parent) value for scroll pane is true, false otherwise.
---@field vertically_stretchable boolean @ nilable; Whether the GUI element stretches its size vertically to other elements. `nil` if this element does not support stretching.
---@field width int @Sets both minimal and maximal width to the given value.
LuaStyle = {}

---@class LuaSurface: any @A "domain" of the world. Surfaces can only be created and deleted through the API. Surfaces are uniquely identified by their name. Every game contains at least the surface "nauvis".
---@field always_day boolean @When set to true, the sun will always shine.
---@field brightness_visual_weights ColorModifier @Defines how surface daytime brightness influences each color channel of the current color lookup table (LUT). The LUT is multiplied by `((1 - weight) + brightness * weight)` and result is clamped to range `[0, 1]`. Default is `{0, 0, 0}`, which means no influence.
---@field darkness float @Amount of darkness at the current time, as a number in range `[0, 1]`.
---@field dawn double @The daytime when dawn starts.
---@field daytime double @Current time of day, as a number in range `[0, 1)`.
---@field deletable boolean @If this surface can be deleted.
---@field dusk double @The daytime when dusk starts.
---@field evening double @The daytime when evening starts.
---@field freeze_daytime boolean @True if daytime is currently frozen.
---@field generate_with_lab_tiles boolean @When set to true, new chunks will be generated with lab tiles, instead of using the surface's map generation settings.
---@field global_effect ModuleEffects @ nilable; Surface-wide effects applied to entities with effect receivers. May be `nil` if surface is not using surface-wide effect source.
---@field has_global_electric_network boolean @Whether this surface currently has a global electric network.
---@field index uint @This surface's index in [LuaGameScript::surfaces](runtime:LuaGameScript::surfaces) (unique ID). It is assigned when a surface is created, and remains so until it is [deleted](runtime:on_surface_deleted). Indexes of deleted surfaces can be reused.
---@field localised_name LocalisedString @ nilable; Localised name of this surface. When set, will replace the internal surface name in places where a player sees surface name. Value may be ignored if a surface has a SpacePlatform or Planet object attached to it, which take the precedence.
---@field map_gen_settings MapGenSettings @The generation settings for this surface. These can be modified after surface generation, but note that this will not retroactively update the surface. To manually regenerate it, [LuaSurface::regenerate_entity](runtime:LuaSurface::regenerate_entity), [LuaSurface::regenerate_decorative](runtime:LuaSurface::regenerate_decorative), and [LuaSurface::delete_chunk](runtime:LuaSurface::delete_chunk) can be used.
---@field min_brightness double @The minimal brightness during the night. Defaults to `0.15`. This has an effect on both rendering and game mechanics such as biter spawns and solar power.
---@field morning double @The daytime when morning starts.
---@field name string @The name of this surface. Names are unique among surfaces. The default surface can't be renamed.
---@field no_enemies_mode boolean @Is no-enemies mode enabled on this surface?
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field peaceful_mode boolean @Is peaceful mode enabled on this surface?
---@field planet LuaPlanet @ nilable; The planet associated with this surface, if there is one. Use [LuaPlanet::associate_surface](runtime:LuaPlanet::associate_surface) to create a new association with a planet.
---@field platform LuaSpacePlatform @ nilable
---@field pollutant_type LuaAirbornePollutantPrototype @ nilable; The type of pollutant enabled on the surface, or `nil` if no pollutant is enabled.
---@field show_clouds boolean @If clouds are shown on this surface. If false, clouds are never shown. If true the player must also have clouds enabled in graphics settings for them to be shown.
---@field solar_power_multiplier double @The multiplier of solar power on this surface. Cannot be less than 0.
---@field ticks_per_day uint @The number of ticks per day for this surface.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field wind_orientation RealOrientation @Current wind direction.
---@field wind_orientation_change double @Change in wind orientation per tick.
---@field wind_speed double @Current wind speed in tiles per tick.
LuaSurface = {}

--- Adds the given script area.
---@param area ScriptArea
---@return uint @The id of the created area.
function LuaSurface.add_script_area(area) end

--- Adds the given script position.
---@param position ScriptPosition
---@return uint @The id of the created position.
function LuaSurface.add_script_position(position) end

--- Sets the given area to the checkerboard lab tiles.
---@param area BoundingBox @The tile area.
function LuaSurface.build_checkerboard(area) end

--- Send a group to build a new base.
--- The specified force must be AI-controlled; i.e. `force.ai_controllable` must be `true`.
---@param position MapPosition @Location of the new base.
---@param unit_count uint @Number of biters to send for the base-building task.
---@param force ForceID|nil @Force the new base will belong to. Defaults to enemy.
---@overload fun(position: MapPosition, unit_count: uint)
function LuaSurface.build_enemy_base(position, unit_count, force) end

--- Calculate values for a list of tile properties at a list of positions. Requests for unrecognized properties will be ignored, so this can also be used to test whether those properties exist.
---@param property_names string[] @Names of properties (`"elevation"`, etc) to calculate.
---@param positions MapPosition[] @Positions for which to calculate property values.
---@return table<string, double[]> @Table of property value lists, keyed by property name.
function LuaSurface.calculate_tile_properties(property_names, positions) end

---@class LuaSurface_can_fast_replace_params
---@field name string @Name of the entity to check.
---@field position MapPosition @Where the entity would be placed.
---@field direction defines.direction|nil @Direction the entity would be placed. Defaults to `north`.
---@field force ForceID|nil @The force that would place the entity. Defaults to the `"neutral"` force.

--- If there exists an entity at the given location that can be fast-replaced with the given entity parameters.
---@param p LuaSurface_can_fast_replace_params
---@return boolean
function LuaSurface.can_fast_replace(p) end

---@class LuaSurface_can_place_entity_params
---@field name string @Name of the entity prototype to check.
---@field position MapPosition @Where the entity would be placed.
---@field direction defines.direction|nil @Direction of the placed entity. Defaults to `north`.
---@field force ForceID|nil @The force that would place the entity. Defaults to the `"neutral"` force.
---@field build_check_type defines.build_check_type|nil @Which type of check should be carried out. Defaults to `ghost_revive`.
---@field forced boolean|nil @If `true`, entities that can be marked for deconstruction are ignored. Only used if `build_check_type` is either `manual_ghost`, `script_ghost` or `blueprint_ghost`. Defaults to `false`.
---@field inner_name string|nil @The prototype name of the entity contained in the ghost. Only used if `name` is `entity-ghost`.

--- Check for collisions with terrain or other entities.
---@param p LuaSurface_can_place_entity_params
---@return boolean
function LuaSurface.can_place_entity(p) end

---@class LuaSurface_cancel_deconstruct_area_params
---@field area BoundingBox @The area to cancel deconstruction orders in.
---@field force ForceID @The force whose deconstruction orders to cancel.
---@field player PlayerIdentification|nil @The player to set the last_user to, if any. Also the player whose undo queue this action should be added to.
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped. Defaults to `false`.
---@field item LuaItemStack|nil @The deconstruction item to use if any.
---@field item_index uint|nil @The index of the undo item to add this action to. An index of `0` creates a new undo item for it. Defaults to putting it into the appropriate undo item automatically if not specified.
---@field super_forced boolean|nil @If the cancel deconstruction is super-forced. Defaults to `false`.

--- Cancel a deconstruction order.
---@param p LuaSurface_cancel_deconstruct_area_params
function LuaSurface.cancel_deconstruct_area(p) end

---@class LuaSurface_cancel_upgrade_area_params
---@field area BoundingBox @The area to cancel upgrade orders in.
---@field force ForceID @The force whose upgrade orders to cancel.
---@field player PlayerIdentification|nil @The player to set the last_user to if any.
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
---@field item LuaItemStack @The upgrade item to use.

--- Cancel a upgrade order.
---@param p LuaSurface_cancel_upgrade_area_params
function LuaSurface.cancel_upgrade_area(p) end

--- Clears this surface deleting all entities and chunks on it.
---@param ignore_characters boolean|nil @Whether characters on this surface that are connected to or associated with players should be ignored (not destroyed). Defaults to `false`.
---@overload fun()
function LuaSurface.clear(ignore_characters) end

--- Completely removes hidden and double hidden tiles data on this surface.
function LuaSurface.clear_hidden_tiles() end

--- Clears all pollution on this surface.
function LuaSurface.clear_pollution() end

---@class LuaSurface_clone_area_params
---@field source_area BoundingBox
---@field destination_area BoundingBox
---@field destination_surface SurfaceIdentification|nil
---@field destination_force ForceID|nil
---@field clone_tiles boolean|nil @If tiles should be cloned
---@field clone_entities boolean|nil @If entities should be cloned
---@field clone_decoratives boolean|nil @If decoratives should be cloned
---@field clear_destination_entities boolean|nil @If the destination entities should be cleared
---@field clear_destination_decoratives boolean|nil @If the destination decoratives should be cleared
---@field expand_map boolean|nil @If the destination surface should be expanded when destination_area is outside current bounds. Defaults to `false`.
---@field create_build_effect_smoke boolean|nil @If true, the building effect smoke will be shown around the new entities. Defaults to `false`.

--- Clones the given area.
--- Entities are cloned in an order such that they can always be created, eg rails before trains.
---@param p LuaSurface_clone_area_params
function LuaSurface.clone_area(p) end

---@class LuaSurface_clone_brush_params
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
---@field expand_map boolean|nil @If the destination surface should be expanded when destination_area is outside current bounds. Defaults to `false`.
---@field manual_collision_mode boolean|nil @If manual-style collision checks should be done.
---@field create_build_effect_smoke boolean|nil @If true, the building effect smoke will be shown around the new entities.

--- Clones the given area.
--- [defines.events.on_entity_cloned](runtime:defines.events.on_entity_cloned) is raised for each entity, and then [defines.events.on_area_cloned](runtime:defines.events.on_area_cloned) is raised.
--- Entities are cloned in an order such that they can always be created, eg rails before trains.
---@param p LuaSurface_clone_brush_params
function LuaSurface.clone_brush(p) end

---@class LuaSurface_clone_entities_params
---@field entities LuaEntity[]
---@field destination_offset Vector
---@field destination_surface SurfaceIdentification|nil
---@field destination_force ForceID|nil
---@field snap_to_grid boolean|nil
---@field create_build_effect_smoke boolean|nil @If true, the building effect smoke will be shown around the new entities.

--- Clones the given entities.
--- Entities are cloned in an order such that they can always be created, eg rails before trains.
---@param p LuaSurface_clone_entities_params
function LuaSurface.clone_entities(p) end

--- Count entities of given type or name in a given area. Works just like [LuaSurface::find_entities_filtered](runtime:LuaSurface::find_entities_filtered), except this only returns the count. As it doesn't construct all the wrapper objects, this is more efficient if one is only interested in the number of entities.
--- - If no `area` or `position` are given, the entire surface is searched.
--- - If `position` is given, this returns the entities colliding with that position (i.e the given position is within the entity's collision box).
--- - If `position` and `radius` are given, this returns entities in the radius of the position.
--- - If `area` is specified, this returns entities colliding with that area.
---@param filter EntitySearchFilters
---@return uint
function LuaSurface.count_entities_filtered(filter) end

--- Count tiles of a given name in a given area. Works just like [LuaSurface::find_tiles_filtered](runtime:LuaSurface::find_tiles_filtered), except this only returns the count. As it doesn't construct all the wrapper objects, this is more efficient if one is only interested in the number of tiles.
--- If no `area` or `position` and `radius` is given, the entire surface is searched. If `position` and `radius` are given, only tiles within the radius of the position are included.
---@param filter TileSearchFilters
---@return uint
function LuaSurface.count_tiles_filtered(filter) end

---@class LuaSurface_create_decoratives_params
---@field check_collision boolean|nil @If collision should be checked against entities/tiles.
---@field decoratives Decorative[]

--- Adds the given decoratives to the surface.
--- This will merge decoratives of the same type that already exist effectively increasing the "amount" field.
---@param p LuaSurface_create_decoratives_params
function LuaSurface.create_decoratives(p) end

---@class LuaSurface_create_entity_params
---@field name EntityID @The entity prototype name to create.
---@field position MapPosition @Where to create the entity.
---@field direction defines.direction|nil @Desired orientation of the entity after creation.
---@field quality QualityID|nil @Quality of the entity to be created. Defaults to `normal`.
---@field force ForceID|nil @Force of the entity, default is enemy.
---@field target (LuaEntity | MapPosition)|nil @Entity with health for the new entity to target.
---@field source (LuaEntity | MapPosition)|nil @Source entity. Used for beams, projectiles, and highlight-boxes.
---@field cause (LuaEntity | ForceID)|nil @Cause entity / force. The entity or force that triggered the chain of events that led to this entity being created. Used for beams, projectiles, stickers, etc. so that the damage receiver can know which entity or force to retaliate against.
---@field snap_to_grid boolean|nil @If false the exact position given is used to instead of snapping to the normal entity grid. This only applies if the entity normally snaps to the grid.
---@field fast_replace boolean|nil @If true, building will attempt to simulate fast-replace building. Defaults to `false`.
---@field item_index uint|nil @The index of the undo item to add this action to. An index of `0` creates a new undo item for it. Defaults to putting it into the appropriate undo item automatically if not specified.
---@field player PlayerIdentification|nil @If given set the last_user to this player. If fast_replace is true simulate fast replace using this player. Also the player whose undo queue this action should be added to.
---@field character LuaEntity|nil @If fast_replace is true simulate fast replace using this character.
---@field spill boolean|nil @If false while fast_replace is true and player is nil any items from fast-replacing will be deleted instead of dropped on the ground. Defaults to `true`.
---@field raise_built boolean|nil @If true; [defines.events.script_raised_built](runtime:defines.events.script_raised_built) will be fired on successful entity creation. Defaults to `false`.
---@field create_build_effect_smoke boolean|nil @If false, the building effect smoke will not be shown around the new entity. Defaults to `true`.
---@field spawn_decorations boolean|nil @If true, entity types that have [spawn_decoration](runtime:LuaEntityPrototype::spawn_decorations) property will apply triggers defined in the property. Defaults to `false`.
---@field move_stuck_players boolean|nil @If true, any characters that are in the way of the entity are teleported out of the way.
---@field item LuaItemStack|nil @If provided, the entity will attempt to pull stored values from this item (for example; creating a spidertron from a previously named and mined spidertron)
---@field preserve_ghosts_and_corpses boolean|nil @If true, colliding ghosts and corpses will not be removed by the creation of some entity types. Defaults to `false`.

--- Create an entity on this surface.
---@param p LuaSurface_create_entity_params
---@return LuaEntity @The created entity or `nil` if the creation failed.
function LuaSurface.create_entity(p) end

--- Creates a global electric network for this surface, if one doesn't exist already.
function LuaSurface.create_global_electric_network() end

---@class LuaSurface_create_particle_params
---@field name ParticleID @The particle name.
---@field position MapPosition @Where to create the particle.
---@field movement Vector
---@field height float
---@field vertical_speed float
---@field frame_speed float

--- Creates a particle at the given location
---@param p LuaSurface_create_particle_params
function LuaSurface.create_particle(p) end

---@class LuaSurface_create_trivial_smoke_params
---@field name TrivialSmokeID @The smoke prototype name to create.
---@field position MapPosition @Where to create the smoke.

---@param p LuaSurface_create_trivial_smoke_params
function LuaSurface.create_trivial_smoke(p) end

---@class LuaSurface_create_unit_group_params
---@field position MapPosition @Initial position of the new unit group.
---@field force ForceID|nil @Force of the new unit group. Defaults to `"enemy"`.

--- Create a new unit group at a given position.
---@param p LuaSurface_create_unit_group_params
---@return LuaCommandable
function LuaSurface.create_unit_group(p) end

---@class LuaSurface_deconstruct_area_params
---@field area BoundingBox @The area to mark for deconstruction.
---@field force ForceID @The force whose bots should perform the deconstruction.
---@field player PlayerIdentification|nil @The player to set the last_user to if any.
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped. Defaults to `false`.
---@field item LuaItemStack|nil @The deconstruction item to use if any.
---@field super_forced boolean|nil @If the deconstruction is super-forced. Defaults to `false`.

--- Place a deconstruction request.
---@param p LuaSurface_deconstruct_area_params
function LuaSurface.deconstruct_area(p) end

--- Whether the given decorative prototype collides at the given position and direction.
---@param prototype DecorativeID @The decorative prototype to check.
---@param position MapPosition @The position to check.
---@return boolean
function LuaSurface.decorative_prototype_collides(prototype, position) end

---@param position ChunkPosition @The chunk position to delete
function LuaSurface.delete_chunk(position) end

---@class LuaSurface_destroy_decoratives_params
---@field area BoundingBox|nil
---@field position TilePosition|nil
---@field name (DecorativeID | DecorativeID[])|nil
---@field collision_mask (CollisionLayerID | CollisionLayerID[] | (table<CollisionLayerID, true>))|nil
---@field from_layer string|nil
---@field to_layer string|nil
---@field exclude_soft boolean|nil @Soft decoratives can be drawn over rails.
---@field limit uint|nil
---@field invert boolean|nil @If the filters should be inverted.

--- Removes all decoratives from the given area. If no area and no position are given, then the entire surface is searched.
---@param p LuaSurface_destroy_decoratives_params
function LuaSurface.destroy_decoratives(p) end

--- Destroys the global electric network for this surface, if it exists.
function LuaSurface.destroy_global_electric_network() end

--- Sets the given script area to the new values.
---@param id uint @The area to edit.
---@param area ScriptArea
function LuaSurface.edit_script_area(id, area) end

--- Sets the given script position to the new values.
---@param id uint @The position to edit.
---@param position ScriptPosition
function LuaSurface.edit_script_position(id, position) end

--- Whether the given entity prototype collides at the given position and direction.
---@param prototype EntityID @The entity prototype to check.
---@param position MapPosition @The position to check.
---@param use_map_generation_bounding_box boolean @If the map generation bounding box should be used instead of the collision bounding box.
---@param direction defines.direction|nil
---@overload fun(prototype: EntityID, position: MapPosition, use_map_generation_bounding_box: boolean): boolean
---@return boolean
function LuaSurface.entity_prototype_collides(prototype, position, use_map_generation_bounding_box, direction) end

---@class LuaSurface_execute_lightning_params
---@field name EntityID
---@field position MapPosition

--- Creates lightning. If other entities which can be lightning targets are nearby, the final position will be adjusted.
---@param p LuaSurface_execute_lightning_params
function LuaSurface.execute_lightning(p) end

--- Find the logistic network with a cell closest to a given position.
---@param position MapPosition
---@param force ForceID @Force the logistic network should belong to.
---@return LuaLogisticNetwork @The found network or `nil` if no such network was found.
function LuaSurface.find_closest_logistic_network_by_position(position, force) end

---@class LuaSurface_find_decoratives_filtered_params
---@field area BoundingBox|nil
---@field position TilePosition|nil
---@field name (DecorativeID | DecorativeID[])|nil
---@field collision_mask (CollisionLayerID | CollisionLayerID[] | (table<CollisionLayerID, true>))|nil
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
--- This is more efficient than [LuaSurface::find_entities](runtime:LuaSurface::find_entities).
---@param center MapPosition @Center of the search area
---@param radius double @Radius of the circular search area
---@param force ForceID|nil @Force to find enemies of. If not given, uses the player force.
---@overload fun(center: MapPosition, radius: double): LuaEntity[]
---@return LuaEntity[]
function LuaSurface.find_enemy_units(center, radius, force) end

--- Find entities in a given area.
--- If no area is given all entities on the surface are returned.
---@param area BoundingBox|nil
---@overload fun(): LuaEntity[]
---@return LuaEntity[]
function LuaSurface.find_entities(area) end

--- Find all entities of the given type or name in the given area.
--- If no filters (`name`, `type`, `force`, etc.) are given, this returns all entities in the search area. If multiple filters are specified, only entities matching all given filters are returned.
--- - If no `area` or `position` are given, the entire surface is searched.
--- - If `position` is given, this returns the entities colliding with that position (i.e the given position is within the entity's collision box).
--- - If `position` and `radius` are given, this returns the entities within the radius of the position. Looks for the center of entities.
--- - If `area` is specified, this returns the entities colliding with that area.
---@param filter EntitySearchFilters
---@return LuaEntity[]
function LuaSurface.find_entities_filtered(filter) end

--- Find an entity of the given name at the given position. This checks both the exact position and the bounding box of the entity.
---@param entity EntityWithQualityID @Name of the entity to look for.
---@param position MapPosition @Coordinates to look at.
---@return LuaEntity @`nil` if no such entity is found.
function LuaSurface.find_entity(entity, position) end

--- Find the logistic network that covers a given position.
---@param position MapPosition
---@param force ForceID @Force the logistic network should belong to.
---@return LuaLogisticNetwork @The found network or `nil` if no such network was found.
function LuaSurface.find_logistic_network_by_position(position, force) end

--- Finds all of the logistics networks whose construction area intersects with the given position.
---@param position MapPosition
---@param force ForceID @Force the logistic networks should belong to.
---@return LuaLogisticNetwork[]
function LuaSurface.find_logistic_networks_by_construction_area(position, force) end

---@class LuaSurface_find_nearest_enemy_params
---@field position MapPosition @Center of the search area.
---@field max_distance double @Radius of the circular search area.
---@field force ForceID|nil @The force the result will be an enemy of. Uses the player force if not specified.

--- Find the enemy military target ([military entity](https://wiki.factorio.com/Military_units_and_structures)) closest to the given position.
---@param p LuaSurface_find_nearest_enemy_params
---@return LuaEntity @The nearest enemy military target or `nil` if no enemy could be found within the given area.
function LuaSurface.find_nearest_enemy(p) end

---@class LuaSurface_find_nearest_enemy_entity_with_owner_params
---@field position MapPosition @Center of the search area.
---@field max_distance double @Radius of the circular search area.
---@field force ForceID|nil @The force the result will be an enemy of. Uses the player force if not specified.

--- Find the enemy entity-with-owner closest to the given position.
---@param p LuaSurface_find_nearest_enemy_entity_with_owner_params
---@return LuaEntity @The nearest enemy entity-with-owner or `nil` if no enemy could be found within the given area.
function LuaSurface.find_nearest_enemy_entity_with_owner(p) end

--- Find a non-colliding position within a given radius.
--- Special care needs to be taken when using a radius of `0`. The game will not stop searching until it finds a suitable position, so it is important to make sure such a position exists. One particular case where it would not be able to find a solution is running it before any chunks have been generated.
---@param name EntityID @Prototype name of the entity to find a position for. (The bounding box for the collision checking is taken from this prototype.)
---@param center MapPosition @Center of the search area.
---@param radius double @Max distance from `center` to search in. A radius of `0` means an infinitely-large search area.
---@param precision double @The step length from the given position as it searches, in tiles. Minimum value is `0.01`.
---@param force_to_tile_center boolean|nil @Will only check tile centers. This can be useful when your intent is to place a building at the resulting position, as they must generally be placed at tile centers. Defaults to `false`.
---@overload fun(name: EntityID, center: MapPosition, radius: double, precision: double): MapPosition
---@return MapPosition @The non-colliding position. May be `nil` if no suitable position was found.
function LuaSurface.find_non_colliding_position(name, center, radius, precision, force_to_tile_center) end

--- Find a non-colliding position within a given rectangle.
---@param name EntityID @Prototype name of the entity to find a position for. (The bounding box for the collision checking is taken from this prototype.)
---@param search_space BoundingBox @The rectangle to search inside.
---@param precision double @The step length from the given position as it searches, in tiles. Minimum value is 0.01.
---@param force_to_tile_center boolean|nil @Will only check tile centers. This can be useful when your intent is to place a building at the resulting position, as they must generally be placed at tile centers. Defaults to `false`.
---@overload fun(name: EntityID, search_space: BoundingBox, precision: double): MapPosition
---@return MapPosition @The non-colliding position. May be `nil` if no suitable position was found.
function LuaSurface.find_non_colliding_position_in_box(name, search_space, precision, force_to_tile_center) end

--- Find all tiles of the given name in the given area.
--- If no filters are given, this returns all tiles in the search area.
--- If no `area` or `position` and `radius` is given, the entire surface is searched. If `position` and `radius` are given, only tiles within the radius of the position are included.
---@param filter TileSearchFilters
---@return LuaTile[]
function LuaSurface.find_tiles_filtered(filter) end

---@class LuaSurface_find_units_params
---@field area BoundingBox @Box to find units within.
---@field force ForceID @Force performing the search.
---@field condition ForceCondition @Only forces which meet the condition will be included in the search.

--- Find units (entities with type "unit") of a given force and force condition within a given area.
--- This is more efficient than [LuaSurface::find_entities](runtime:LuaSurface::find_entities).
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
---@param entities LuaEntity[] @The Entities to check.
---@return LuaEntity
function LuaSurface.get_closest(position, entities) end

--- Gets all tiles of the given types that are connected horizontally or vertically to the given tile position including the given tile position.
--- This won't find tiles in non-generated chunks.
---@param position TilePosition @The tile position to start at.
---@param tiles TileID[] @The tiles to search for.
---@param include_diagonal boolean|nil @Include tiles that are connected diagonally.
---@param area BoundingBox|nil @The area to find connected tiles in. If provided the start position must be in this area.
---@overload fun(position: TilePosition, tiles: TileID[], include_diagonal: boolean|nil): TilePosition[]
---@overload fun(position: TilePosition, tiles: TileID[]): TilePosition[]
---@return TilePosition[] @The resulting set of tiles.
function LuaSurface.get_connected_tiles(position, tiles, include_diagonal, area) end

--- The double hidden tile name or `nil` if there isn't one for the given position.
---@param position TilePosition @The tile position.
---@return string
function LuaSurface.get_double_hidden_tile(position) end

--- Returns all the military targets (entities with force) on this chunk for the given force.
---@param position ChunkPosition @The chunk's position.
---@param force ForceID @Entities of this force will be returned.
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
--- Pollution is stored per chunk, so this will return the same value for all positions in one chunk.
---@param position MapPosition @The position to poll the chunk's pollution
---@return double
function LuaSurface.get_pollution(position) end

--- Gets the value of surface property on this surface.
---@param property SurfacePropertyID @Property to read.
---@return double @Value of the property.
function LuaSurface.get_property(property) end

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

--- Get the tile at a given position. An alternative call signature for this method is passing it a single [TilePosition](runtime:TilePosition).
--- Non-integer values will result in them being rounded down.
---@param x int
---@param y int
---@return LuaTile
function LuaSurface.get_tile(x, y) end

--- Gets the total amount of pollution on the surface by iterating over all the chunks containing pollution.
---@return double
function LuaSurface.get_total_pollution() end

--- Is a given chunk generated?
---@param position ChunkPosition @The chunk's position.
---@return boolean
function LuaSurface.is_chunk_generated(position) end

---@class LuaSurface_play_sound_params
---@field path SoundPath @The sound to play.
---@field position MapPosition|nil @Where the sound should be played. If not given, it's played at the current position of each player.
---@field volume_modifier double|nil @The volume of the sound to play. Must be between 0 and 1 inclusive.
---@field override_sound_type SoundType|nil @The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.

--- Play a sound for every player on this surface.
--- The sound is not played if its location is not [charted](runtime:LuaForce::chart) for that player.
---@param p LuaSurface_play_sound_params
function LuaSurface.play_sound(p) end

--- Spawn pollution at the given position.
---@param source MapPosition @Where to spawn the pollution.
---@param amount double @How much pollution to add.
function LuaSurface.pollute(source, amount) end

--- Print text to the chat console of all players on this surface.
--- By default, messages that are identical to a message sent in the last 60 ticks are not printed again.
---@param message LocalisedString
---@param print_settings PrintSettings|nil
---@overload fun(message: LocalisedString)
function LuaSurface.print(message, print_settings) end

--- Regenerate autoplacement of some decoratives on this surface. This can be used to autoplace newly-added decoratives.
--- All specified decorative prototypes must be autoplacable. If nothing is given all decoratives are generated on all chunks.
---@param decoratives (string | string[])|nil @Prototype names of decorative or decoratives to autoplace. When `nil` all decoratives with an autoplace are used.
---@param chunks ChunkPosition[]|nil @The chunk positions to regenerate the decoratives on. If not given all chunks are regenerated. Note chunks with status < entities are ignored.
---@overload fun(decoratives: (string | string[])|nil)
---@overload fun()
function LuaSurface.regenerate_decorative(decoratives, chunks) end

--- Regenerate autoplacement of some entities on this surface. This can be used to autoplace newly-added entities.
--- All specified entity prototypes must be autoplacable. If nothing is given all entities are generated on all chunks.
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

---@class LuaSurface_request_path_params
---@field bounding_box BoundingBox @The dimensions of the object that's supposed to travel the path.
---@field collision_mask CollisionMask @The collision mask the `bounding_box` collides with.
---@field start MapPosition @The position from which to start pathfinding.
---@field goal MapPosition @The position to find a path to.
---@field force ForceID @The force for which to generate the path, determining which gates can be opened for example.
---@field radius double|nil @How close the pathfinder needs to get to its `goal` (in tiles). Defaults to `1`.
---@field pathfind_flags PathfinderFlags|nil @Flags that affect pathfinder behavior.
---@field can_open_gates boolean|nil @Whether the path request can open gates. Defaults to `false`.
---@field path_resolution_modifier int|nil @Defines how coarse the pathfinder's grid is, where smaller values mean a coarser grid. Defaults to `0`, which equals a resolution of `1x1` tiles, centered on tile centers. Values range from `-8` to `8` inclusive, where each integer increment doubles/halves the resolution. So, a resolution of `-8` equals a grid of `256x256` tiles, and a resolution of `8` equals `1/256` of a tile.
---@field max_gap_size int|nil @Defines the maximum allowed distance between path waypoints. 0 means that paths must be contiguous (as they are for biters). Values greater than 0 will produce paths with "gaps" that are suitable for spiders. Allowed values are from `0` to `31`. Defaults to `0`.
---@field max_attack_distance double|nil @Defines the maximum allowed distance between the last traversable path waypoint and an obstacle entity to be destroyed. Only used when finding a discontiguous path, i.e. when `max_gap_size` > 0. This field filters out paths that are blocked by obstacles that are outside the entity's attack range. Allowed values are `0` or greater. Defaults to `max_gap_size`.
---@field entity_to_ignore LuaEntity|nil @Makes the pathfinder ignore collisions with this entity if it is given.

--- Generates a path with the specified constraints (as an array of [PathfinderWaypoints](runtime:PathfinderWaypoint)) using the unit pathfinding algorithm. This path can be used to emulate pathing behavior by script for non-unit entities, such as vehicles. If you want to command actual units (such as biters or spitters) to move, use [LuaEntity::set_command](runtime:LuaEntity::set_command) instead.
--- The resulting path is ultimately returned asynchronously via [on_script_path_request_finished](runtime:on_script_path_request_finished).
---@param p LuaSurface_request_path_params
---@return uint @A unique handle to identify this call when [on_script_path_request_finished](runtime:on_script_path_request_finished) fires.
function LuaSurface.request_path(p) end

--- Request that the game's map generator generate chunks at the given position for the given radius on this surface. If the radius is `0`, then only the chunk at the given position is generated.
---@param position MapPosition @Where to generate the new chunks.
---@param radius uint|nil @The chunk radius from `position` to generate new chunks in. Defaults to `0`.
---@overload fun(position: MapPosition)
function LuaSurface.request_to_generate_chunks(position, radius) end

--- Set generated status of a chunk. Useful when copying chunks.
---@param position ChunkPosition @The chunk's position.
---@param status defines.chunk_generated_status @The chunk's new status.
function LuaSurface.set_chunk_generated_status(position, status) end

--- Set double hidden tile for the specified position. During normal gameplay, only [non-mineable](runtime:LuaTilePrototype::mineable_properties) tiles can become double hidden.
--- Does nothing if hidden tile at specified position does not exist.
---@param position TilePosition @The tile position.
---@param tile TileID|nil @The new double hidden tile or `nil` to clear the double hidden tile.
---@overload fun(position: TilePosition)
function LuaSurface.set_double_hidden_tile(position, tile) end

--- Set the hidden tile for the specified position. While during normal gameplay only [non-mineable](runtime:LuaTilePrototype::mineable_properties) or [foundation](runtime:LuaTilePrototype::is_foundation) tiles can become hidden, this method allows any kind of tile to be set as the hidden one.
---@param position TilePosition @The tile position.
---@param tile TileID|nil @The new hidden tile or `nil` to clear the hidden tile.
---@overload fun(position: TilePosition)
function LuaSurface.set_hidden_tile(position, tile) end

---@class LuaSurface_set_multi_command_params
---@field command Command
---@field unit_count uint @Number of units to give the command to.
---@field force ForceID|nil @Force of the units this command is to be given to. If not specified, uses the enemy force.
---@field unit_search_distance uint|nil @Radius to search for units. The search area is centered on the destination of the command. If not specified uses default value of 150.

--- Give a command to multiple units. This will automatically select suitable units for the task.
---@param p LuaSurface_set_multi_command_params
---@return uint @Number of units actually sent. May be less than `count` if not enough units were available.
function LuaSurface.set_multi_command(p) end

--- Sets the value of surface property on this surface.
---@param property SurfacePropertyID @Property to change.
---@param value double @The wanted value of the property.
function LuaSurface.set_property(property, value) end

--- Set tiles at specified locations. Can automatically correct the edges around modified tiles.
--- Placing a [mineable](runtime:LuaTilePrototype::mineable_properties) tile on top of a non-mineable or [foundation](runtime:LuaTilePrototype::is_foundation) one will turn the latter into the [LuaTile::hidden_tile](runtime:LuaTile::hidden_tile) for that tile. Placing a mineable tile on a mineable one or a non-mineable tile on a non-mineable one or a foundation tile on a foundation one will not modify the hidden tile. This restriction can however be circumvented by using [LuaSurface::set_hidden_tile](runtime:LuaSurface::set_hidden_tile). Placing a non-foundation tile on top of a foundation one when there already exists a hidden tile will push hidden tile to [double hidden](runtime:LuaTile::double_hidden_tile), and foundation tile will turn into hidden.
--- It is recommended to call this method once for all the tiles you want to change rather than calling it individually for every tile. As the tile correction is used after every step, calling it one by one could cause the tile correction logic to redo some of the changes. Also, many small API calls are generally more performance intensive than one big one.
---@param tiles Tile[]
---@param correct_tiles boolean|nil @If `false`, the correction logic is not applied to the changed tiles. Defaults to `true`.
---@param remove_colliding_entities (boolean | "abort_on_collision")|nil @Defaults to `true`.
---@param remove_colliding_decoratives boolean|nil @Defaults to `true`.
---@param raise_event boolean|nil @Defaults to `false`.
---@param player PlayerIdentification|nil @The player whose undo queue to add these actions to.
---@param undo_index uint|nil @The index of the undo item to add this action to. An index of `0` creates a new undo item for it. Defaults to putting it into the appropriate undo item automatically if not specified.
---@overload fun(tiles: Tile[], correct_tiles: boolean|nil, remove_colliding_entities: (boolean | "abort_on_collision")|nil, remove_colliding_decoratives: boolean|nil, raise_event: boolean|nil, player: PlayerIdentification|nil)
---@overload fun(tiles: Tile[], correct_tiles: boolean|nil, remove_colliding_entities: (boolean | "abort_on_collision")|nil, remove_colliding_decoratives: boolean|nil, raise_event: boolean|nil)
---@overload fun(tiles: Tile[], correct_tiles: boolean|nil, remove_colliding_entities: (boolean | "abort_on_collision")|nil, remove_colliding_decoratives: boolean|nil)
---@overload fun(tiles: Tile[], correct_tiles: boolean|nil, remove_colliding_entities: (boolean | "abort_on_collision")|nil)
---@overload fun(tiles: Tile[], correct_tiles: boolean|nil)
---@overload fun(tiles: Tile[])
function LuaSurface.set_tiles(tiles, correct_tiles, remove_colliding_entities, remove_colliding_decoratives, raise_event, player, undo_index) end

---@class LuaSurface_spill_item_stack_params
---@field position MapPosition @Center of the spillage
---@field stack ItemStackIdentification @Stack of items to spill
---@field enable_looted boolean|nil @When true, each created item will be flagged with the [LuaEntity::to_be_looted](runtime:LuaEntity::to_be_looted) flag. Defaults to `false`.
---@field force ForceID|nil @When provided (and not `nil`) the items will be marked for deconstruction by this force.
---@field allow_belts boolean|nil @Whether items can be spilled onto belts. Defaults to `true`.
---@field max_radius double|nil @Max radius from the specified `position` to spill items.
---@field use_start_position_on_failure boolean|nil @Allow spilling items at `position` if no non-colliding position is found. Note: Setting to false might cause some items not to be spilled. Defaults to `true`.

--- Spill items on the ground centered at a given location.
---@param p LuaSurface_spill_item_stack_params
---@return LuaEntity[] @The created item-on-ground entities.
function LuaSurface.spill_item_stack(p) end

---@class LuaSurface_upgrade_area_params
---@field area BoundingBox @The area to mark for upgrade.
---@field force ForceID @The force whose bots should perform the upgrade.
---@field player PlayerIdentification|nil @The player to set the last_user to if any.
---@field skip_fog_of_war boolean|nil @If chunks covered by fog-of-war are skipped.
---@field item LuaItemStack @The upgrade item to use.

--- Place an upgrade request.
---@param p LuaSurface_upgrade_area_params
function LuaSurface.upgrade_area(p) end

---@class LuaSurfacePropertyPrototype: LuaPrototypeBase @Prototype of a surface property.
---@field default_value double
---@field is_time boolean
---@field localised_unit_key string
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaSurfacePropertyPrototype = {}

---@class LuaSurfacePrototype: LuaPrototypeBase @Prototype of a surface.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field surface_properties table<SurfacePropertyID, double>
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaSurfacePrototype = {}

---@class LuaTechnology: any @One research item.
---@field enabled boolean @Can this technology be researched?
---@field force LuaForce @The force this technology belongs to.
---@field level uint @The current level of this technology. For level-based technology writing to this is the same as researching the technology to the previous level. Writing the level will set [LuaTechnology::enabled](runtime:LuaTechnology::enabled) to `true`.
---@field localised_description LocalisedString
---@field localised_name LocalisedString @Localised name of this technology.
---@field name string @Name of this technology.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field order string @The string used to alphabetically sort these prototypes. It is a simple string that has no additional semantic meaning.
---@field prerequisites table<string, LuaTechnology> @Prerequisites of this technology. The result maps technology name to the [LuaTechnology](runtime:LuaTechnology) object.
---@field prototype LuaTechnologyPrototype @The prototype of this technology.
---@field research_unit_count uint @The number of research units required for this technology. This is multiplied by the current research cost multiplier, unless [LuaTechnologyPrototype::ignore_tech_cost_multiplier](runtime:LuaTechnologyPrototype::ignore_tech_cost_multiplier) is `true`.
---@field research_unit_count_formula MathExpression @ nilable; The count formula, if this research has any. See [TechnologyUnit::count_formula](prototype:TechnologyUnit::count_formula) for details.
---@field research_unit_energy double @Amount of energy required to finish a unit of research.
---@field research_unit_ingredients Ingredient[] @The types of ingredients that labs will require to research this technology.
---@field researched boolean @Has this technology been researched? Switching from `false` to `true` will trigger the technology advancement perks; switching from `true` to `false` will reverse them.
---@field saved_progress double @Saved technology progress fraction as a value in range `[0, 1)`. 0 means there is no saved progress.
---@field successors table<string, LuaTechnology> @Successors of this technology, i.e. technologies which have this technology as a prerequisite.
---@field upgrade boolean @Is this an upgrade-type research?
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field visible_when_disabled boolean @If this technology will be visible in the research GUI even though it is disabled.
LuaTechnology = {}

--- Reload this technology from its prototype.
function LuaTechnology.reload() end

--- Research this technology and all of its prerequisites recursively.
function LuaTechnology.research_recursive() end

---@class LuaTechnologyPrototype: LuaPrototypeBase @A Technology prototype.
---@field allows_productivity boolean
---@field effects TechnologyModifier[] @Effects applied when this technology is researched.
---@field enabled boolean @If this technology prototype is enabled by default (enabled at the beginning of a game).
---@field essential boolean @If this technology prototype is essential, meaning it is shown in the condensed technology graph.
---@field ignore_tech_cost_multiplier boolean @If this technology ignores the technology cost multiplier setting. [LuaTechnologyPrototype::research_unit_count](runtime:LuaTechnologyPrototype::research_unit_count) will already take this setting into account.
---@field level uint @The level of this research.
---@field max_level uint @The max level of this research.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field prerequisites table<string, LuaTechnologyPrototype> @Prerequisites of this technology. The result maps technology name to the [LuaTechnologyPrototype](runtime:LuaTechnologyPrototype) object.
---@field research_trigger ResearchTrigger @ nilable; The trigger that will research this technology if any.
---@field research_unit_count uint @The number of research units required for this technology. This is multiplied by the current research cost multiplier, unless [LuaTechnologyPrototype::ignore_tech_cost_multiplier](runtime:LuaTechnologyPrototype::ignore_tech_cost_multiplier) is `true`.
---@field research_unit_count_formula MathExpression @ nilable; The count formula, if this research has any. See [TechnologyUnit::count_formula](prototype:TechnologyUnit::count_formula) for details.
---@field research_unit_energy double @Amount of energy required to finish a unit of research.
---@field research_unit_ingredients ResearchIngredient[] @The types of ingredients that labs will require to research this technology.
---@field successors table<string, LuaTechnologyPrototype> @Successors of this technology, i.e. technologies which have this technology as a prerequisite.
---@field upgrade boolean @If the is technology prototype is an upgrade to some other technology.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field visible_when_disabled boolean @If this technology will be visible in the research GUI even though it is disabled.
LuaTechnologyPrototype = {}

---@class LuaTile: any @A single "square" on the map.
---@field double_hidden_tile string @ nilable; The name of the [LuaTilePrototype](runtime:LuaTilePrototype) double hidden under this tile or `nil` if there is no double hidden tile. During normal gameplay, only [non-mineable](runtime:LuaTilePrototype::mineable_properties) tiles can become double hidden. This can however be circumvented with [LuaSurface::set_double_hidden_tile](runtime:LuaSurface::set_double_hidden_tile).
---@field hidden_tile string @ nilable; The name of the [LuaTilePrototype](runtime:LuaTilePrototype) hidden under this tile, if any. During normal gameplay, only [non-mineable](runtime:LuaTilePrototype::mineable_properties) or [foundation](runtime:LuaTilePrototype::is_foundation) tiles can become hidden. This can however be circumvented with [LuaSurface::set_hidden_tile](runtime:LuaSurface::set_hidden_tile).
---@field name string @Prototype name of this tile. E.g. `"sand-3"` or `"grass-2"`.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field position TilePosition @The position this tile references.
---@field prototype LuaTilePrototype
---@field surface LuaSurface @The surface this tile is on.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTile = {}

--- Cancels deconstruction if it is scheduled, does nothing otherwise.
---@param force ForceID @The force who did the deconstruction order.
---@param player PlayerIdentification|nil @The player to set the last_user to if any.
---@overload fun(force: ForceID)
function LuaTile.cancel_deconstruction(force, player) end

--- What type of things can collide with this tile?
---@param layer CollisionLayerID
---@return boolean
function LuaTile.collides_with(layer) end

--- Gets all tile ghosts on this tile.
---@param force ForceID|nil @Get tile ghosts of this force.
---@overload fun(): LuaEntity[]
---@return LuaEntity[] @The tile ghosts.
function LuaTile.get_tile_ghosts(force) end

--- Does this tile have any tile ghosts on it.
---@param force ForceID|nil @Check for tile ghosts of this force.
---@overload fun(): boolean
---@return boolean
function LuaTile.has_tile_ghost(force) end

--- Orders deconstruction of this tile by the given force.
---@param force ForceID @The force whose robots are supposed to do the deconstruction.
---@param player PlayerIdentification|nil @The player to set the last_user to if any.
---@overload fun(force: ForceID): LuaEntity
---@return LuaEntity @The deconstructible tile proxy created, if any.
function LuaTile.order_deconstruction(force, player) end

--- Is this tile marked for deconstruction?
---@param force ForceID|nil @The force whose robots are supposed to do the deconstruction. If not given, checks if to be deconstructed by any force.
---@overload fun(): boolean
---@return boolean
function LuaTile.to_be_deconstructed(force) end

---@class LuaTilePrototype: LuaPrototypeBase @Prototype of a tile.
---@field absorptions_per_second table<string, double> @A table of pollution emissions per second this tile will absorb, indexed by the name of each absorbed pollution type.
---@field allowed_neighbors table<string, LuaTilePrototype>
---@field allows_being_covered boolean @True if this tile can be [hidden](runtime:LuaTile::hidden_tile) or replaced by another tile through player actions.
---@field ambient_sounds_group LuaTilePrototype @ nilable
---@field automatic_neighbors boolean
---@field autoplace_specification AutoplaceSpecification @ nilable; Autoplace specification for this prototype, if any.
---@field bound_decoratives LuaDecorativePrototype[] @ nilable
---@field can_be_part_of_blueprint boolean @False if this tile is not allowed in blueprints regardless of the ability to build it.
---@field check_collision_with_entities boolean @True if building this tile should check for colliding entities above and prevent building if such are found. Also during mining tiles above this tile checks for entities colliding with this tile and prevents mining if such are found.
---@field collision_mask CollisionMask @The collision mask this tile uses
---@field decorative_removal_probability float @The probability that decorative entities will be removed from on top of this tile when this tile is generated.
---@field default_cover_tile LuaTilePrototype @ nilable
---@field default_destroyed_dropped_item_trigger TriggerItem[] @ nilable
---@field destroys_dropped_items boolean @ nilable
---@field fluid LuaFluidPrototype @ nilable; The fluid offshore pump produces on this tile, if any.
---@field frozen_variant LuaTilePrototype @ nilable
---@field is_foundation boolean @True if this tile can be used as a foundation for other tiles, false otherwise. Foundation tiles can be [hidden](runtime:LuaTile::hidden_tile).
---@field items_to_place_this ItemStackDefinition[] @ nilable; Items that when placed will produce this tile, if any. Construction bots will choose the first item in the list to build this tile.
---@field layer uint
---@field map_color Color
---@field max_health float @ nilable
---@field mineable_properties {minable: boolean, mining_time: double, mining_particle: string, products: Product[]}
---@field needs_correction boolean @If this tile needs correction logic applied when it's generated in the world.
---@field next_direction LuaTilePrototype @ nilable; The next direction of this tile, if any. Used when a tile has multiple directions (such as hazard concrete)
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field placeable_by SimpleItemStack[] @ nilable
---@field scorch_mark_color Color @ nilable
---@field thawed_variant LuaTilePrototype @ nilable
---@field trigger_effect TriggerEffectItem[] @ nilable
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field vehicle_friction_modifier float
---@field walking_speed_modifier float
---@field weight double @ nilable
LuaTilePrototype = {}

---@class LuaTrain: any @A train. Trains are a sequence of connected rolling stocks -- locomotives and wagons.
---@field back_end LuaRailEnd @Back end of the train: Rail and direction on that rail where the train will go when moving backward
---@field back_stock LuaEntity @ nilable; The back stock of this train, if any. The back of the train is at the opposite end of the [front](runtime:LuaTrain::front_stock).
---@field cargo_wagons LuaEntity[] @The cargo carriages the train contains.
---@field carriages LuaEntity[] @The rolling stocks this train is composed of, with the numbering starting at the [front](runtime:LuaTrain::front_stock) of the train.
---@field fluid_wagons LuaEntity[] @The fluid carriages the train contains.
---@field front_end LuaRailEnd @Front end of the train: Rail and direction on that rail where the train will go when moving forward
---@field front_stock LuaEntity @ nilable; The front stock of this train, if any. The front of the train is in the direction that a majority of locomotives are pointing in. If it's a tie, the North and West directions take precedence.
---@field group string @The group this train belongs to. Setting the group will apply the schedule of the group to this train.
---@field has_path boolean @If this train has a path.
---@field id uint @The unique train ID.
---@field kill_count uint @The total number of kills by this train.
---@field killed_players table<uint, uint> @The players killed by this train. The keys are the player indices, the values are how often this train killed that player.
---@field locomotives {front_movers: LuaEntity[], back_movers: LuaEntity[]} @Locomotives of the train.
---@field manual_mode boolean @When `true`, the train is explicitly controlled by the player or script. When `false`, the train moves autonomously according to its schedule.
---@field max_backward_speed double @Current max speed when moving backwards, depends on locomotive prototype and fuel.
---@field max_forward_speed double @Current max speed when moving forward, depends on locomotive prototype and fuel.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field passengers LuaPlayer[] @The player passengers on the train This does *not* index using player index. See [LuaPlayer::index](runtime:LuaPlayer::index) on each player instance for the player index.
---@field path LuaRailPath @ nilable; The path this train is using, if any.
---@field path_end_rail LuaEntity @ nilable; The destination rail this train is currently pathing to, if any.
---@field path_end_stop LuaEntity @ nilable; The destination train stop this train is currently pathing to, if any.
---@field riding_state RidingState @The riding state of this train.
---@field schedule TrainSchedule @ nilable; This train's current schedule, if any. Set to `nil` to clear. The schedule can't be changed by modifying the returned table. Instead, changes must be made by assigning a new table to this attribute.
---@field signal LuaEntity @ nilable; The signal this train is arriving or waiting at, if any.
---@field speed double @Current speed. Changing the speed of the train is potentially an unsafe operation because train uses the speed for its internal calculations of break distances, etc.
---@field state defines.train_state @This train's current state.
---@field station LuaEntity @ nilable; The train stop this train is stopped at, if any.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field weight double @The weight of this train.
LuaTrain = {}

--- Clears all fluids in this train.
function LuaTrain.clear_fluids_inside() end

--- Clear all items in this train.
function LuaTrain.clear_items_inside() end

--- Get a mapping of the train's inventory.
---@return ItemCountWithQuality[] @List of all items in the train.
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
---@param item ItemID|nil @Item name to count. If not given, counts all items.
---@overload fun(): uint
---@return uint
function LuaTrain.get_item_count(item) end

--- Gets a LuaRailEnd object pointing away from the train at specified end of the train
---@param direction defines.rail_direction
---@return LuaRailEnd
function LuaTrain.get_rail_end(direction) end

--- Gets all rails under the train.
---@return LuaEntity[]
function LuaTrain.get_rails() end

--- Go to the station specified by the index in the train's schedule.
---@param index uint
function LuaTrain.go_to_station(index) end

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

---@class LuaTrainManager: any @The train manager manages all the train in the game. LuaTrainManager allows to perform some direct queries to the train manager. There is always exactly one train manager instance in a game, it can be obtained from [LuaGameScript::train_manager](runtime:LuaGameScript::train_manager). This object is always valid and is equal to any other instance of LuaTrainManager from this game.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTrainManager = {}

--- Searches for a train with given ID.
---@param train_id uint @Train ID to search
---@return LuaTrain @Train if found
function LuaTrainManager.get_train_by_id(train_id) end

--- Gets all train stops that pass given filter
---@param filter TrainStopFilter @Filters the train stop must pass in order to be returned here
---@return LuaEntity[]
function LuaTrainManager.get_train_stops(filter) end

--- Gets all trains that pass given filter
---@param filter TrainFilter @Filters the train must pass in order to be returned here
---@return LuaTrain[]
function LuaTrainManager.get_trains(filter) end

---@class LuaTrainManager_request_train_path_params
---@field type TrainPathRequestType|nil @Request type. Determines the return type of the method. Defaults to `"path"`.
---@field train LuaTrain|nil @Mandatory if `starts` is not provided, optional otherwise. Selects a context for the pathfinder to decide which train to exclude from penalties and which signals are considered possible to reacquire. If `starts` is not provided, then it is also used to collect front and back ends for the search
---@field goals TrainPathFinderGoal[]
---@field return_path boolean|nil @Only relevant if request type is `"path"`. Returning a full path is expensive due to multiple LuaEntity created. In order for path to be returned, true must be provided here. Defaults to false in which case a path will not be provided.
---@field starts RailEndStart[]|nil @Manually provided starting positions.
---@field search_direction ("respect-movement-direction" | "any-direction-with-locomotives")|nil @Only relevant if `starts` was not provided in which case 2 starts (front and back) are deduced from the train. Selects which train ends should be considered as starts. Defaults to `"any-direction-with-locomotives"`.
---@field in_chain_signal_section boolean|nil @Defaults to `false`. If set to true, pathfinder will not return a path that cannot have its start immediately reserved. A path that cannot have its start immediately reserved could cause a train to stop inside of an intersection.
---@field steps_limit uint|nil @Maximum amount of steps pathfinder is allowed to perform.
---@field shortest_path boolean|nil @Defaults to `false`. If set to true, only length of rails is added to penalties causing search to look for shortest path (not smallest penalty)

--- Direct access to train pathfinder. Allows to search rail paths or querying which stops are accessible
---@param p LuaTrainManager_request_train_path_params
---@return TrainPathFinderOneGoalResult | TrainPathAllGoalsResult @The type of the returned value depends on `type`.
function LuaTrainManager.request_train_path(p) end

---@class LuaTrainStopControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for train stops.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field priority_signal SignalID @ nilable; The signal to be used by set-priority change priority of the train stop
---@field read_from_train boolean @`true` if the train stop should send the train contents to the circuit network.
---@field read_stopped_train boolean @`true` if the train stop should send the stopped train id to the circuit network.
---@field read_trains_count boolean @`true` if the train stop should send amount of incoming trains to the circuit network.
---@field send_to_train boolean @`true` if the train stop should send the circuit network contents to the train to use.
---@field set_priority boolean @`true` if the priority_signal is used to set a priority of the train stop.
---@field set_trains_limit boolean @`true` if the trains_limit_signal is used to set a limit of trains incoming for train stop.
---@field stopped_train_signal SignalID @ nilable; The signal that will be sent when using the send-train-id option.
---@field trains_count_signal SignalID @ nilable; The signal that will be sent when using the read-trains-count option.
---@field trains_limit_signal SignalID @ nilable; The signal to be used by set-trains-limit to limit amount of incoming trains
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTrainStopControlBehavior = {}

---@class LuaTransportBeltControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for transport belts.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_contents boolean @If the belt will read the contents and send them to the circuit network.
---@field read_contents_mode defines.control_behavior.transport_belt.content_read_mode @The read mode for the belt.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTransportBeltControlBehavior = {}

---@class LuaTransportLine: any @One line on a transport belt.
---@field input_lines LuaTransportLine[] @The transport lines that this transport line is fed by or an empty table if none.
---@field line_length float @Length of the transport line. Items can be inserted at line position from 0 up to returned value
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field output_lines LuaTransportLine[] @The transport lines that this transport line outputs items to or an empty table if none.
---@field owner LuaEntity @The entity this transport line belongs to.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
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

--- Get counts of all items on this line, similar to how [LuaInventory::get_contents](runtime:LuaInventory::get_contents) does.
---@return ItemCountWithQuality[] @List of all items on this line.
function LuaTransportLine.get_contents() end

--- Get detailed information of items on this line, such as their position.
---@return DetailedItemOnLine[]
function LuaTransportLine.get_detailed_contents() end

--- Count some or all items on this line, similar to how [LuaInventory::get_item_count](runtime:LuaInventory::get_item_count) does.
---@param item ItemID|nil @Prototype name of the item to count. If not specified, count all items.
---@overload fun(): uint
---@return uint
function LuaTransportLine.get_item_count(item) end

--- Get a map position related to a position on a transport line.
---@param position float @Linear position along the transport line. Clamped to the transport line range.
---@return MapPosition
function LuaTransportLine.get_line_item_position(position) end

--- Insert items at a given position.
---@param position float @Where on the line to insert the items.
---@param items ItemStackIdentification @Items to insert.
---@param belt_stack_size uint8|nil @Maximum size of stack created on belt
---@overload fun(position: float, items: ItemStackIdentification): boolean
---@return boolean @Were the items inserted successfully?
function LuaTransportLine.insert_at(position, items, belt_stack_size) end

--- Insert items at the back of this line.
---@param items ItemStackIdentification
---@param belt_stack_size uint8|nil @Maximum size of stack created on belt
---@overload fun(items: ItemStackIdentification): boolean
---@return boolean @Were the items inserted successfully?
function LuaTransportLine.insert_at_back(items, belt_stack_size) end

--- Returns whether the associated internal transport line of this line is the same as the others associated internal transport line.
--- This can return true even when the [LuaTransportLine::owner](runtime:LuaTransportLine::owner)s are different (so `this == other` is false), because the internal transport lines can span multiple tiles.
---@param other LuaTransportLine
---@return boolean
function LuaTransportLine.line_equals(other) end

--- Remove some items from this line.
---@param items ItemStackIdentification @Items to remove.
---@return uint @Number of items actually removed.
function LuaTransportLine.remove_item(items) end

---@class LuaTrivialSmokePrototype: LuaPrototypeBase @Prototype of a trivial smoke.
---@field affected_by_wind boolean
---@field color Color
---@field cyclic boolean
---@field duration uint
---@field end_scale double
---@field fade_away_duration uint
---@field fade_in_duration uint
---@field glow_animation boolean
---@field glow_fade_away_duration uint
---@field movement_slow_down_factor double
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field render_layer RenderLayer
---@field show_when_smoke_off boolean
---@field spread_duration uint
---@field start_scale double
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTrivialSmokePrototype = {}

---@class LuaTurretControlBehavior: LuaGenericOnOffControlBehavior @Control behavior for turrets.
---@field ignore_unlisted_targets_condition CircuitConditionDefinition @The condition under which the turret will ignore targets not on its priority list.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field read_ammo boolean @`true` if the turret will send the ammunition or fluid it contains to the circuit network.
---@field set_ignore_unlisted_targets boolean @`true` if the turret will ignore targets not on its priority list if a circuit condition is met.
---@field set_priority_list boolean @`true` if the turret's target priority list will be determined from the signals on the circuit network.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaTurretControlBehavior = {}

---@class LuaUndoRedoStack: any @The undo queue for a player. The term `item_index` refers to the index of an undo item in the queue, while `action_index` refers to the index of one of the individual actions that make up an undo item.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field player_index uint @The index of the player to whom this stack belongs to.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaUndoRedoStack = {}

--- Gets an undo item from the redo stack.
---@param index uint @The index of the item to get, ordered from most recent to oldest.
---@return UndoRedoAction[]
function LuaUndoRedoStack.get_redo_item(index) end

--- The number of undo items in the redo stack.
---@return uint
function LuaUndoRedoStack.get_redo_item_count() end

--- Gets the tag with the given name from a specific redo item action, or `nil` if it doesn't exist.
---@param item_index uint @The index of the redo item, ordered from most recent to oldest.
---@param action_index uint @The index of the redo action.
---@param tag_name string @The name of the tag to get.
---@return AnyBasic
function LuaUndoRedoStack.get_redo_tag(item_index, action_index, tag_name) end

--- Gets all tags for the given redo action.
---@param item_index uint @The index of the redo item, ordered from most recent to oldest.
---@param action_index uint @The index of the redo action.
---@return Tags
function LuaUndoRedoStack.get_redo_tags(item_index, action_index) end

--- Gets an undo item from the undo stack.
---@param index uint @The index of the undo item to get, ordered from most recent to oldest.
---@return UndoRedoAction[]
function LuaUndoRedoStack.get_undo_item(index) end

--- The number undo items in the undo stack.
---@return uint
function LuaUndoRedoStack.get_undo_item_count() end

--- Gets the tag with the given name from a specific undo item action, or `nil` if it doesn't exist.
---@param item_index uint @The index of the undo item, ordered from most recent to oldest.
---@param action_index uint @The index of the undo action.
---@param tag_name string @The name of the tag to get.
---@return AnyBasic
function LuaUndoRedoStack.get_undo_tag(item_index, action_index, tag_name) end

--- Gets all tags for the given undo action.
---@param item_index uint @The index of the undo item, ordered from most recent to oldest.
---@param action_index uint @The index of the undo action.
---@return Tags
function LuaUndoRedoStack.get_undo_tags(item_index, action_index) end

--- Removes an undo action from the specified undo item on the redo stack.
---@param item_index uint @The index of the undo item to change, ordered from most recent to oldest.
---@param action_index uint @The index of the undo action to remove.
function LuaUndoRedoStack.remove_redo_action(item_index, action_index) end

--- Removes an undo item from the redo stack.
---@param index uint @The index of the undo item to remove, ordered from most recent to oldest.
function LuaUndoRedoStack.remove_redo_item(index) end

--- Removes a tag with the given name from the specified redo item.
---@param item_index uint @The index of the redo item, ordered from most recent to oldest.
---@param action_index uint @The index of the redo action.
---@param tag string @The name of the tag to remove.
---@return boolean @Whether the tag existed and was successfully removed.
function LuaUndoRedoStack.remove_redo_tag(item_index, action_index, tag) end

--- Removes an undo action from the specified undo item on the undo stack.
---@param item_index uint @The index of the undo item to change, ordered from most recent to oldest.
---@param action_index uint @The index of the undo action to remove.
function LuaUndoRedoStack.remove_undo_action(item_index, action_index) end

--- Removes an undo item from the undo stack.
---@param index uint @The index of the undo item to remove, ordered from most recent to oldest.
function LuaUndoRedoStack.remove_undo_item(index) end

--- Removes a tag with the given name from the specified undo item.
---@param item_index uint @The index of the undo item, ordered from most recent to oldest.
---@param action_index uint @The index of the undo action.
---@param tag string @The name of the tag to remove.
---@return boolean @Whether the tag existed and was successfully removed.
function LuaUndoRedoStack.remove_undo_tag(item_index, action_index, tag) end

--- Sets a new tag with the given name and value on the specified redo item action.
---@param item_index uint @The index of the redo item, ordered from most recent to oldest.
---@param action_index uint @The index of the redo action.
---@param tag_name string @The name of the tag to set.
---@param tag AnyBasic @The contents of the new tag.
function LuaUndoRedoStack.set_redo_tag(item_index, action_index, tag_name, tag) end

--- Sets a new tag with the given name and value on the specified undo item action.
---@param item_index uint @The index of the undo item, ordered from most recent to oldest.
---@param action_index uint @The index of the undo action.
---@param tag_name string @The name of the tag to set.
---@param tag AnyBasic @The contents of the new tag.
function LuaUndoRedoStack.set_undo_tag(item_index, action_index, tag_name, tag) end

---@class LuaVirtualSignalPrototype: LuaPrototypeBase @Prototype of a virtual signal.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field special boolean @Whether this is a special signal. The `everything`, `anything`, `each`, and `unknown` signals are considered special.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaVirtualSignalPrototype = {}

---@class LuaVoidEnergySourcePrototype: any @Prototype of a void energy source.
---@field emissions_per_joule table<string, double> @The table of emissions of this energy source in `pollution/Joule`, indexed by pollutant type. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field render_no_network_icon boolean
---@field render_no_power_icon boolean
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaVoidEnergySourcePrototype = {}

---@class LuaWallControlBehavior: LuaControlBehavior @Control behavior for walls.
---@field circuit_condition CircuitConditionDefinition @The circuit condition.
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field open_gate boolean
---@field output_signal SignalID @ nilable
---@field read_sensor boolean
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
LuaWallControlBehavior = {}

---@class LuaWireConnector: any @A wire connector of a given entity. Allows to find wires, add or remove wires and do some basic operations specific to those connectors.
---@field connection_count uint @Amount of wires going out of this connector. It includes all wires (ghost wires and real wires).
---@field connections WireConnection[] @All wire connectors this connector is connected to.
---@field is_ghost boolean @If this connector is owned by an entity inside of a ghost. If any of 2 ends of a wire attaches to a ghost connector, then a wire is considered to be a ghost.
---@field network_id uint @Index of a CircuitNetwork or ElectricSubNetwork which is going through this wire connector. Returns 0 if there is no network associated with this wire connector right now. CircuitNetwork indexes are independent of indexes of ElectricSubNetwork so they may collide with each other
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---@field owner LuaEntity @The entity this wire connector belongs to. May return entity ghost instead if this wire connector belongs to inner entity.
---@field real_connection_count uint @Amount of real wires going out of this connector. It only includes wires for which both wire connectors are real.
---@field real_connections WireConnection[] @All wire connectors this connector is connected to with real wires.
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---@field wire_connector_id defines.wire_connector_id @Identifier of this connector in the entity this connector belongs to.
---@field wire_type defines.wire_type @The type of wires that can be connected to this connector.
LuaWireConnector = {}

--- Checks if a wire can reach from this connector to the other connector.
---@param other_connector LuaWireConnector | LuaEntity @Target to which a wire reach is to be checked.
---@return boolean
function LuaWireConnector.can_wire_reach(other_connector) end

--- Connects this connector to other wire connector.
---@param target LuaWireConnector @Other connector to which a wire should be added.
---@param reach_check boolean|nil @True by default. For wires out of reach or on different surfaces, `false` must be provided.
---@param origin defines.wire_origin|nil @Origin of the wire. Defaults to `defines.wire_origin.player`.
---@overload fun(target: LuaWireConnector, reach_check: boolean|nil): boolean
---@overload fun(target: LuaWireConnector): boolean
---@return boolean @Whether a connection was made.
function LuaWireConnector.connect_to(target, reach_check, origin) end

--- Removes all wires going out of this wire connector.
---@param origin defines.wire_origin|nil @Origin of the wires to remove. Defaults to `defines.wire_origin.player`.
---@overload fun(): boolean
---@return boolean @True if any wire was removed.
function LuaWireConnector.disconnect_all(origin) end

--- Disconnects this connector from other wire connector.
---@param target LuaWireConnector @Other connector to which wire to be removed should be removed.
---@param origin defines.wire_origin|nil @Origin of the wire. Defaults to `defines.wire_origin.player`.
---@overload fun(target: LuaWireConnector): boolean
---@return boolean @Whether a connection was removed.
function LuaWireConnector.disconnect_from(target, origin) end

--- Checks if this and other wire connector have a common neighbour.
---@param other_connector LuaWireConnector @Other connector to check for common neighbour.
---@param ignore_ghost_neighbours boolean|nil
---@overload fun(other_connector: LuaWireConnector): boolean
---@return boolean
function LuaWireConnector.have_common_neighbour(other_connector, ignore_ghost_neighbours) end

--- Checks if this connector has any wire going to the other connector.
---@param target LuaWireConnector @Other connector to check for a connection to.
---@param origin defines.wire_origin|nil @Origin of the wire. Defaults to `defines.wire_origin.player`.
---@overload fun(target: LuaWireConnector): boolean
---@return boolean
function LuaWireConnector.is_connected_to(target, origin) end


--- events

---@class CustomInputEvent: EventData @Called when a [CustomInputPrototype](prototype:CustomInputPrototype) is activated.
---@field cursor_display_location GuiLocation @The mouse cursor display location when the custom input was activated.
---@field cursor_position MapPosition @The mouse cursor position when the custom input was activated.
---@field input_name string @The prototype name of the custom input that was activated.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player that activated the custom input.
---@field selected_prototype SelectedPrototypeData @nilable; Information about the prototype that is selected when the custom input is used. Needs to be enabled on the custom input's prototype. `nil` if none is selected.
---@field tick uint @Tick the event was generated.

---@class OnAchievementGained: EventData @Called when an achievement is gained.
---@field achievement LuaAchievementPrototype
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who gained the achievement.
---@field tick uint @Tick the event was generated.

---@class OnAiCommandCompleted: EventData @Called when a unit/group completes a command.
---@field name defines.events @Identifier of the event
---@field result defines.behavior_result
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
---@field name defines.events @Identifier of the event
---@field source_area BoundingBox
---@field source_surface LuaSurface
---@field tick uint @Tick the event was generated.

---@class OnBiterBaseBuilt: EventData @Called when a biter migration builds a base. This will be called multiple times for each migration, once for every biter that is sacrificed to build part of the new base.
---@field entity LuaEntity @The entity that was built.
---@field name defines.events @Identifier of the event
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
---@field name defines.events @Identifier of the event
---@field source_offset TilePosition
---@field source_positions TilePosition[]
---@field source_surface LuaSurface
---@field tick uint @Tick the event was generated.

---@class OnBuildBaseArrived: EventData @Called when a [defines.command.build_base](runtime:defines.command.build_base) command reaches its destination, and before building starts.
---@field group LuaCommandable @nilable; The unit group the command was assigned to.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.
---@field unit LuaEntity @nilable; The unit the command was assigned to.

---@class OnBuiltEntity: EventData @Called when player builds something.
---@field consumed_items LuaInventory
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tags Tags @nilable; The tags associated with this entity if any.
---@field tick uint @Tick the event was generated.

---@class OnCancelledDeconstruction: EventData @Called when the deconstruction of an entity is canceled.
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable
---@field tick uint @Tick the event was generated.

---@class OnCancelledUpgrade: EventData @Called when the upgrade of an entity is canceled.
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable
---@field quality LuaQualityPrototype
---@field target LuaEntityPrototype
---@field tick uint @Tick the event was generated.

---@class OnCharacterCorpseExpired: EventData @Called when a character corpse expires due to timeout or all of the items being removed from it. this is not called if the corpse is mined. See [defines.events.on_pre_player_mined_item](runtime:defines.events.on_pre_player_mined_item) to detect that.
---@field corpse LuaEntity @The corpse.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnChartTagAdded: EventData @Called when a chart tag is created.
---@field force LuaForce
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable
---@field tag LuaCustomChartTag
---@field tick uint @Tick the event was generated.

---@class OnChartTagModified: EventData @Called when a chart tag is modified by a player.
---@field force LuaForce
---@field name defines.events @Identifier of the event
---@field old_icon SignalID
---@field old_player_index uint @nilable
---@field old_position MapPosition
---@field old_surface LuaSurface
---@field old_text string
---@field player_index uint @nilable
---@field tag LuaCustomChartTag
---@field tick uint @Tick the event was generated.

---@class OnChartTagRemoved: EventData @Called just before a chart tag is deleted.
---@field force LuaForce
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable
---@field tag LuaCustomChartTag
---@field tick uint @Tick the event was generated.

---@class OnChunkCharted: EventData @Called when a chunk is charted or re-charted.
---@field area BoundingBox @Area of the chunk.
---@field force LuaForce
---@field name defines.events @Identifier of the event
---@field position ChunkPosition
---@field surface_index uint
---@field tick uint @Tick the event was generated.

---@class OnChunkDeleted: EventData @Called when one or more chunks are deleted using [LuaSurface::delete_chunk](runtime:LuaSurface::delete_chunk).
---@field name defines.events @Identifier of the event
---@field positions ChunkPosition[] @The chunks deleted.
---@field surface_index uint
---@field tick uint @Tick the event was generated.

---@class OnChunkGenerated: EventData @Called when a chunk is generated.
---@field area BoundingBox @Area of the chunk.
---@field name defines.events @Identifier of the event
---@field position ChunkPosition @Position of the chunk.
---@field surface LuaSurface @The surface the chunk is on.
---@field tick uint @Tick the event was generated.

---@class OnCombatRobotExpired: EventData @Called when a combat robot expires through a lack of energy, or timeout.
---@field name defines.events @Identifier of the event
---@field owner LuaEntity @nilable; The entity that owns the robot if any.
---@field robot LuaEntity
---@field tick uint @Tick the event was generated.

---@class OnConsoleChat: EventData @Called when a message is sent to the in-game console, either by a player or through the server interface. This event only fires for plain messages, not for any commands (including `/shout` or `/whisper`).
---@field message string @The chat message that was sent.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player doing the chatting, if any.
---@field tick uint @Tick the event was generated.

---@class OnConsoleCommand: EventData @Called when someone enters a command-like message regardless of it being a valid command.
---@field command string @The command as typed without the preceding forward slash ('/').
---@field name defines.events @Identifier of the event
---@field parameters string @The parameters provided if any.
---@field player_index uint @nilable; The player if any.
---@field tick uint @Tick the event was generated.

---@class OnCutsceneCancelled: EventData @Called when a cutscene is cancelled by the player or by script.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player the cutscene was shown to.
---@field tick uint @Tick the event was generated.

---@class OnCutsceneFinished: EventData @Called when a cutscene finishes naturally (was not cancelled).
---@field name defines.events @Identifier of the event
---@field player_index uint @The player the cutscene was shown to.
---@field tick uint @Tick the event was generated.

---@class OnCutsceneStarted: EventData @Called when a cutscene starts.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player the cutscene is being shown to.
---@field tick uint @Tick the event was generated.

---@class OnCutsceneWaypointReached: EventData @Called when a cutscene is playing, each time it reaches a waypoint in that cutscene. This refers to an index in the table previously passed to set_controller which started the cutscene.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player index of the player viewing the cutscene.
---@field tick uint @Tick the event was generated.
---@field waypoint_index uint @The index of the waypoint we just completed.

---@class OnEntityCloned: EventData @Called when an entity is cloned. The filter applies to the source entity.
---@field destination LuaEntity
---@field name defines.events @Identifier of the event
---@field source LuaEntity
---@field tick uint @Tick the event was generated.

---@class OnEntityColorChanged: EventData @Called after an entity has been recolored either by the player or through script. Automatic recoloring due to [LuaPlayer::color](runtime:LuaPlayer::color) will not raise events, as that is a separate mechanism.
---@field entity LuaEntity @The entity that was recolored.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnEntityDamaged: EventData @Called when an entity is damaged. This is not called when an entities health is set directly by another mod.
---@field cause LuaEntity @nilable; The entity that originally triggered the events that led to this damage, if available (e.g. the character, turret, etc. that pulled the trigger).
---@field damage_type LuaDamagePrototype
---@field entity LuaEntity
---@field final_damage_amount float @The damage amount after resistances.
---@field final_health float @The health of the entity after the damage was applied.
---@field force LuaForce @nilable; The force that did the attacking if any.
---@field name defines.events @Identifier of the event
---@field original_damage_amount float @The damage amount before resistances.
---@field source LuaEntity @nilable; The entity that is directly dealing the damage, if available (e.g. the projectile, flame, sticker, grenade, laser beam, etc.).
---@field tick uint @Tick the event was generated.

---@class OnEntityDied: EventData @Called when an entity dies.
---@field cause LuaEntity @nilable; The entity that did the killing if available.
---@field damage_type LuaDamagePrototype @nilable; The damage type if any.
---@field entity LuaEntity @The entity that died.
---@field force LuaForce @nilable; The force that did the killing if any.
---@field loot LuaInventory @The loot generated by this entity if any.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnEntityLogisticSlotChanged: EventData @Called when one of an entity's logistic slots changes.
---@field entity LuaEntity @The entity for whom a logistic slot was changed.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player who changed the slot, or `nil` if changed by script.
---@field section LuaLogisticSection @The section changed.
---@field slot_index uint @The slot index that was changed.
---@field tick uint @Tick the event was generated.

---@class OnEntityRenamed: EventData @Called after an entity has been renamed either by the player or through script.
---@field by_script boolean
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field old_name string
---@field player_index uint @nilable; If by_script is true this will not be included.
---@field tick uint @Tick the event was generated.

---@class OnEntitySettingsPasted: EventData @Called after entity copy-paste is done.
---@field destination LuaEntity @The destination entity settings were copied to.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field source LuaEntity @The source entity settings were copied from.
---@field tick uint @Tick the event was generated.

---@class OnEntitySpawned: EventData @Called when an entity is spawned by a EnemySpawner
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field spawner LuaEntity
---@field tick uint @Tick the event was generated.

---@class OnEquipmentInserted: EventData @Called after equipment is inserted into an equipment grid.
---@field equipment LuaEquipment @The equipment inserted.
---@field grid LuaEquipmentGrid @The equipment grid inserted into.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnEquipmentRemoved: EventData @Called after equipment is removed from an equipment grid.
---@field count uint @The count of equipment removed.
---@field equipment string @The equipment removed.
---@field grid LuaEquipmentGrid @The equipment grid removed from.
---@field name defines.events @Identifier of the event
---@field quality string @The equipment quality.
---@field tick uint @Tick the event was generated.

---@class OnForceCeaseFireChanged: EventData @Called when the a forces cease fire values change.
---@field added boolean @If the other force was added or removed.
---@field force LuaForce @The force who's cease fire changed.
---@field name defines.events @Identifier of the event
---@field other_force LuaForce @Which force was added or removed.
---@field tick uint @Tick the event was generated.

---@class OnForceCreated: EventData @Called when a new force is created using `game.create_force()` This is not called when the default forces (`'player'`, `'enemy'`, `'neutral'`) are created as they will always exist.
---@field force LuaForce @The newly created force.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnForceFriendsChanged: EventData @Called when the a forces friends change.
---@field added boolean @If the other force was added or removed.
---@field force LuaForce @The force who's friends changed.
---@field name defines.events @Identifier of the event
---@field other_force LuaForce @Which force was added or removed.
---@field tick uint @Tick the event was generated.

---@class OnForceReset: EventData @Called when [LuaForce::reset](runtime:LuaForce::reset) is finished.
---@field force LuaForce
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnForcesMerged: EventData @Called after two forces have been merged using `game.merge_forces()`. The source force is invalidated before this event is called and the name can be re-used in this event if desired.
---@field destination LuaForce @The force entities where reassigned to.
---@field name defines.events @Identifier of the event
---@field source_index uint @The index of the destroyed force.
---@field source_name string @The force destroyed.
---@field tick uint @Tick the event was generated.

---@class OnForcesMerging: EventData @Called when two forces are about to be merged using `game.merge_forces()`.
---@field destination LuaForce @The force to reassign entities to.
---@field name defines.events @Identifier of the event
---@field source LuaForce @The force to be destroyed
---@field tick uint @Tick the event was generated.

---@class OnGameCreatedFromScenario: EventData @Called when a game is created from a scenario. This is fired for every mod, even when the scenario's save data already includes it. In those cases however, [LuaBootstrap::on_init](runtime:LuaBootstrap::on_init) is not fired. This event is not fired when the scenario is loaded via the map editor.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnGuiCheckedStateChanged: EventData @Called when [LuaGuiElement](runtime:LuaGuiElement) checked state is changed (related to checkboxes and radio buttons).
---@field element LuaGuiElement @The element whose checked state changed.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the change.
---@field tick uint @Tick the event was generated.

---@class OnGuiClick: EventData @Called when [LuaGuiElement](runtime:LuaGuiElement) is clicked.
---@field alt boolean @If alt was pressed.
---@field button defines.mouse_button_type @The mouse button used if any.
---@field control boolean @If control was pressed.
---@field cursor_display_location GuiLocation @The display location of the player's cursor.
---@field element LuaGuiElement @The clicked element.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the clicking.
---@field shift boolean @If shift was pressed.
---@field tick uint @Tick the event was generated.

---@class OnGuiClosed: EventData @Called when the player closes the GUI they have open. This can only be raised when the GUI's player controller is still valid. If a GUI is thus closed due to the player disconnecting, dying, or becoming a spectator in other ways, it won't cause this event to be raised. It's not advised to open any other GUI during this event because if this is run as a request to open a different GUI the game will force close the new opened GUI without notice to ensure the original requested GUI is opened.
---@field element LuaGuiElement @nilable; The custom GUI element that was open
---@field entity LuaEntity @nilable; The entity that was open
---@field equipment LuaEquipment @nilable; The equipment that was open
---@field gui_type defines.gui_type @The GUI type that was open.
---@field inventory LuaInventory @nilable; The script inventory that was open
---@field item LuaItemStack @nilable; The item that was open
---@field name defines.events @Identifier of the event
---@field other_player LuaPlayer @nilable; The other player that was open
---@field player_index uint @The player.
---@field technology LuaTechnology @nilable; The technology that was automatically selected when opening the research GUI
---@field tick uint @Tick the event was generated.
---@field tile_position TilePosition @nilable; The tile position that was open

---@class OnGuiConfirmed: EventData @Called when a [LuaGuiElement](runtime:LuaGuiElement) is confirmed, for example by pressing Enter in a textfield.
---@field alt boolean @If alt was pressed.
---@field control boolean @If control was pressed.
---@field element LuaGuiElement @The confirmed element.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the confirming.
---@field shift boolean @If shift was pressed.
---@field tick uint @Tick the event was generated.

---@class OnGuiElemChanged: EventData @Called when [LuaGuiElement](runtime:LuaGuiElement) element value is changed (related to choose element buttons).
---@field element LuaGuiElement @The element whose element value changed.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the change.
---@field tick uint @Tick the event was generated.

---@class OnGuiHover: EventData @Called when [LuaGuiElement](runtime:LuaGuiElement) is hovered by the mouse. Only fired for events whose [LuaGuiElement::raise_hover_events](runtime:LuaGuiElement::raise_hover_events) is `true`.
---@field element LuaGuiElement @The element that is being hovered over.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player whose cursor is hovering.
---@field tick uint @Tick the event was generated.

---@class OnGuiLeave: EventData @Called when the player's cursor leaves a [LuaGuiElement](runtime:LuaGuiElement) that was previously hovered. Only fired for events whose [LuaGuiElement::raise_hover_events](runtime:LuaGuiElement::raise_hover_events) is `true`.
---@field element LuaGuiElement @The element that was being hovered.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player whose cursor was hovering.
---@field tick uint @Tick the event was generated.

---@class OnGuiLocationChanged: EventData @Called when [LuaGuiElement](runtime:LuaGuiElement) element location is changed (related to frames in `player.gui.screen`).
---@field element LuaGuiElement @The element whose location changed.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the change.
---@field tick uint @Tick the event was generated.

---@class OnGuiOpened: EventData @Called when the player opens a GUI.
---@field element LuaGuiElement @nilable; The custom GUI element that was opened
---@field entity LuaEntity @nilable; The entity that was opened
---@field equipment LuaEquipment @nilable; The equipment that was opened
---@field gui_type defines.gui_type @The GUI type that was opened.
---@field inventory LuaInventory @nilable; The script inventory that was opened
---@field item LuaItemStack @nilable; The item that was opened
---@field name defines.events @Identifier of the event
---@field other_player LuaPlayer @nilable; The other player that was opened
---@field player_index uint @The player.
---@field tick uint @Tick the event was generated.

---@class OnGuiSelectedTabChanged: EventData @Called when [LuaGuiElement](runtime:LuaGuiElement) selected tab is changed (related to tabbed-panes).
---@field element LuaGuiElement @The tabbed pane whose selected tab changed.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the change.
---@field tick uint @Tick the event was generated.

---@class OnGuiSelectionStateChanged: EventData @Called when [LuaGuiElement](runtime:LuaGuiElement) selection state is changed (related to drop-downs and listboxes).
---@field element LuaGuiElement @The element whose selection state changed.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the change.
---@field tick uint @Tick the event was generated.

---@class OnGuiSwitchStateChanged: EventData @Called when [LuaGuiElement](runtime:LuaGuiElement) switch state is changed (related to switches).
---@field element LuaGuiElement @The switch whose switch state changed.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the change.
---@field tick uint @Tick the event was generated.

---@class OnGuiTextChanged: EventData @Called when [LuaGuiElement](runtime:LuaGuiElement) text is changed by the player.
---@field element LuaGuiElement @The edited element.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the edit.
---@field text string @The new text in the element.
---@field tick uint @Tick the event was generated.

---@class OnGuiValueChanged: EventData @Called when [LuaGuiElement](runtime:LuaGuiElement) slider value is changed (related to the slider element).
---@field element LuaGuiElement @The element whose value changed.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the change.
---@field tick uint @Tick the event was generated.

---@class OnLandMineArmed: EventData @Called when a land mine is armed.
---@field mine LuaEntity
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnLuaShortcut: EventData @Called when a custom [Lua shortcut](prototype:ShortcutPrototype) is pressed.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field prototype_name string @Shortcut prototype name of the shortcut that was clicked.
---@field tick uint @Tick the event was generated.

---@class OnMarkedForDeconstruction: EventData @Called when an entity is marked for deconstruction with the Deconstruction planner or via script.
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable
---@field tick uint @Tick the event was generated.

---@class OnMarkedForUpgrade: EventData @Called when an entity is marked for upgrade with the Upgrade planner or via script.
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable
---@field quality LuaQualityPrototype
---@field target LuaEntityPrototype
---@field tick uint @Tick the event was generated.

---@class OnMarketItemPurchased: EventData @Called after a player purchases some offer from a `market` entity.
---@field count uint @The amount of offers purchased.
---@field market LuaEntity @The market entity.
---@field name defines.events @Identifier of the event
---@field offer_index uint @The index of the offer purchased.
---@field player_index uint @The player who did the purchasing.
---@field tick uint @Tick the event was generated.

---@class OnModItemOpened: EventData @Called when the player uses the 'Open item GUI' control on an item defined with the 'mod-openable' flag
---@field item LuaItemPrototype @The item clicked on.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player.
---@field quality LuaQualityPrototype @The item quality clicked on.
---@field tick uint @Tick the event was generated.

---@class OnObjectDestroyed: EventData @Called after an object is destroyed that has been registered with [LuaBootstrap::register_on_object_destroyed](runtime:LuaBootstrap::register_on_object_destroyed). Depending on when a given object is destroyed, this event will be fired at the end of the current tick or at the end of the next tick.
---@field name defines.events @Identifier of the event
---@field registration_number uint64 @The number returned by [register_on_object_destroyed](runtime:LuaBootstrap::register_on_object_destroyed) to uniquely identify this object during this event.
---@field tick uint @Tick the event was generated.
---@field type defines.target_type @Type of the object that was destroyed. Same as third value returned by [LuaBootstrap::register_on_object_destroyed](runtime:LuaBootstrap::register_on_object_destroyed)
---@field useful_id uint64 @Useful identifier of the object. Same as second value returned by [LuaBootstrap::register_on_object_destroyed](runtime:LuaBootstrap::register_on_object_destroyed)

---@class OnPermissionGroupAdded: EventData @Called directly after a permission group is added.
---@field group LuaPermissionGroup @The group added.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player that added the group or `nil` if by a mod.
---@field tick uint @Tick the event was generated.

---@class OnPermissionGroupDeleted: EventData @Called directly after a permission group is deleted.
---@field group_name string @The group that was deleted.
---@field id uint @The group id that was deleted.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player doing the deletion or `nil` if by a mod.
---@field tick uint @Tick the event was generated.

---@class OnPermissionGroupEdited: EventData @Called directly after a permission group is edited in some way.
---@field action defines.input_action @The action when the `type` is `"add-permission"` or `"remove-permission"`.
---@field group LuaPermissionGroup @The group being edited.
---@field name defines.events @Identifier of the event
---@field new_name string @The new group name when the `type` is `"rename"`.
---@field old_name string @The old group name when the `type` is `"rename"`.
---@field other_player_index uint @The other player when the `type` is `"add-player"` or `"remove-player"`.
---@field player_index uint @nilable; The player that did the editing or `nil` if by a mod.
---@field tick uint @Tick the event was generated.
---@field type "add-permission" | "remove-permission" | "enable-all" | "disable-all" | "add-player" | "remove-player" | "rename" @The edit type.

---@class OnPermissionStringImported: EventData @Called directly after a permission string is imported.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player that imported the string.
---@field tick uint @Tick the event was generated.

---@class OnPickedUpItem: EventData @Called when a player picks up an item.
---@field item_stack SimpleItemStack
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerAltReverseSelectedArea: EventData @Called after a player alt-reverse-selects an area with a selection-tool item.
---@field area BoundingBox @The area selected.
---@field entities LuaEntity[] @The entities selected.
---@field item string @The item used to select the area.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player doing the selection.
---@field surface LuaSurface @The surface selected.
---@field tick uint @Tick the event was generated.
---@field tiles LuaTile[] @The tiles selected.

---@class OnPlayerAltSelectedArea: EventData @Called after a player alt-selects an area with a selection-tool item.
---@field area BoundingBox @The area selected.
---@field entities LuaEntity[] @The entities selected.
---@field item string @The item used to select the area.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player doing the selection.
---@field quality string @The item quality used to select the area.
---@field surface LuaSurface @The surface selected.
---@field tick uint @Tick the event was generated.
---@field tiles LuaTile[] @The tiles selected.

---@class OnPlayerAmmoInventoryChanged: EventData @Called after a players ammo inventory changed in some way.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerArmorInventoryChanged: EventData @Called after a players armor inventory changed in some way.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerBanned: EventData @Called when a player is banned.
---@field by_player uint @nilable; The player that did the banning if any.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player banned.
---@field player_name string @The banned player name.
---@field reason string @nilable; The reason given if any.
---@field tick uint @Tick the event was generated.

---@class OnPlayerBuiltTile: EventData @Called after a player builds tiles.
---@field inventory LuaInventory @nilable; The inventory containing the items used to build the tiles.
---@field item LuaItemPrototype @nilable; The item type used to build the tiles
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field quality LuaQualityPrototype @nilable; The quality of the item used to build the tiles
---@field surface_index uint @The surface the tile(s) were built on.
---@field tick uint @Tick the event was generated.
---@field tile LuaTilePrototype @The tile prototype that was placed.
---@field tiles OldTileAndPosition[] @The position data.

---@class OnPlayerCancelledCrafting: EventData @Called when a player cancels crafting.
---@field cancel_count uint @The number of crafts that have been cancelled.
---@field items LuaInventory @The crafting items returned to the player's inventory.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player that did the crafting.
---@field recipe LuaRecipe @The recipe that has been cancelled.
---@field tick uint @Tick the event was generated.

---@class OnPlayerChangedForce: EventData @Called after a player changes forces.
---@field force LuaForce @The old force.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who changed forces.
---@field tick uint @Tick the event was generated.

---@class OnPlayerChangedPosition: EventData @Called when the tile position a player is located at changes.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player.
---@field tick uint @Tick the event was generated.

---@class OnPlayerChangedSurface: EventData @Called after a player changes surfaces.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who changed surfaces.
---@field surface_index uint @nilable; The surface index the player was on - may be `nil` if the surface no longer exists.
---@field tick uint @Tick the event was generated.

---@class OnPlayerCheatModeDisabled: EventData @Called when cheat mode is disabled on a player.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player.
---@field tick uint @Tick the event was generated.

---@class OnPlayerCheatModeEnabled: EventData @Called when cheat mode is enabled on a player.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player.
---@field tick uint @Tick the event was generated.

---@class OnPlayerClickedGpsTag: EventData @Called when a player clicks a gps tag
---@field name defines.events @Identifier of the event
---@field player_index uint @Index of the player
---@field position MapPosition @Map position contained in gps tag
---@field surface string @Surface name contained in gps tag, even when such surface does not exists
---@field tick uint @Tick the event was generated.

---@class OnPlayerConfiguredBlueprint: EventData @Called when a player clicks the "confirm" button in the configure Blueprint GUI.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player.
---@field tick uint @Tick the event was generated.

---@class OnPlayerControllerChanged: EventData @Called after a player changes controller types.
---@field name defines.events @Identifier of the event
---@field old_type defines.controllers @The old controller type.
---@field player_index uint @The player who changed controllers.
---@field tick uint @Tick the event was generated.

---@class OnPlayerCraftedItem: EventData @Called when the player finishes crafting an item. This event fires just before the results are inserted into the player's inventory, not when the crafting is queued (see [on_pre_player_crafted_item](runtime:on_pre_player_crafted_item)).
---@field item_stack LuaItemStack @The item that has been crafted.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player doing the crafting.
---@field recipe LuaRecipe @The recipe used to craft this item.
---@field tick uint @Tick the event was generated.

---@class OnPlayerCreated: EventData @Called after the player was created.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerCursorStackChanged: EventData @Called after a player's [cursor stack](runtime:LuaControl::cursor_stack) changed in some way. This is fired in the same tick that the change happens, but not instantly.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerDeconstructedArea: EventData @Called when a player selects an area with a deconstruction planner.
---@field alt boolean @If normal selection or alt selection was used.
---@field area BoundingBox @The area selected.
---@field item string @The item used to select the area.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player doing the selection.
---@field quality string @The item quality used to select the area.
---@field stack LuaItemStack @nilable; The item stack used to select the area.
---@field surface LuaSurface @The surface selected.
---@field tick uint @Tick the event was generated.

---@class OnPlayerDemoted: EventData @Called when a player is demoted.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player.
---@field tick uint @Tick the event was generated.

---@class OnPlayerDied: EventData @Called after a player dies.
---@field cause LuaEntity @nilable
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerDisplayDensityScaleChanged: EventData @Called when the display density scale changes for a given player. The display density scale is the scale value automatically applied based on the player's display DPI. This is only relevant on platforms that support high-density displays.
---@field name defines.events @Identifier of the event
---@field old_scale double @The old display scale
---@field player_index uint @The player
---@field tick uint @Tick the event was generated.

---@class OnPlayerDisplayResolutionChanged: EventData @Called when the display resolution changes for a given player.
---@field name defines.events @Identifier of the event
---@field old_resolution DisplayResolution @The old display resolution
---@field player_index uint @The player
---@field tick uint @Tick the event was generated.

---@class OnPlayerDisplayScaleChanged: EventData @Called when the display scale changes for a given player.
---@field name defines.events @Identifier of the event
---@field old_scale double @The old display scale
---@field player_index uint @The player
---@field tick uint @Tick the event was generated.

---@class OnPlayerDrivingChangedState: EventData @Called when the player's driving state has changed, meaning a player has either entered or left a vehicle. This event is not raised when the player is ejected from a vehicle due to it being destroyed.
---@field entity LuaEntity @nilable; The vehicle if any.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerDroppedItem: EventData @Called when a player drops an item on the ground.
---@field entity LuaEntity @The item-on-ground entity.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerFastTransferred: EventData @Called when a player fast-transfers something to or from an entity.
---@field entity LuaEntity @The entity transferred from or to.
---@field from_player boolean @Whether the transfer was from player to entity. If `false`, the transfer was from entity to player.
---@field is_split boolean @Whether the transfer was a split action (half stack).
---@field name defines.events @Identifier of the event
---@field player_index uint @The player transferred from or to.
---@field tick uint @Tick the event was generated.

---@class OnPlayerFlippedEntity: EventData @Called when the player flips an entity. This event is only fired when the entity actually changes its orientation or mirroring -- pressing the flip keys on an entity that can't be flipped won't fire this event.
---@field entity LuaEntity @The flipped entity.
---@field horizontal boolean @The enacted flip. true = Horizontal, false = Vertical
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerFlushedFluid: EventData @Called after player flushed fluid
---@field amount double @Amount of fluid that was removed
---@field entity LuaEntity @Entity from which flush was performed
---@field fluid string @Name of a fluid that was flushed
---@field name defines.events @Identifier of the event
---@field only_this_entity boolean @True if flush was requested only on this entity
---@field player_index uint @Index of the player
---@field tick uint @Tick the event was generated.

---@class OnPlayerGunInventoryChanged: EventData @Called after a players gun inventory changed in some way.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerInputMethodChanged: EventData @Called when a player's input method changes. See [LuaPlayer::input_method](runtime:LuaPlayer::input_method).
---@field name defines.events @Identifier of the event
---@field player_index uint @The player whose input method changed.
---@field tick uint @Tick the event was generated.

---@class OnPlayerJoinedGame: EventData @Called after a player joins the game. This is not called when loading a save file in singleplayer, as the player doesn't actually leave the game, and the save is just on pause until they rejoin.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerKicked: EventData @Called when a player is kicked.
---@field by_player uint @nilable; The player that did the kicking if any.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player kicked.
---@field reason string @nilable; The reason given if any.
---@field tick uint @Tick the event was generated.

---@class OnPlayerLeftGame: EventData @Called after a player leaves the game. This is not called when closing a save file in singleplayer, as the player doesn't actually leave the game, and the save is just on pause until they rejoin.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field reason defines.disconnect_reason
---@field tick uint @Tick the event was generated.

---@class OnPlayerLocaleChanged: EventData @Called when a player's active locale changes. See [LuaPlayer::locale](runtime:LuaPlayer::locale).
---@field name defines.events @Identifier of the event
---@field old_locale string @The previously active locale.
---@field player_index uint @The player whose locale was changed.
---@field tick uint @Tick the event was generated.

---@class OnPlayerMainInventoryChanged: EventData @Called after a players main inventory changed in some way.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerMinedEntity: EventData @Called after the results of an entity being mined are collected just before the entity is destroyed. After this event any items in the buffer will be transferred into the player as if they came from mining the entity. The buffer inventory is special in that it's only valid during this event and has a dynamic size expanding as more items are transferred into it.
---@field buffer LuaInventory @The temporary inventory that holds the result of mining the entity.
---@field entity LuaEntity @The entity that has been mined.
---@field name defines.events @Identifier of the event
---@field player_index uint @The index of the player doing the mining.
---@field tick uint @Tick the event was generated.

---@class OnPlayerMinedItem: EventData @Called when the player mines something.
---@field item_stack SimpleItemStack @The item given to the player
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerMinedTile: EventData @Called after a player mines tiles.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field surface_index uint @The surface the tile(s) were mined from.
---@field tick uint @Tick the event was generated.
---@field tiles OldTileAndPosition[] @The position data.

---@class OnPlayerMuted: EventData @Called when a player is muted.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player.
---@field tick uint @Tick the event was generated.

---@class OnPlayerPipette: EventData @Called when a player invokes the "smart pipette" over an entity.
---@field item LuaItemPrototype @The item put in the cursor
---@field name defines.events @Identifier of the event
---@field player_index uint @The player
---@field quality LuaQualityPrototype @The item quality put in the cursor
---@field tick uint @Tick the event was generated.
---@field used_cheat_mode boolean @If cheat mode was used to give a free stack of the item.

---@class OnPlayerPlacedEquipment: EventData @Called after the player puts equipment in an equipment grid
---@field equipment LuaEquipment @The equipment put in the equipment grid.
---@field grid LuaEquipmentGrid @The equipment grid the equipment was put in.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerPromoted: EventData @Called when a player is promoted.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player.
---@field tick uint @Tick the event was generated.

---@class OnPlayerRemoved: EventData @Called when a player is removed (deleted) from the game. This is markedly different from a player temporarily [leaving](runtime:on_player_left_game) the game, and instead behaves like the player never existed in the save file.
---@field name defines.events @Identifier of the event
---@field player_index uint @The index of the removed player.
---@field tick uint @Tick the event was generated.

---@class OnPlayerRemovedEquipment: EventData @Called after the player removes equipment from an equipment grid
---@field count uint @The count of equipment removed.
---@field equipment string @The equipment removed.
---@field grid LuaEquipmentGrid @The equipment grid removed from.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field quality string @The equipment quality.
---@field tick uint @Tick the event was generated.

---@class OnPlayerRepairedEntity: EventData @Called when a player repairs an entity.
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerRespawned: EventData @Called after a player respawns.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field player_port LuaEntity @nilable; The player port used to respawn if one was used.
---@field tick uint @Tick the event was generated.

---@class OnPlayerReverseSelectedArea: EventData @Called after a player reverse-selects an area with a selection-tool item.
---@field area BoundingBox @The area selected.
---@field entities LuaEntity[] @The entities selected.
---@field item string @The item used to select the area.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player doing the selection.
---@field surface LuaSurface @The surface selected.
---@field tick uint @Tick the event was generated.
---@field tiles LuaTile[] @The tiles selected.

---@class OnPlayerRotatedEntity: EventData @Called when the player rotates an entity. This event is only fired when the entity actually changes its orientation -- pressing the rotate key on an entity that can't be rotated won't fire this event. Entities being flipped will not fire this event, even if the flip involves rotating. See [on_player_flipped_entity](runtime:on_player_flipped_entity).
---@field entity LuaEntity @The rotated entity.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field previous_direction defines.direction @The previous direction
---@field tick uint @Tick the event was generated.

---@class OnPlayerSelectedArea: EventData @Called after a player selects an area with a selection-tool item.
---@field area BoundingBox @The area selected.
---@field entities LuaEntity[] @The entities selected.
---@field item string @The item used to select the area.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player doing the selection.
---@field quality string @The item quality used to select the area.
---@field surface LuaSurface @The surface selected.
---@field tick uint @Tick the event was generated.
---@field tiles LuaTile[] @The tiles selected.

---@class OnPlayerSetQuickBarSlot: EventData @Called when a player sets a quickbar slot to anything (new value, or set to empty).
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerSetupBlueprint: EventData @Called when a player selects an area with a blueprint.
---@field alt boolean @If normal selection or alt selection was used.
---@field area BoundingBox @The area selected.
---@field item string @The item used to select the area.
---@field mapping table<uint, LuaEntity> @The blueprint entity index to source entity mapping. Note: if any mod changes the blueprint this will be incorrect.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player doing the selection.
---@field quality string @The item quality used to select the area.
---@field stack LuaItemStack @nilable; The item stack used to select the area.
---@field surface LuaSurface @The surface selected.
---@field tick uint @Tick the event was generated.

---@class OnPlayerToggledAltMode: EventData @Called when a player toggles alt mode, also known as "show entity info".
---@field alt_mode boolean @The new alt mode value. This value is a shortcut for accessing [GameViewSettings::show_entity_info](runtime:GameViewSettings::show_entity_info) on the player.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerToggledMapEditor: EventData @Called when a player toggles the map editor on or off.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerTrashInventoryChanged: EventData @Called after a players trash inventory changed in some way.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPlayerUnbanned: EventData @Called when a player is un-banned.
---@field by_player uint @nilable; The player that did the un-banning if any.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player un-banned.
---@field player_name string @The player name un-banned.
---@field reason string @nilable; The reason the player was banned if any.
---@field tick uint @Tick the event was generated.

---@class OnPlayerUnmuted: EventData @Called when a player is unmuted.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player.
---@field tick uint @Tick the event was generated.

---@class OnPlayerUsedCapsule: EventData @Called when a player uses a capsule that results in some game action.
---@field item LuaItemPrototype @The capsule item used.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player.
---@field position MapPosition @The position the capsule was used.
---@field quality LuaQualityPrototype @The quality of the capsule item used.
---@field tick uint @Tick the event was generated.

---@class OnPlayerUsedSpidertronRemote: EventData @Called when a player uses spidertron remote to send all selected units to a given position
---@field name defines.events @Identifier of the event
---@field player_index uint @The player that used the remote.
---@field position MapPosition @Goal position to which spidertron was sent to.
---@field tick uint @Tick the event was generated.

---@class OnPostEntityDied: EventData @Called after an entity dies.
---@field corpses LuaEntity[] @The corpses created by the entity dying if any.
---@field damage_type LuaDamagePrototype @nilable; The damage type if any.
---@field force LuaForce @nilable; The force that did the killing if any.
---@field ghost LuaEntity @nilable; The ghost created by the entity dying if any.
---@field name defines.events @Identifier of the event
---@field position MapPosition @Position where the entity died.
---@field prototype LuaEntityPrototype @The entity prototype of the entity that died.
---@field quality LuaQualityPrototype @The quality of the entity that died.
---@field surface_index uint @The surface the entity was on.
---@field tick uint @Tick the event was generated.
---@field unit_number uint @nilable; The unit number the entity had if any.

---@class OnPreBuild: EventData @Called when players uses an item to build something. Called before [on_built_entity](runtime:on_built_entity).
---@field build_mode defines.build_mode @Build mode the item was placed with.
---@field created_by_moving boolean @Whether the item was placed while moving.
---@field direction defines.direction @The direction the item was facing when placed.
---@field flip_horizontal boolean @Whether the blueprint was flipped horizontally. `nil` if not built by a blueprint.
---@field flip_vertical boolean @Whether the blueprint was flipped vertically. `nil` if not built by a blueprint.
---@field mirror boolean @If the item is mirrored (only crafting machines support this)
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who did the placing.
---@field position MapPosition @Where the item was placed.
---@field tick uint @Tick the event was generated.

---@class OnPreChunkDeleted: EventData @Called before one or more chunks are deleted using [LuaSurface::delete_chunk](runtime:LuaSurface::delete_chunk).
---@field name defines.events @Identifier of the event
---@field positions ChunkPosition[] @The chunks to be deleted.
---@field surface_index uint
---@field tick uint @Tick the event was generated.

---@class OnPreEntitySettingsPasted: EventData @Called before entity copy-paste is done.
---@field destination LuaEntity @The destination entity settings will be copied to.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field source LuaEntity @The source entity settings will be copied from.
---@field tick uint @Tick the event was generated.

---@class OnPreGhostDeconstructed: EventData @Called before a ghost entity is destroyed as a result of being marked for deconstruction. Also called for item request proxies before they are destroyed as a result of being marked for deconstruction.
---@field ghost LuaEntity
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player that did the deconstruction if any.
---@field tick uint @Tick the event was generated.

---@class OnPreGhostUpgraded: EventData @Called before a ghost entity is upgraded.
---@field ghost LuaEntity
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player that did the upgrade if any.
---@field quality LuaQualityPrototype
---@field target LuaEntityPrototype
---@field tick uint @Tick the event was generated.

---@class OnPrePermissionGroupDeleted: EventData @Called directly before a permission group is deleted.
---@field group LuaPermissionGroup @The group to be deleted.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player doing the deletion or `nil` if by a mod.
---@field tick uint @Tick the event was generated.

---@class OnPrePermissionStringImported: EventData @Called directly before a permission string is imported.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player importing the string.
---@field tick uint @Tick the event was generated.

---@class OnPrePlayerCraftedItem: EventData @Called when a player queues something to be crafted.
---@field items LuaInventory @The items removed from the players inventory to do the crafting.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player doing the crafting.
---@field queued_count uint @The number of times the recipe is being queued.
---@field recipe LuaRecipe @The recipe being queued.
---@field tick uint @Tick the event was generated.

---@class OnPrePlayerDied: EventData @Called before a players dies.
---@field cause LuaEntity @nilable
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPrePlayerLeftGame: EventData @Called before a player leaves the game.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field reason defines.disconnect_reason
---@field tick uint @Tick the event was generated.

---@class OnPrePlayerMinedItem: EventData @Called when the player completes a mining action, but before the entity is potentially removed from the map. This is called even if the entity does not end up being removed.
---@field entity LuaEntity @The entity being mined
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPrePlayerRemoved: EventData @Called before a player is removed (deleted) from the game. This is markedly different from a player temporarily [leaving](runtime:on_player_left_game) the game, and instead behaves like the player never existed in the save file.
---@field name defines.events @Identifier of the event
---@field player_index uint @The index of the removed player.
---@field tick uint @Tick the event was generated.

---@class OnPrePlayerToggledMapEditor: EventData @Called before a player toggles the map editor on or off.
---@field name defines.events @Identifier of the event
---@field player_index uint
---@field tick uint @Tick the event was generated.

---@class OnPreRobotExplodedCliff: EventData @Called directly before a robot explodes cliffs.
---@field cliff LuaEntity
---@field item LuaItemPrototype @The cliff explosive used.
---@field name defines.events @Identifier of the event
---@field quality LuaQualityPrototype @The quality of the cliff explosive used.
---@field robot LuaEntity
---@field tick uint @Tick the event was generated.

---@class OnPreScenarioFinished: EventData @Called just before the scenario finishes.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnPreScriptInventoryResized: EventData @Called just before a script inventory is resized.
---@field inventory LuaInventory
---@field mod string @The mod that did the resizing. This will be `"core"` if done by console command or scenario script.
---@field name defines.events @Identifier of the event
---@field new_size uint @The new inventory size.
---@field old_size uint @The old inventory size.
---@field player_index uint @nilable; If done by console command; the player who ran the command.
---@field tick uint @Tick the event was generated.

---@class OnPreSurfaceCleared: EventData @Called just before a surface is cleared (all entities removed and all chunks deleted).
---@field name defines.events @Identifier of the event
---@field surface_index uint
---@field tick uint @Tick the event was generated.

---@class OnPreSurfaceDeleted: EventData @Called just before a surface is deleted.
---@field name defines.events @Identifier of the event
---@field surface_index uint
---@field tick uint @Tick the event was generated.

---@class OnRedoApplied: EventData @Called when the player triggers "redo".
---@field actions UndoRedoAction[] @The context of the redo action.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who triggered the redo action.
---@field tick uint @Tick the event was generated.

---@class OnResearchCancelled: EventData @Called when research is cancelled.
---@field force LuaForce @The force whose research was cancelled.
---@field name defines.events @Identifier of the event
---@field research table<string, uint> @A mapping of technology name to how many times it was cancelled.
---@field tick uint @Tick the event was generated.

---@class OnResearchFinished: EventData @Called when a research finishes.
---@field by_script boolean @If the technology was researched by script.
---@field name defines.events @Identifier of the event
---@field research LuaTechnology @The researched technology
---@field tick uint @Tick the event was generated.

---@class OnResearchMoved: EventData @Called when research is moved forwards or backwards in the research queue.
---@field force LuaForce @The force whose research was re-arranged.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnResearchReversed: EventData @Called when a research is reversed (unresearched).
---@field by_script boolean @If the technology was un-researched by script.
---@field name defines.events @Identifier of the event
---@field research LuaTechnology @The technology un-researched
---@field tick uint @Tick the event was generated.

---@class OnResearchStarted: EventData @Called when a technology research starts.
---@field last_research LuaTechnology @nilable
---@field name defines.events @Identifier of the event
---@field research LuaTechnology @The technology being researched
---@field tick uint @Tick the event was generated.

---@class OnResourceDepleted: EventData @Called when a resource entity reaches 0 or its minimum yield for infinite resources.
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnRobotBuiltEntity: EventData @Called when a construction robot builds an entity.
---@field entity LuaEntity @The entity built.
---@field name defines.events @Identifier of the event
---@field robot LuaEntity @The robot that did the building.
---@field stack LuaItemStack @The item used to do the building.
---@field tags Tags @nilable; The tags associated with this entity if any.
---@field tick uint @Tick the event was generated.

---@class OnRobotBuiltTile: EventData @Called after a robot builds tiles.
---@field inventory LuaInventory @The inventory containing the stacks used to build the tiles.
---@field item LuaItemPrototype @The item type used to build the tiles.
---@field name defines.events @Identifier of the event
---@field quality LuaQualityPrototype @The quality the item used to build the tiles.
---@field robot LuaEntity @The robot.
---@field surface_index uint @The surface the tile(s) are build on.
---@field tick uint @Tick the event was generated.
---@field tile LuaTilePrototype @The tile prototype that was placed.
---@field tiles OldTileAndPosition[] @The position data.

---@class OnRobotExplodedCliff: EventData @Called directly after a robot explodes cliffs.
---@field item LuaItemPrototype @The cliff explosive used.
---@field name defines.events @Identifier of the event
---@field quality LuaQualityPrototype @The quality of the cliff explosive used.
---@field robot LuaEntity
---@field tick uint @Tick the event was generated.

---@class OnRobotMined: EventData @Called when a robot mines an entity.
---@field item_stack SimpleItemStack @The entity the robot just picked up.
---@field name defines.events @Identifier of the event
---@field robot LuaEntity @The robot that did the mining.
---@field tick uint @Tick the event was generated.

---@class OnRobotMinedEntity: EventData @Called after the results of an entity being mined are collected just before the entity is destroyed. After this event any items in the buffer will be transferred into the robot as if they came from mining the entity. The buffer inventory is special in that it's only valid during this event and has a dynamic size expanding as more items are transferred into it.
---@field buffer LuaInventory @The temporary inventory that holds the result of mining the entity.
---@field entity LuaEntity @The entity that has been mined.
---@field name defines.events @Identifier of the event
---@field robot LuaEntity @The robot doing the mining.
---@field tick uint @Tick the event was generated.

---@class OnRobotMinedTile: EventData @Called after a robot mines tiles.
---@field name defines.events @Identifier of the event
---@field robot LuaEntity @The robot.
---@field surface_index uint @The surface the tile(s) were mined on.
---@field tick uint @Tick the event was generated.
---@field tiles OldTileAndPosition[] @The position data.

---@class OnRobotPreMined: EventData @Called before a robot mines an entity.
---@field entity LuaEntity @The entity which is about to be mined.
---@field name defines.events @Identifier of the event
---@field robot LuaEntity @The robot that's about to do the mining.
---@field tick uint @Tick the event was generated.

---@class OnRocketLaunchOrdered: EventData @Called when a rocket silo is ordered to be launched.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player that is riding the rocket, if any.
---@field rocket LuaEntity
---@field rocket_silo LuaEntity
---@field tick uint @Tick the event was generated.

---@class OnRocketLaunched: EventData @Called when the rocket is launched.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player that is riding the rocket, if any.
---@field rocket LuaEntity
---@field rocket_silo LuaEntity @nilable
---@field tick uint @Tick the event was generated.

---@class OnRuntimeModSettingChanged: EventData @Called when a runtime mod setting is changed by a player.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; If the `setting_type` is `"global"` and it was changed through the mod settings GUI, this is the index of the player that changed the global setting. If the `setting_type` is `"runtime-per-user"` and it changed a current setting of the player, this is the index of the player whose setting was changed. In all other cases, this is `nil`.
---@field setting string @The prototype name of the setting that was changed.
---@field setting_type "runtime-global" | "runtime-per-user"
---@field tick uint @Tick the event was generated.

---@class OnScriptInventoryResized: EventData @Called just after a script inventory is resized.
---@field inventory LuaInventory
---@field mod string @The mod that did the resizing. This will be `"core"` if done by console command or scenario script.
---@field name defines.events @Identifier of the event
---@field new_size uint @The new inventory size.
---@field old_size uint @The old inventory size.
---@field overflow_inventory LuaInventory @Any items which didn't fit into the new inventory size.
---@field player_index uint @nilable; If done by console command; the player who ran the command.
---@field tick uint @Tick the event was generated.

---@class OnScriptPathRequestFinished: EventData @Called when a [LuaSurface::request_path](runtime:LuaSurface::request_path) call completes.
---@field id uint @Handle to associate the callback with a particular call to [LuaSurface::request_path](runtime:LuaSurface::request_path).
---@field name defines.events @Identifier of the event
---@field path PathfinderWaypoint[] @nilable; The actual path that the pathfinder has determined. `nil` if pathfinding failed.
---@field tick uint @Tick the event was generated.
---@field try_again_later boolean @Indicates that the pathfinder failed because it is too busy, and that you can retry later.

---@class OnScriptTriggerEffect: EventData @Called when a script trigger effect is triggered.
---@field cause_entity LuaEntity @nilable; The entity that originally caused the sequence of triggers
---@field effect_id string @The effect_id specified in the trigger effect.
---@field name defines.events @Identifier of the event
---@field source_entity LuaEntity @nilable
---@field source_position MapPosition @nilable
---@field surface_index uint @The surface the effect happened on.
---@field target_entity LuaEntity @nilable
---@field target_position MapPosition @nilable
---@field tick uint @Tick the event was generated.

---@class OnSectorScanned: EventData @Called when an entity of type `radar` finishes scanning a sector.
---@field area BoundingBox @Area of the scanned chunk.
---@field chunk_position ChunkPosition @The chunk scanned.
---@field name defines.events @Identifier of the event
---@field radar LuaEntity @The radar that did the scanning.
---@field tick uint @Tick the event was generated.

---@class OnSegmentEntityCreated: EventData @Called when an individual segment of a SegmentedUnit is created.
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnSelectedEntityChanged: EventData @Called after the selected entity changes for a given player.
---@field last_entity LuaEntity @nilable; The last selected entity if it still exists and there was one.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player whose selected entity changed.
---@field tick uint @Tick the event was generated.

---@class OnSpacePlatformBuiltEntity: EventData @Called when a space platform builds an entity.
---@field entity LuaEntity @The entity built.
---@field name defines.events @Identifier of the event
---@field platform LuaSpacePlatform @The platform that did the building.
---@field stack LuaItemStack @The item used to do the building.
---@field tags Tags @nilable; The tags associated with this entity if any.
---@field tick uint @Tick the event was generated.

---@class OnSpacePlatformBuiltTile: EventData @Called after a space platform builds tiles.
---@field inventory LuaInventory @The inventory containing the stacks used to build the tiles.
---@field item LuaItemPrototype @The item type used to build the tiles.
---@field name defines.events @Identifier of the event
---@field platform LuaSpacePlatform @The platform.
---@field quality LuaQualityPrototype @The quality the item used to build the tiles.
---@field surface_index uint @The surface the tile(s) are build on.
---@field tick uint @Tick the event was generated.
---@field tile LuaTilePrototype @The tile prototype that was placed.
---@field tiles OldTileAndPosition[] @The position data.

---@class OnSpacePlatformChangedState: EventData @Called when a space platform changes state
---@field name defines.events @Identifier of the event
---@field old_state defines.space_platform_state
---@field platform LuaSpacePlatform
---@field tick uint @Tick the event was generated.

---@class OnSpacePlatformMinedEntity: EventData @Called after the results of an entity being mined are collected just before the entity is destroyed. After this event any items in the buffer will be transferred into the platform as if they came from mining the entity. The buffer inventory is special in that it's only valid during this event and has a dynamic size expanding as more items are transferred into it.
---@field buffer LuaInventory @The temporary inventory that holds the result of mining the entity.
---@field entity LuaEntity @The entity that has been mined.
---@field name defines.events @Identifier of the event
---@field platform LuaSpacePlatform @The platform doing the mining.
---@field tick uint @Tick the event was generated.

---@class OnSpacePlatformMinedItem: EventData @Called when a platform mines an entity.
---@field item_stack SimpleItemStack @The entity the platform just picked up.
---@field name defines.events @Identifier of the event
---@field platform LuaSpacePlatform @The platform that did the mining.
---@field tick uint @Tick the event was generated.

---@class OnSpacePlatformMinedTile: EventData @Called after a platform mines tiles.
---@field name defines.events @Identifier of the event
---@field platform LuaSpacePlatform @The platform.
---@field surface_index uint @The surface the tile(s) were mined on.
---@field tick uint @Tick the event was generated.
---@field tiles OldTileAndPosition[] @The position data.

---@class OnSpacePlatformPreMined: EventData @Called before a platform mines an entity.
---@field entity LuaEntity @The entity which is about to be mined.
---@field name defines.events @Identifier of the event
---@field platform LuaSpacePlatform @The platform that's about to do the mining.
---@field tick uint @Tick the event was generated.

---@class OnSpiderCommandCompleted: EventData @Called when a spider finishes moving to its autopilot position.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.
---@field vehicle LuaEntity @Spider vehicle which was requested to move.

---@class OnStringTranslated: EventData @Called when a translation request generated through [LuaPlayer::request_translation](runtime:LuaPlayer::request_translation) or [LuaPlayer::request_translations](runtime:LuaPlayer::request_translations) has been completed.
---@field id uint @The unique id for this translation request.
---@field localised_string LocalisedString @The localised string being translated.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player whose locale was used for the translation.
---@field result string @The translated `localised_string`.
---@field tick uint @Tick the event was generated.
---@field translated boolean @Whether the requested localised string was valid and could be translated.

---@class OnSurfaceCleared: EventData @Called just after a surface is cleared (all entities removed and all chunks deleted).
---@field name defines.events @Identifier of the event
---@field surface_index uint
---@field tick uint @Tick the event was generated.

---@class OnSurfaceCreated: EventData @Called when a surface is created. This is not called when the default surface is created as it will always exist.
---@field name defines.events @Identifier of the event
---@field surface_index uint
---@field tick uint @Tick the event was generated.

---@class OnSurfaceDeleted: EventData @Called after a surface is deleted.
---@field name defines.events @Identifier of the event
---@field surface_index uint
---@field tick uint @Tick the event was generated.

---@class OnSurfaceImported: EventData @Called after a surface is imported via the map editor.
---@field name defines.events @Identifier of the event
---@field original_name string @The original surface name.
---@field surface_index uint
---@field tick uint @Tick the event was generated.

---@class OnSurfaceRenamed: EventData @Called when a surface is renamed.
---@field name defines.events @Identifier of the event
---@field new_name string
---@field old_name string
---@field surface_index uint
---@field tick uint @Tick the event was generated.

---@class OnTechnologyEffectsReset: EventData @Called when [LuaForce::reset_technology_effects](runtime:LuaForce::reset_technology_effects) is finished.
---@field force LuaForce
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnTick: EventData @It is fired once every tick. Since this event is fired every tick, its handler shouldn't include performance heavy code.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnTrainChangedState: EventData @Called when a train changes state (started to stopped and vice versa)
---@field name defines.events @Identifier of the event
---@field old_state defines.train_state
---@field tick uint @Tick the event was generated.
---@field train LuaTrain

---@class OnTrainCreated: EventData @Called when a new train is created either through disconnecting/connecting an existing one or building a new one.
---@field name defines.events @Identifier of the event
---@field old_train_id_1 uint @nilable; The first old train id when splitting/merging trains.
---@field old_train_id_2 uint @nilable; The second old train id when splitting/merging trains.
---@field tick uint @Tick the event was generated.
---@field train LuaTrain

---@class OnTrainScheduleChanged: EventData @Called when a trains schedule is changed either by the player or through script.
---@field name defines.events @Identifier of the event
---@field player_index uint @nilable; The player who made the change if any.
---@field tick uint @Tick the event was generated.
---@field train LuaTrain

---@class OnTriggerCreatedEntity: EventData @Called when an entity with a trigger prototype (such as capsules) create an entity AND that trigger prototype defined `trigger_created_entity=true`.
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field source LuaEntity @nilable
---@field tick uint @Tick the event was generated.

---@class OnTriggerFiredArtillery: EventData @Called when an entity with a trigger prototype (such as capsules) fire an artillery projectile AND that trigger prototype defined `trigger_fired_artillery=true`.
---@field entity LuaEntity
---@field name defines.events @Identifier of the event
---@field source LuaEntity @nilable
---@field tick uint @Tick the event was generated.

---@class OnUndoApplied: EventData @Called when the player triggers "undo".
---@field actions UndoRedoAction[] @The context of the undo action.
---@field name defines.events @Identifier of the event
---@field player_index uint @The player who triggered the undo action.
---@field tick uint @Tick the event was generated.

---@class OnUnitAddedToGroup: EventData @Called when a unit is added to a unit group.
---@field group LuaCommandable
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.
---@field unit LuaEntity

---@class OnUnitGroupCreated: EventData @Called when a new unit group is created, before any members are added to it.
---@field group LuaCommandable
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnUnitGroupFinishedGathering: EventData @Called when a unit group finishes gathering and starts executing its command.
---@field group LuaCommandable
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class OnUnitRemovedFromGroup: EventData @Called when a unit is removed from a unit group.
---@field group LuaCommandable
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.
---@field unit LuaEntity

---@class OnWorkerRobotExpired: EventData @Called when a worker (construction or logistic) robot expires through a lack of energy.
---@field name defines.events @Identifier of the event
---@field robot LuaEntity
---@field tick uint @Tick the event was generated.

---@class ScriptRaisedBuilt: EventData @A static event mods can use to tell other mods they built something by script. This event is only raised if a mod does so with [LuaBootstrap::raise_event](runtime:LuaBootstrap::raise_event) or [LuaBootstrap::raise_script_built](runtime:LuaBootstrap::raise_script_built), or when `raise_built` is passed to [LuaSurface::create_entity](runtime:LuaSurface::create_entity).
---@field entity LuaEntity @The entity that has been built.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class ScriptRaisedDestroy: EventData @A static event mods can use to tell other mods they destroyed something by script. This event is only raised if a mod does so with [LuaBootstrap::raise_event](runtime:LuaBootstrap::raise_event) or [LuaBootstrap::raise_script_destroy](runtime:LuaBootstrap::raise_script_destroy), or when `raise_destroy` is passed to [LuaEntity::destroy](runtime:LuaEntity::destroy).
---@field entity LuaEntity @The entity that was destroyed.
---@field name defines.events @Identifier of the event
---@field tick uint @Tick the event was generated.

---@class ScriptRaisedRevive: EventData @A static event mods can use to tell other mods they revived something by script. This event is only raised if a mod does so with [LuaBootstrap::raise_event](runtime:LuaBootstrap::raise_event) or [LuaBootstrap::raise_script_revive](runtime:LuaBootstrap::raise_script_revive), or when `raise_revive` is passed to [LuaEntity::revive](runtime:LuaEntity::revive).
---@field entity LuaEntity @The entity that was revived.
---@field name defines.events @Identifier of the event
---@field tags Tags @nilable; The tags associated with this entity, if any.
---@field tick uint @Tick the event was generated.

---@class ScriptRaisedSetTiles: EventData @A static event mods can use to tell other mods they changed tiles on a surface by script. This event is only raised if a mod does so with [LuaBootstrap::raise_event](runtime:LuaBootstrap::raise_event) or [LuaBootstrap::raise_script_set_tiles](runtime:LuaBootstrap::raise_script_set_tiles), or when `raise_event` is passed to [LuaSurface::set_tiles](runtime:LuaSurface::set_tiles).
---@field name defines.events @Identifier of the event
---@field surface_index uint @The surface whose tiles were changed.
---@field tick uint @Tick the event was generated.
---@field tiles Tile[] @The tiles that were changed.

---@class ScriptRaisedTeleported: EventData @A static event mods can use to tell other mods they teleported something by script. This event is only raised if a mod does so with [LuaBootstrap::raise_event](runtime:LuaBootstrap::raise_event) or [LuaBootstrap::raise_script_teleported](runtime:LuaBootstrap::raise_script_teleported), or when `raise_teleported` is passed to [LuaControl::teleport](runtime:LuaControl::teleport).
---@field entity LuaEntity @The entity that was teleported.
---@field name defines.events @Identifier of the event
---@field old_position MapPosition @The entity's position before the teleportation.
---@field old_surface_index uint8 @The entity's surface before the teleportation.
---@field tick uint @Tick the event was generated.


--- global_functions

--- `localised_print()` allows printing [LocalisedString](runtime:LocalisedString) to stdout without polluting the Factorio [log file](https://wiki.factorio.com/Log_file). This is primarily useful when communicating with external tools that launch Factorio as a child process.
---@param string LocalisedString
function localised_print(string) end


--- `log()` can print [LocalisedStrings](runtime:LocalisedString) to the Factorio [log file](https://wiki.factorio.com/Log_file). This, in combination with the serpent library, makes debugging in the data stage easier because it allows the inspection of entire prototype tables. For example, printing all properties of the sulfur item prototype can be done like so: `log(serpent.block(data.raw["item"]["sulfur"]))`
---@param string LocalisedString
function log(string) end


--- Factorio provides the `table_size()` function as a simple way to determine the size of tables with non-continuous keys, as the standard `#` operator does not work correctly for these. The function is a C++ implementation of the following Lua code, which is faster than doing the same in Lua:
--- ```
--- local function size(t)
---   local count = 0
---   for k,v in pairs(t) do
---     count = count + 1
---   end
---   return count
--- end
--- ```
--- Note that `table_size()` does not work correctly for [LuaCustomTable](runtime:LuaCustomTable), their size has to be determined with [LuaCustomTable::length_operator](runtime:LuaCustomTable::length_operator) instead.
---@param table table
---@return uint
function table_size(table) end



--- global_objects

---@type LuaCommandProcessor @Allows registration of custom commands for the in-game console.
commands = commands

---@type LuaGameScript @The main scripting interface through which most of the API is accessed.
game = game

---@type LuaHelpers @Provides access to various helper and utility functions.
helpers = helpers

---@type LuaPrototypes @Allows read-only access to prototypes.
prototypes = prototypes

---@type LuaRCON @Allows printing messages to the calling RCON instance, if any.
rcon = rcon

---@type LuaRemote @Allows registration and use of functions to communicate between mods.
remote = remote

---@type LuaRendering @Allows rendering of geometric shapes, text and sprites in the game world.
rendering = rendering

---@type LuaBootstrap @Provides an interface for registering game event handlers.
script = script

---@type LuaSettings @Provides access to the current mod settings.
settings = settings



--- ex types

---@class DifficultySettings
---@field technology_price_multiplier double @A value in range [0.001, 1000].
---@field spoil_time_modifier double @A value in range [0.01, 100].

---@class GameViewSettings
---@field show_controller_gui boolean @Show the controller GUI elements. This includes the toolbar, the selected tool slot, the armour slot, and the gun and ammunition slots.
---@field show_minimap boolean @Show the chart in the upper right-hand corner of the screen.
---@field show_research_info boolean @Show research progress and name in the upper right-hand corner of the screen.
---@field show_entity_info boolean @Show overlay icons on entities. Also known as "alt-mode".
---@field show_alert_gui boolean @Show the flashing alert icons next to the player's toolbar.
---@field update_entity_selection boolean @When `true` (the default), mousing over an entity will select it. Otherwise, moving the mouse won't update entity selection.
---@field show_rail_block_visualisation boolean @When `true` (`false` is default), the rails will always show the rail block visualisation.
---@field show_side_menu boolean @Shows or hides the buttons row.
---@field show_map_view_options boolean @Shows or hides the view options when map is opened.
---@field show_entity_tooltip boolean @Shows or hides the tooltip that is displayed when selecting an entity.
---@field show_quickbar boolean @Shows or hides quickbar of shortcuts.
---@field show_shortcut_bar boolean @Shows or hides the shortcut bar.
---@field show_crafting_queue boolean @Shows or hides the crafting queue.
---@field show_tool_bar boolean @Shows or hides the tool window with the weapons and armor.
---@field show_hotkey_suggestions boolean @hows or hides the mouse and keyboard/controller button hints in the bottom left corner if they are enabled in the interface settings.

---@class MapSettings
---@field pollution PollutionMapSettings
---@field enemy_evolution EnemyEvolutionMapSettings
---@field enemy_expansion EnemyExpansionMapSettings
---@field unit_group UnitGroupMapSettings
---@field steering SteeringMapSetting
---@field path_finder PathFinderMapSettings
---@field asteroids AsteroidMapSettings
---@field max_failed_behavior_count uint @If a behavior fails this many times, the enemy (or enemy group) is destroyed. This solves biters getting stuck within their own base.

