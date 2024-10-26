local stopBlueprintMappings = {}

local TAB_STATUS = 1201

--local DIV_ = 1000
local DIV_TABS = 1005
local DIV_BIDI = 1001
--local DIV_DEPOT = 1002
--local DIV_CLEAN = 1003
local DIV_COMMON = 1004
local EL_DEBUG = 1005

local DIV_ITEM = 1101

local FLAG_useSignals = 2003
local FLAG_useEquals = 2004
local FLAG_tamp = 2005
local FLAG_turnInserters = 2006
local FLAG_compounds = 2007
local FLAG_liquidation = 2010

local OPT_OUT_MODE = 2012

local EL_MODE = 3001
local EL_NETWORK = 3003
local EL_COMPS = 3004
local EL_COMPS_BUTTONS = 3005
local EL_COMPS_BUTTON = 3006
local EL_PRIORITY = 3007

local EL_OTHER_BUTTON = 3102
local EL_ITEM_BUTTON = 3101
local EL_ITEM_MIN = 3103
local EL_ITEM_MIN_LABEL = 3107
local EL_ITEM_MIN_UNIT = 3104
local EL_ITEM_REQUEST = 3105
local EL_ITEM_REQUEST_UNIT = 3106
local EL_ITEM_MEM_BUTTON = 3108

local EL_AUTO_ITEMS_MIN = 3201
local EL_AUTO_ITEMS_MIN_UNIT = 3202
local EL_AUTO_FLUID_MIN = 3203
local EL_AUTO_FLUID_MIN_UNIT = 3204
local EL_AUTO_ITEMS_PROVIDE = 2008
local EL_AUTO_FLUID_PROVIDE = 2009

local EL_IO_TABLE = 5005
local EL_DELIVERIES_TABLE = 5006
local EL_CARGO_STAT_TABLE = 5007
local EL_DEPOT_STAT_TABLE = 5008

local EL_STAT_TRAINS = 6001

local EL_APPLY = 9001
local EL_ROLLBACK = 9002

---@class DispGui
    ---@field player LuaPlayer
    ---@field disp DispClass @nullable
    ---@field entity LuaEntity
    ---@field model GuiModel
    ---@field ioRows table<string, GuiModel>
    ---@field deliveryRows table<DeliveryUid, GuiModel>
    ---@field statRows table<string, GuiModel>
    ---@field depotStatRows table<string, GuiModel>
    ---@field data DispSettings
    ---@field signalByIndex table<number, DispSignal>
    ---@field selectedButton number @nullable
    ---@field selectedItem DispSignal @nullable

DispGui = --[[---@type DispGui]] createClass("DispGui")

function DispGui:restoreClass()
    if self.disp then
        restoreClass(self.disp)
    end
end

---@param event OnGuiOpened
function DispGui.handleGuiOpened(event)
    if event.entity.name == "viirld2-dispatcher" then
        local player = --[[---@type LuaPlayer]] game.players[event.player_index]
        DispGui:open(player, event.entity)
    end
end

---@param player LuaPlayer
---@param dispEntity LuaEntity @ dispatcher entity
function DispGui:open(player, dispEntity)
    ---@type DispClass
    local disp = globalDispByEntity(dispEntity.unit_number)

    ---@type DispGui
    local gui = instanceClass(self, {
        player = player,
        entity = dispEntity,
        disp = disp,
        data = nil,
        ioRows = {},
        deliveryRows = {},
        statRows = {},
        depotStatRows = {},
        signalByIndex = nil,
    })
    gui:_reloadDataFromDisp()
    gui.model = gui:_create(disp.stopEntity and disp.stopEntity.backer_name or "?")
    gui:_dataToForm()
    disp.gui = gui
    gui:updateDispInfo()
    player.opened = gui.model.root
    --gui.model.root.force_auto_center()
end

function DispGui:_reloadDataFromDisp()
    self.data = self.disp:getSets()
    self.signalByIndex = {}
    for _, sig in pairs(self.data.signals) do
        if sig.index then
            self.signalByIndex[sig.index] = sig
        end
    end

end

function DispGui:close()
    self:_normalizeData()
    destroyGuiModel(self.model)
    self.disp.gui = nil
    self.disp:setSets(self.data)
    globalUpdateNextTick(self.disp)

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

---@param name LocalisedString
---@return GuiModel
function DispGui:_create(name)
    local STYLE_MARGIN = { left_margin = 12 }
    return createGuiModel(
            self.player.gui.screen,
            self,
            { type = "frame", onClosed = DispGui.onClose, direction = "vertical", auto_center = true, _style1 = { minimal_height = 600 }, _sub = {
                { type = "flow", _sub = {
                    { type = "label", style = "frame_title", caption = { "viirld2-gui.window-title", name }, _dragTarget = "" },
                    { type = "empty-widget", style = "viirld_draggable_space_header", _dragTarget = "" },
                    { type = "button", caption = { "viirld2-gui.rollback" }, style = "viirld_frame_button", _name = EL_ROLLBACK, onAny = DispGui.onAny },
                    { type = "button", caption = { "viirld2-gui.apply" }, style = "viirld_frame_button", _name = EL_APPLY, onAny = DispGui.onAny },
                    { type = "sprite-button", onClick = DispGui.onClose, style = "close_button", sprite = "utility/close", hovered_sprite = "utility/close_black" },
                } },
                { type = "flow", direction = "horizontal", _name = DIV_TABS, _sub = {
                    { type = "frame", style = "entity_frame", _style1 = { vertically_stretchable = true }, direction = "vertical", _sub = {
                        { type = "flow", direction = "horizontal", _sub = {
                            { type = "flow", direction = "vertical", _sub = {
                                { type = "radiobutton", state = false, _share = EL_MODE, onAny = DispGui.onAny, _value = MODE_OFF, caption = { "viirld2-gui.MODE_OFF" }, tooltip = { "viirld2-gui.MODE_OFF-tt" } },
                                { type = "radiobutton", state = false, _share = EL_MODE, onAny = DispGui.onAny, _value = MODE_BIDI, caption = { "viirld2-gui.MODE_BIDI" }, tooltip = { "viirld2-gui.MODE_BIDI-tt" } },
                            } },
                            { type = "flow", direction = "vertical", _style1 = STYLE_MARGIN, _sub = {
                                { type = "radiobutton", state = false, _share = EL_MODE, onAny = DispGui.onAny, _value = MODE_DEPOT, caption = { "viirld2-gui.MODE_DEPOT" }, tooltip = { "viirld2-gui.MODE_DEPOT-tt" } },
                                { type = "radiobutton", state = false, _share = EL_MODE, onAny = DispGui.onAny, _value = MODE_CLEAN, caption = { "viirld2-gui.MODE_CLEAN" }, tooltip = { "viirld2-gui.MODE_CLEAN-tt" } },
                                { type = "radiobutton", state = false, _share = EL_MODE, onAny = DispGui.onAny, _value = MODE_INFO, caption = { "viirld2-gui.MODE_INFO" }, tooltip = { "viirld2-gui.MODE_INFO-tt" } },
                            } },
                        } },
                        { type = "flow", direction = "vertical", _sub = {
                            { type = "flow", direction = "vertical", _name = DIV_BIDI, _sub = {
                                { type = "line", },
                                { type = "frame", style = "slot_button_deep_frame", _sub = {
                                    { type = "table", style = "slot_table", column_count = 10, _sub = (
                                            function()
                                                ---@type GuiDef[]
                                                local buttons = {}
                                                buttons[#buttons + 1] = { type = "choose-elem-button", _share = EL_ITEM_BUTTON, onAny = DispGui.onAny, _value = -1, tooltip = { "viirld2-gui.item-other-tt" }, style = "viirld_slot_button", elem_type = "signal", elem_value = { type = "virtual", name = "signal-anything" }, locked = true, _sub = {
                                                    { type = "flow", direction = "vertical", _style1 = { top_padding = 9 }, ignored_by_interaction = true, _sub = {
                                                        { type = "label", caption = "R", ignored_by_interaction = true, style = "viirld_count_label" },
                                                        { type = "label", caption = "M", ignored_by_interaction = true, style = "viirld_count_label" },
                                                    } }
                                                } }
                                                for i = 1, dispatcherSignalSlotCount - 1 do
                                                    buttons[#buttons + 1] = { type = "choose-elem-button", _share = EL_ITEM_BUTTON, onAny = DispGui.onAny, _value = i, style = "viirld_slot_button", elem_type = "signal", _sub = {
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
                                    { type = "table", column_count = 3, _autoSharesFrom = 2, _sub = {
                                        { type = "label", caption = { "viirld2-gui.item-request" } },
                                        { type = "flow", direction = "horizontal", _sub = {
                                            { type = "textfield", _name = EL_ITEM_REQUEST, onAny = DispGui.onAny, text = "1000", numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", _style1 = STYLE_MARGIN, },
                                            { type = "button", _name = EL_ITEM_REQUEST_UNIT, onAny = DispGui.onAny, style = "viirld_unit" },
                                        } },
                                        { type = "empty-widget" },

                                        { type = "label", caption = { "viirld2-gui.item-min" }, _name = EL_ITEM_MIN_LABEL, tooltip = { "viirld2-gui.item-min-tt" } },
                                        { type = "flow", direction = "horizontal", _sub = {
                                            { type = "textfield", _name = EL_ITEM_MIN, onAny = DispGui.onAny, text = "500", numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", _style1 = STYLE_MARGIN, },
                                            { type = "button", _name = EL_ITEM_MIN_UNIT, onAny = DispGui.onAny, style = "viirld_unit" },
                                        } },
                                        { type = "empty-widget" },

                                        { type = "label", caption = { "viirld2-gui.item-other-min-cargo" }, tooltip = { "viirld2-gui.item-other-min-cargo-tt" } },
                                        { type = "flow", direction = "horizontal", _sub = {
                                            { type = "textfield", _name = EL_AUTO_ITEMS_MIN, onAny = DispGui.onAny, text = "500", numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", _style1 = STYLE_MARGIN, },
                                            { type = "button", _name = EL_AUTO_ITEMS_MIN_UNIT, onAny = DispGui.onAny, style = "viirld_unit" },
                                        } },
                                        { type = "flow", direction = "horizontal", _style1 = { horizontally_stretchable = true, horizontal_align = "right", }, _sub = {
                                            { type = "checkbox", _name = EL_AUTO_ITEMS_PROVIDE, onAny = DispGui.onAny, caption = { "viirld2-gui.cb-autoItemsProvide" }, tooltip = { "viirld2-gui.cb-autoItemsProvide-tt" } },
                                        } },

                                        { type = "label", caption = { "viirld2-gui.item-other-min-fluid" }, tooltip = { "viirld2-gui.item-other-min-fluid-tt" } },
                                        { type = "flow", direction = "horizontal", _sub = {
                                            { type = "textfield", _name = EL_AUTO_FLUID_MIN, onAny = DispGui.onAny, text = "500", numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", _style1 = STYLE_MARGIN, },
                                            { type = "button", _name = EL_AUTO_FLUID_MIN_UNIT, onAny = DispGui.onAny, style = "viirld_unit" },
                                        } },
                                        { type = "flow", direction = "horizontal", _style1 = { horizontally_stretchable = true, horizontal_align = "right", }, _sub = {
                                            { type = "checkbox", _name = EL_AUTO_FLUID_PROVIDE, onAny = DispGui.onAny, caption = { "viirld2-gui.cb-autoFluidProvide" }, tooltip = { "viirld2-gui.cb-autoFluidProvide-tt" } },
                                        } },
                                    } },
                                    { type = "label", caption = { "viirld2-gui.connect-tip" }, _style1 = { single_line = false } },
                                    { type = "flow", direction = "horizontal", _sub = (
                                            function()
                                                ---@type GuiDef[]
                                                local buttons = {}
                                                for i = 1, 8 do
                                                    buttons[#buttons + 1] = { type = "button", _share = EL_ITEM_MEM_BUTTON, onAny = DispGui.onAny, _value = i, style = "viirld_mem", caption = "m" .. tostring(i), tooltip = { "viirld2-gui.mem-tt" } }
                                                end
                                                return buttons
                                            end)()
                                    }
                                } },
                            } },
                            --{ type = "flow", direction = "vertical", _share = DIV_, _name = DIV_DEPOT },
                            --{ type = "flow", direction = "vertical", _share = DIV_, _name = DIV_CLEAN },
                            { type = "line" },
                            { type = "flow", direction = "vertical", _sub = (function()
                                ---@type GuiDef[]
                                local sub = {
                                    { type = "checkbox", _name = FLAG_useSignals, onAny = DispGui.onAny, caption = { "viirld2-gui.cb-FLAG_useSignals" }, tooltip = { "viirld2-gui.cb-FLAG_useSignals-tt" } },
                                    { type = "checkbox", _name = FLAG_useEquals, onAny = DispGui.onAny, caption = { "viirld2-gui.cb-FLAG_useEquals" }, tooltip = { "viirld2-gui.cb-FLAG_useEquals-tt" } },
                                    { type = "checkbox", _name = FLAG_tamp, onAny = DispGui.onAny, caption = { "viirld2-gui.cb-FLAG_tamp" }, tooltip = { "viirld2-gui.cb-FLAG_tamp-tt" } },
                                    { type = "checkbox", _name = FLAG_turnInserters, onAny = DispGui.onAny, caption = { "viirld2-gui.cb-FLAG_turnInserters" }, tooltip = { "viirld2-gui.cb-FLAG_turnInserters-tt" } },
                                    { type = "checkbox", _name = FLAG_compounds, onAny = DispGui.onAny, caption = { "viirld2-gui.cb-FLAG_compounds" }, tooltip = { "viirld2-gui.cb-FLAG_compounds-tt" } },
                                    { type = "checkbox", _name = FLAG_liquidation, onAny = DispGui.onAny, caption = { "viirld2-gui.cb-FLAG_liquidation" }, tooltip = { "viirld2-gui.cb-FLAG_liquidation-tt" } },
                                    { type = "radiobutton", state = false, _share = OPT_OUT_MODE, onAny = DispGui.onAny, _value = OUT_OFF, caption = { "viirld2-gui.OUT_OFF" }, tooltip = { "viirld2-gui.OUT_OFF-tt" } },
                                    { type = "radiobutton", state = false, _share = OPT_OUT_MODE, onAny = DispGui.onAny, _value = OUT_NEED_CONTENTS_NEG, caption = { "viirld2-gui.OUT_NEED_CONTENTS_NEG" }, tooltip = { "viirld2-gui.OUT_NEED_CONTENTS_NEG-tt" } },
                                    { type = "radiobutton", state = false, _share = OPT_OUT_MODE, onAny = DispGui.onAny, _value = OUT_NEED_CONTENTS_POS, caption = { "viirld2-gui.OUT_NEED_CONTENTS_POS" }, tooltip = { "viirld2-gui.OUT_NEED_CONTENTS_POS-tt" } },
                                    { type = "radiobutton", state = false, _share = OPT_OUT_MODE, onAny = DispGui.onAny, _value = OUT_EXCHANGE, caption = { "viirld2-gui.OUT_EXCHANGE" }, tooltip = { "viirld2-gui.OUT_EXCHANGE-tt" } },
                                }
                                return sub
                            end)() },
                            { type = "flow", direction = "vertical", _name = DIV_COMMON, _sub = {
                                { type = "line" },
                                { type = "table", column_count = 2, _autoSharesFrom = 2, _sub = {
                                    { type = "label", caption = { "viirld2-gui.nets" }, tooltip = { "viirld2-gui.nets-tt" } },
                                    { type = "textfield", _name = EL_NETWORK, onAny = DispGui.onAny, text = "1", tooltip = { "viirld2-gui.nets-tt" }, numeric = true, allow_decimal = false, allow_negative = false, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", _style1 = STYLE_MARGIN, },
                                    { type = "label", caption = { "viirld2-gui.comps" }, tooltip = { "viirld2-gui.comps-tt" } },
                                    { type = "textfield", _name = EL_COMPS, onAny = DispGui.onAny, text = "", tooltip = { "viirld2-gui.comps-tt" }, clear_and_focus_on_right_click = true, _style1 = STYLE_MARGIN, _style2 = { width = 280 } },
                                    { type = "label", caption = { "viirld2-gui.priority" }, tooltip = { "viirld2-gui.priority-tt" } },
                                    { type = "textfield", _name = EL_PRIORITY, onAny = DispGui.onAny, text = "0", tooltip = { "viirld2-gui.priority-tt" }, numeric = true, allow_decimal = true, allow_negative = true, clear_and_focus_on_right_click = true, style = "viirld_number_textfield", _style1 = STYLE_MARGIN, },
                                    --[[{ type = "flow", direction = "horizontal", _sub = {
                                        { type = "sprite-button", _share = EL_COMPS_BUTTON, _value = ", ", sprite = nil }
                                    }},
                                    { type = "table", _name = EL_COMPS_BUTTONS, column_count = 7, _style1 = STYLE_MARGIN, _sub = (function()
                                        ---@type GuiDef[]
                                        local buttons = {}
                                        local types = { "locomotive", "cargo-wagon", "fluid-wagon", "artillery-wagon"}
                                        for _, type in pairs(types) do
                                            for name, proto in pairs(game.entity_prototypes) do
                                                if proto.type == type then
                                                    buttons[#buttons + 1] = {
                                                        type = "sprite-button",
                                                        _share = EL_COMPS_BUTTON,
                                                        _value = "[entity=" .. proto.name .. "]",
                                                        tooltip = proto.localised_name,
                                                        sprite = "entity/" .. proto.name,
                                                    }
                                                end
                                            end
                                        end
                                        return buttons
                                    end)() },]]
                                } },
                            } },
                        } }
                    } },
                    { type = "scroll-pane", style = "scroll_pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "always", _style1 = { vertically_stretchable = true, padding = 6 }, direction = "vertical", _share = TAB_STATUS, _sub = {
                        { type = "flow", direction = "vertical", _style1 = { vertically_stretchable = true, vertical_spacing = 8 }, _sub = {
                            { type = "label", caption = { "viirld2-gui.req-prov-head", table.concat(REQUEST_COLOR, ','), table.concat(PROVIDE_COLOR, ',') }, style = "caption_label" },
                            { type = "table", column_count = 4, _name = EL_IO_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = "", style = "heading_2_label" },
                                { type = "label", caption = { "viirld2-gui.req-prov-count" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "viirld2-gui.req-prov-on-way" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", style = "heading_2_label", },
                            }, _row = {
                                { type = "label", caption = "" },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "" },
                            } },
                            { type = "line" },
                            { type = "label", caption = { "viirld2-gui.deliveries-head" }, style = "caption_label" },
                            { type = "table", column_count = 3, _name = EL_DELIVERIES_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = { "viirld2-gui.deliveries-from" }, style = "heading_2_label", _style1 = { minimal_width = 150 } },
                                { type = "label", caption = { "viirld2-gui.deliveries-to" }, style = "heading_2_label", _style1 = { minimal_width = 150 } },
                                { type = "label", caption = { "viirld2-gui.deliveries-time" }, style = "heading_2_label" },
                            }, _row = {
                                { type = "label", caption = "", _style1 = { single_line = false } },
                                { type = "label", caption = "", _style1 = { single_line = false } },
                                { type = "label", caption = "" },
                            } },
                            { type = "line" },
                            { type = "flow", direction = "horizontal", _sub = {
                                { type = "label", caption = { "viirld2-gui.stat-head" }, style = "caption_label" },
                                { type = "empty-widget", _style1 = { horizontally_stretchable = true } },
                                { type = "label", caption = { "viirld2-gui.stat-trains", 0 }, _name = EL_STAT_TRAINS },
                            } },
                            { type = "table", column_count = 4, _name = EL_CARGO_STAT_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = { "viirld2-gui.stat-count" }, style = "heading_2_label", _style1 = { minimal_width = 70 } },
                                { type = "label", caption = { "viirld2-gui.stat-sent" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "viirld2-gui.stat-recv" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "viirld2-gui.stat-lastTime" }, style = "heading_2_label" },
                            }, _row = {
                                { type = "label", caption = "", _style1 = { minimal_width = 70 } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70 } },
                            } },
                            { type = "table", column_count = 3, _name = EL_DEPOT_STAT_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = "", style = "heading_2_label", _style1 = { minimal_width = 70 } },
                                { type = "label", caption = { "viirld2-gui.stat-depot-trains" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "viirld2-gui.stat-depot-freeTrains" }, style = "heading_2_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                            }, _row = {
                                { type = "label", caption = "", _style1 = { minimal_width = 70 } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                            } },
                            --[[DEBUG]] { type = "line" },
                            --[[DEBUG]] { type = "label", caption = "Debug", style = "caption_label" },
                            --[[DEBUG]] { type = "label", _name = EL_DEBUG, caption = "", _style1 = { single_line = false } },
                        } },
                    } }
                } },
            } }
    )
end

function DispGui:_normalizeData()
    local named = self.model.named
    local data = self.data
    data.flagUseSignals = data.flagUseSignals or nil
    data.flagUseEquals = data.flagUseEquals or nil
    data.flagTamp = data.flagTamp or nil
    data.flagTurnInserters = data.flagTurnInserters or nil
    data.flagCompounds = data.flagCompounds or nil
    data.flagLiquidation = data.flagLiquidation or nil
    data.autoItemsMin = validCountWithUnits(data.autoItemsMin, true)
    data.autoFluidMin = validCountWithUnits(data.autoFluidMin, true)
    data.autoItemsNoProvide = data.autoItemsNoProvide or nil
    data.autoFluidNoProvide = data.autoFluidNoProvide or nil
    for _, sig in pairs(self.signalByIndex) do
        sig.request = validCountWithUnits(sig.request, true)
        sig.min = validCountWithUnits(sig.min, true)
    end
    data.comps = normalizeCompositions(data.comps)
end

function DispGui:_updateCounters()
    local data = self.data
    local named = self.model.named
    local shares = self.model.shares
    for _, btn in pairs(shares[EL_ITEM_BUTTON]) do
        local index = --[[---@type number]]btn.tags._value
        ---@type LocalisedString, LocalisedString
        local label1, label2
        if index == -1 then
            local c = validCountWithUnits(data.autoItemsMin)
            local f = validCountWithUnits(data.autoFluidMin)
            if c then
                label1 = countWithUnitsToString(c)
            end
            if f then
                label2 = countWithUnitsToString(f)
            end
            local icon = (c or f) and "signal-anything" --[[green]] or "signal-everything" --[[red]]
            if (--[[---@type SignalID]]btn.elem_value).name ~= icon then
                btn.elem_value = { type = "virtual", name = icon }
            end
        else
            local signal = self.signalByIndex[index]
            if signal then
                local req = validCountWithUnits(signal.request)
                if req then
                    label1 = countWithUnitsToString(req)
                else
                    label1 = "+"
                end
                local min = validCountWithUnits(signal.min)
                if min then
                    label2 = countWithUnitsToString(min)
                else
                    label2 = "0"
                end
            end
        end
        btn.children[1].children[1].caption = label1 or ""
        btn.children[1].children[2].caption = label2 or ""
    end
end

function DispGui:_updateMemButtons()
    local shares = self.model.shares
    local forceIndex = (--[[---@type LuaForce]]self.player.force).index
    storage.mem[forceIndex] = storage.mem[forceIndex] or {}

    if self.selectedItem then
        --[[DEBUG]]log("self.selectedItem: " .. var_dump(self.selectedItem))
        storage.mem[forceIndex][self.selectedItem.type] = storage.mem[forceIndex][self.selectedItem.type] or {}
        for _, el in pairs(shares[EL_ITEM_MEM_BUTTON]) do
            local v = storage.mem[forceIndex][self.selectedItem.type][el.tags._value]
            el.style = v and "viirld_mem_active" or "viirld_mem"
            if v then
                el.tooltip = { "", { "viirld2-gui.mem-item-tt" }, {
                    "viirld2-gui.mem-item-active-tt",
                    validCountWithUnits(v.request) and countWithUnitsToString2(v.request) or { "viirld2-gui.mem-item-no-req" },
                    validCountWithUnits(v.min) and countWithUnitsToString2(v.min) or { "viirld2-gui.mem-item-no-min" }
                } }
            else
                el.tooltip = { "viirld2-gui.mem-item-tt" }
            end
        end
    else
        storage.mem[forceIndex].other = storage.mem[forceIndex].other or {}
        for _, el in pairs(shares[EL_ITEM_MEM_BUTTON]) do
            local v = storage.mem[forceIndex].other[el.tags._value]
            el.style = v and "viirld_mem_active" or "viirld_mem"
            if v then
                el.tooltip = { "", { "viirld2-gui.mem-item-tt" }, {
                    "viirld2-gui.mem-other-active-tt",
                    validCountWithUnits(v.autoItemsMin) and countWithUnitsToString2(v.autoItemsMin) or { "viirld2-gui.mem-other-no-cargo" },
                    validCountWithUnits(v.autoFluidMin) and countWithUnitsToString2(v.autoFluidMin) or { "viirld2-gui.mem-other-no-fluid" }
                } }
            else
                el.tooltip = { "viirld2-gui.mem-item-tt" }
            end
        end
    end
end

function DispGui:_updateVisibleAndEnabled()
    local data = self.data
    local named = self.model.named
    local shares = self.model.shares

    --guiSetVisible(shares[TAB_STATUS], self.stop ~= nil)

    named[DIV_BIDI].visible = data.mode == MODE_BIDI
    named[DIV_COMMON].visible = data.mode ~= MODE_OFF
    named[DIV_ITEM].visible = self.selectedButton ~= nil

    guiSetVisible(shares[EL_ITEM_REQUEST], self.selectedItem ~= nil)
    guiSetVisible(shares[EL_ITEM_MIN], self.selectedItem ~= nil)
    guiSetVisible(shares[EL_AUTO_ITEMS_MIN], self.selectedButton ~= nil and self.selectedItem == nil)
    guiSetVisible(shares[EL_AUTO_FLUID_MIN], self.selectedButton ~= nil and self.selectedItem == nil)

    named[FLAG_useSignals].visible = data.mode == MODE_BIDI or data.mode == MODE_CLEAN
    named[FLAG_useEquals].visible = data.mode == MODE_BIDI
    named[FLAG_tamp].visible = data.mode == MODE_BIDI
    named[FLAG_turnInserters].visible = data.mode == MODE_BIDI
    named[FLAG_compounds].visible = data.mode == MODE_BIDI
    named[FLAG_liquidation].visible = data.mode == MODE_BIDI
    guiSetVisible(shares[OPT_OUT_MODE], data.mode == MODE_BIDI)

    guiSetVisible(shares[EL_NETWORK], data.mode == MODE_BIDI)
    guiSetVisible(shares[EL_PRIORITY], data.mode == MODE_BIDI or data.mode == MODE_CLEAN)
    guiSetVisible(shares[EL_COMPS], data.mode == MODE_BIDI or data.mode == MODE_CLEAN or data.mode == MODE_DEPOT)
    -- guiSetVisible(shares[EL_COMPS_BUTTONS], data.mode ~= MODE_OFF)

    named[EL_CARGO_STAT_TABLE].visible = data.mode == MODE_BIDI
    named[EL_DEPOT_STAT_TABLE].visible = data.mode ~= MODE_BIDI

    self:_updateCounters()
end

function DispGui:_dataToForm()
    local named = self.model.named
    self.selectedButton = nil
    self.selectedItem = nil
    guiSetRadiobutton(self.model, EL_MODE, self.data.mode)
    for _, el in pairs(self.model.shares[EL_ITEM_BUTTON]) do
        if el.tags._value > 0 then
            el.elem_value = self.signalByIndex[--[[---@type number]]el.tags._value]
            if el.elem_value then
                el.locked = true
            end
        else
            el.locked = true
        end
    end
    named[FLAG_useSignals].state = self.data.flagUseSignals
    named[FLAG_useEquals].state = self.data.flagUseEquals
    named[FLAG_tamp].state = self.data.flagTamp
    named[FLAG_turnInserters].state = self.data.flagTurnInserters
    named[FLAG_compounds].state = self.data.flagCompounds
    named[FLAG_liquidation].state = self.data.flagLiquidation
    guiSetRadiobutton(self.model, OPT_OUT_MODE, self.data.out or OUT_NEED_CONTENTS_NEG)
    named[EL_NETWORK].text = tostring(self.data.network or 0)
    named[EL_PRIORITY].text = tostring(self.data.priority or 0)
    named[EL_COMPS].text = self.data.comps or ""
    self:_updateVisibleAndEnabled()
end

function DispGui:_itemDataToForm()
    local named = self.model.named
    local btn = self.selectedButton
    local item = self.selectedItem
    if btn then
        if item then
            guiSetCountWithUnits(
                    named[EL_ITEM_REQUEST],
                    named[EL_ITEM_REQUEST_UNIT],
                    item.request
            )
            guiSetCountWithUnits(
                    named[EL_ITEM_MIN],
                    named[EL_ITEM_MIN_UNIT],
                    item.min
            )
        else
            guiSetCountWithUnits(
                    named[EL_AUTO_ITEMS_MIN],
                    named[EL_AUTO_ITEMS_MIN_UNIT],
                    self.data.autoItemsMin
            )
            guiSetCountWithUnits(
                    named[EL_AUTO_FLUID_MIN],
                    named[EL_AUTO_FLUID_MIN_UNIT],
                    self.data.autoFluidMin
            )
            named[EL_AUTO_ITEMS_PROVIDE].state = not self.data.autoItemsNoProvide
            named[EL_AUTO_FLUID_PROVIDE].state = not self.data.autoFluidNoProvide
        end
    end
end

---@overload fun()
function DispGui:onClose(event)
    self:close()
end

---@overload fun()
function DispGui:onAny(event)
    local element = --[[---@type LuaGuiElement]]event.element
    local _name = element.tags._name
    local _share = element.tags._share
    if not _name and not _share then
        return
    end
    local focusTo
    local doUpdateVisible
    local doUpdateElemButtons
    local doUpdateCounters
    local doUpdateItemForm
    local doUpdateMemButtons
    if event.name == defines.events.on_gui_click then
        -- click
        if _share == EL_ITEM_MEM_BUTTON then
            local forceIndex = self.player.force.index
            storage.mem[forceIndex] = storage.mem[forceIndex] or {}
            if self.selectedItem then
                storage.mem[forceIndex][self.selectedItem.type] = storage.mem[forceIndex][self.selectedItem.type] or {}
                if event.button == defines.mouse_button_type.left then
                    if event.control or event.alt or event.shift then
                        storage.mem[forceIndex][self.selectedItem.type][element.tags._value] = {
                            request = validCountWithUnits(copyCountWithUnits(self.selectedItem.request), true),
                            min = validCountWithUnits(copyCountWithUnits(self.selectedItem.min), true)
                        }
                        doUpdateMemButtons = true
                    else
                        local mem = storage.mem[forceIndex][self.selectedItem.type][element.tags._value]
                        if mem then
                            self.selectedItem.request = copyCountWithUnits(mem.request)
                            self.selectedItem.min = copyCountWithUnits(mem.min)
                            doUpdateElemButtons = true
                            focusTo = 1
                        end
                    end
                elseif event.button == defines.mouse_button_type.right then
                    storage.mem[forceIndex][self.selectedItem.type][element.tags._value] = nil
                    doUpdateMemButtons = true
                end
            else
                storage.mem[forceIndex].other = storage.mem[forceIndex].other or {}
                if event.button == defines.mouse_button_type.left then
                    if event.control or event.alt or event.shift then
                        storage.mem[forceIndex].other[element.tags._value] = {
                            autoItemsMin = validCountWithUnits(copyCountWithUnits(self.data.autoItemsMin), true),
                            autoFluidMin = validCountWithUnits(copyCountWithUnits(self.data.autoFluidMin), true)
                        }
                        doUpdateMemButtons = true
                    else
                        local mem = storage.mem[forceIndex].other[element.tags._value]
                        if mem then
                            self.data.autoItemsMin = copyCountWithUnits(mem.autoItemsMin)
                            self.data.autoFluidMin = copyCountWithUnits(mem.autoFluidMin)
                            doUpdateElemButtons = true
                            focusTo = 1
                        end
                    end
                elseif event.button == defines.mouse_button_type.right then
                    storage.mem[forceIndex].other[element.tags._value] = nil
                    doUpdateMemButtons = true
                end
            end
        end
        if _share == EL_ITEM_BUTTON then
            if event.button == defines.mouse_button_type.right then
                if element.tags._value ~= -1 then
                    element.locked = false
                    element.elem_value = nil
                    self.selectedButton = nil
                    local sig = self.signalByIndex[--[[---@type number]]element.tags._value]
                    if sig then
                        self.signalByIndex[--[[---@type number]]element.tags._value] = nil
                        if sig.typeAndName then
                            self.data.signals[sig.typeAndName] = nil
                        end
                    end
                    doUpdateElemButtons = true
                else
                    if self.selectedButton == -1 then
                        if (self.data.autoItemsMin and self.data.autoItemsMin.count)
                                or (self.data.autoFluidMin and self.data.autoFluidMin.count)
                        then
                            self.data.autoItemsMin = setCount(self.data.autoItemsMin, nil)
                            self.data.autoFluidMin = setCount(self.data.autoFluidMin, nil)
                        else
                            self.data.autoItemsMin = setCount(nil, 1000)
                            self.data.autoFluidMin = setCount(nil, 1000)
                        end
                    else
                        self.selectedButton = -1
                        focusTo = 1
                    end
                    doUpdateElemButtons = true
                end
            elseif event.button == defines.mouse_button_type.left and event.element.elem_value then
                if element.locked then
                    element.locked = element.tags._value == -1
                    self.selectedButton = --[[---@type number]]element.tags._value
                    doUpdateElemButtons = true
                    focusTo = 1
                end
            end
        elseif _name == EL_APPLY then
            local selectedButton = self.selectedButton
            self:_normalizeData()
            self.disp:setSets(self.data)
            globalUpdateNextTick(self.disp)
            self:_reloadDataFromDisp()
            self:_dataToForm()
            self:updateDispInfo()
            --if self.disp.stop then
            --    self.disp.stop:update()
            --    self.disp.stop:updateInputPort()
            --    self.disp.stop:updateOutputPort()
            --end
            self.selectedButton = selectedButton
            doUpdateVisible = true
            doUpdateElemButtons = true
            doUpdateCounters = true
            doUpdateItemForm = true
            doUpdateMemButtons = true
        elseif _name == EL_ROLLBACK then
            local selectedButton = self.selectedButton
            self:_reloadDataFromDisp()
            self:_dataToForm()
            self:updateDispInfo()
            self.selectedButton = selectedButton
            doUpdateVisible = true
            doUpdateElemButtons = true
            doUpdateCounters = true
            doUpdateItemForm = true
            doUpdateMemButtons = true
        elseif _name == EL_ITEM_REQUEST_UNIT then
            self.selectedItem.request = guiNextUnit(element, self.selectedItem.request, self.selectedItem.type)
            doUpdateCounters = true
        elseif _name == EL_ITEM_MIN_UNIT then
            self.selectedItem.min = guiNextUnit(element, self.selectedItem.min, self.selectedItem.type)
            doUpdateCounters = true
        elseif _name == EL_AUTO_ITEMS_MIN_UNIT then
            self.data.autoItemsMin = guiNextUnit(element, self.data.autoItemsMin, "item")
            doUpdateCounters = true
        elseif _name == EL_AUTO_FLUID_MIN_UNIT then
            self.data.autoFluidMin = guiNextUnit(element, self.data.autoFluidMin, "fluid")
            doUpdateCounters = true
        elseif _share == EL_COMPS_BUTTON then
            self.model.named[EL_COMPS].text = self.model.named[EL_COMPS].text .. element.tags._value
            self.model.named[EL_COMPS].focus()
        end
    else
        -- any changed event
        if _share == EL_MODE then
            self.data.mode = guiHandleRadiobutton(self.model, element)
            self.selectedButton = nil
            doUpdateVisible = true
            doUpdateElemButtons = true
        elseif _share == OPT_OUT_MODE then
            self.data.out = guiHandleRadiobutton(self.model, element)
        elseif _share == EL_ITEM_BUTTON then
            element.locked = false
            local _value = --[[---@type number]] element.tags._value
            local type0 = element.elem_value and (--[[---@type SignalID]]element.elem_value).type
            local name0 = element.elem_value and (--[[---@type SignalID]]element.elem_value).name
            local typeAndName0 = element.elem_value and toTypeAndName(--[[---@type SignalID]]element.elem_value)
            local valid = true
            if type0 and type0 ~= "item" and type0 ~= "fluid" then
                valid = false
            end
            if typeAndName0 then
                if self.data.signals[typeAndName0] and self.data.signals[typeAndName0].index ~= _value then
                    valid = false
                end
            end
            if valid then
                local signal = self.signalByIndex[_value]
                if signal and signal.type ~= type0 then
                    signal = nil
                end
                if not signal then
                    signal = --[[---@type DispSignal]]{
                        index = _value,
                    }
                    self.signalByIndex[_value] = signal
                    if typeAndName0 then
                        self.data.signals[typeAndName0] = signal
                    end
                end
                signal.type = type0
                signal.name = name0
            else
                element.elem_value = nil
            end
            self.selectedButton = element.elem_value and _value or nil
            doUpdateElemButtons = true
            focusTo = 1
        elseif _name == EL_ITEM_REQUEST then
            self.selectedItem.request = setCount(self.selectedItem.request, toInt32Range(toPosNumber(element.text)))
            doUpdateCounters = true
        elseif _name == EL_ITEM_MIN then
            self.selectedItem.min = setCount(self.selectedItem.min, toInt32Range(toNotNegNumber(element.text)))
            doUpdateCounters = true
        elseif _name == EL_AUTO_ITEMS_MIN then
            self.data.autoItemsMin = setCount(self.data.autoItemsMin, toInt32Range(toNotNegNumber(element.text)))
            doUpdateCounters = true
        elseif _name == EL_AUTO_FLUID_MIN then
            self.data.autoFluidMin = setCount(self.data.autoFluidMin, toInt32Range(toNotNegNumber(element.text)))
            doUpdateCounters = true
        elseif _name == EL_AUTO_ITEMS_PROVIDE then
            self.data.autoItemsNoProvide = (not element.state) or nil
        elseif _name == EL_AUTO_FLUID_PROVIDE then
            self.data.autoFluidNoProvide = (not element.state) or nil
        elseif _name == EL_NETWORK then
            self.data.network = toInt32Range(tonumber(element.text) or 0)
        elseif _name == EL_PRIORITY then
            self.data.priority = toInt32Range(tonumber(element.text) or 0)
        elseif _name == EL_COMPS then
            self.data.comps = element.text
        elseif _name == FLAG_useSignals then
            self.data.flagUseSignals = element.state or nil
        elseif _name == FLAG_useEquals then
            self.data.flagUseEquals = element.state or nil
        elseif _name == FLAG_tamp then
            self.data.flagTamp = element.state or nil
        elseif _name == FLAG_turnInserters then
            self.data.flagTurnInserters = element.state or nil
        elseif _name == FLAG_compounds then
            self.data.flagCompounds = element.state or nil
        elseif _name == FLAG_liquidation then
            self.data.flagLiquidation = element.state or nil
        end
    end
    if doUpdateElemButtons then
        self:_updateElemButtons(element)
        doUpdateItemForm = true
        doUpdateVisible = true
        doUpdateCounters = true
    end
    if doUpdateCounters then
        self:_updateCounters()
    end
    if doUpdateItemForm then
        self:_itemDataToForm()
    end
    if doUpdateVisible then
        self:_updateVisibleAndEnabled()
        doUpdateMemButtons = true
    end
    if doUpdateMemButtons then
        self:_updateMemButtons()
    end
    if focusTo then
        if focusTo == 1 then
            local el
            if self.selectedItem then
                if self.model.named[EL_ITEM_REQUEST].visible then
                    el = self.model.named[EL_ITEM_REQUEST]
                else
                    el = self.model.named[EL_ITEM_MIN]
                end
            elseif self.selectedButton then
                el = self.model.named[EL_AUTO_ITEMS_MIN]
            end
            if el then
                el.focus()
                el.select_all()
            end
        end
    end
end

---@param element LuaGuiElement
function DispGui:_updateElemButtons(element)
    if self.selectedButton then
        if self.selectedButton > 0 then
            self.signalByIndex[self.selectedButton] = self.signalByIndex[self.selectedButton] or { index = self.selectedButton }
        end
        self.selectedItem = self.selectedButton ~= -1 and self.signalByIndex[self.selectedButton] or nil
    else
        self.selectedItem = nil
    end
    for _, el in pairs(self.model.shares[EL_ITEM_BUTTON]) do
        el.style = self.selectedButton == el.tags._value and "viirld_slot_button_selected" or "viirld_slot_button"
        if el ~= element and self.selectedButton ~= nil then
            el.locked = not not el.elem_value
        end
    end
end

function DispGui:updateDispInfo()
    local disp = self.disp
    local named = self.model.named

    guiTableBeginUpdate(self.model, EL_IO_TABLE)
    ---@param typeAndName TypeAndName
    local function registerName(self, typeAndName)
        local row, added = guiTableAddOrGetRow(self.model, EL_IO_TABLE, typeAndName)
        if added then
            row.cells[1].caption = "[" .. typeAndName .. "]"
        end
    end
    if disp.request then
        for typeAndName, _ in pairs(disp.request) do
            registerName(self, typeAndName)
        end
    end
    if disp.provide then
        for typeAndName, _ in pairs(disp.provide) do
            registerName(self, typeAndName)
        end
    end
    if disp.deliveryChanges then
        for typeAndName, _ in pairs(disp.deliveryChanges) do
            registerName(self, typeAndName)
        end
    end
    guiTableEndUpdate(self.model, EL_IO_TABLE)
    local rows = guiTableGetRows(self.model, EL_IO_TABLE)
    for typeAndName, row in pairs(--[[---@type table<TypeAndName, GuiModel>]]rows) do
        ---@type LocalisedString, LocalisedString
        local state, stateTt
        local request = disp.request and disp.request[typeAndName]
        if request then
            row.cells[2].caption = '−' .. util.format_number(-request._count, false)
            if request.error and request.errorTick then
                state = { "", request.error, " ", util.formattime(game.tick - (request.errorTick or 0)) }
            else
                state = request.error
            end
            stateTt = request.errorTt
            row.cells[2].style.font_color = request._request > 0 and REQUEST_COLOR or UNDER_MIN_COLOR
            row.cells[2].style.font = request._request > 0 and 'default-bold' or 'default'
        else
            local provide = disp.provide and disp.provide[typeAndName]
            if provide then
                row.cells[2].caption = '+' .. util.format_number(provide._count, false)
                row.cells[2].style.font_color = provide._provide > 0 and PROVIDE_COLOR or UNDER_MIN_COLOR
                row.cells[2].style.font = provide._provide > 0 and 'default-bold' or 'default'
            else
                row.cells[2].caption = "-"
                row.cells[2].style.font_color = UNDER_MIN_COLOR
                row.cells[2].style.font = 'default'
            end
        end
        if disp.deliveryChanges[typeAndName] then
            row.cells[3].caption = util.format_number(disp.deliveryChanges[typeAndName], false)
        else
            row.cells[3].caption = "-"
        end
        row.cells[4].caption = state or ""
        row.cells[4].tooltip = stateTt or ""
    end

    guiTableBeginUpdate(self.model, EL_DELIVERIES_TABLE)
    for uid, delivery in pairs(disp.deliveries) do
        local row = guiTableAddOrGetRow(self.model, EL_DELIVERIES_TABLE, uid)
        do
            ---@type string[]
            local text = {}
            text[#text + 1] = delivery.provider.stopEntity.backer_name
            if delivery.providerPassed then
                text[#text + 1] = "."
            end
            for typeAndName, count in pairs(delivery.contents) do
                text[#text + 1] = "\n    [" .. typeAndName .. "] " .. util.format_number(count, false)
            end
            row.cells[1].caption = table.concat(text)
        end
        do
            ---@type string[]
            local text = {}
            text[#text + 1] = delivery.requester.stopEntity.backer_name
            if delivery.requesterPassed then
                text[#text + 1] = "."
            end
            row.cells[2].caption = table.concat(text)
        end
        row.cells[3].caption = util.formattime(game.tick - (delivery.startTick or 0))
    end
    guiTableEndUpdate(self.model, EL_DELIVERIES_TABLE)

    named[EL_STAT_TRAINS].caption = { "viirld2-gui.stat-trains", util.format_number(disp.statTrains or 0, false) }

    if disp.mode == MODE_BIDI then
        guiTableBeginUpdate(self.model, EL_CARGO_STAT_TABLE)
        if disp.stat then
            for typeAndName, stat in pairs(disp.stat) do
                local rowModel, added = guiTableAddOrGetRow(self.model, EL_CARGO_STAT_TABLE, typeAndName)
                if added then
                    rowModel.cells[1].caption = "[" .. typeAndName .. "] " .. (stat.deliveries and util.format_number(stat.deliveries, false) or "?")
                end
                rowModel.cells[2].caption = stat.provided and util.format_number(stat.provided, true) or "-"
                rowModel.cells[3].caption = stat.received and util.format_number(stat.received, true) or "-"
                rowModel.cells[4].caption = stat.lastTick and util.formattime(game.tick - stat.lastTick) or "-"
            end
        end
        guiTableEndUpdate(self.model, EL_CARGO_STAT_TABLE)
    else
        ---@type table<LocalisedString, {count: number, free: number}>
        local stats = {}
        for _, mover in pairs(disp.net.movers) do
            local name = MoverClass.trainTypeToStr(mover.trainType)
            if ((not disp.compFlags) or disp.compFlags[mover.comp]) then
                stats[name] = stats[name] or { count = 0, free = 0 }
                stats[name].count = stats[name].count + 1
                if mover.isFree then
                    stats[name].free = stats[name].free + 1
                end
            end
        end
        guiTableBeginUpdate(self.model, EL_DEPOT_STAT_TABLE)
        for name, stat in pairs(stats) do
            local mover = guiTableAddOrGetRow(self.model, EL_DEPOT_STAT_TABLE, name)
            mover.cells[1].caption = name
            mover.cells[2].caption = stat.count
            mover.cells[3].caption = stat.free
        end
        guiTableEndUpdate(self.model, EL_DEPOT_STAT_TABLE)
    end

    --[[DEBUG_BEGIN]]
    ---@type string[]
    local debugLines = {}
    debugLines[#debugLines + 1] = "uid: " .. tostring(disp.uid)
    debugLines[#debugLines + 1] = "net: " .. tostring(disp.net and disp.net.title)
    debugLines[#debugLines + 1] = "active: " .. tostring(disp.active and "yes" or "no")
    debugLines[#debugLines + 1] = "storage.activeDisps: " .. tostring(storage.activeDisps[disp.uid] and "yes" or "no")
    debugLines[#debugLines + 1] = "lastUpdateTick: " .. tostring(disp.lastUpdateTick)
    if disp.inserters then
        debugLines[#debugLines + 1] = "Inserters: " .. tostring(table_size(disp.inserters))
    end
    -- [[DEBUG]]log("updateDispInfo(): disp.signals = " .. var_dump(disp.signals))
    for typeAndName, sig in pairs(disp.signals) do
        local prefix = "[" .. typeAndName .. "] "
        for k, v in pairs(sig) do
            debugLines[#debugLines + 1] = prefix .. k .. ": " .. var_dump(v)
        end
        if disp.deliveryChanges and disp.deliveryChanges[typeAndName] then
            debugLines[#debugLines + 1] = prefix .. "DC=" .. tostring(disp.deliveryChanges[typeAndName])
        end
        if disp.provide and disp.provide[typeAndName] then
            debugLines[#debugLines + 1] = prefix .. "PROVIDE"
        end
        if disp.net.provide
                and disp.net.provide[disp.network]
                and disp.net.provide[disp.network][typeAndName]
                and disp.net.provide[disp.network][typeAndName][disp.uid]
        then
            debugLines[#debugLines + 1] = prefix .. "PROVIDE IN NETWORK"
        end

        if disp.request and disp.request[typeAndName] then
            debugLines[#debugLines + 1] = prefix .. "REQUEST"
        end
    end
    if disp.deliveryChanges then
        for typeAndName, v in pairs(disp.deliveryChanges) do
            if not disp.signals[typeAndName] then
                local prefix
                prefix = "[" .. typeAndName .. "] "
                debugLines[#debugLines + 1] = prefix .. "!DC=" .. tostring(v)
            end
        end
    end
    named[EL_DEBUG].caption = table.concat(debugLines, "\n")
    --[[DEBUG_END]]
end

