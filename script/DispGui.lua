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

local FLAG_flagReverseLocos = 2001
local FLAG_flagUseSignals = 2002
local FLAG_flagMute = 2003
local FLAG_flagBuild = 2004
local FLAG_flagDestroy = 2005
local FLAG_flagUseEquals = 2006
local FLAG_flagTamp = 2007
local FLAG_flagTurnInserters = 2008
local FLAG_flagAllowMulti = 2009
local FLAG_flagAllowLoadToNotEmpty = 2010
local FLAG_flagAllowPartUnload = 2011
local OPT_OUT_MODE = 2012

local EL_MODE = 3001
local EL_NETWORKS = 3003
local EL_COMPS = 3004
local EL_COMPS_BUTTONS = 3005
local EL_COMPS_BUTTON = 3006

local EL_OTHER_BUTTON = 3102
local EL_ITEM_BUTTON = 3101
local EL_ITEM_MIN = 3103
local EL_ITEM_MIN_LABEL = 3107
local EL_ITEM_MIN_UNIT = 3104
local EL_ITEM_REQUEST = 3105
local EL_ITEM_REQUEST_UNIT = 3106
local EL_ITEM_MEM_BUTTON = 3108

local EL_ANY_MIN_CARGO = 3201
local EL_ANY_MIN_CARGO_UNIT = 3202
local EL_ANY_MIN_FLUID = 3203
local EL_ANY_MIN_FLUID_UNIT = 3204

local EL_IO_TABLE = 5005
local EL_DELIVERIES_TABLE = 5006
local EL_CARGO_STAT_TABLE = 5007

local EL_STAT_TRAINS = 6001

local EL_CLOSE = 9000
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
    ---@field data DispSettings
    ---@field selectedButton number @nullable
    ---@field selectedItem DispSignal @nullable
DispGui = {
}

local preventClose = false

---@param event OnGuiOpened
function DispGui.handleGuiOpened(event)
    if event.entity.name == "yatm-dispatcher" then
        local player = --[[---@type LuaPlayer]] game.players[event.player_index]
        ---@type DispGui
        local gui = global.guis[player.index]
        if gui then
            gui:close()
        end
        DispGui:open(player, event.entity)
    end
end

---@field event OnGuiClosed
function DispGui.handleGuiClosed(event)
    if not preventClose then
        ---@type DispGui
        local gui = global.guis[event.player_index]
        if gui then
            gui:close()
        end
    end
end

function DispGui.handleGuiEvent(event)
    local gui = global.guis[event.player_index]
    if gui then
        gui:_handleGuiEvent(event)
    end
end

---@param player LuaPlayer
---@param dispEntity LuaEntity @ dispatcher entity
function DispGui:open(player, dispEntity)
    ---@type DispClass
    local disp = DispClass.ofEntity(dispEntity)

    ---@type DispGui
    local gui = instanceClass(self, {
        player = player,
        entity = dispEntity,
        disp = disp,
        data = disp:getSettings(),
        ioRows = {},
        deliveryRows = {},
        statRows = {},
    })
    gui.model = gui:_create()
    gui:_dataToForm()
    disp.gui = gui
    global.guis[player.index] = gui
    gui:updateStopInfo()
    preventClose = true
    player.opened = gui.model.root
    preventClose = false
    --gui.model.root.force_auto_center()
end

function DispGui:close()
    self:_normalizeData()
    global.guis[self.player.index] = nil
    self.model.root.destroy()
    self.disp.gui = nil
    self.disp:setSettings(self.data)
end

---@return GuiModel
function DispGui:_create()
    local STYLE_MARGIN = { left_margin = 12 }
    return createGuiModel(
            self.player.gui.screen,
            { namedTag = ST_TAG },
            { type = "frame", name = ST_TAG, direction = "vertical", auto_center = true, _style1 = { minimal_height = 600 }, _sub = {
                { type = "flow", _sub = {
                    { type = "label", style = "frame_title", caption = { "yatm-gui.window-title" }, _dragTarget = "" },
                    { type = "empty-widget", style = "yatm_draggable_space_header", _dragTarget = "" },
                    { type = "button", caption = { "yatm-gui.rollback" }, style = "yatm_frame_button", _name = EL_ROLLBACK },
                    { type = "button", caption = { "yatm-gui.apply" }, style = "yatm_frame_button", _name = EL_APPLY },
                    { type = "sprite-button", _name = EL_CLOSE, style = "close_button", sprite = "utility/close_white", hovered_sprite = "utility/close_black" },
                } },
                { type = "flow", direction = "horizontal", _name = DIV_TABS, _sub = {
                    { type = "frame", style = "entity_frame", _style1 = { vertically_stretchable = true }, direction = "vertical", _sub = {
                        { type = "flow", direction = "horizontal", _sub = {
                            { type = "flow", direction = "vertical", _sub = {
                                { type = "radiobutton", state = false, _share = EL_MODE, _value = ST_MODE_OFF, caption = { "yatm-gui.mode-off" }, tooltip = { "yatm-gui.mode-off-tt" } },
                                { type = "radiobutton", state = false, _share = EL_MODE, _value = ST_MODE_BIDI, caption = { "yatm-gui.mode-bidi" }, tooltip = { "yatm-gui.mode-bidi-tt" } },
                            } },
                            { type = "flow", direction = "vertical", _style1 = STYLE_MARGIN, _sub = {
                                { type = "radiobutton", state = false, _share = EL_MODE, _value = ST_MODE_DEPOT, caption = { "yatm-gui.mode-depot" }, tooltip = { "yatm-gui.mode-depot-tt" } },
                                { type = "radiobutton", state = false, _share = EL_MODE, _value = ST_MODE_FUEL, caption = { "yatm-gui.mode-fuel" }, tooltip = { "yatm-gui.mode-fuel-tt" } },
                                { type = "radiobutton", state = false, _share = EL_MODE, _value = ST_MODE_CLEAN, caption = { "yatm-gui.mode-clean" }, tooltip = { "yatm-gui.mode-clean-tt" } },
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
                                                buttons[#buttons + 1] = { type = "choose-elem-button", _share = EL_ITEM_BUTTON, _value = -1, tooltip = { "yatm-gui.item-other-tt" }, style = "yatm_slot_button", elem_type = "signal", elem_value = { type = "virtual", name = "signal-anything" }, locked = true, _sub = {
                                                    { type = "flow", direction = "vertical", _style1 = { top_padding = 9 }, ignored_by_interaction = true, _sub = {
                                                        { type = "label", caption = "R", ignored_by_interaction = true, style = "yatm_count_label" },
                                                        { type = "label", caption = "M", ignored_by_interaction = true, style = "yatm_count_label" },
                                                    } }
                                                } }
                                                for i = 1, dispatcherSignalSlotCount - 1 do
                                                    buttons[#buttons + 1] = { type = "choose-elem-button", _share = EL_ITEM_BUTTON, _value = i, style = "yatm_slot_button", elem_type = "signal", _sub = {
                                                        { type = "flow", direction = "vertical", _style1 = { top_padding = 9 }, ignored_by_interaction = true, _sub = {
                                                            { type = "label", caption = "R", ignored_by_interaction = true, style = "yatm_count_label" },
                                                            { type = "label", caption = "M", ignored_by_interaction = true, style = "yatm_count_label" },
                                                        } }
                                                    } }
                                                end
                                                return buttons
                                            end)()
                                    }
                                } },
                                { type = "flow", direction = "vertical", style = "vertical_flow", _name = DIV_ITEM, _sub = {
                                    { type = "table", column_count = 2, _autoSharesFrom = 2, _sub = {
                                        { type = "label", caption = { "yatm-gui.item-request" } },
                                        { type = "flow", direction = "horizontal", _sub = {
                                            { type = "textfield", _name = EL_ITEM_REQUEST, text = "1000", numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "short_number_textfield", _style1 = STYLE_MARGIN, },
                                            { type = "button", _name = EL_ITEM_REQUEST_UNIT, style = "yatm_unit" },
                                        } },
                                        { type = "label", caption = { "yatm-gui.item-min" }, _name = EL_ITEM_MIN_LABEL, tooltip = { "yatm-gui.item-min-tt" } },
                                        { type = "flow", direction = "horizontal", _sub = {
                                            { type = "textfield", _name = EL_ITEM_MIN, text = "500", numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "short_number_textfield", _style1 = STYLE_MARGIN, },
                                            { type = "button", _name = EL_ITEM_MIN_UNIT, style = "yatm_unit" },
                                        } },
                                        { type = "label", caption = { "yatm-gui.item-other-min-cargo" }, tooltip = { "yatm-gui.item-other-min-cargo-tt" } },
                                        { type = "flow", direction = "horizontal", _sub = {
                                            { type = "textfield", _name = EL_ANY_MIN_CARGO, text = "500", numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "short_number_textfield", _style1 = STYLE_MARGIN, },
                                            { type = "button", _name = EL_ANY_MIN_CARGO_UNIT, style = "yatm_unit" },
                                        } },
                                        { type = "label", caption = { "yatm-gui.item-other-min-fluid" }, tooltip = { "yatm-gui.item-other-min-fluid-tt" } },
                                        { type = "flow", direction = "horizontal", _sub = {
                                            { type = "textfield", _name = EL_ANY_MIN_FLUID, text = "500", numeric = true, allow_decimal = true, allow_negative = false, clear_and_focus_on_right_click = true, style = "short_number_textfield", _style1 = STYLE_MARGIN, },
                                            { type = "button", _name = EL_ANY_MIN_FLUID_UNIT, style = "yatm_unit" },
                                        } },
                                    } },
                                    { type = "label", caption = { "yatm-gui.connect-tip" }, _style1 = { single_line = false } },
                                    { type = "flow", direction = "horizontal", _sub = (
                                            function()
                                                ---@type GuiDef[]
                                                local buttons = {}
                                                for i = 1, 8 do
                                                    buttons[#buttons + 1] = { type = "button", _share = EL_ITEM_MEM_BUTTON, _value = i, style = "yatm_mem", caption = "m" .. tostring(i), tooltip = { "yatm-gui.mem-tt" } }
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
                                    { type = "checkbox", _name = FLAG_flagMute, caption = { "yatm-gui.cb-flagMute" }, tooltip = { "yatm-gui.cb-flagMute-tt" } },
                                    { type = "checkbox", _name = FLAG_flagUseSignals, caption = { "yatm-gui.cb-flagUseSignals" }, tooltip = { "yatm-gui.cb-flagUseSignals-tt" } },
                                    { type = "checkbox", _name = FLAG_flagUseEquals, caption = { "yatm-gui.cb-flagUseEquals" }, tooltip = { "yatm-gui.cb-flagUseEquals-tt" } },
                                    { type = "checkbox", _name = FLAG_flagTamp, caption = { "yatm-gui.cb-flagTamp" }, tooltip = { "yatm-gui.cb-flagTamp-tt" } },
                                    { type = "checkbox", _name = FLAG_flagTurnInserters, caption = { "yatm-gui.cb-flagTurnInserters" }, tooltip = { "yatm-gui.cb-flagTurnInserters-tt" } },
                                    { type = "checkbox", _name = FLAG_flagReverseLocos, caption = { "yatm-gui.cb-flagReverseLocos" }, tooltip = { "yatm-gui.cb-flagReverseLocos-tt" } },
                                    { type = "checkbox", _name = FLAG_flagAllowMulti, caption = { "yatm-gui.cb-flagAllowMulti" }, tooltip = { "yatm-gui.cb-flagAllowMulti-tt" } },
                                    { type = "checkbox", _name = FLAG_flagAllowLoadToNotEmpty, caption = { "yatm-gui.cb-flagAllowLoadToNotEmpty" }, tooltip = { "yatm-gui.cb-flagAllowLoadToNotEmpty-tt" } },
                                    { type = "checkbox", _name = FLAG_flagAllowPartUnload, caption = { "yatm-gui.cb-flagAllowPartUnload" }, tooltip = { "yatm-gui.cb-flagAllowPartUnload-tt" } },
                                    { type = "checkbox", _name = FLAG_flagBuild, caption = { "yatm-gui.cb-flagBuild" }, tooltip = { "yatm-gui.cb-flagBuild-tt" } },
                                    { type = "checkbox", _name = FLAG_flagDestroy, caption = { "yatm-gui.cb-flagDestroy" }, tooltip = { "yatm-gui.cb-flagDestroy-tt" } },
                                }
                                for value, data in pairs(ST_OUTS) do
                                    sub[#sub + 1] = { type = "radiobutton", state = false, _share = OPT_OUT_MODE, _value = value, caption = data.caption, tooltip = data.tooltip }
                                end
                                return sub
                            end)() },
                            { type = "flow", direction = "vertical", _name = DIV_COMMON, _sub = {
                                { type = "line" },
                                { type = "table", column_count = 2, _autoSharesFrom = 2, _sub = {
                                    { type = "label", caption = { "yatm-gui.nets" } },
                                    { type = "textfield", _name = EL_NETWORKS, text = "1", numeric = true, allow_decimal = false, allow_negative = false, clear_and_focus_on_right_click = true, style = "short_number_textfield", _style1 = STYLE_MARGIN, },
                                    { type = "label", caption = { "yatm-gui.comps" } },
                                    { type = "textfield", _name = EL_COMPS, text = "", tooltip = { "yatm-gui.comps-tt" }, clear_and_focus_on_right_click = true, _style1 = STYLE_MARGIN, _style2 = { width = 300 } },
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
                            { type = "label", caption = { "yatm-gui.req-prov-head", table.concat(REQUEST_COLOR, ','), table.concat(PROVIDE_COLOR, ',') }, style = "caption_label" },
                            { type = "table", column_count = 4, _name = EL_IO_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = "", style = "heading_3_label" },
                                { type = "label", caption = { "yatm-gui.req-prov-count" }, style = "heading_3_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "yatm-gui.req-prov-on-way" }, style = "heading_3_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", style = "heading_3_label", },
                            }, _row = {
                                { type = "label", caption = "" },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "" },
                            } },
                            { type = "line" },
                            { type = "label", caption = { "yatm-gui.deliveries-head" }, style = "caption_label" },
                            { type = "table", column_count = 3, _name = EL_DELIVERIES_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = { "yatm-gui.deliveries-from" }, style = "heading_3_label", _style1 = { minimal_width = 150 } },
                                { type = "label", caption = { "yatm-gui.deliveries-to" }, style = "heading_3_label", _style1 = { minimal_width = 150 } },
                                { type = "label", caption = { "yatm-gui.deliveries-time" }, style = "heading_3_label" },
                            }, _row = {
                                { type = "label", caption = "", _style1 = { single_line = false } },
                                { type = "label", caption = "", _style1 = { single_line = false } },
                                { type = "label", caption = "" },
                            } },
                            { type = "line" },
                            { type = "flow", direction = "horizontal", _sub = {
                                { type = "label", caption = { "yatm-gui.stat-head" }, style = "caption_label" },
                                { type = "empty-widget", _style1 = { horizontally_stretchable = "on" } },
                                { type = "label", caption = { "yatm-gui.stat-trains", 0 }, _name = EL_STAT_TRAINS },
                            } },
                            { type = "table", column_count = 4, _name = EL_CARGO_STAT_TABLE, vertical_centering = false, _style1 = { width = 400 },
                              draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                { type = "label", caption = { "yatm-gui.stat-count" }, style = "heading_3_label", _style1 = { minimal_width = 70 } },
                                { type = "label", caption = { "yatm-gui.stat-sent" }, style = "heading_3_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "yatm-gui.stat-recv" }, style = "heading_3_label", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = { "yatm-gui.stat-lastTime" }, style = "heading_3_label" },
                            }, _row = {
                                { type = "label", caption = "", _style1 = { minimal_width = 70 } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70, horizontal_align = "right" } },
                                { type = "label", caption = "", _style1 = { minimal_width = 70 } },
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
    data.flagReverseLocos = data.flagReverseLocos --[[and named[FLAG_flagReverseLocos].visible]] or nil
    data.flagUseSignals = data.flagUseSignals --[[and named[FLAG_flagUseSignals].visible]] or nil
    data.flagUseEquals = data.flagUseEquals --[[and named[FLAG_flagUseEquals].visible]] or nil
    data.flagMute = data.flagMute --[[and named[FLAG_flagMute].visible]] or nil
    data.flagBuild = data.flagBuild --[[and named[FLAG_flagBuild].visible]] or nil
    data.flagDestroy = data.flagDestroy --[[and named[FLAG_flagDestroy].visible]] or nil
    data.flagTamp = data.flagTamp --[[and named[FLAG_flagTamp].visible]] or nil
    data.flagTurnInserters = data.flagTurnInserters --[[and named[FLAG_flagTurnInserters].visible]] or nil
    data.flagAllowMulti = data.flagAllowMulti --[[and named[FLAG_flagAllowMulti].visible]] or nil
    data.flagAllowLoadToNotEmpty = data.flagAllowLoadToNotEmpty --[[and named[FLAG_flagAllowLoadToNotEmpty].visible]] or nil
    data.flagAllowPartUnload = data.flagAllowPartUnload --[[and named[FLAG_flagAllowPartUnload].visible]] or nil

    data.otherCargoMin = validCountWithUnits(data.otherCargoMin, true)
    data.otherFluidMin = validCountWithUnits(data.otherFluidMin, true)
    for _, sig in pairs(data.signals) do
        sig.request = validCountWithUnits(sig.request, true)
        sig.min = validCountWithUnits(sig.min, true)
    end
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
            local c = validCountWithUnits(data.otherCargoMin)
            local f = validCountWithUnits(data.otherFluidMin)
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
            local signal = data.signals[index]
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
    global.mem[forceIndex] = global.mem[forceIndex] or {}

    if self.selectedItem then
        global.mem[forceIndex][self.selectedItem.type] = global.mem[forceIndex][self.selectedItem.type] or {}
        for _, el in pairs(shares[EL_ITEM_MEM_BUTTON]) do
            local v = global.mem[forceIndex][self.selectedItem.type][el.tags._value]
            el.style = v and "yatm_mem_active" or "yatm_mem"
            if v then
                el.tooltip = { "", { "yatm-gui.mem-item-tt" }, {
                    "yatm-gui.mem-item-active-tt",
                    validCountWithUnits(v.request) and countWithUnitsToString2(v.request) or { "yatm-gui.mem-item-no-req" },
                    validCountWithUnits(v.min) and countWithUnitsToString2(v.min) or { "yatm-gui.mem-item-no-min" }
                } }
            else
                el.tooltip = { "yatm-gui.mem-item-tt" }
            end
        end
    else
        global.mem[forceIndex].other = global.mem[forceIndex].other or {}
        for _, el in pairs(shares[EL_ITEM_MEM_BUTTON]) do
            local v = global.mem[forceIndex].other[el.tags._value]
            el.style = v and "yatm_mem_active" or "yatm_mem"
            if v then
                el.tooltip = { "", { "yatm-gui.mem-item-tt" }, {
                    "yatm-gui.mem-other-active-tt",
                    validCountWithUnits(v.otherCargoMin) and countWithUnitsToString2(v.otherCargoMin) or { "yatm-gui.mem-other-no-cargo" },
                    validCountWithUnits(v.otherFluidMin) and countWithUnitsToString2(v.otherFluidMin) or { "yatm-gui.mem-other-no-fluid" }
                } }
            else
                el.tooltip = { "yatm-gui.mem-item-tt" }
            end
        end
    end
end

function DispGui:_updateVisibleAndEnabled()
    local data = self.data
    local named = self.model.named
    local shares = self.model.shares

    --guiSetVisible(shares[TAB_STATUS], self.stop ~= nil)

    named[DIV_BIDI].visible = data.mode == ST_MODE_BIDI
    named[DIV_COMMON].visible = data.mode ~= ST_MODE_OFF
    named[DIV_ITEM].visible = self.selectedButton ~= nil

    guiSetVisible(shares[EL_ITEM_REQUEST], self.selectedItem ~= nil)
    guiSetVisible(shares[EL_ITEM_MIN], self.selectedItem ~= nil)
    guiSetVisible(shares[EL_ANY_MIN_CARGO], self.selectedButton ~= nil and self.selectedItem == nil)
    guiSetVisible(shares[EL_ANY_MIN_FLUID], self.selectedButton ~= nil and self.selectedItem == nil)

    named[FLAG_flagReverseLocos].visible = false --[[not implemented]] and true
    named[FLAG_flagUseSignals].visible = data.mode == ST_MODE_BIDI or data.mode == ST_MODE_OFF or data.mode == ST_MODE_CLEAN or data.mode == ST_MODE_FUEL
    named[FLAG_flagUseEquals].visible = data.mode == ST_MODE_BIDI
    named[FLAG_flagMute].visible = data.mode ~= ST_MODE_OFF
    named[FLAG_flagBuild].visible = false --[[not implemented]] and data.mode == ST_MODE_DEPOT
    named[FLAG_flagDestroy].visible = false --[[not implemented]] and data.mode == ST_MODE_DEPOT
    named[FLAG_flagTamp].visible = data.mode == ST_MODE_BIDI
    named[FLAG_flagTurnInserters].visible = data.mode == ST_MODE_BIDI
    named[FLAG_flagAllowMulti].visible = data.mode == ST_MODE_BIDI
    named[FLAG_flagAllowLoadToNotEmpty].visible = false --[[not implemented]] and data.mode == ST_MODE_BIDI
    named[FLAG_flagAllowPartUnload].visible = false --[[not implemented]] and data.mode == ST_MODE_BIDI
    guiSetVisible(shares[OPT_OUT_MODE], data.mode == ST_MODE_BIDI)

    guiSetVisible(shares[EL_NETWORKS], data.mode ~= ST_MODE_OFF)
    guiSetVisible(shares[EL_COMPS], data.mode ~= ST_MODE_OFF)
    -- guiSetVisible(shares[EL_COMPS_BUTTONS], data.mode ~= ST_MODE_OFF)

    self:_updateCounters()
end

function DispGui:_dataToForm()
    local named = self.model.named
    self.selectedButton = nil
    self.selectedItem = nil
    guiSetRadiobutton(self.model, EL_MODE, self.data.mode)
    for _, el in pairs(self.model.shares[EL_ITEM_BUTTON]) do
        if el.tags._value > 0 then
            el.elem_value = self.data.signals[--[[---@type number]]el.tags._value]
            if el.elem_value then
                el.locked = true
            end
        else
            el.locked = true
        end
    end
    named[FLAG_flagReverseLocos].state = self.data.flagReverseLocos
    named[FLAG_flagUseSignals].state = self.data.flagUseSignals
    named[FLAG_flagUseEquals].state = self.data.flagUseEquals
    named[FLAG_flagMute].state = self.data.flagMute
    named[FLAG_flagBuild].state = self.data.flagBuild
    named[FLAG_flagDestroy].state = self.data.flagDestroy
    named[FLAG_flagTamp].state = self.data.flagTamp
    named[FLAG_flagTurnInserters].state = self.data.flagTurnInserters
    named[FLAG_flagAllowMulti].state = self.data.flagAllowMulti
    named[FLAG_flagAllowLoadToNotEmpty].state = self.data.flagAllowLoadToNotEmpty
    named[FLAG_flagAllowPartUnload].state = self.data.flagAllowPartUnload
    guiSetRadiobutton(self.model, OPT_OUT_MODE, self.data.outMode or ST_OUT_NEED_CONTENTS_NEG)

    named[EL_NETWORKS].text = tostring(self.data.networks or defaultNetworks)
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
                    named[EL_ANY_MIN_CARGO],
                    named[EL_ANY_MIN_CARGO_UNIT],
                    self.data.otherCargoMin
            )
            guiSetCountWithUnits(
                    named[EL_ANY_MIN_FLUID],
                    named[EL_ANY_MIN_FLUID_UNIT],
                    self.data.otherFluidMin
            )
        end
    end
end

function DispGui:_handleGuiEvent(event)
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
            global.mem[forceIndex] = global.mem[forceIndex] or {}
            if self.selectedItem then
                global.mem[forceIndex][self.selectedItem.type] = global.mem[forceIndex][self.selectedItem.type] or {}
                if event.button == defines.mouse_button_type.left then
                    if event.control or event.alt or event.shift then
                        global.mem[forceIndex][self.selectedItem.type][element.tags._value] = {
                            request = validCountWithUnits(copyCountWithUnits(self.selectedItem.request), true),
                            min = validCountWithUnits(copyCountWithUnits(self.selectedItem.min), true)
                        }
                        doUpdateMemButtons = true
                    else
                        local mem = global.mem[forceIndex][self.selectedItem.type][element.tags._value]
                        if mem then
                            self.selectedItem.request = copyCountWithUnits(mem.request)
                            self.selectedItem.min = copyCountWithUnits(mem.min)
                            doUpdateElemButtons = true
                            focusTo = 1
                        end
                    end
                elseif event.button == defines.mouse_button_type.right then
                    global.mem[forceIndex][self.selectedItem.type][element.tags._value] = nil
                    doUpdateMemButtons = true
                end
            else
                global.mem[forceIndex].other = global.mem[forceIndex].other or {}
                if event.button == defines.mouse_button_type.left then
                    if event.control or event.alt or event.shift then
                        global.mem[forceIndex].other[element.tags._value] = {
                            otherCargoMin = validCountWithUnits(copyCountWithUnits(self.data.otherCargoMin), true),
                            otherFluidMin = validCountWithUnits(copyCountWithUnits(self.data.otherFluidMin), true)
                        }
                        doUpdateMemButtons = true
                    else
                        local mem = global.mem[forceIndex].other[element.tags._value]
                        if mem then
                            self.data.otherCargoMin = copyCountWithUnits(mem.otherCargoMin)
                            self.data.otherFluidMin = copyCountWithUnits(mem.otherFluidMin)
                            doUpdateElemButtons = true
                            focusTo = 1
                        end
                    end
                elseif event.button == defines.mouse_button_type.right then
                    global.mem[forceIndex][self.selectedItem.type][element.tags._value] = nil
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
                    if self.data.signals[--[[---@type number]]element.tags._value] then
                        self.data.signals[--[[---@type number]]element.tags._value] = nil
                    end
                    doUpdateElemButtons = true
                else
                    if self.selectedButton == -1 then
                        if (self.data.otherCargoMin and self.data.otherCargoMin.count)
                                or (self.data.otherFluidMin and self.data.otherFluidMin.count)
                        then
                            self.data.otherCargoMin = setCount(self.data.otherCargoMin, nil)
                            self.data.otherFluidMin = setCount(self.data.otherFluidMin, nil)
                        else
                            self.data.otherCargoMin = setCount(nil, 1000)
                            self.data.otherFluidMin = setCount(nil, 1000)
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
        elseif _name == EL_CLOSE then
            self:close()
        elseif _name == EL_APPLY then
            local selectedButton = self.selectedButton
            self:_normalizeData()
            self.disp:setSettings(self.data)
            self.data = self.disp:getSettings()
            self:_dataToForm()
            self:updateStopInfo()
            if self.disp.stop then
                self.disp.stop:update()
                self.disp.stop:updateInputPort()
                self.disp.stop:updateOutputPort()
            end
            self.selectedButton = selectedButton
            doUpdateVisible = true
            doUpdateElemButtons = true
            doUpdateCounters = true
            doUpdateItemForm = true
            doUpdateMemButtons = true
        elseif _name == EL_ROLLBACK then
            local selectedButton = self.selectedButton
            self.data = self.disp:getSettings()
            self:_dataToForm()
            self:updateStopInfo()
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
        elseif _name == EL_ANY_MIN_CARGO_UNIT then
            self.data.otherCargoMin = guiNextUnit(element, self.data.otherCargoMin, "item")
            doUpdateCounters = true
        elseif _name == EL_ANY_MIN_FLUID_UNIT then
            self.data.otherFluidMin = guiNextUnit(element, self.data.otherFluidMin, "fluid")
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
            self.data.outMode = guiHandleRadiobutton(self.model, element)
        elseif _share == EL_ITEM_BUTTON then
            element.locked = false
            local _value = --[[---@type number]] element.tags._value
            local type0 = element.elem_value and (--[[---@type SignalID]]element.elem_value).type
            local name0 = element.elem_value and (--[[---@type SignalID]]element.elem_value).name
            local valid = true
            if type0 and type0 ~= "item" and type0 ~= "fluid" then
                valid = false
            end
            if valid and type0 then
                for i, s in pairs(self.data.signals) do
                    if i ~= _value and s.name == name0 then
                        valid = false
                        break
                    end
                end
            end
            if valid then
                local signal = self.data.signals[_value]
                if signal and signal.type ~= type0 then
                    signal = nil
                end
                if not signal then
                    local wagonUnit = getWagonUnitCode(type0)
                    signal = --[[---@type DispSignal]]{
                    }
                    self.data.signals[_value] = signal
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
            self.selectedItem.request = setCount(self.selectedItem.request, toPosNumber(element.text))
            doUpdateCounters = true
        elseif _name == EL_ITEM_MIN then
            self.selectedItem.min = setCount(self.selectedItem.min, toNotNegNumber(element.text))
            doUpdateCounters = true
        elseif _name == EL_ANY_MIN_CARGO then
            self.data.otherCargoMin = setCount(self.data.otherCargoMin, toNotNegNumber(element.text))
            doUpdateCounters = true
        elseif _name == EL_ANY_MIN_FLUID then
            self.data.otherFluidMin = setCount(self.data.otherFluidMin, toNotNegNumber(element.text))
            doUpdateCounters = true
        elseif _name == EL_NETWORKS then
            self.data.networks = toPosNumber(element.text, 1)
        elseif _name == EL_COMPS then
            self.data.comps = element.text
        elseif _name == FLAG_flagReverseLocos then
            self.data.flagReverseLocos = element.state or nil
        elseif _name == FLAG_flagUseSignals then
            self.data.flagUseSignals = element.state or nil
        elseif _name == FLAG_flagUseEquals then
            self.data.flagUseEquals = element.state or nil
        elseif _name == FLAG_flagMute then
            self.data.flagMute = element.state or nil
        elseif _name == FLAG_flagBuild then
            self.data.flagBuild = element.state or nil
            doUpdateVisible = true
        elseif _name == FLAG_flagDestroy then
            self.data.flagDestroy = element.state or nil
            doUpdateVisible = true
        elseif _name == FLAG_flagTamp then
            self.data.flagTamp = element.state or nil
        elseif _name == FLAG_flagTurnInserters then
            self.data.flagTurnInserters = element.state or nil
        elseif _name == FLAG_flagAllowMulti then
            self.data.flagAllowMulti = element.state or nil
        elseif _name == FLAG_flagAllowLoadToNotEmpty then
            self.data.flagAllowLoadToNotEmpty = element.state or nil
        elseif _name == FLAG_flagAllowPartUnload then
            self.data.flagAllowPartUnload = element.state or nil
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
                el = self.model.named[EL_ANY_MIN_CARGO]
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
        self.data.signals[self.selectedButton] = self.data.signals[self.selectedButton] or {}
        self.selectedItem = self.selectedButton ~= -1 and self.data.signals[self.selectedButton] or nil
    else
        self.selectedItem = nil
    end
    for _, el in pairs(self.model.shares[EL_ITEM_BUTTON]) do
        el.style = self.selectedButton == el.tags._value and "yatm_slot_button_selected" or "yatm_slot_button"
        if el ~= element and self.selectedButton ~= nil then
            el.locked = not not el.elem_value
        end
    end
end

function DispGui:updateStopInfo()
    local stop = self.disp.stop
    local named = self.model.named
    if stop then
        ---@param name string
        local function registerName(self, name)
            if not self.ioRows[name] then
                local rowModel = guiAddRow(self.model, EL_IO_TABLE)
                rowModel.cells[1].caption = "[" .. typeOfName(name) .. "=" .. name .. "]"
                self.ioRows[name] = rowModel
            end
        end
        if stop.request then
            for name, _ in pairs(stop.request) do
                registerName(self, name)
            end
        end
        if stop.provide then
            for name, _ in pairs(stop.provide) do
                registerName(self, name)
            end
        end
        if stop.deliveryChanges then
            for name, _ in pairs(stop.deliveryChanges) do
                registerName(self, name)
            end
        end
        for name, rowModel in pairs(self.ioRows) do
            ---@type LocalisedString
            local state
            local request = stop.request and stop.request[name]
            if request then
                rowModel.cells[2].caption = '−' .. util.format_number(-request._count, false)
                if request.error and request.errorTick then
                    state = { "", request.error, " ", util.formattime(game.tick - (request.errorTick or 0)) }
                else
                    state = request.error
                end
                rowModel.cells[2].style.font_color = request._request > 0 and REQUEST_COLOR or UNDER_MIN_COLOR
                rowModel.cells[2].style.font = request._request > 0 and 'default-bold' or 'default'
            else
                local provide = stop.provide and stop.provide[name]
                if provide then
                    rowModel.cells[2].caption = '+' .. util.format_number(provide._count, false)
                    rowModel.cells[2].style.font_color = provide._provide > 0 and PROVIDE_COLOR or UNDER_MIN_COLOR
                    rowModel.cells[2].style.font = provide._provide > 0 and 'default-bold' or 'default'
                else
                    rowModel.cells[2].caption = "-"
                    rowModel.cells[2].style.font_color = UNDER_MIN_COLOR
                    rowModel.cells[2].style.font = 'default'
                end
            end
            if stop.deliveryChanges[name] then
                rowModel.cells[3].caption = util.format_number(stop.deliveryChanges[name], false)
            else
                rowModel.cells[3].caption = "-"
            end
            rowModel.cells[4].caption = state or ""
        end

        for uid, delivery in pairs(stop.deliveries) do
            local rowModel = self.deliveryRows[uid]
            if not rowModel then
                rowModel = guiAddRow(self.model, EL_DELIVERIES_TABLE)
                self.deliveryRows[uid] = rowModel
            end
            do
                ---@type string[]
                local text = {}
                text[#text + 1] = delivery.provider.stopEntity.backer_name
                if delivery.providerPassed then
                    text[#text + 1] = "."
                end
                for name, count in pairs(delivery.contents) do
                    text[#text + 1] = "\n    [" .. typeOfName(name) .. "=" .. name .. "] " .. util.format_number(count, false)
                end
                rowModel.cells[1].caption = table.concat(text)
            end
            do
                ---@type string[]
                local text = {}
                text[#text + 1] = delivery.requester.stopEntity.backer_name
                if delivery.requesterPassed then
                    text[#text + 1] = "."
                end
                rowModel.cells[2].caption = table.concat(text)
            end
            rowModel.cells[3].caption = util.formattime(game.tick - (delivery.startTick or 0))
        end
        for uid, row in pairs(self.deliveryRows) do
            if not stop.deliveries[uid] then
                guiRemoveRow(row)
            end
        end

        if stop.stat then
            for name, stat in pairs(stop.stat) do
                local rowModel = self.statRows[name]
                if not rowModel then
                    rowModel = guiAddRow(self.model, EL_CARGO_STAT_TABLE)
                    self.statRows[name] = rowModel
                end
                rowModel.cells[1].caption = "[" .. typeOfName(name) .. "=" .. name .. "] " .. (stat.deliveries and util.format_number(stat.deliveries, false) or "?")
                rowModel.cells[2].caption = stat.provided and util.format_number(stat.provided, true) or "-"
                rowModel.cells[3].caption = stat.received and util.format_number(stat.received, true) or "-"
                rowModel.cells[4].caption = stat.lastTick and util.formattime(game.tick - stat.lastTick) or "-"
            end
        end
        for name, row in pairs(self.statRows) do
            if not stop.stat or not stop.stat[name] then
                guiRemoveRow(row)
            end
        end

        named[EL_STAT_TRAINS].caption = { "yatm-gui.stat-trains", util.format_number(stop.statTrains or 0, false) }

        local debug --[[DEBUG]] = true
        if debug then
            ---@type string[]
            local debugLines = {}
            if stop.inserters then
                debugLines[#debugLines + 1] = "Inserters: " .. tostring(table_size(stop.inserters))
            end
            for name, sig in pairs(stop.signalStates) do
                local prefix = "[" .. sig.type .. "=" .. sig.name .. "] "
                for k, v in pairs(sig) do
                    debugLines[#debugLines + 1] = prefix .. k .. ": " .. var_dump(v)
                end
                if stop.deliveryChanges and stop.deliveryChanges[name] then
                    debugLines[#debugLines + 1] = prefix .. "DC=" .. tostring(stop.deliveryChanges[name])
                end
            end
            if stop.deliveryChanges then
                for name, v in pairs(stop.deliveryChanges) do
                    if not stop.signalStates[name] then
                        local prefix
                        prefix = "["..typeOfName(name).."=" .. name .. "] "
                        debugLines[#debugLines + 1] = prefix .. "!DC=" .. tostring(v)
                    end
                end
            end
            named[EL_DEBUG].caption = table.concat(debugLines, "\n")
        end
    end
end

