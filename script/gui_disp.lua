---@class DispGui: GuiSelf
---@field player LuaPlayer
---@field disp DispClass|nil
---@field ghost LuaEntity|nil
---@field data DispSettings
---@field model GuiModel
---@field ioRows table<string, GuiModel>
---@field deliveryRows table<DeliveryUid, GuiModel>
---@field statRows table<string, GuiModel>
---@field depotStatRows table<string, GuiModel>
---@field selectedButton number|nil
---@field selectedItem DispSettingsItem|nil
---@field itemByIndex table<number, DispSettingsItem>
---@field doFocusTo number|nil
---@field doUpdateVisible boolean|nil
---@field doUpdateElemButtons boolean|nil
---@field doUpdateCounters boolean|nil
---@field doUpdateItemForm boolean|nil
---@field doUpdateMemButtons boolean|nil
DispGuiLua = {}
guiHandlers["DispGuiLua"] = DispGuiLua

local TAB_STATUS = 1201

--local DIV_ = 1000
local DIV_TABS = 1005
local DIV_ENDPOINT = 1001
--local DIV_DEPOT = 1002
--local DIV_CLEAN = 1003
local DIV_COMMON = 1004
local EL_DEBUG = 1005
local EL_TITLE = 1006

local DIV_ITEM = 1101
local DIV_ANY_ITEM = 1102

local FLAG_useSignals = 2003
local FLAG_useEquals = 2004
local FLAG_turnInserters = 2006
local FLAG_itemCompounds = 2007
local FLAG_fluidCompounds = 2008
local FLAG_liquidation = 2010

local EL_OUT_MODE = 2012
local EL_OUT_MODE_TARGET_CONTENTS = 2012001
local EL_OUT_MODE_EXCHANGE = 2012002
local EL_OUT_MODE_NEGATE = 2013

local EL_MODE = 3001
local EL_MODE_OFF = 3001001
local EL_MODE_ENDPOINT = 3001002
local EL_MODE_LIQUIDATION = 3001003
local EL_MODE_DEPOT = 3001004

local EL_NETWORK = 3003
local EL_LEN = 3004
local EL_LEN_MIN = 3005
local EL_LEN_MAX = 3006
local EL_STATION_TEMPLATE = 3007

local EL_ITEM_BUTTON = 3101
local EL_ITEM_ALLOW_PROVIDE = 3102
local EL_ITEM_ALLOW_REQUEST = 3103
local EL_ITEM_REQUEST = 3104
local EL_ITEM_REQUEST_UNIT = 3105
local EL_ITEM_MIN = 3106
local EL_ITEM_MIN_UNIT = 3107

local EL_ITEM_MEM_BUTTON = 3150
---@field allowAnyItemProvide true|nil
---@field allowAnyItemRequest true|nil
---@field minAnyItem CountWithUnits|nil
---@field allowAnyFluidProvide true|nil
---@field allowAnyFluidRequest true|nil
---@field minAnyFluid CountWithUnits|nil
---
local EL_ALLOW_ANY_ITEM_PROVIDE = 3201
local EL_ALLOW_ANY_ITEM_REQUEST = 3202
local EL_MIN_ANY_ITEM = 3203
local EL_MIN_ANY_ITEM_UNIT = 3204
local EL_ALLOW_ANY_FLUID_PROVIDE = 3211
local EL_ALLOW_ANY_FLUID_REQUEST = 3212
local EL_MIN_ANY_FLUID = 3213
local EL_MIN_ANY_FLUID_UNIT = 3214

local EL_IO_TABLE = 5005
local EL_DELIVERIES_TABLE = 5006
local EL_CARGO_STAT_TABLE = 5007
local EL_DEPOT_STAT_TABLE = 5008
local EL_ERR_TABLE = 5009

local EL_STAT_TRAINS = 6001

local EL_PAUSE = 9003

local FOCUS_TO_ITEM_REQUEST = 1
local FOCUS_TO_ANY_MIN = 2
local FOCUS_TO_MIN_ANY_ITEM = 3
local FOCUS_TO_MIN_ANY_FLUID = 4

---@param event OnGuiOpened
function DispGuiLua.open(event)
    local player = game.get_player(event.player_index)

    ---@type DispClass
    local disp
    ---@type LuaEntity
    local ghost

    if event.entity.name == "viirld-dispatcher" then
        disp = storage.disps[event.entity.unit_number]
    elseif event.entity.type == "entity-ghost" and event.entity.ghost_name == "viirld-dispatcher" then
        ghost = event.entity
    end
    if not disp and not ghost then
        player.opened = nil
        return
    end

    ---@type DispGui
    local gui = {
        player = player,
        disp = disp,
        ghost = ghost,
        ioRows = {},
        deliveryRows = {},
        statRows = {},
        depotStatRows = {},
        eventHandlers = "DispGuiLua",
    }
    if disp then
        disp.gui = gui
    end
    DispGuiLua._loadData(gui)
    local STYLE_MARGIN = { left_margin = 12 }
    gui.model = createGuiModel(
            gui.player.gui.screen,
            gui,
            { type = "frame", onClosed = DispGuiLua._on_close, direction = "vertical", auto_center = true, _style1 = { minimal_height = 600 }, _sub = {
                { type = "flow", _sub = {
                    { type = "label", style = "frame_title", _name = EL_TITLE, caption = "?", _dragTarget = "" },
                    { type = "empty-widget", style = "viirld_draggable_space_header", _dragTarget = "" },
                    { type = "button", caption = { "viirld-gui.EL_PAUSE" }, style = "viirld_frame_button", tooltip = { "viirld-gui.EL_PAUSE-tt" }, _name = EL_PAUSE, onClick = DispGuiLua._on_EL_PAUSE_click },
                    { type = "button", caption = { "viirld-gui.EL_ROLLBACK" }, style = "viirld_frame_button", onClick = DispGuiLua._on_EL_ROLLBACK_click },
                    { type = "button", caption = { "viirld-gui.EL_APPLY" }, style = "viirld_frame_button", onClick = DispGuiLua._on_EL_APPLY_click },
                    { type = "sprite-button", onClick = DispGuiLua._on_close, style = "close_button", sprite = "utility/close", hovered_sprite = "utility/close_black" },
                } },
                { type = "flow", direction = "horizontal", _name = DIV_TABS, _sub = {
                    { type = "frame", style = "entity_frame", _style1 = { vertically_stretchable = true }, direction = "vertical", _sub = {
                        { type = "flow", direction = "horizontal", _sub = {
                            { type = "flow", direction = "vertical", _sub = {
                                { type = "radiobutton", state = false, _share = EL_MODE, onChanged = DispGuiLua._on_EL_MODE, _value = EL_MODE_OFF, caption = { "viirld-gui.EL_MODE_OFF" }, tooltip = { "viirld-gui.EL_MODE_OFF-tt" } },
                                { type = "radiobutton", state = false, _share = EL_MODE, onChanged = DispGuiLua._on_EL_MODE, _value = EL_MODE_ENDPOINT, caption = { "viirld-gui.EL_MODE_ENDPOINT" }, tooltip = { "viirld-gui.EL_MODE_ENDPOINT-tt" } },
                                { type = "radiobutton", state = false, _share = EL_MODE, onChanged = DispGuiLua._on_EL_MODE, _value = EL_MODE_LIQUIDATION, caption = { "viirld-gui.EL_MODE_LIQUIDATION" }, tooltip = { "viirld-gui.EL_MODE_LIQUIDATION-tt" } },
                                { type = "radiobutton", state = false, _share = EL_MODE, onChanged = DispGuiLua._on_EL_MODE, _value = EL_MODE_DEPOT, caption = { "viirld-gui.EL_MODE_DEPOT" }, tooltip = { "viirld-gui.EL_MODE_DEPOT-tt" } },

                                { type = "line", _style1 = { top_margin = 10, bottom_margin = 10 } },

                                { type = "table", column_count = 2, _autoSharesFrom = 2, _sub = {
                                    { type = "label", _share = EL_NETWORK, caption = { "viirld-gui.EL_NETWORK" }, tooltip = { "viirld-gui.EL_NETWORK-tt" } },
                                    { type = "textfield", _share = EL_NETWORK, _name = EL_NETWORK, onChanged = DispGuiLua._on_EL_NETWORK, onConfirmed = DispGuiLua._on_close, text = "1", tooltip = { "viirld-gui.EL_NETWORK-tt" }, _style2 = { width = 100 }, numeric = true, allow_decimal = false, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", _style1 = STYLE_MARGIN, },

                                    { type = "label", _share = EL_LEN, caption = { "viirld-gui.EL_LEN" }, enabled = false, tooltip = { "viirld-gui.EL_LEN-tt" } },
                                    { type = "flow", direction = "horizontal", _style1 = STYLE_MARGIN, _style2 = { vertical_align = "center" }, _sub = {
                                        { type = "textfield", _name = EL_LEN_MIN, _share = EL_LEN, enabled = false, onChanged = DispGuiLua._on_EL_LEN, onConfirmed = DispGuiLua._on_close, text = "1", tooltip = { "viirld-gui.EL_LEN-tt" }, _style1 = { width = 50 }, numeric = true, allow_decimal = false, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield" },
                                        { type = "label", _share = EL_LEN, caption = "–", enabled = false, tooltip = { "viirld-gui.EL_LEN-tt" }, },
                                        { type = "textfield", _name = EL_LEN_MAX, _share = EL_LEN, enabled = false, onChanged = DispGuiLua._on_EL_LEN, onConfirmed = DispGuiLua._on_close, text = "1", tooltip = { "viirld-gui.EL_LEN-tt" }, _style1 = { width = 50 }, numeric = true, allow_decimal = false, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield" },
                                    } },

                                    { type = "label", _share = EL_STATION_TEMPLATE, caption = { "viirld-gui.EL_STATION_TEMPLATE" }, tooltip = { "viirld-gui.EL_STATION_TEMPLATE-tt" } },
                                    { type = "textfield", _share = EL_STATION_TEMPLATE, _name = EL_STATION_TEMPLATE, onChanged = DispGuiLua._on_EL_STATION_TEMPLATE, onConfirmed = DispGuiLua._on_close, text = "1", tooltip = { "viirld-gui.EL_STATION_TEMPLATE-tt" }, _style2 = { width = 120 }, icon_selector = true, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", _style1 = STYLE_MARGIN, },
                                } },
                            } },
                            { type = "flow", direction = "vertical", _style1 = STYLE_MARGIN, _sub = {
                                { type = "radiobutton", state = false, _share = EL_OUT_MODE, onChanged = DispGuiLua._on_EL_OUT_MODE, _value = EL_OUT_MODE_TARGET_CONTENTS, caption = { "viirld-gui.EL_OUT_MODE_TARGET_CONTENTS" }, tooltip = { "viirld-gui.EL_OUT_MODE_TARGET_CONTENTS-tt" } },
                                { type = "radiobutton", state = false, _share = EL_OUT_MODE, onChanged = DispGuiLua._on_EL_OUT_MODE, _value = EL_OUT_MODE_EXCHANGE, caption = { "viirld-gui.EL_OUT_MODE_EXCHANGE" }, tooltip = { "viirld-gui.EL_OUT_MODE_EXCHANGE-tt" } },
                                { type = "checkbox", _name = EL_OUT_MODE_NEGATE, onChanged = DispGuiLua._on_EL_OUT_MODE_NEGATE, caption = { "viirld-gui.EL_OUT_MODE_NEGATE" }, tooltip = { "viirld-gui.EL_OUT_MODE_NEGATE-tt" } },
                                { type = "line", _style1 = { top_margin = 10, bottom_margin = 10 } },
                                { type = "checkbox", _name = FLAG_useSignals, onChanged = DispGuiLua._on_FLAG, caption = { "viirld-gui.FLAG_useSignals" }, tooltip = { "viirld-gui.FLAG_useSignals-tt" } },
                                { type = "checkbox", _name = FLAG_useEquals, onChanged = DispGuiLua._on_FLAG, caption = { "viirld-gui.FLAG_useEquals" }, tooltip = { "viirld-gui.FLAG_useEquals-tt" } },
                                { type = "checkbox", _name = FLAG_turnInserters, onChanged = DispGuiLua._on_FLAG, caption = { "viirld-gui.FLAG_turnInserters" }, tooltip = { "viirld-gui.FLAG_turnInserters-tt" } },
                                { type = "checkbox", _name = FLAG_itemCompounds, onChanged = DispGuiLua._on_FLAG, caption = { "viirld-gui.FLAG_itemCompounds" }, tooltip = { "viirld-gui.FLAG_itemCompounds-tt" } },
                                { type = "checkbox", _name = FLAG_fluidCompounds, onChanged = DispGuiLua._on_FLAG, caption = { "viirld-gui.FLAG_fluidCompounds" }, tooltip = { "viirld-gui.FLAG_fluidCompounds-tt" } },
                            } },
                        } },
                        { type = "flow", direction = "vertical", _sub = {
                            { type = "flow", direction = "vertical", _name = DIV_ENDPOINT, _sub = {
                                { type = "line", },
                                { type = "frame", style = "slot_button_deep_frame", _sub = {
                                    { type = "table", style = "slot_table", column_count = 12, _sub = (
                                            function()
                                                ---@type GuiDef[]
                                                local buttons = {}
                                                buttons[#buttons + 1] = { type = "choose-elem-button", _share = EL_ITEM_BUTTON, onClick = DispGuiLua._on_click_EL_ITEM_BUTTON, onChanged = DispGuiLua._on_EL_ITEM_BUTTON, _value = -1, tooltip = { "viirld-gui.EL_ITEM_BUTTON-ANY-tt" }, style = "viirld_slot_button", elem_type = "signal", elem_value = { type = "virtual", name = "signal-anything" }, locked = true, _sub = {
                                                    { type = "flow", direction = "vertical", _style1 = { top_padding = 9 }, ignored_by_interaction = true, _sub = {
                                                        { type = "label", caption = "R", ignored_by_interaction = true, style = "viirld_count_label" },
                                                        { type = "label", caption = "M", ignored_by_interaction = true, style = "viirld_count_label" },
                                                    } }
                                                } }
                                                for i = 1, dispatcherSignalSlotCount - 1 do
                                                    buttons[#buttons + 1] = { type = "choose-elem-button", _share = EL_ITEM_BUTTON, onClick = DispGuiLua._on_click_EL_ITEM_BUTTON, onChanged = DispGuiLua._on_EL_ITEM_BUTTON, _value = i, tooltip = { "viirld-gui.EL_ITEM_BUTTON-tt" }, style = "viirld_slot_button", elem_type = "signal", _sub = {
                                                        { type = "flow", direction = "vertical", _style1 = { top_padding = 9 }, ignored_by_interaction = true, _sub = {
                                                            { type = "label", caption = "R", ignored_by_interaction = true, style = "viirld_count_label" },
                                                            { type = "label", caption = "M", ignored_by_interaction = true, style = "viirld_count_label" },
                                                        } }
                                                    } }
                                                end
                                                return buttons
                                            end)()
                                    }
                                } },
                                { type = "flow", direction = "vertical", style = "vertical_flow", _name = DIV_ITEM, _sub = {
                                    { type = "table", column_count = 3, _sub = {
                                        { type = "checkbox", _name = EL_ITEM_ALLOW_PROVIDE, onChanged = DispGuiLua._on_EL_ITEM_ALLOW_PROVIDE, caption = { "viirld-gui.EL_ITEM_ALLOW_PROVIDE" }, tooltip = { "viirld-gui.EL_ITEM_ALLOW_PROVIDE-tt" }, _style1 = { top_margin = 12 } },
                                        { type = "empty-widget" },
                                        { type = "empty-widget" },
                                        { type = "checkbox", _name = EL_ITEM_ALLOW_REQUEST, onChanged = DispGuiLua._on_EL_ITEM_ALLOW_REQUEST, caption = { "viirld-gui.EL_ITEM_ALLOW_REQUEST" }, tooltip = { "viirld-gui.EL_ITEM_ALLOW_REQUEST-tt" }, _style1 = { top_margin = 12 } },
                                        { type = "flow", direction = "horizontal", _style1 = { top_margin = 12 }, _sub = {
                                            { type = "textfield", _name = EL_ITEM_REQUEST, _share = EL_ITEM_ALLOW_REQUEST, onChanged = DispGuiLua._on_EL_ITEM_REQUEST, onConfirmed = DispGuiLua._on_close, text = "1000", tooltip = { "viirld-gui.EL_ITEM_REQUEST-tt" }, numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", _style1 = STYLE_MARGIN, },
                                            { type = "button", _name = EL_ITEM_REQUEST_UNIT, _share = EL_ITEM_ALLOW_REQUEST, onClick = DispGuiLua._on_EL_ITEM_REQUEST_UNIT_click, tooltip = { "viirld-gui.EL_ITEM_REQUEST-tt" }, style = "viirld_unit" },
                                        } },
                                        { type = "empty-widget" },
                                        { type = "label", caption = { "viirld-gui.EL_ITEM_MIN" }, _share = EL_ITEM_ALLOW_REQUEST, tooltip = { "viirld-gui.EL_ITEM_MIN-tt" }, _style1 = { left_margin = 45 } },
                                        { type = "flow", direction = "horizontal", _sub = {
                                            { type = "textfield", _name = EL_ITEM_MIN, _share = EL_ITEM_ALLOW_REQUEST, onChanged = DispGuiLua._on_EL_ITEM_REQUEST_MIN, onConfirmed = DispGuiLua._on_close, text = "500", tooltip = { "viirld-gui.EL_ITEM_MIN-tt" }, numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", _style1 = STYLE_MARGIN, },
                                            { type = "button", _name = EL_ITEM_MIN_UNIT, _share = EL_ITEM_ALLOW_REQUEST, onClick = DispGuiLua._on_EL_ITEM_REQUEST_MIN_UNIT_click, tooltip = { "viirld-gui.EL_ITEM_MIN-tt" }, style = "viirld_unit" },
                                        } },
                                        { type = "empty-widget" },
                                    } },
                                    { type = "line", _style1 = { top_margin = 12 } },
                                    { type = "flow", direction = "horizontal", _style1 = { vertical_align = "center", top_margin = 12 }, _sub = (
                                            function()
                                                ---@type GuiDef[]
                                                local buttons = {}
                                                buttons[#buttons + 1] = { type = "label", caption = { "viirld-gui.EL_ITEM_MEM_BUTTON" }, tooltip = { "viirld-gui.EL_ITEM_MEM_BUTTON-tt" }, _style1 = { right_margin = 12 } }
                                                for i = 1, 10 do
                                                    buttons[#buttons + 1] = { type = "button", _share = EL_ITEM_MEM_BUTTON, onClick = DispGuiLua._on_EL_ITEM_MEM_BUTTON_click, _value = i, style = "viirld_mem", caption = tostring(i), tooltip = { "viirld-gui.EL_ITEM_MEM_BUTTON-tt" } }
                                                end
                                                return buttons
                                            end)()
                                    }
                                } },
                                { type = "flow", direction = "vertical", style = "vertical_flow", _name = DIV_ANY_ITEM, _sub = {
                                    { type = "table", column_count = 3, _sub = {
                                        { type = "label", caption = { "viirld-gui.ANY_ITEM_BY_SIGNALS" }, _style1 = { top_margin = 12 } },
                                        { type = "empty-widget" },
                                        { type = "empty-widget" },

                                        { type = "checkbox", _name = EL_ALLOW_ANY_ITEM_PROVIDE, onChanged = DispGuiLua._on_EL_ALLOW_ANY_ITEM_PROVIDE, caption = { "viirld-gui.EL_ALLOW_ANY_ITEM_PROVIDE" }, tooltip = { "viirld-gui.EL_ALLOW_ANY_ITEM_PROVIDE-tt" }, _style1 = { top_margin = 12, left_margin = 20 } },
                                        { type = "empty-widget" },
                                        { type = "empty-widget" },

                                        { type = "checkbox", _name = EL_ALLOW_ANY_ITEM_REQUEST, onChanged = DispGuiLua._on_EL_ALLOW_ANY_ITEM_REQUEST, caption = { "viirld-gui.EL_ALLOW_ANY_ITEM_REQUEST" }, tooltip = { "viirld-gui.EL_ALLOW_ANY_ITEM_REQUEST-tt" }, _style1 = { top_margin = 12, left_margin = 20 } },
                                        { type = "flow", direction = "horizontal", _style1 = { top_margin = 12, left_margin = 12, vertical_align = "center" }, _sub = {
                                            { type = "label", enabled = false, caption = { "viirld-gui.EL_MIN_ANY_ITEM" }, _share = EL_MIN_ANY_ITEM, tooltip = { "viirld-gui.EL_MIN_ANY_ITEM-tt" } },
                                            { type = "textfield", enabled = false, _name = EL_MIN_ANY_ITEM, _share = EL_MIN_ANY_ITEM, onChanged = DispGuiLua._on_EL_MIN_ANY_ITEM, onConfirmed = DispGuiLua._on_close, text = "1000", tooltip = { "viirld-gui.EL_MIN_ANY_ITEM-tt" }, numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", },
                                            { type = "button", enabled = false, _name = EL_MIN_ANY_ITEM_UNIT, _share = EL_MIN_ANY_ITEM, onClick = DispGuiLua._on_EL_MIN_ANY_ITEM_UNIT_click, tooltip = { "viirld-gui.EL_MIN_ANY_ITEM-tt" }, style = "viirld_unit" },
                                        } },
                                        { type = "empty-widget" },

                                        { type = "label", caption = { "viirld-gui.ANY_FLUID_BY_SIGNALS" }, _style1 = { top_margin = 12 } },
                                        { type = "empty-widget" },
                                        { type = "empty-widget" },
                                        { type = "checkbox", _name = EL_ALLOW_ANY_FLUID_PROVIDE, onChanged = DispGuiLua._on_EL_ALLOW_ANY_FLUID_PROVIDE, caption = { "viirld-gui.EL_ALLOW_ANY_FLUID_PROVIDE" }, tooltip = { "viirld-gui.EL_ALLOW_ANY_FLUID_PROVIDE-tt" }, _style1 = { top_margin = 12, left_margin = 20 } },
                                        { type = "empty-widget" },
                                        { type = "empty-widget" },

                                        { type = "checkbox", _name = EL_ALLOW_ANY_FLUID_REQUEST, onChanged = DispGuiLua._on_EL_ALLOW_ANY_FLUID_REQUEST, caption = { "viirld-gui.EL_ALLOW_ANY_FLUID_REQUEST" }, tooltip = { "viirld-gui.EL_ALLOW_ANY_FLUID_REQUEST-tt" }, _style1 = { top_margin = 12, left_margin = 20 } },
                                        { type = "flow", direction = "horizontal", _style1 = { top_margin = 12, left_margin = 12, vertical_align = "center" }, _sub = {
                                            { type = "label", caption = { "viirld-gui.EL_MIN_ANY_FLUID" }, _share = EL_MIN_ANY_FLUID, tooltip = { "viirld-gui.EL_MIN_ANY_FLUID-tt" } },
                                            { type = "textfield", _name = EL_MIN_ANY_FLUID, _share = EL_MIN_ANY_FLUID, onChanged = DispGuiLua._on_EL_MIN_ANY_FLUID, onConfirmed = DispGuiLua._on_close, text = "1000", tooltip = { "viirld-gui.EL_MIN_ANY_FLUID-tt" }, numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", },
                                            { type = "button", _name = EL_MIN_ANY_FLUID_UNIT, _share = EL_MIN_ANY_FLUID, onClick = DispGuiLua._on_EL_MIN_ANY_FLUID_UNIT_click, tooltip = { "viirld-gui.EL_MIN_ANY_FLUID-tt" }, style = "viirld_unit" },
                                        } },
                                        { type = "empty-widget" },
                                    } },
                                    { type = "line", _style1 = { top_margin = 12 } },
                                    { type = "flow", direction = "horizontal", _style1 = { vertical_align = "center", top_margin = 12 }, _sub = (
                                            function()
                                                ---@type GuiDef[]
                                                local buttons = {}
                                                buttons[#buttons + 1] = { type = "label", caption = { "viirld-gui.EL_ITEM_MEM_BUTTON" }, tooltip = { "viirld-gui.EL_ITEM_MEM_BUTTON-tt" }, _style1 = { right_margin = 12 } }
                                                for i = 1, 10 do
                                                    buttons[#buttons + 1] = { type = "button", _share = EL_ITEM_MEM_BUTTON, onClick = DispGuiLua._on_EL_ITEM_MEM_BUTTON_click, _value = i, style = "viirld_mem", caption = tostring(i), tooltip = { "viirld-gui.EL_ITEM_MEM_BUTTON-tt" } }
                                                end
                                                return buttons
                                            end)()
                                    }
                                } },
                            } },
                            --{ type = "flow", direction = "vertical", _share = DIV_, _name = DIV_DEPOT },
                        } }
                    } },
                    { type = "scroll-pane", style = "scroll_pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "always", _style1 = { vertically_stretchable = true, padding = 6 }, direction = "vertical", _share = TAB_STATUS, _sub = {
                        { type = "flow", direction = "vertical", _style1 = { vertically_stretchable = true, vertical_spacing = 8 }, _sub = {
                            { type = "table", column_count = 3, _name = EL_ERR_TABLE, _share = EL_ERR_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = "", style = "heading_2_label" },
                                { type = "label", caption = { "viirld-gui.EL_ERR_TABLE-H-ERROR" }, style = "heading_2_label", _style1 = { minimal_width = 150 } },
                                { type = "label", caption = { "viirld-gui.EL_ERR_TABLE-H-TIME" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "center" } },
                            }, _row = {
                                { type = "label", caption = "[img=utility/warning_icon]" },
                                { type = "label", caption = "" },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "center" } },
                            } },
                            { type = "line", _share = EL_ERR_TABLE },
                            { type = "label", caption = { "viirld-gui.EL_IO_TABLE-TITLE", table.concat(REQUEST_COLOR, ','), table.concat(PROVIDE_COLOR, ',') }, style = "caption_label" },
                            { type = "table", column_count = 5, _name = EL_IO_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = "", style = "heading_2_label" },
                                { type = "label", caption = { "viirld-gui.EL_IO_TABLE-H-ON_STATION" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "viirld-gui.EL_IO_TABLE-H-BALANCE" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "viirld-gui.EL_IO_TABLE-H-ON_WAY" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", style = "heading_2_label", },
                            }, _row = {
                                { type = "label", caption = "" },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "" },
                            } },
                            { type = "line" },
                            { type = "label", caption = { "viirld-gui.EL_DELIVERIES_TABLE-TITLE" }, style = "caption_label" },
                            { type = "table", column_count = 4, _name = EL_DELIVERIES_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = { "viirld-gui.EL_DELIVERIES_TABLE-H-FROM" }, style = "heading_2_label", _style1 = { minimal_width = 150 } },
                                { type = "label", caption = { "viirld-gui.EL_DELIVERIES_TABLE-H-TO" }, style = "heading_2_label", _style1 = { minimal_width = 150 } },
                                { type = "label", caption = { "viirld-gui.EL_DELIVERIES_TABLE-H-TIME" }, style = "heading_2_label", _style1 = { minimal_width = 64, horizontal_align = "center" } },
                                { type = "label", caption = "", style = "heading_2_label", _style1 = { width = 36 } },
                            }, _row = {
                                { type = "label", caption = "", _style1 = { single_line = false } },
                                { type = "label", caption = "", _style1 = { single_line = false } },
                                { type = "label", caption = "", _style1 = { minimal_width = 64, horizontal_align = "center" } },
                                { type = "sprite-button", onClick = DispGuiLua._on_EL_DELETE_DELIVERY_click, style = "viirld_delete_button", tooltip = { "viirld-gui.EL_DELETE_DELIVERY-tt" }, sprite = "utility/trash_white" },
                            } },
                            { type = "line" },
                            { type = "flow", direction = "horizontal", _sub = {
                                { type = "label", caption = { "viirld-gui.EL_CARGO_STAT_TABLE-TITLE" }, style = "caption_label" },
                                { type = "empty-widget", _style1 = { horizontally_stretchable = true } },
                                { type = "label", caption = { "viirld-gui.EL_STAT_TRAINS", 0 }, _name = EL_STAT_TRAINS },
                            } },
                            { type = "table", column_count = 4, _name = EL_CARGO_STAT_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = { "viirld-gui.EL_CARGO_STAT_TABLE-H-COUNT" }, style = "heading_2_label", _style1 = { minimal_width = 70 } },
                                { type = "label", caption = { "viirld-gui.EL_CARGO_STAT_TABLE-H-SENT" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "viirld-gui.EL_CARGO_STAT_TABLE-H-RECV" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "viirld-gui.EL_CARGO_STAT_TABLE-H-LASTTIME" }, style = "heading_2_label" },
                            }, _row = {
                                { type = "label", caption = "", _style1 = { minimal_width = 70 } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "center" } },
                            } },
                            { type = "table", column_count = 3, _name = EL_DEPOT_STAT_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = "", style = "heading_2_label", _style1 = { minimal_width = 70 } },
                                { type = "label", caption = { "viirld-gui.EL_DEPOT_STAT_TABLE-H-trains" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "viirld-gui.EL_DEPOT_STAT_TABLE-H-freeTrains" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                            }, _row = {
                                { type = "label", caption = "", _style1 = { minimal_width = 70 } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                            } },
                            { type = "line", _skip = (not debugMode) or nil },
                            { type = "label", caption = "Debug", style = "caption_label", _skip = (not debugMode) or nil },
                            { type = "label", _name = EL_DEBUG, caption = "", _style1 = { single_line = false }, _skip = (not debugMode) or nil },
                        } },
                    } }
                } },
            } }
    )
    DispGuiLua.updateStationName(gui)
    gui.model.onAfterEvent = "_on_afterEvent"
    DispGuiLua._dataToForm(gui)
    DispGuiLua.updateDispInfo(gui)
    gui.player.opened = gui.model.root
    --gui.model.root.force_auto_center()
end

---@param gui DispGui
function DispGuiLua.updateStationName(gui)
    local disp = gui.disp
    if disp then
        gui.model.named[EL_TITLE].caption = { "viirld-gui.WINDOW_TITLE", disp.stopName or "?" }
    elseif gui.ghost then
        gui.model.named[EL_TITLE].caption = { "viirld-gui.WINDOW_TITLE-ghost" }
    end
end

---@param gui DispGui
function DispGuiLua._loadData(gui)
    if gui.disp then
        gui.data = table.deepcopy(gui.disp.settings)
    elseif gui.ghost then
        gui.data = dispCombinatorToSettings(gui.ghost)
        if not gui.data then
            gui.data = dispDefaultSettings()
        end
    else
        error("!disp!ghost")
    end
    gui.itemByIndex = {}
    for _, it in pairs(gui.data.items) do
        if it.index then
            gui.itemByIndex[it.index] = it
        end
    end
end

---@param gui DispGui
function DispGuiLua._dataToForm(gui)
    local named = gui.model.named
    gui.selectedButton = nil
    gui.selectedItem = nil

    local mode = EL_MODE_OFF
    if gui.data.modeEndpoint then
        mode = gui.data.flagLiquidation and EL_MODE_LIQUIDATION or EL_MODE_ENDPOINT
    elseif gui.data.modeDepot then
        mode = EL_MODE_DEPOT
    end
    guiSetRadiobutton(gui.model, EL_MODE, mode)

    local outMode = 0
    if gui.data.outTargetCounts then
        outMode = EL_OUT_MODE_TARGET_CONTENTS
    elseif gui.data.outExchangeCounts then
        outMode = EL_OUT_MODE_EXCHANGE
    end
    guiSetRadiobutton(gui.model, EL_OUT_MODE, outMode)
    named[EL_OUT_MODE_NEGATE].state = gui.data.outNegate or false

    for _, el in pairs(gui.model.shares[EL_ITEM_BUTTON]) do
        if el.tags._value > 0 then
            el.elem_value = gui.itemByIndex[el.tags._value]
            if el.elem_value then
                el.locked = true
            end
        else
            el.locked = true
        end
    end
    named[FLAG_useSignals].state = gui.data.flagUseSignals or false
    named[FLAG_useEquals].state = gui.data.flagUseEquals or false
    named[FLAG_turnInserters].state = gui.data.flagTurnInserters or false
    named[FLAG_itemCompounds].state = gui.data.flagItemCompounds or false
    named[FLAG_fluidCompounds].state = gui.data.flagFluidCompounds or false

    named[EL_NETWORK].text = tostring(gui.data.network or 0)
    named[EL_LEN_MIN].text = gui.data.minTrainLength and tostring(gui.data.minTrainLength) or ""
    named[EL_LEN_MAX].text = gui.data.maxTrainLength and tostring(gui.data.maxTrainLength) or ""
    named[EL_STATION_TEMPLATE].text = gui.data.stationTemplate or ""

    DispGuiLua._updateVisibleAndEnabled(gui)
end

---@param gui DispGui
function DispGuiLua._itemDataToForm(gui)
    local named = gui.model.named
    local btn = gui.selectedButton
    local item = gui.selectedItem
    if btn then
        if item then
            named[EL_ITEM_ALLOW_PROVIDE].state = item.allowProvide or false
            named[EL_ITEM_ALLOW_REQUEST].state = item.allowRequest or false
            guiSetCountWithUnits(named[EL_ITEM_REQUEST], named[EL_ITEM_REQUEST_UNIT], item.request)
            guiSetCountWithUnits(named[EL_ITEM_MIN], named[EL_ITEM_MIN_UNIT], item.requestMin)
        else
            named[EL_ALLOW_ANY_ITEM_PROVIDE].state = gui.data.allowAnyItemProvide or false
            named[EL_ALLOW_ANY_ITEM_REQUEST].state = gui.data.allowAnyItemRequest or false
            guiSetCountWithUnits(named[EL_MIN_ANY_ITEM], named[EL_MIN_ANY_ITEM_UNIT], gui.data.minAnyItem)

            named[EL_ALLOW_ANY_FLUID_PROVIDE].state = gui.data.allowAnyFluidProvide or false
            named[EL_ALLOW_ANY_FLUID_REQUEST].state = gui.data.allowAnyFluidRequest or false
            guiSetCountWithUnits(named[EL_MIN_ANY_FLUID], named[EL_MIN_ANY_FLUID_UNIT], gui.data.minAnyFluid)
        end
    end
end

---@param gui DispGui
function DispGuiLua._updateVisibleAndEnabled(gui)
    local data = gui.data
    local named = gui.model.named
    local shares = gui.model.shares

    named[DIV_ENDPOINT].visible = data.modeEndpoint or false

    guiSetEnabled(shares[EL_ITEM_BUTTON], data.modeEndpoint)
    named[DIV_ITEM].visible = gui.selectedButton ~= nil and gui.selectedButton ~= -1
    named[DIV_ANY_ITEM].visible = gui.selectedButton ~= nil and gui.selectedButton == -1

    guiSetEnabled(shares[EL_ITEM_ALLOW_REQUEST], gui.selectedItem and gui.selectedItem.allowRequest)

    guiSetEnabled(shares[EL_MIN_ANY_ITEM], gui.data.allowAnyItemRequest)
    guiSetEnabled(shares[EL_MIN_ANY_FLUID], gui.data.allowAnyFluidRequest)

    named[FLAG_useSignals].enabled = data.modeEndpoint or false
    named[FLAG_useEquals].enabled = data.modeEndpoint or false
    named[FLAG_turnInserters].enabled = data.modeEndpoint or false
    named[FLAG_itemCompounds].visible = false -- data.modeEndpoint or false
    named[FLAG_fluidCompounds].visible = false -- data.modeEndpoint or false

    guiSetEnabled(shares[EL_OUT_MODE], data.modeEndpoint or false)
    named[EL_OUT_MODE_NEGATE].enabled = data.modeEndpoint or false

    guiSetEnabled(shares[EL_NETWORK], data.modeEndpoint)
    guiSetEnabled(shares[EL_LEN], data.modeEndpoint)
    guiSetEnabled(shares[EL_STATION_TEMPLATE], data.modeEndpoint or data.modeDepot)

    named[EL_CARGO_STAT_TABLE].visible = data.modeEndpoint or false
    named[EL_DEPOT_STAT_TABLE].visible = --[[data.modeDepot or]] false

    named[EL_PAUSE].visible = gui.disp and true or false

    DispGuiLua._updateCounters(gui)
end

---@param gui DispGui
function DispGuiLua.updateDispInfo(gui)
    local disp = gui.disp
    local named = gui.model.named

    local paused = disp and dispIsPaused(disp)
    named[EL_PAUSE].caption = paused and { "viirld-gui.EL_PAUSE-paused" } or { "viirld-gui.EL_PAUSE" }

    guiTableBeginUpdate(gui.model, EL_IO_TABLE)
    ---@param tnq TypeNameQuality
    local function registerName(tnq)
        local row, added = guiTableAddOrGetRow(gui.model, EL_IO_TABLE, tnq)
        if added then
            row.cells[1].caption = "[" .. tnq .. "]"
        end
    end
    if disp then
        if disp.signals then
            for tnq, _ in pairs(disp.signals) do
                registerName(tnq)
            end
        end
        if disp.transit then
            for tnq, _ in pairs(disp.transit) do
                registerName(tnq)
            end
        end
    end
    guiTableEndUpdate(gui.model, EL_IO_TABLE)
    local rows = guiTableGetRows(gui.model, EL_IO_TABLE)
    for tnq, row in pairs(rows) do
        local dispSignal = disp and disp.signals[tnq]
        if dispSignal then
            row.cells[2].caption = formatNumberInt(dispSignal.circuitValue or 0, false)
            row.cells[2].tooltip = getUnitReverseTooltip(dispSignal.circuitValue or 0, dispSignal.type, dispSignal.name)
            if dispSignal.provideCount then
                row.cells[3].caption = "+" .. formatNumberInt(dispSignal.balance, false)
                row.cells[3].tooltip = getUnitReverseTooltip(dispSignal.balance, dispSignal.type, dispSignal.name)
                row.cells[3].style.font_color = dispSignal.balance >= 0 and PROVIDE_COLOR or UNDER_MIN_COLOR
                row.cells[3].style.font = dispSignal.balance > 0 and 'default-bold' or 'default'
            elseif dispSignal.requestCount then
                if dispSignal.balance <= 0 then
                    row.cells[3].caption = "−" .. formatNumberInt(-dispSignal.balance, false)
                    row.cells[3].tooltip = getUnitReverseTooltip(-dispSignal.balance, dispSignal.type, dispSignal.name)
                    row.cells[3].style.font_color = dispSignal.requestCount >= 0 and REQUEST_COLOR or UNDER_MIN_COLOR
                    row.cells[3].style.font = dispSignal.requestCount > 0 and 'default-bold' or 'default'
                else
                    row.cells[3].caption = "+" .. formatNumberInt(dispSignal.balance, false)
                    row.cells[3].tooltip = getUnitReverseTooltip(dispSignal.balance, dispSignal.type, dispSignal.name)
                    row.cells[3].style.font_color = UNDER_MIN_COLOR
                    row.cells[3].style.font = 'default'
                end
            else
                row.cells[3].caption = ""
                row.cells[3].style.font_color = UNDER_MIN_COLOR
                row.cells[3].style.font = 'default'
                row.cells[3].tooltip = nil
            end
        else
            row.cells[2].caption = ""
            row.cells[2].tooltip = nil
            row.cells[3].caption = ""
            row.cells[3].tooltip = nil
        end
        if disp and disp.transit[tnq] then
            row.cells[4].caption = formatNumberInt(disp.transit[tnq], false)
        else
            row.cells[4].caption = "-"
        end
        local err = disp and disp.errors and disp.errors[tnq]
        if err then
            err._used = true
        end
        row.cells[5].caption = err and { "", "[img=utility/warning_icon] ", err.text } or ""
        row.cells[5].tooltip = err and err.tt or ""
    end

    local hasErrors = false
    guiTableBeginUpdate(gui.model, EL_ERR_TABLE)
    if disp and paused then
        local row = guiTableAddOrGetRow(gui.model, EL_ERR_TABLE, "-paused")
        row.cells[2].caption = { "viirld.ERR-PAUSED" }
        row.cells[2].tooltip = { "viirld.ERR-PAUSED-tt" }
        row.cells[3].caption = ""
        row.cells[3].tooltip = { "viirld.ERR-PAUSED-tt" }
        hasErrors = true
    end
    if disp and disp.errors then
        for code, err in pairs(disp.errors) do
            if not err._used then
                local row = guiTableAddOrGetRow(gui.model, EL_ERR_TABLE, code)
                row.cells[2].caption = err.text
                row.cells[2].tooltip = err.tt
                row.cells[3].caption = util.formattime(game.tick - (err.addTick or 0))
                row.cells[3].tooltip = err.tt
                hasErrors = true
            else
                err._used = nil
            end
        end
    end
    guiTableEndUpdate(gui.model, EL_ERR_TABLE)
    guiSetVisible(gui.model.shares[EL_ERR_TABLE], hasErrors)

    guiTableBeginUpdate(gui.model, EL_DELIVERIES_TABLE)
    if disp then
        for uid, delivery in pairs(disp.deliveries) do
            local row = guiTableAddOrGetRow(gui.model, EL_DELIVERIES_TABLE, uid)
            do
                ---@type string[]
                local text = {}
                text[#text + 1] = delivery.provider.stopName or "?"
                if delivery.providerPassedTick then
                    text[#text + 1] = "."
                end
                for tnq, count in pairs(delivery.contents) do
                    text[#text + 1] = "\n    [" .. tnq .. "] " .. formatNumberInt(count, false)
                end
                row.cells[1].caption = table.concat(text)
            end
            do
                ---@type string[]
                local text = {}
                text[#text + 1] = delivery.requester.stopName or "?"
                if delivery.requesterPassedTick then
                    text[#text + 1] = "."
                end
                row.cells[2].caption = table.concat(text)
            end
            local time = game.tick - (delivery.startTick or 0)
            row.cells[3].caption = util.formattime(time)
            local tags = row.cells[4].tags
            tags._value = uid
            row.cells[4].tags = tags
            row.cells[4].style = (time > timeOfStuckDelivery) and "viirld_hili_delete_button" or "viirld_delete_button"
            row.cells[4].sprite = (time > timeOfStuckDelivery) and "utility/trash" or "utility/trash_white"
        end
    end
    guiTableEndUpdate(gui.model, EL_DELIVERIES_TABLE)

    named[EL_STAT_TRAINS].caption = { "viirld-gui.EL_STAT_TRAINS", formatNumberInt(disp and disp.statTrains or 0, false) }

    if disp and disp.settings.modeEndpoint then
        guiTableBeginUpdate(gui.model, EL_CARGO_STAT_TABLE)
        if disp.stat then
            for tnq, stat in pairs(disp.stat) do
                local rowModel, added = guiTableAddOrGetRow(gui.model, EL_CARGO_STAT_TABLE, tnq)
                if added then
                    rowModel.cells[1].caption = "[" .. tnq .. "] " .. (stat.deliveries and formatNumberInt(stat.deliveries, false) or "?")
                end
                rowModel.cells[2].caption = stat.provided and formatNumberInt(stat.provided, true) or "-"
                rowModel.cells[3].caption = stat.received and formatNumberInt(stat.received, true) or "-"
                rowModel.cells[4].caption = stat.lastTick and util.formattime(game.tick - stat.lastTick) or "-"
            end
        end
        guiTableEndUpdate(gui.model, EL_CARGO_STAT_TABLE)
    else
        -----@type table<LocalisedString, {count: number, free: number}>
        --local stats = {}
        --for _, mover in pairs(disp.net.movers) do
        --    local name = MoverClass.trainTypeToStr(mover.trainType)
        --    if ((not disp.compFlags) or disp.compFlags[mover.comp]) then
        --        stats[name] = stats[name] or { count = 0, free = 0 }
        --        stats[name].count = stats[name].count + 1
        --        if mover.isFree then
        --            stats[name].free = stats[name].free + 1
        --        end
        --    end
        --end
        --guiTableBeginUpdate(gui.model, EL_DEPOT_STAT_TABLE)
        --for name, stat in pairs(stats) do
        --    local mover = guiTableAddOrGetRow(gui.model, EL_DEPOT_STAT_TABLE, name)
        --    mover.cells[1].caption = name
        --    mover.cells[2].caption = stat.count
        --    mover.cells[3].caption = stat.free
        --end
        --guiTableEndUpdate(gui.model, EL_DEPOT_STAT_TABLE)
    end

    if debugMode and disp and named[EL_DEBUG] then
        ---@type string[]
        local debugLines = {}
        debugLines[#debugLines + 1] = "uid: " .. tostring(disp.uid)
        debugLines[#debugLines + 1] = "net: " .. tostring(disp.settings.network)
        debugLines[#debugLines + 1] = "storage.activeDisps: " .. tostring(storage.activeDisps[disp.uid] and "yes" or "no")
        debugLines[#debugLines + 1] = "lastUpdateTick: " .. tostring(disp.lastUpdateTick)
        if disp.inserters then
            debugLines[#debugLines + 1] = "Inserters: " .. tostring(table_size(disp.inserters))
        end
        if disp.turnedInserters then
            debugLines[#debugLines + 1] = "Turned Inserters: " .. tostring(table_size(disp.turnedInserters))
        end
        -- [[DEBUG]]log("updateDispInfo(): disp.signals = " .. var_dump(disp.signals))
        for tnq, sig in pairs(disp.signals) do
            local prefix = "[" .. tnq .. "] "
            debugLines[#debugLines + 1] = prefix .. "tnq: " .. var_dump(tnq)
            for k, v in pairs(sig) do
                debugLines[#debugLines + 1] = prefix .. k .. ": " .. var_dump(v)
            end
            if disp.transit and disp.transit[tnq] then
                debugLines[#debugLines + 1] = prefix .. "TRANSIT=" .. tostring(disp.transit[tnq])
            end
            if disp.org.provide
                    and disp.org.provide[disp.settings.network]
                    and disp.org.provide[disp.settings.network][tnq]
                    and disp.org.provide[disp.settings.network][tnq][disp.uid]
            then
                debugLines[#debugLines + 1] = prefix .. "PROVIDE IN NETWORK"
            end
            local netQueue = disp.org.requestQueue[disp.settings.network]
            if netQueue then
                local queue = netQueue[tnq]
                if queue then
                    for uid, qDisp in pairs(queue.queuedDisps) do
                        debugLines[#debugLines + 1] = prefix .. "QUEUE " .. uid .. ": " .. var_dump(qDisp.stopName) .. (qDisp == disp and " - this" or "")
                    end
                end
            end
        end
        if disp.transit then
            for tnq, v in pairs(disp.transit) do
                if not disp.signals[tnq] then
                    local prefix = "[" .. tnq .. "] "
                    debugLines[#debugLines + 1] = prefix .. "!TRANSIT=" .. tostring(v) .. " (" .. var_dump(tnq) .. ")"
                end
            end
        end
        if disp.org.depotDisps[disp.uid] then
            debugLines[#debugLines + 1] = "IN org.depotDisps"
        end
        if disp.org.depotReadyDisps[disp.uid] then
            debugLines[#debugLines + 1] = "IN org.depotReadyDisps"
        end
        if disp.stoppedTrain then
            debugLines[#debugLines + 1] = "stoppedTrain: " .. var_dump(disp.stoppedTrain)
        end
        if disp.stoppedTrainType then
            debugLines[#debugLines + 1] = "stoppedTrainType: " .. var_dump(disp.stoppedTrainType)
            debugLines[#debugLines + 1] = "stoppedTrainType (info): " .. var_dump(storage.trainTypes[disp.stoppedTrainType])
        end
        named[EL_DEBUG].caption = table.concat(debugLines, "\n")
    end
end

---@param gui DispGui
---@param element LuaGuiElement
function DispGuiLua._updateElemButtons(gui, element)
    if gui.selectedButton then
        if gui.selectedButton > 0 then
            gui.itemByIndex[gui.selectedButton] = gui.itemByIndex[gui.selectedButton] or { index = gui.selectedButton }
        end
        gui.selectedItem = gui.selectedButton ~= -1 and gui.itemByIndex[gui.selectedButton] or nil
    else
        gui.selectedItem = nil
    end
    for _, el in pairs(gui.model.shares[EL_ITEM_BUTTON]) do
        el.style = gui.selectedButton == el.tags._value and "viirld_slot_button_selected" or "viirld_slot_button"
        if el ~= element and gui.selectedButton ~= nil then
            el.locked = not not el.elem_value
        end
    end
end

---@param gui DispGui
function DispGuiLua._updateCounters(gui)
    local data = gui.data
    local shares = gui.model.shares
    for _, btn in pairs(shares[EL_ITEM_BUTTON]) do
        local index = btn.tags._value
        ---@type LocalisedString
        local label1, label2
        if index == -1 then
            if data.allowAnyItemRequest then
                local min = validCountWithUnits(data.minAnyItem)
                if min then
                    label1 = countWithUnitsToString(min)
                end
            end
            if data.allowAnyItemProvide then
                label1 = label1 and { "", label1, "+" } or "+"
            end

            if data.allowAnyFluidRequest then
                local min = validCountWithUnits(data.minAnyFluid)
                if min then
                    label2 = countWithUnitsToString(min)
                end
            end
            if data.allowAnyFluidProvide then
                label2 = label2 and { "", label2, "+" } or "+"
            end
            local icon = (label1 or label2) and "signal-anything" --[[green]] or "signal-everything" --[[red]]
            if btn.elem_value.name ~= icon then
                btn.elem_value = { type = "virtual", name = icon }
            end
        else
            local item = gui.itemByIndex[index]
            if item then
                if item.allowRequest then
                    local req = validCountWithUnits(item.request)
                    if req then
                        label1 = countWithUnitsToString(req)
                    end
                    local min = validCountWithUnits(item.requestMin)
                    if min then
                        label2 = countWithUnitsToString(min)
                    end
                end
                if item.allowProvide then
                    label2 = "+"
                end
            end
        end
        btn.children[1].children[1].caption = label1 or ""
        btn.children[1].children[2].caption = label2 or ""
    end
end

---@param gui DispGui
function DispGuiLua._updateMemButtons(gui)
    local shares = gui.model.shares
    local forcePref = storageGetForcePrefs(gui.player.force.index)

    if gui.selectedItem then
        -- [[DEBUG]]log("self.selectedItem: " .. var_dump(gui.selectedItem))
        for _, el in pairs(shares[EL_ITEM_MEM_BUTTON]) do
            local v = forcePref.itemMem[gui.selectedItem.type][el.tags._value]
            el.style = v and "viirld_mem_active" or "viirld_mem"
            if v then
                local tt = {
                    "",
                    { "viirld-gui.mem-item-tt" },
                    "\n",
                }
                if (not v.allowProvide) and (not v.allowRequest) then
                    tt[#tt + 1] = "\n"
                    tt[#tt + 1] = { "viirld-gui.mem-item-nothing" }
                else
                    if v.allowProvide then
                        tt[#tt + 1] = "\n"
                        tt[#tt + 1] = { "viirld-gui.mem-item-provide" }
                    end
                    if v.allowRequest then
                        local request = validCountWithUnits(v.request)
                        local requestMin = validCountWithUnits(v.requestMin)
                        tt[#tt + 1] = "\n"
                        tt[#tt + 1] = {
                            "viirld-gui.mem-item-request",
                            countWithUnitsToString2(request) or "?",
                            countWithUnitsToString2(requestMin) or "?",
                        }
                    end
                end
                el.tooltip = tt
            else
                el.tooltip = { "viirld-gui.mem-item-tt" }
            end
        end
    else
        for _, el in pairs(shares[EL_ITEM_MEM_BUTTON]) do
            local v = forcePref.anyMem[el.tags._value]
            el.style = v and "viirld_mem_active" or "viirld_mem"
            if v then
                local tt = {
                    "",
                    { "viirld-gui.mem-item-tt" },
                    "\n",
                }
                tt[#tt + 1] = "\n"
                tt[#tt + 1] = { "viirld-gui.mem-any-item-item" }
                if (not v.allowAnyItemProvide) and (not v.allowAnyItemRequest) then
                    tt[#tt + 1] = "\n"
                    tt[#tt + 1] = { "viirld-gui.mem-any-item-nothing" }
                else
                    if v.allowAnyItemProvide then
                        tt[#tt + 1] = "\n"
                        tt[#tt + 1] = { "viirld-gui.mem-any-item-provide" }
                    end
                    if v.allowAnyItemRequest then
                        local min = validCountWithUnits(v.minAnyItem)
                        tt[#tt + 1] = "\n"
                        tt[#tt + 1] = {
                            "viirld-gui.mem-any-item-request",
                            countWithUnitsToString2(min) or "?",
                        }
                    end
                end
                tt[#tt + 1] = "\n"
                tt[#tt + 1] = "\n"
                tt[#tt + 1] = { "viirld-gui.mem-any-item-fluid" }
                if (not v.allowAnyFluidProvide) and (not v.allowAnyFluidRequest) then
                    tt[#tt + 1] = "\n"
                    tt[#tt + 1] = { "viirld-gui.mem-any-item-nothing" }
                else
                    if v.allowAnyFluidProvide then
                        tt[#tt + 1] = { "viirld-gui.mem-any-item-provide" }
                    end
                    if v.allowAnyFluidRequest then
                        local min = validCountWithUnits(v.minAnyFluid)
                        tt[#tt + 1] = "\n"
                        tt[#tt + 1] = {
                            "viirld-gui.mem-any-item-request",
                            countWithUnitsToString2(min) or "?",
                        }
                    end
                end
                el.tooltip = tt
            else
                el.tooltip = { "viirld-gui.mem-item-tt" }
            end
        end
    end
end

---@param gui DispGui
function DispGuiLua._normalizeData(gui)
    local data = gui.data

    data.modeEndpoint = data.modeEndpoint or nil
    data.modeDepot = data.modeDepot or nil

    data.outExchangeCounts = data.outExchangeCounts or nil
    data.outTargetCounts = data.outTargetCounts or nil
    data.outNegate = data.outNegate or nil

    data.flagUseSignals = data.flagUseSignals or nil
    data.flagUseEquals = data.flagUseEquals or nil
    data.flagTamp = data.flagTamp or nil
    data.flagTurnInserters = data.flagTurnInserters or nil
    data.flagItemCompounds = data.flagItemCompounds or nil
    data.flagFluidCompounds = data.flagFluidCompounds or nil
    data.flagLiquidation = data.flagLiquidation or nil

    data.allowAnyItemProvide = data.allowAnyItemProvide or nil
    data.allowAnyItemRequest = data.allowAnyItemRequest or nil
    data.allowAnyFluidProvide = data.allowAnyFluidProvide or nil
    data.allowAnyFluidRequest = data.allowAnyFluidRequest or nil

    if data.allowAnyItemRequest and (not data.minAnyItem or not data.minAnyItem.count) then
        data.minAnyItem = setCount(data.minAnyItem, 1)
    end
    data.minAnyItem = validCountWithUnits(data.minAnyItem, true)
    if data.allowAnyFluidRequest and (not data.minAnyFluid or not data.minAnyFluid.count) then
        data.minAnyFluid = setCount(data.minAnyFluid, 1)
    end
    data.minAnyFluid = validCountWithUnits(data.minAnyFluid, true)

    for _, item in pairs(gui.itemByIndex) do
        item.allowProvide = item.allowProvide or nil
        item.allowRequest = item.allowRequest or nil

        if item.allowRequest and (not item.request or not item.request.count) then
            item.request = setCount(item.request, 1)
        end
        item.request = validCountWithUnits(item.request, true)

        if item.allowRequest and (not item.requestMin or not item.requestMin.count) then
            item.requestMin = setCount(item.requestMin, 1)
        end
        item.requestMin = validCountWithUnits(item.requestMin, true)
    end

    if not data.network or data.network < 0 then
        data.network = 0
    end
    if data.minTrainLength and data.minTrainLength < 1 then
        data.minTrainLength = nil
    end
    if data.maxTrainLength and data.maxTrainLength > 99999 then
        data.maxTrainLength = nil
    end
    if data.stationTemplate and trim(data.stationTemplate) == "" then
        data.stationTemplate = nil
    end
end

---@param gui DispGui
---@param event OnGuiClick|OnGuiTextChanged @...
function DispGuiLua._on_afterEvent(gui, event)
    if gui.doUpdateElemButtons then
        DispGuiLua._updateElemButtons(gui, event.element)
        gui.doUpdateItemForm = true
        gui.doUpdateVisible = true
        gui.doUpdateCounters = true
    end
    if gui.doUpdateCounters then
        DispGuiLua._updateCounters(gui)
    end
    if gui.doUpdateItemForm then
        DispGuiLua._itemDataToForm(gui)
    end
    if gui.doUpdateVisible then
        DispGuiLua._updateVisibleAndEnabled(gui)
        gui.doUpdateMemButtons = true
    end
    if gui.doUpdateMemButtons then
        DispGuiLua._updateMemButtons(gui)
    end

    ---@type LuaGuiElement
    local focusElement

    if gui.doFocusTo == FOCUS_TO_ITEM_REQUEST then
        focusElement = gui.model.named[EL_ITEM_REQUEST]
    elseif gui.doFocusTo == FOCUS_TO_ANY_MIN then
        focusElement = gui.model.named[EL_MIN_ANY_ITEM]
        if not (focusElement.visible and focusElement.enabled) then
            focusElement = gui.model.named[EL_MIN_ANY_FLUID]
        end
    elseif gui.doFocusTo == FOCUS_TO_MIN_ANY_ITEM then
        focusElement = gui.model.named[EL_MIN_ANY_ITEM]
    elseif gui.doFocusTo == FOCUS_TO_MIN_ANY_FLUID then
        focusElement = gui.model.named[EL_MIN_ANY_FLUID]
    end
    if focusElement and focusElement.visible and focusElement.enabled then
        focusElement.focus()
        focusElement.select_all()
    end

    gui.doFocusTo = nil
    gui.doUpdateVisible = nil
    gui.doUpdateElemButtons = nil
    gui.doUpdateCounters = nil
    gui.doUpdateItemForm = nil
    gui.doUpdateMemButtons = nil
end

---@param gui DispGui
function DispGuiLua._on_EL_APPLY_click(gui)
    local selectedButton = gui.selectedButton
    DispGuiLua._normalizeData(gui)
    if gui.disp then
        dispSetSettings(gui.disp, gui.data)
        gui.data = table.deepcopy(gui.disp.settings)
    elseif gui.ghost then
        dispSettingsToCombinator(gui.data, gui.ghost)
    end
    DispGuiLua._loadData(gui)
    DispGuiLua._dataToForm(gui)
    gui.selectedButton = selectedButton
    gui.doUpdateVisible = true
    gui.doUpdateElemButtons = true
    gui.doUpdateCounters = true
    gui.doUpdateItemForm = true
    gui.doUpdateMemButtons = true
end

---@param gui DispGui
function DispGuiLua._on_close(gui)
    DispGuiLua.close(gui, false)
end

---@param gui DispGui
---@param justForgot boolean
function DispGuiLua.close(gui, justForgot)
    if justForgot then
        destroyGuiModel(gui.model)
        if gui.disp then
            gui.disp.gui = nil
        end
        return
    end
    DispGuiLua._normalizeData(gui)
    if gui.disp then
        dispSetSettings(gui.disp, gui.data)
    elseif gui.ghost then
        dispSettingsToCombinator(gui.data, gui.ghost)
    end
    destroyGuiModel(gui.model)
    if gui.disp then
        gui.disp.gui = nil
    end
    -- todo globalUpdateNextTick(gui.disp)

    --if self.disp.entity.valid then
    --    if self.disp.stop and self.disp.stop.stopEntity.valid then
    --        if self.disp.stop.stopEntity.connected_rail and self.disp.stop.stopEntity.connected_rail.valid then
    --            if self.disp.stop:isValid() then
    --                if self.disp.mode == MODE_BIDI then
    --                    local hasConnection = false
    --                    for _, def in pairs(self.disp.entity.circuit_connection_definitions) do
    --                        if def.source_circuit_id == defines.circuit_connector_id.combinator_input
    --                                and def.target_entity ~= self.disp.input
    --                        then
    --                            hasConnection = true
    --                            break
    --                        end
    --                    end
    --                    if not hasConnection then
    --                        self.disp.entity.surface.create_entity {
    --                            type = "flying-text",
    --                            name = "tutorial-flying-text",
    --                            position = self.disp.entity.position,
    --                            text = { "viirld.err-not-input-connected" },
    --                        }
    --                    end
    --                end
    --            else
    --                self.disp.entity.surface.create_entity {
    --                    type = "flying-text",
    --                    name = "tutorial-flying-text",
    --                    position = self.disp.entity.position,
    --                    text = { "viirld.err-internal" },
    --                }
    --            end
    --        else
    --            self.disp.entity.surface.create_entity {
    --                type = "flying-text",
    --                name = "tutorial-flying-text",
    --                position = self.disp.entity.position,
    --                text = { "viirld.err-no-rail" },
    --            }
    --        end
    --    else
    --        self.disp.entity.surface.create_entity {
    --            type = "flying-text",
    --            name = "tutorial-flying-text",
    --            position = self.disp.entity.position,
    --            text = { "viirld.err-no-station" },
    --        }
    --    end
    --end
end

---@param gui DispGui
function DispGuiLua._on_EL_PAUSE_click(gui)
    dispToggleUserPause(gui.disp, gui.player)
end

---@param gui DispGui
function DispGuiLua._on_EL_ROLLBACK_click(gui)
    local selectedButton = gui.selectedButton
    DispGuiLua._loadData(gui)
    DispGuiLua._dataToForm(gui)
    DispGuiLua.updateDispInfo(gui)
    gui.selectedButton = selectedButton
    gui.doUpdateVisible = true
    gui.doUpdateElemButtons = true
    gui.doUpdateCounters = true
    gui.doUpdateItemForm = true
    gui.doUpdateMemButtons = true
end

---@param gui DispGui
---@param event OnGuiElemChanged
function DispGuiLua._on_EL_MODE(gui, event)
    local mode = guiHandleRadiobutton(gui.model, event.element)
    gui.data.modeDepot = mode == EL_MODE_DEPOT
    gui.data.modeEndpoint = mode == EL_MODE_ENDPOINT or mode == EL_MODE_LIQUIDATION
    gui.data.flagLiquidation = mode == EL_MODE_LIQUIDATION

    gui.doUpdateVisible = true
    gui.doUpdateElemButtons = true
end

---@param gui DispGui
---@param event OnGuiElemChanged
function DispGuiLua._on_EL_OUT_MODE(gui, event)
    local out_mode = guiHandleRadiobutton(gui.model, event.element)
    gui.data.outExchangeCounts = out_mode == EL_OUT_MODE_EXCHANGE
    gui.data.outTargetCounts = out_mode == EL_OUT_MODE_TARGET_CONTENTS
end

---@param gui DispGui
---@param event OnGuiElemChanged
function DispGuiLua._on_EL_OUT_MODE_NEGATE(gui, event)
    gui.data.outNegate = event.element.state or nil
end

---@param gui DispGui
---@param event OnGuiCheckedStateChanged
function DispGuiLua._on_FLAG(gui, event)
    gui.data.flagUseSignals = gui.model.named[FLAG_useSignals].state or nil
    gui.data.flagUseEquals = gui.model.named[FLAG_useEquals].state or nil
    gui.data.flagTurnInserters = gui.model.named[FLAG_turnInserters].state or nil
    gui.data.flagItemCompounds = gui.model.named[FLAG_itemCompounds].state or nil
    gui.data.flagFluidCompounds = gui.model.named[FLAG_fluidCompounds].state or nil
end

---@param gui DispGui
---@param event OnGuiTextChanged
function DispGuiLua._on_EL_NETWORK(gui, event)
    gui.data.network = toInt32Range(tonumber(event.element.text) or 0)
end

---@param gui DispGui
---@param event OnGuiTextChanged
function DispGuiLua._on_EL_LEN(gui, event)
    gui.data.minTrainLength = toInt32Range(tonumber(gui.model.named[EL_LEN_MIN].text) or nil)
    gui.data.maxTrainLength = toInt32Range(tonumber(gui.model.named[EL_LEN_MAX].text) or nil)
end

---@param gui DispGui
---@param event OnGuiTextChanged
function DispGuiLua._on_EL_STATION_TEMPLATE(gui, event)
    gui.data.stationTemplate = event.text
end

---@param gui DispGui
---@param event OnGuiClick
function DispGuiLua._on_click_EL_ITEM_BUTTON(gui, event)
    local element = event.element
    if event.button == defines.mouse_button_type.right then
        if element.tags._value ~= -1 then
            element.locked = false
            element.elem_value = nil
            gui.selectedButton = nil
            local item = gui.itemByIndex[element.tags._value]
            if item then
                gui.itemByIndex[element.tags._value] = nil
                if item.tnq then
                    gui.data.items[item.tnq] = nil
                end
            end
            gui.doUpdateElemButtons = true
        else
            if gui.selectedButton == -1 then
                gui.data.allowAnyItemProvide = nil
                gui.data.allowAnyItemRequest = nil
                gui.data.minAnyItem = nil
                gui.data.allowAnyFluidProvide = nil
                gui.data.allowAnyFluidRequest = nil
                gui.data.minAnyFluid = nil
            else
                gui.selectedButton = -1
                gui.doFocusTo = FOCUS_TO_ANY_MIN
            end
            gui.doUpdateElemButtons = true
        end
    elseif event.button == defines.mouse_button_type.left and event.element.elem_value then
        if element.locked then
            element.locked = element.tags._value == -1
            gui.selectedButton = element.tags._value
            gui.doUpdateElemButtons = true
            gui.doFocusTo = (gui.selectedButton == -1) and FOCUS_TO_ANY_MIN or FOCUS_TO_ITEM_REQUEST
        end
    end
end

---@param gui DispGui
---@param event OnGuiElemChanged
function DispGuiLua._on_EL_ITEM_BUTTON(gui, event)
    local element = event.element

    element.locked = false
    local _value = --[[---@type number]] element.tags._value
    local type0 = element.elem_value and (element.elem_value.type or "item")
    local name0 = element.elem_value and element.elem_value.name
    local quality0 = element.elem_value and element.elem_value.quality
    if quality0 == defaultQuality then
        quality0 = nil
    end
    local tnq0 = element.elem_value and toTypeNameQuality(element.elem_value)
    local valid = true
    if type0 and type0 ~= "item" and type0 ~= "fluid"
            or tnq0 and gui.data.items[tnq0] and gui.data.items[tnq0].index ~= _value
    then
        valid = false
    end

    if valid then
        local item = gui.itemByIndex[_value]
        if item and item.type ~= type0 then
            item = nil
        end
        if not item then
            item = {
                index = _value,
            }
            gui.itemByIndex[_value] = item
            if tnq0 then
                gui.data.items[tnq0] = item
            end
        end
        item.type = type0
        item.name = name0
        item.quality = quality0
    else
        gui.player.create_local_flying_text {
            text = { "viirld-gui.FLY-SELECT_ITEM_OR_FLUID" },
            create_at_cursor = true,
            time_to_live = 180
        }
        element.elem_value = nil
    end
    gui.selectedButton = element.elem_value and _value or nil
    gui.doUpdateElemButtons = true
    gui.doFocusTo = FOCUS_TO_ITEM_REQUEST
end

---@param gui DispGui
---@param event OnGuiCheckedStateChanged
function DispGuiLua._on_EL_ITEM_ALLOW_PROVIDE(gui, event)
    gui.selectedItem.allowProvide = event.element.state or nil
    gui.selectedItem.allowRequest = nil
    gui.model.named[EL_ITEM_ALLOW_REQUEST].state = false

    gui.doUpdateVisible = true
end

---@param gui DispGui
---@param event OnGuiCheckedStateChanged
function DispGuiLua._on_EL_ITEM_ALLOW_REQUEST(gui, event)
    gui.selectedItem.allowRequest = event.element.state or nil
    gui.selectedItem.allowProvide = nil
    gui.model.named[EL_ITEM_ALLOW_PROVIDE].state = false

    gui.doUpdateVisible = true
    gui.doFocusTo = FOCUS_TO_ITEM_REQUEST
end

---@param gui DispGui
---@param event OnGuiTextChanged
function DispGuiLua._on_EL_ITEM_REQUEST(gui, event)
    gui.selectedItem.request = setCount(gui.selectedItem.request, toInt32Range(toPosNumber(event.element.text)))
    gui.doUpdateCounters = true
end

---@param gui DispGui
---@param event OnGuiTextChanged
function DispGuiLua._on_EL_ITEM_REQUEST_MIN(gui, event)
    gui.selectedItem.requestMin = setCount(gui.selectedItem.requestMin, toInt32Range(toPosNumber(event.element.text)))
    gui.doUpdateCounters = true
end

---@param gui DispGui
---@param event OnGuiClick
function DispGuiLua._on_EL_ITEM_REQUEST_UNIT_click(gui, event)
    gui.selectedItem.request = guiNextUnit(event.element, gui.selectedItem.request, gui.selectedItem.type)
    gui.doUpdateCounters = true
end

---@param gui DispGui
---@param event OnGuiClick
function DispGuiLua._on_EL_ITEM_REQUEST_MIN_UNIT_click(gui, event)
    gui.selectedItem.requestMin = guiNextUnit(event.element, gui.selectedItem.requestMin, gui.selectedItem.type)
    gui.doUpdateCounters = true
end

---@param gui DispGui
---@param event OnGuiCheckedStateChanged
function DispGuiLua._on_EL_ALLOW_ANY_ITEM_PROVIDE(gui, event)
    gui.data.allowAnyItemProvide = event.element.state
    gui.doUpdateCounters = true
end

---@param gui DispGui
---@param event OnGuiCheckedStateChanged
function DispGuiLua._on_EL_ALLOW_ANY_ITEM_REQUEST(gui, event)
    gui.data.allowAnyItemRequest = event.element.state
    gui.doUpdateVisible = true
    gui.doUpdateCounters = true
    gui.doFocusTo = FOCUS_TO_MIN_ANY_ITEM
end

---@param gui DispGui
---@param event OnGuiTextChanged
function DispGuiLua._on_EL_MIN_ANY_ITEM(gui, event)
    gui.data.minAnyItem = setCount(gui.data.minAnyItem, toInt32Range(toPosNumber(event.element.text)))
    gui.doUpdateCounters = true
end

---@param gui DispGui
---@param event OnGuiClick
function DispGuiLua._on_EL_MIN_ANY_ITEM_UNIT_click(gui, event)
    gui.data.minAnyItem = guiNextUnit(event.element, gui.data.minAnyItem, "item")
    gui.doUpdateCounters = true
end

---@param gui DispGui
---@param event OnGuiCheckedStateChanged
function DispGuiLua._on_EL_ALLOW_ANY_FLUID_PROVIDE(gui, event)
    gui.data.allowAnyFluidProvide = event.element.state
    gui.doUpdateCounters = true
end

---@param gui DispGui
---@param event OnGuiCheckedStateChanged
function DispGuiLua._on_EL_ALLOW_ANY_FLUID_REQUEST(gui, event)
    gui.data.allowAnyFluidRequest = event.element.state
    gui.doUpdateVisible = true
    gui.doUpdateCounters = true
    gui.doFocusTo = FOCUS_TO_MIN_ANY_FLUID
end

---@param gui DispGui
---@param event OnGuiTextChanged
function DispGuiLua._on_EL_MIN_ANY_FLUID(gui, event)
    gui.data.minAnyFluid = setCount(gui.data.minAnyFluid, toInt32Range(toPosNumber(event.element.text)))
    gui.doUpdateCounters = true
end

---@param gui DispGui
---@param event OnGuiClick
function DispGuiLua._on_EL_MIN_ANY_FLUID_UNIT_click(gui, event)
    gui.data.minAnyFluid = guiNextUnit(event.element, gui.data.minAnyFluid, "fluid")
    gui.doUpdateCounters = true
end

---@param gui DispGui
---@param gui DispGui
---@param event OnGuiClick
function DispGuiLua._on_EL_DELETE_DELIVERY_click(gui, event)
    local deli = gui.disp.deliveries[event.element.tags._value]
    if deli then
        storage.deliveries[deli.uid] = nil
        if deli.provider then
            deli.provider.deliveries[deli.uid] = nil
            dispUpdate(deli.provider, false, true, true)
        end
        if deli.requester then
            deli.requester.deliveries[deli.uid] = nil
            dispUpdate(deli.requester, false, true, true)
        end
    end
end

---@param gui DispGui
---@param event OnGuiClick
function DispGuiLua._on_EL_ITEM_MEM_BUTTON_click(gui, event)
    local forcePref = storageGetForcePrefs(gui.player.force.index)
    if gui.selectedItem then
        if event.button == defines.mouse_button_type.left then
            if event.control or event.alt or event.shift then
                forcePref.itemMem[gui.selectedItem.type][event.element.tags._value] = {
                    allowProvide = gui.selectedItem.allowProvide or nil,
                    allowRequest = gui.selectedItem.allowRequest or nil,
                    request = validCountWithUnits(copyCountWithUnits(gui.selectedItem.request), true),
                    requestMin = validCountWithUnits(copyCountWithUnits(gui.selectedItem.requestMin), true),
                }
                gui.doUpdateMemButtons = true
            else
                local mem = forcePref.itemMem[gui.selectedItem.type][event.element.tags._value]
                if mem then
                    gui.selectedItem.allowProvide = mem.allowProvide or nil
                    gui.selectedItem.allowRequest = mem.allowRequest or nil
                    gui.selectedItem.request = copyCountWithUnits(mem.request)
                    gui.selectedItem.requestMin = copyCountWithUnits(mem.requestMin)
                    gui.doUpdateElemButtons = true
                    gui.doFocusTo = FOCUS_TO_ITEM_REQUEST
                end
            end
        elseif event.button == defines.mouse_button_type.right then
            forcePref.itemMem[gui.selectedItem.type][event.element.tags._value] = nil
            gui.doUpdateMemButtons = true
        end
    else
        if event.button == defines.mouse_button_type.left then
            if event.control or event.alt or event.shift then
                forcePref.anyMem[event.element.tags._value] = {
                    allowAnyItemProvide = gui.data.allowAnyItemProvide or nil,
                    allowAnyItemRequest = gui.data.allowAnyItemRequest or nil,
                    minAnyItem = validCountWithUnits(copyCountWithUnits(gui.data.minAnyItem), true),
                    allowAnyFluidProvide = gui.data.allowAnyFluidProvide or nil,
                    allowAnyFluidRequest = gui.data.allowAnyFluidRequest or nil,
                    minAnyFluid = validCountWithUnits(copyCountWithUnits(gui.data.minAnyFluid), true),
                }
                gui.doUpdateMemButtons = true
            else
                local mem = forcePref.anyMem[event.element.tags._value]
                if mem then
                    gui.data.allowAnyItemProvide = mem.allowAnyItemProvide or nil
                    gui.data.allowAnyItemRequest = mem.allowAnyItemRequest or nil
                    gui.data.minAnyItem = copyCountWithUnits(mem.minAnyItem)
                    gui.data.allowAnyFluidProvide = mem.allowAnyFluidProvide or nil
                    gui.data.allowAnyFluidRequest = mem.allowAnyFluidRequest or nil
                    gui.data.minAnyFluid = copyCountWithUnits(mem.minAnyFluid)
                    gui.doUpdateElemButtons = true
                    gui.doFocusTo = FOCUS_TO_ANY_MIN
                end
            end
        elseif event.button == defines.mouse_button_type.right then
            forcePref.anyMem[event.element.tags._value] = nil
            gui.doUpdateMemButtons = true
        end
    end
end

