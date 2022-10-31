local empty = util.empty_sprite(1)

local empty4 = {
    north = empty,
    east = empty,
    south = empty,
    west = empty
}

do
    local name = 'yatm-io'
    local entity = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
    entity.name = name
    entity.minable = nil
    entity.item_slot_count = 50
    entity.draw_cargo = false
    entity.draw_circuit_wires = false
    entity.selection_box = { { -0.0, -0.0 }, { 0.0, 0.0 } }
    entity.collision_box = { { -0.0, -0.0 }, { 0.0, 0.0 } }
    entity.collision_mask = { }
    entity.flags = { "placeable-off-grid", "not-on-map", "not-blueprintable", "hidden", "hide-alt-info" }
    entity.sprites = empty4
    entity.activity_led_sprites = empty4

    data:extend { entity }
end

do
    local name = 'yatm-dispatcher'

    local item = table.deepcopy(data.raw["item"]["arithmetic-combinator"])
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
            --tint = v.tint,
            --scale = .3,
            --shift = v.shift,
        },
        {
            icon = data.raw["item"]["small-lamp"].icon,
            icon_size = data.raw["item"]["small-lamp"].icon_size,
            icon_mipmaps = data.raw["item"]["small-lamp"].icon_mipmaps,
            scale = .35,
            shift = { -5, 9 }
            --tint = { r = 1, g = 1, b = 1, a = 1 },
        },
    }
    item.order = data.raw["item"]["train-stop"].order
    item.subgroup = data.raw["item"]["train-stop"].subgroup

    local entity = table.deepcopy(data.raw["arithmetic-combinator"]["arithmetic-combinator"])
    entity.name = name
    entity.minable.result = name
    entity.icons = item.icons
    entity.corpse = data.raw["lamp"]["small-lamp"].corpse
    entity.dying_explosion = data.raw["lamp"]["small-lamp"].dying_explosion
    entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
    entity.collision_box = { { -0.25, -0.25 }, { 0.25, 0.25 } }
    entity.energy_source = { type = "void" }
    local function sprite(x)
        return {
            layers = {
                {
                    filename = "__yatm__/gfx/disp.png",
                    priority = "high",
                    width = 42,
                    height = 35,
                    x = x * 42,
                    frame_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    --shift = util.by_pixel(0, 3),
                    hr_version = {
                        filename = "__yatm__/gfx/hr-disp.png",
                        priority = "high",
                        width = 84,
                        x = x * 84,
                        height = 70,
                        frame_count = 1,
                        axially_symmetrical = false,
                        direction_count = 1,
                        --shift = util.by_pixel(0.25, 3),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/small-lamp/lamp-shadow.png",
                    priority = "high",
                    width = 38,
                    height = 24,
                    frame_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    --shift = util.by_pixel(4, 5),
                    draw_as_shadow = true,
                    hr_version = {
                        filename = "__base__/graphics/entity/small-lamp/hr-lamp-shadow.png",
                        priority = "high",
                        width = 76,
                        height = 47,
                        frame_count = 1,
                        axially_symmetrical = false,
                        direction_count = 1,
                        --shift = util.by_pixel(4, 4.75),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        }
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
    local left = -22 / 84
    local right = 20 / 84
    local top = -29 / 70
    local bottom = -2 / 70
    local shadowDx = 2 / 84
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
        local light = {
            filename = "__base__/graphics/entity/small-lamp/lamp-light.png",
            priority = "high",
            width = 46,
            height = 40,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(0, -7),
            draw_as_glow = true,
            tint = tint,
            hr_version = {
                filename = "__base__/graphics/entity/small-lamp/hr-lamp-light.png",
                priority = "high",
                width = 90,
                height = 78,
                frame_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(0, -7),
                draw_as_glow = true,
                tint = tint,
                scale = 0.5
            }
        }
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
    --entity.xor_symbol_sprites = colorLight {r = .5, g = .5, b = .5}

    local recipe = table.deepcopy(data.raw["recipe"]["arithmetic-combinator"])
    recipe.name = name
    recipe.result = name
    recipe.icons = item.icons
    recipe.ingredients = {
        { "electronic-circuit", 10 },
        { "copper-cable", 4 },
        { "small-lamp", 1 },
    }
    recipe.enabled = true

    data:extend { item, entity, recipe }
end

data:extend {
    {
        type = "sprite",
        name = "yatm_stack",
        filename = "__core__/graphics/icons/technology/effect-constant/effect-constant-capacity.png",
        priority = "medium",
        width = 32 + 4,
        height = 32 + 4,
        x = 30 - 2,
        y = 30 - 2,
        flags = { "gui-icon" }
    }
}

local style = data.raw["gui-style"].default

style.yatm_count_label = {
    type = "label_style",
    parent = "count_label",
    width = 36,
    height = 9,
    horizontal_align = "right",
    --vertical_align = "bottom",
}

style.yatm_slot_button = {
    type = "button_style",
    parent = "slot_button",
}

style.yatm_slot_button_selected = {
    type = "button_style",
    parent = "yatm_slot_button",
    default_graphical_set = style.slot_button.selected_graphical_set,
    hovered_graphical_set = style.slot_button.selected_hovered_graphical_set,
    clicked_graphical_set = style.slot_button.selected_clicked_graphical_set,
}

style.yatm_unit = {
    type = "button_style",
    parent = "button",
    minimal_width = 20,
}

style.yatm_mem = {
    type = "button_style",
    parent = "button",
    minimal_width = 20,
}

local activeColor = { 0, 0.3, 0 }
style.yatm_mem_active = {
    type = "button_style",
    parent = "yatm_mem",
    default_font_color = activeColor,
    hovered_font_color = activeColor,
    clicked_font_color = activeColor,
}

style.yatm_draggable_space_header = {
    type = "empty_widget_style",
    parent = "draggable_space_header",
    horizontally_stretchable = "on",
    left_margin = 4,
    right_margin = 4,
    height = 24,
}

local whileColor = { 1, 1, 1 }

style.yatm_frame_button = {
    type = "button_style",
    parent = "frame_button",
    height = 24,
    default_font_color = whileColor,
    hovered_font_color = whileColor,
    clicked_font_color = whileColor,
    left_click_sound = { { filename = "__core__/sound/gui-tool-button.ogg", volume = 1 } }
}

style.yatm_tabbed_pane = table.deepcopy(style.tabbed_pane)
style.yatm_tabbed_pane.tab_content_frame.right_padding = 7
style.yatm_tabbed_pane.tab_content_frame.left_padding = 7
style.yatm_tabbed_pane.tab_content_frame.bottom_padding = 7
