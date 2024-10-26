local empty = util.empty_sprite(1)

local empty4 = {
    north = empty,
    east = empty,
    south = empty,
    west = empty
}

do
    -- v1: io ports
    -- v2: hidden output port that connected to station
    local name = 'viirld-io'
    local entity = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
    entity.name = name
    entity.minable = nil
    entity.item_slot_count = 300
    entity.draw_cargo = false
    entity.draw_circuit_wires = false
    entity.selection_box = { { -0.0, -0.0 }, { 0.0, 0.0 } }
    entity.collision_box = { { -0.0, -0.0 }, { 0.0, 0.0 } }
    --entity.collision_mask = { }
    entity.flags = { "placeable-off-grid", "not-on-map", "not-blueprintable", "hide-alt-info" }
    entity.sprites = empty4
    entity.activity_led_sprites = empty4

    data:extend { entity }
end

do
    -- v1: dispatcher
    -- v2: nothing
    local name = 'viirld-dispatcher'

    local item = table.deepcopy(data.raw["item"]["train-stop"])
    item.name = name
    item.place_result = name
    item.icon = data.raw["item"]["small-lamp"].icon
    item.icon_size = data.raw["item"]["small-lamp"].icon_size
    item.icon_mipmaps = data.raw["item"]["small-lamp"].icon_mipmaps
    item.icons = {
        {
            icon = data.raw["item"]["train-stop"].icon,
            icon_size = data.raw["item"]["train-stop"].icon_size,
            icon_mipmaps = data.raw["item"]["train-stop"].icon_mipmaps,
            scale = .7,
        },
        {
            icon = data.raw["item"]["small-lamp"].icon,
            icon_size = data.raw["item"]["small-lamp"].icon_size,
            icon_mipmaps = data.raw["item"]["small-lamp"].icon_mipmaps,
            scale = .35,
            shift = { -5, 9 }
        },
    }
    item.order = "a[train-system]-f[viirld-dispatcher]"
    item.subgroup = data.raw["item"]["train-stop"].subgroup
    if (mods["nullius"]) then
        -- Enable item in Nullius and place next to the regular train stop
        item.order = "nullius-eca"
    end

    local entity = table.deepcopy(data.raw["arithmetic-combinator"]["arithmetic-combinator"])
    entity.name = name
    entity.minable.result = name
    entity.icons = item.icons
    entity.corpse = data.raw["lamp"]["small-lamp"].corpse
    entity.dying_explosion = data.raw["lamp"]["small-lamp"].dying_explosion
    entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
    entity.collision_box = { { -0.25, -0.25 }, { 0.25, 0.25 } }
    entity.energy_source = { type = "void" }
    entity.additional_pastable_entities = { "viirld2-dispatcher" }
    local function sprite(x)
        local s = table.deepcopy(data.raw["lamp"]["small-lamp"].picture_off)
        s.layers[#s.layers + 1] = {
            filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole.png",
            priority = "high",
            width = 6,
            height = 8,
            x = 13,
            y = 10,
            shift = { (x == 2 or x == 3) and .33 or -.33, (x == 0 or x == 3) and .12 or -.33 },
            hr_version = {
                filename = "__base__/graphics/entity/small-electric-pole/hr-small-electric-pole.png",
                priority = "high",
                width = 10,
                height = 16,
                x = 28,
                y = 24,
                shift = { (x == 2 or x == 3) and .33 or -.33, (x == 0 or x == 3) and .12 or -.33 },
                scale = 0.5
            }
        }
        s.layers[#s.layers + 1] = {
            filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole.png",
            priority = "high",
            width = 6,
            height = 8,
            x = 13,
            y = 10,
            shift = { (x == 1 or x == 2) and .33 or -.33, (x == 2 or x == 3) and .12 or -.33 },
            hr_version = {
                filename = "__base__/graphics/entity/small-electric-pole/hr-small-electric-pole.png",
                priority = "high",
                width = 10,
                height = 16,
                x = 28,
                y = 24,
                shift = { (x == 1 or x == 2) and .33 or -.33, (x == 2 or x == 3) and .12 or -.33 },
                scale = 0.5
            }
        }
        return s
    end
    entity.sprites = {
        north = sprite(0),
        east = sprite(1),
        south = sprite(2),
        west = sprite(3)
    }
    entity.input_connection_bounding_box = { { -0.5, 0 }, { 0.5, 0.5 } }
    entity.output_connection_bounding_box = { { -0.5, -0.5 }, { 0.5, 0 } }
    -- 84 70
    local left = -.33
    local right = .33
    local top = -.33
    local bottom = .12
    local shadowDx = 2 / 83
    local shadowDy = -17 / 70
    function connection(wLeft, wTop)
        return {
            shadow = {
                red = { wLeft + shadowDx, wTop + shadowDy },
                green = { wLeft + shadowDx, wTop + shadowDy },
            },
            wire = {
                red = { wLeft, wTop },
                green = { wLeft, wTop },
            }
        }
    end
    entity.input_connection_points = {
        connection(left, bottom),
        connection(left, top),
        connection(right, top),
        connection(right, bottom),
    }
    entity.output_connection_points = {
        connection(left, top),
        connection(right, top),
        connection(right, bottom),
        connection(left, bottom),
    }

    entity.multiply_symbol_sprites = empty4

    local function colorLight(tint)
        local light = table.deepcopy(data.raw["lamp"]["small-lamp"].picture_on)
        light.draw_as_glow = true
        light.tint = tint
        light.priority = "extra-high"
        --light.hr_version.draw_as_glow = true
        --light.hr_version.tint = tint
        --light.hr_version.priority = "extra-high"
        return {
            north = light,
            east = light,
            south = light,
            west = light
        }
    end

    entity.plus_symbol_sprites = colorLight { r = 1, g = 0, b = 0 }
    entity.minus_symbol_sprites = colorLight { r = 0, g = 1, b = 0 }
    entity.divide_symbol_sprites = colorLight { r = 0, g = 0, b = 1 }
    entity.modulo_symbol_sprites = colorLight { r = 1, g = 1, b = 0 }
    entity.power_symbol_sprites = colorLight { r = 1, g = 0, b = 1 }
    entity.left_shift_symbol_sprites = colorLight { r = 0, g = 1, b = 1 }
    entity.right_shift_symbol_sprites = colorLight { r = 1, g = 1, b = 1 }
    entity.and_symbol_sprites = colorLight { r = 0, g = .5, b = 0 }
    entity.or_symbol_sprites = colorLight { r = .5, g = .5, b = 0 }
    entity.xor_symbol_sprites = colorLight { r = 1, g = .25, b = .18 }

    --local recipe = table.deepcopy(data.raw["recipe"]["train-stop"])
    --recipe.name = name
    --recipe.result = name
    --recipe.icons = item.icons
    --recipe.ingredients = {
    --    { "advanced-circuit", 1 },
    --    { "copper-cable", 2 },
    --    { "small-lamp", 1 },
    --}
    --recipe.enabled = false
    --
    --if (mods["nullius"]) then
    --    -- Enable recipe and place it just after regular station
    --    recipe.order = "nullius-eca"
    --    -- Use the same costs (minus the train stop) and metadata as for LTN
    --    recipe.category = "tiny-crafting"
    --    recipe.always_show_made_in = true
    --    recipe.energy_required = 3
    --    recipe.ingredients = {
    --        {"arithmetic-combinator", 2},
    --        {"green-wire", 4}
    --    }
    --end

    --local tech = {
    --    type = "technology",
    --    name = name,
    --    icon = item.icon,
    --    icon_size = item.icon_size,
    --    icon_mipmaps = item.icon_mipmaps,
    --    icons = item.icons,
    --    prerequisites = { "automated-rail-transportation", "circuit-network", "advanced-circuit" },
    --    effects = { { type = "unlock-recipe", recipe = name } },
    --    unit = table.deepcopy(data.raw["technology"]["rail-signals"].unit),
    --    order = "c-g-c"
    --}
    --tech.unit.count = math.floor(tech.unit.count * 1.5)
    --
    --if (mods["nullius"]) then
    --    -- Enable technology
    --    tech.order = "nullius-" .. (tech.order or "")
    --    -- Use the same costs and requirements as for LTN
    --    tech.unit = {
    --        count = 100,
    --        ingredients = {
    --            { "nullius-geology-pack", 1 }, { "nullius-climatology-pack", 1 },
    --            { "nullius-mechanical-pack", 1 }, { "nullius-electrical-pack", 1 }
    --        },
    --        time = 25
    --    }
    --    tech.prerequisites = { "nullius-checkpoint-optimization", "nullius-traffic-control" }
    --    tech.ignore_tech_cost_multiplier = true
    --end

    data:extend { item, entity, --[[recipe, tech]] }
end

do
    local name = 'viirld2-io'
    local entity = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
    entity.name = name
    entity.minable = nil
    entity.item_slot_count = 300
    entity.draw_cargo = false
    entity.draw_circuit_wires = false
    entity.selection_box = { { -0.0, -0.0 }, { 0.0, 0.0 } }
    entity.collision_box = { { -0.0, -0.0 }, { 0.0, 0.0 } }
    --entity.collision_mask = { }
    entity.flags = { "placeable-off-grid", "not-on-map", "not-blueprintable",  "hide-alt-info" }
    --entity.sprites = empty4
    --entity.activity_led_sprites = empty4

    data:extend { entity }
end

do
    -- v1: nothing
    -- v2: dispatcher
    local name = 'viirld2-dispatcher'

    local item = table.deepcopy(data.raw["item"]["train-stop"])
    item.name = name
    item.place_result = name
    item.icon = data.raw["item"]["small-lamp"].icon
    item.icon_size = data.raw["item"]["small-lamp"].icon_size
    item.icon_mipmaps = data.raw["item"]["small-lamp"].icon_mipmaps
    item.icons = {
        {
            icon = data.raw["item"]["train-stop"].icon,
            icon_size = data.raw["item"]["train-stop"].icon_size,
            icon_mipmaps = data.raw["item"]["train-stop"].icon_mipmaps,
            scale = .7,
        },
        {
            icon = data.raw["item"]["small-lamp"].icon,
            icon_size = data.raw["item"]["small-lamp"].icon_size,
            icon_mipmaps = data.raw["item"]["small-lamp"].icon_mipmaps,
            scale = .35,
            shift = { -5, 9 }
        },
    }
    item.order = "a[train-system]-f[viirld-dispatcher]"
    item.subgroup = data.raw["item"]["train-stop"].subgroup
    if (mods["nullius"]) then
        -- Enable item in Nullius and place next to the regular train stop
        item.order = "nullius-eca"
    end
    local entity = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
    entity.name = name
    entity.minable.result = name
    entity.icons = item.icons
    entity.item_slot_count = 300
    entity.allow_copy_paste = true
    local flags = entity.flags or {}
    flags[#flags + 1] = "hide-alt-info"
    entity.corpse = data.raw["lamp"]["small-lamp"].corpse
    entity.dying_explosion = data.raw["lamp"]["small-lamp"].dying_explosion
    entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
    entity.collision_box = { { -0.25, -0.25 }, { 0.25, 0.25 } }
    entity.energy_source = { type = "void" }
    local entitySprite = table.deepcopy(data.raw["lamp"]["small-lamp"].picture_off)
    entitySprite.layers[1].tint = {.75, .75, .75}
    --entitySprite.layers[1].hr_version.tint = {.75, .75, .75}
    entity.sprites = {
        north = entitySprite,
        east = entitySprite,
        south = entitySprite,
        west = entitySprite
    }
    -- 84 70
    local right = .33
    local top = -.33
    local shadowDx = 2 / 83
    local shadowDy = -17 / 70
    local entityConnection = {
        shadow = {
            red = { right + shadowDx, top + shadowDy },
            green = { right + shadowDx, top + shadowDy },
        },
        wire = {
            red = { right, top },
            green = { right, top },
        }
    }
    entity.circuit_wire_connection_points = {
        entityConnection,
        entityConnection,
        entityConnection,
        entityConnection,
    }
    local function colorLight(tint)
        local light = table.deepcopy(data.raw["lamp"]["small-lamp"].picture_on)
        light.draw_as_glow = true
        light.tint = tint
        light.priority = "extra-high"
        --light.hr_version.draw_as_glow = true
        --light.hr_version.tint = tint
        --light.hr_version.priority = "extra-high"
        return {
            north = light,
            east = light,
            south = light,
            west = light
        }
    end

    entity.activity_led_sprites = empty4 -- colorLight { r = 0, g = 1, b = 1 }
    local recipe = table.deepcopy(data.raw["recipe"]["train-stop"])
    recipe.name = name
    recipe.results =  {{type="item", name=name, amount=1}}
    recipe.icons = item.icons
    recipe.ingredients = {
        { type="item", name = "advanced-circuit", amount = 1 },
        { type="item", name = "copper-cable", amount = 2 },
        { type="item", name = "small-lamp", amount = 1 },
    }
    recipe.enabled = false

    if (mods["nullius"]) then
        -- Enable recipe and place it just after regular station
        recipe.order = "nullius-eca"
        -- Use the same costs (minus the train stop) and metadata as for LTN
        recipe.category = "tiny-crafting"
        recipe.always_show_made_in = true
        recipe.energy_required = 3
        recipe.ingredients = {
            {type = "item", name = "arithmetic-combinator", amount = 2},
            {type = "item", name = "green-wire", amount = 4}
        }
    end

    local tech = {
        type = "technology",
        name = name,
        icon = item.icon,
        icon_size = item.icon_size,
        icon_mipmaps = item.icon_mipmaps,
        icons = item.icons,
        prerequisites = { "automated-rail-transportation", "circuit-network", "advanced-circuit" },
        effects = { { type = "unlock-recipe", recipe = name } },
        unit = table.deepcopy(data.raw["technology"]["automated-rail-transportation"].unit),
        order = "c-g-c"
    }
    tech.unit.count = math.floor(tech.unit.count * 1.5)

    if (mods["nullius"]) then
        -- Enable technology
        tech.order = "nullius-" .. (tech.order or "")
        -- Use the same costs and requirements as for LTN
        tech.unit = {
            count = 100,
            ingredients = {
                { "nullius-geology-pack", 1 }, { "nullius-climatology-pack", 1 },
                { "nullius-mechanical-pack", 1 }, { "nullius-electrical-pack", 1 }
            },
            time = 25
        }
        tech.prerequisites = { "nullius-checkpoint-optimization", "nullius-traffic-control" }
        tech.ignore_tech_cost_multiplier = true
    end

    data:extend { item, entity, recipe, tech }
end

do
    -- v1: nothing
    -- v2: dispatcher output port
    local name = 'viirld2-dispatcher-out'

    local item = table.deepcopy(data.raw["item"]["viirld2-dispatcher"])
    item.name = name
    item.place_result = name
    item.order = "a[train-system]-f[viirld-dispatcher]"
    item.subgroup = data.raw["item"]["train-stop"].subgroup
    if (mods["nullius"]) then
        -- Enable item in Nullius and place next to the regular train stop
        item.order = "nullius-eca"
    end
    local entity = table.deepcopy(data.raw["constant-combinator"]["viirld2-dispatcher"])
    entity.name = name
    entity.minable.result = "viirld2-dispatcher"
    entity.icons = item.icons
    local function colorLight(tint)
        local light = table.deepcopy(data.raw["lamp"]["small-lamp"].picture_on)
        light.draw_as_glow = true
        light.tint = tint
        light.priority = "extra-high"
        --light.hr_version.draw_as_glow = true
        --light.hr_version.tint = tint
        --light.hr_version.priority = "extra-high"
        return {
            north = light,
            east = light,
            south = light,
            west = light
        }
    end
    entity.activity_led_sprites = colorLight { r = 1, g = 1, b = 0.5 }

    data:extend { item, entity }
end

do
    local function copyIcon(from, to)
        to.icons = from.icons
        to.icon = from.icon
        to.icon_size = from.icon_size
        to.icon_mipmaps = from.icon_mipmaps
    end
    local water = data.raw["fluid"]["water"]

    local sigSurface = {
        type = "fluid",
        name = "viirld2-surface-signal",
        base_color = water.base_color,
        flow_color = water.flow_color,
        default_temperature = 0,
        hidden = true,
        auto_barrel = false,
    }
    copyIcon(data.raw["virtual-signal"]["signal-yellow"], sigSurface)
    data:extend { sigSurface }

    local sigOrder = {
        type = "fluid",
        name = "viirld2-delivery-signal",
        base_color = water.base_color,
        flow_color = water.flow_color,
        default_temperature = 0,
        hidden = true,
        auto_barrel = false,
    }
    copyIcon(data.raw["virtual-signal"]["signal-white"], sigOrder)
    data:extend { sigOrder }

    local sigSkipUpdate = {
        type = "virtual-signal",
        name = "viirld2-skip-update-signal",
        icons = {
            {
                icon = data.raw["virtual-signal"]["signal-red"].icon,
                icon_size = data.raw["virtual-signal"]["signal-red"].icon_size,
                icon_mipmaps = data.raw["virtual-signal"]["signal-red"].icon_mipmaps,
            },
            {
                icon = data.raw["item"]["train-stop"].icon,
                icon_size = data.raw["item"]["train-stop"].icon_size,
                icon_mipmaps = data.raw["item"]["train-stop"].icon_mipmaps,
                scale = .35,
            },
        }
    }
    data:extend { sigSkipUpdate }

end

local lampLight = data.raw["lamp"]["small-lamp"].picture_on

data:extend {
    {
        type = "sprite",
        name = "viirld_stack",
        filename = "__core__/graphics/icons/technology/effect-constant/effect-constant-capacity.png",
        priority = "medium",
        width = 32 + 4,
        height = 32 + 4,
        x = 30 - 2,
        y = 30 - 2,
        flags = { "gui-icon" }
    },
    {
        type = "sprite",
        name = "viirld2_light",
        filename = lampLight.filename,
        width = lampLight.width,
        height = lampLight.height,
        shift = lampLight.shift,
        priority = "high",
        draw_as_glow = true,
        draw_as_light = true,
        apply_runtime_tint = true,
    }
}

local style = data.raw["gui-style"].default

style.viirld_count_label = {
    type = "label_style",
    parent = "count_label",
    width = 36,
    height = 9,
    horizontal_align = "right",
    --vertical_align = "bottom",
}

style.viirld_slot_button = {
    type = "button_style",
    parent = "slot_button",
}

style.viirld_slot_button_selected = {
    type = "button_style",
    parent = "viirld_slot_button",
    default_graphical_set = style.slot_button.selected_graphical_set,
    hovered_graphical_set = style.slot_button.selected_hovered_graphical_set,
    clicked_graphical_set = style.slot_button.selected_clicked_graphical_set,
}

style.viirld_unit = {
    type = "button_style",
    parent = "button",
    minimal_width = 20,
}

style.viirld_mem = {
    type = "button_style",
    parent = "button",
    minimal_width = 20,
}

local activeColor = { 0, 0.3, 0 }
style.viirld_mem_active = {
    type = "button_style",
    parent = "viirld_mem",
    default_font_color = activeColor,
    hovered_font_color = activeColor,
    clicked_font_color = activeColor,
}

style.viirld_draggable_space_header = {
    type = "empty_widget_style",
    parent = "draggable_space_header",
    horizontally_stretchable = "on",
    left_margin = 4,
    right_margin = 4,
    height = 24,
}

local whileColor = { 1, 1, 1 }

style.viirld_frame_button = {
    type = "button_style",
    parent = "frame_button",
    height = 24,
    default_font_color = whileColor,
    hovered_font_color = whileColor,
    clicked_font_color = whileColor,
    left_click_sound = { { filename = "__core__/sound/gui-tool-button.ogg", volume = 1 } }
}

style.viirld_number_textfield =
{
    type = "textbox_style",
    width = 120
}

style.viirld_tabbed_pane = table.deepcopy(style.tabbed_pane)
style.viirld_tabbed_pane.tab_content_frame.right_padding = 7
style.viirld_tabbed_pane.tab_content_frame.left_padding = 7
style.viirld_tabbed_pane.tab_content_frame.bottom_padding = 7
