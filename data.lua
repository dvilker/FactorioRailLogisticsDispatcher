local empty = util.empty_sprite(1)

local empty4 = {
    north = empty,
    east = empty,
    south = empty,
    west = empty
}

do
    -- TODO Unused now, remove after may 2025
    -- io ports
    local name = 'viirld-io'
    local entity = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
    entity.name = name
    entity.minable = nil
    entity.item_slot_count = 300
    entity.draw_cargo = false
    entity.draw_circuit_wires = false
    entity.selection_box = { { -0.0, -0.0 }, { 0.0, 0.0 } }
    entity.collision_box = { { -0.0, -0.0 }, { 0.0, 0.0 } }
    entity.collision_mask = { layers = {} }
    entity.flags = { "placeable-off-grid", "not-on-map", "not-blueprintable", "hide-alt-info" }
    entity.sprites = empty4
    entity.activity_led_sprites = empty4

    data:extend { entity }
end

do
    -- dispatcher
    local name = 'viirld-dispatcher'

    local item = table.deepcopy(data.raw["item"]["train-stop"])
    item.name = name
    item.place_result = name
    item.icon = "__base__/graphics/icons/small-lamp.png"
    item.icons = {
        {
            icon = "__base__/graphics/icons/train-stop.png",
            scale = .7,
        },
        {
            icon = "__base__/graphics/icons/small-lamp.png",
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

    local entity = table.deepcopy(data.raw["decider-combinator"]["decider-combinator"])
    entity.name = name
    entity.minable.result = name
    entity.icons = item.icons
    entity.corpse = data.raw["lamp"]["small-lamp"].corpse
    entity.dying_explosion = data.raw["lamp"]["small-lamp"].dying_explosion
    entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
    entity.collision_box = { { -0.25, -0.25 }, { 0.25, 0.25 } }
    entity.energy_source = { type = "void" }
    entity.additional_pastable_entities = { "viirld-dispatcher" }
    local function sprite(x)
        local s = table.deepcopy(data.raw["lamp"]["small-lamp"].picture_off)
        s.layers[#s.layers + 1] = {
            filename = "__RailLogisticsDispatcher__/graphics/connector.png",
            priority = "high",
            width = 9,
            height = 16,
            shift = { (x == 2 or x == 3) and .33 or -.33, (x == 0 or x == 3) and .12 or -.33 },
        }
        s.layers[#s.layers + 1] = {
            filename = "__RailLogisticsDispatcher__/graphics/connector.png",
            priority = "high",
            width = 9,
            height = 16,
            shift = { (x == 1 or x == 2) and .33 or -.33, (x == 2 or x == 3) and .12 or -.33 },
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
    local shadowDx = .05
    local shadowDy = .05
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

    -- ">" - gray
    entity.greater_symbol_sprites = empty4
    -- "<" - red
    entity.less_symbol_sprites = colorLight { r = 1, g = .25, b = .25 }
    -- "=" - white
    entity.equal_symbol_sprites = colorLight { r = 1, g = 1, b = 1 }
    -- "≥" - green
    entity.greater_or_equal_symbol_sprites = colorLight { r = 0, g = 1, b = 0 }
    -- "≤" - aqua
    entity.less_or_equal_symbol_sprites = colorLight { r = 0, g = 1, b = 1 }
    -- "≠" - yellow
    entity.not_equal_symbol_sprites = colorLight { r = 1, g = 1, b = 0 }

    --entity.right_shift_symbol_sprites = colorLight { r = 1, g = 1, b = 1 }
    --entity.and_symbol_sprites = colorLight { r = 0, g = .5, b = 0 }
    --entity.or_symbol_sprites = colorLight { r = .5, g = .5, b = 0 }
    --entity.xor_symbol_sprites = colorLight { r = 1, g = .25, b = .18 }

    local recipe = table.deepcopy(data.raw["recipe"]["train-stop"])
    recipe.name = name
    recipe.results = { { type = "item", name = name, amount = 1 } }
   recipe.icons = item.icons
    recipe.ingredients = {
        { type = "item", name = "advanced-circuit", amount = 1 },
        { type = "item", name = "copper-cable", amount = 2 },
        { type = "item", name = "small-lamp", amount = 1 },
    }
    recipe.enabled = false


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

    data:extend { item, entity, recipe, tech }
end


do
    local function copyIcon(from, to)
        to.icons = from.icons
        to.icon = from.icon
        to.icon_size = from.icon_size
        to.icon_mipmaps = from.icon_mipmaps
    end
    local water = data.raw["fluid"]["water"]


    local sigOrder = {
        type = "virtual-signal",
        name = "viirld-delivery",
        hidden = true,
        icons = {
            {
                icon = "__base__/graphics/icons/signal/signal_white.png",
            },
            {
                icon = "__base__/graphics/icons/train-stop.png",
                scale = .25,
            },
        }
    }
    data:extend { sigOrder }


    local sigSkipUpdate = {
        type = "virtual-signal",
        name = "viirld-delivery-pause",
        icons = {
            {
                icon = "__base__/graphics/icons/signal/signal_yellow.png",
            },
            {
                icon = "__base__/graphics/icons/train-stop.png",
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
    font = "default-bold",
    default_font_color = activeColor,
    hovered_font_color = activeColor,
    clicked_font_color = activeColor,
}

style.viirld_delete_button = {
    type = "button_style",
    parent = "frame_button",
    size = 24,
    padding = 0,
    top_margin = 6,
    invert_colors_of_picture_when_hovered_or_toggled = true,
}

style.viirld_hili_delete_button = {
    type = "button_style",
    parent = "red_button",
    size = 24,
    padding = 0,
    top_margin = 6,
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

style.viirld_number_textfield = {
    type = "textbox_style",
    width = 120
}

style.viirld_tabbed_pane = table.deepcopy(style.tabbed_pane)
style.viirld_tabbed_pane.tab_content_frame.right_padding = 7
style.viirld_tabbed_pane.tab_content_frame.left_padding = 7
style.viirld_tabbed_pane.tab_content_frame.bottom_padding = 7


data:extend({
    {
        type = "custom-input",
        name = "viirld-pause-key",
        key_sequence = "F",
        consuming = "none",
    }
})
