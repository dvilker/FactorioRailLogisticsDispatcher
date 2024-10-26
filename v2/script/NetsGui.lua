---@class NetsGui: GuiSelf
    ---@field currentNet NetClass
    ---@field player LuaPlayer
    ---@field model GuiModel
    ---@field data DispSettings
    ---@field netList NetClass[]

NetsGui = --[[---@type NetsGui]] createClass("NetsGui")

function NetsGui:restoreClass()
end

local BTN_CLOSE = 3001
local EL_DEBUG = 1001
local EL_NET_LIST = 1002
local EL_NET_TABS = 1003
local TABLE_MOVERS = 2001
local TABLE_REQ_RESOURCES = 2002
local TABLE_PROV_RESOURCES = 2008
local TABLE_DELIVERIES = 2003
local TABLE_STATIONS = 2004
local TABLE_UTIL_STATIONS = 2007
local TABLE_RES_STATS = 2005
local TABLE_DEL_STATS = 2006

local EL_FILTER_RESOURCES_TYPE = 3001

local KEY_NETS = "nets"

---@param event OnGuiOpened
function NetsGui.triggerOpened(event)
    local player = --[[---@type LuaPlayer]] game.players[event.player_index]
    local netGuiModel = getIndexedModel(KEY_NETS, event.player_index)
    if netGuiModel then
        netGuiModel.self:close()
        return
    end
    NetsGui:open(player)
end

---@param player LuaPlayer
function NetsGui:open(player)
    --[[DEBUG]]log("NetsGui:open(" .. tostring(player.name) .. ")")
    ---@type NetsGui
    local gui = instanceClass(self, {
        player = player,
        data = nil,
    })
    gui.model = gui:_create()
    player.opened = gui.model.root
    --gui.model.root.force_auto_center()
    gui:_refreshNetList()
    gui:_refreshNetInfo()
end

function NetsGui:close()
    destroyGuiModel(self.model)
end

---@param event OnGuiClick
---@param model GuiModel
---@param def GuiDef
local function doRollbackClick(event, model, def)

end

---@param event OnGuiClick
---@param model GuiModel
---@overload fun()
function NetsGui:doRefreshClick(event, model)
    self:_refreshNetList()
    self:_refreshNetInfo()
end

---@param event OnGuiClick
---@param model GuiModel
---@overload fun()
function NetsGui:doClose(event, model)
    self:close()
end

---@param event OnGuiSelectionStateChanged
---@param model GuiModel
---@overload fun()
function NetsGui:doNetListChanged(event, model)
    self:_refreshNetInfo()
    local selectedIndex = model.named[EL_NET_LIST].selected_index
    if selectedIndex > 0 then
        setPlayerPref(self.player.index, PREF_GUI_NET, self.netList[selectedIndex].title)
    end
end

---@param event OnGuiSelectedTabChanged
---@param model GuiModel
---@overload fun()
function NetsGui:doTabChanged(event, model)
    setPlayerPref(self.player.index, PREF_GUI_TAB, event.element.selected_tab_index)
end

---@param event OnGuiElemChanged
---@param model GuiModel
---@overload fun()
function NetsGui:doResourceFilterChanged(event, model)
    local overrideTypeAndName = event.element.tags._filterTypeAndName

    local signal = (not overrideTypeAndName) and --[[---@type SignalID]] model.named[EL_FILTER_RESOURCES_TYPE].elem_value
    local resourceFilter = {
        typeAndName = overrideTypeAndName and overrideTypeAndName or (signal and toTypeAndName(signal) or nil)
    }
    setPlayerPref(self.player.index, PREF_GUI_RESOURCES_FILTER, resourceFilter)
    self:_refreshResourcesTab()
end

---@param event OnGuiClick
---@param model GuiModel
---@overload fun()
function NetsGui:doNavigateTo(event, model)
    local unitNumber = event.element.tags._unitNumber
    if unitNumber then
        local disp = globalDispByEntity(unitNumber)
        if disp then
            game.players[event.player_index].zoom_to_world(disp.entity.position)
        end
    end
end

---@param disp DispClass
---@param checkStop? boolean
---@return boolean
function isValidDisp(disp, checkStop)
    if not disp.entity or not disp.entity.valid then
        return false
    end
    if disp.stopEntity and not disp.stopEntity.valid then
        game.print("Removed stopEntity from disp [entity=" .. disp.entity.unit_number .. "]")
        disp.stopEntity = nil
    end
    if checkStop and not disp.stopEntity then
        return false
    end
    return true
end

---@param event OnGuiClick
---@param model GuiModel
---@overload fun()
function NetsGui:doNormalizeData(event, model)
    for _, surNetMap in pairs(storage.nets) do
        for _, net in pairs(surNetMap) do
            for network, typeDispsMap in pairs(net.provide) do
                for typeAndName, disps in pairs(typeDispsMap) do
                    for uid, disp in pairs(disps) do
                        if not isValidDisp(disp, true) then
                            game.print("Not valid disp for provide")
                            disps[uid] = nil
                        elseif not disp.provide or not disp.provide[typeAndName] or not disp.provide[typeAndName]._provide then
                            game.print("Not real provide")
                            disps[uid] = nil
                        end
                    end
                    if table_size(disps) == 0 then
                        typeDispsMap[typeAndName] = nil
                    end
                end
                if table_size(typeDispsMap) == 0 then
                    net.provide[network] = nil
                end
            end
            for network, typeRqsMap in pairs(net.request) do
                for typeAndName, rq in pairs(typeRqsMap) do
                    for uid, rqi in pairs(rq.items) do
                        local disp = rqi.disp
                        if not isValidDisp(disp, true) then
                            game.print("Not valid disp for request")
                            net:rqRemoveFromQueue(typeAndName, disp)
                        elseif not disp.request or not disp.request[typeAndName] or not disp.request[typeAndName]._request then
                            game.print("Not real request")
                            net:rqRemoveFromQueue(typeAndName, disp)
                        end
                    end
                end
            end
            for _, disp in pairs(net.disps) do
                if not isValidDisp(disp) then

                end
            end
        end
    end
end

---@return GuiModel
function NetsGui:_create()
    local STYLE_MARGIN = { left_margin = 12 }
    return createGuiModel(
            self.player.gui.screen,
            self,
            { type = "frame", _key = KEY_NETS, onClosed = NetsGui.doClose, direction = "vertical", auto_center = true, _style1 = { minimal_height = 600 }, _sub = {
                { type = "flow", _sub = {
                    { type = "label", style = "frame_title", caption = "Сети диспетчера железнодорожной логистики", _dragTarget = "" },
                    { type = "empty-widget", style = "viirld_draggable_space_header", _dragTarget = "" },
                    --{ type = "button", onClick = doRollbackClick, caption = { "viirld2-gui.rollback" }, style = "viirld_frame_button" },
                    --[[DEBUG]]{ type = "button", onClick = NetsGui.doNormalizeData, caption = 'Привести в порядок', style = "viirld_frame_button" },
                    { type = "button", onClick = NetsGui.doRefreshClick, caption = 'Обновить', style = "viirld_frame_button" },
                    { type = "sprite-button", onClick = NetsGui.doClose, style = "close_button", sprite = "utility/close", hovered_sprite = "utility/close_black" },
                } },
                { type = "flow", direction = "horizontal", _sub = {
                    { type = "list-box", _name = EL_NET_LIST, onSelectionStateChanged = NetsGui.doNetListChanged, items = { "qwe", "asd", "zxc" }, _style1 = { vertically_stretchable = true, horizontal_align = "right", width = 200 } },
                    { type = "tabbed-pane", _name = EL_NET_TABS, onSelectedTabChanged = NetsGui.doTabChanged, _sub = {
                        { type = "tab", caption = "Ресурсы" },
                        { type = "scroll-pane", style = "scroll_pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "always", _style1 = { vertically_stretchable = true, padding = 6, minimal_width = 640 }, direction = "vertical", _share = TAB_STATUS, _sub = {
                            { type = "flow", direction = "vertical", _style1 = { vertically_stretchable = true, vertical_spacing = 8 }, _sub = {
                                { type = "flow", direction = "horizontal", _style1 = { vertical_align = "center" }, _sub = {
                                    { type = "label", caption = "Фильтр: ", style = "heading_2_label" },
                                    { type = "choose-elem-button", _name = EL_FILTER_RESOURCES_TYPE, onElemChanged = NetsGui.doResourceFilterChanged, tooltip = { "viirld2-gui.item-other-tt" }, style = "viirld_slot_button", elem_type = "signal" }
                                } },

                                { type = "label", caption = "Очереди на запрос", style = "caption_label" },
                                { type = "table", _name = TABLE_REQ_RESOURCES, vertical_centering = false, _style1 = {  },
                                  draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                    { type = "label", caption = "", style = "heading_2_label" },
                                    { type = "label", caption = "", onClick = NetsGui.doResourceFilterChanged, _style1 = { single_line = false } },
                                    { type = "label", caption = "Сеть", _align = "top-center", style = "heading_2_label", _style1 = { minimal_width = 25 } },
                                    { type = "label", caption = "", _style1 = { single_line = false, horizontal_align = "center" } },
                                    { type = "label", caption = "Станция", style = "heading_2_label", },
                                    { type = "label", caption = "", onClick = NetsGui.doNavigateTo, _style1 = { single_line = false } },
                                    { type = "label", caption = "Запрос", _align = "top-right", style = "heading_2_label", _style1 = { minimal_width = 100, horizontal_align = "right" } },
                                    { type = "label", caption = "", _style1 = { single_line = false, horizontal_align = "right" } },
                                    { type = "label", caption = "Минимум", _align = "top-right", style = "heading_2_label", _style1 = { minimal_width = 100, horizontal_align = "right" } },
                                    { type = "label", caption = "", _style1 = { single_line = false, horizontal_align = "right" } },
                                    { type = "label", caption = "Пр.", tooltip = "Приоритет", _align = "top-right", style = "heading_2_label", _style1 = { minimal_width = 25, horizontal_align = "right" } },
                                    { type = "label", caption = "", tooltip = "Приоритет", _style1 = { single_line = false, horizontal_align = "right" } },
                                    { type = "label", caption = "", style = "heading_2_label" },
                                    { type = "label", caption = "" },
                                } },

                                { type = "label", caption = "Предложения", style = "caption_label" },
                                { type = "table", _name = TABLE_PROV_RESOURCES, vertical_centering = false, _style1 = {  }, draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                    { type = "label", caption = "", style = "heading_2_label" },
                                    { type = "label", caption = "", onClick = NetsGui.doResourceFilterChanged, _style1 = { single_line = false } },
                                    { type = "label", caption = "Сеть", _align = "top-center", style = "heading_2_label", _style1 = { minimal_width = 25 } },
                                    { type = "label", caption = "", _style1 = { single_line = false, horizontal_align = "center" } },
                                    { type = "label", caption = "Станция", style = "heading_2_label", },
                                    { type = "label", caption = "", onClick = NetsGui.doNavigateTo, _style1 = { single_line = false } },
                                    { type = "label", caption = "Предложение", _align = "top-right", style = "heading_2_label", _style1 = { minimal_width = 100, horizontal_align = "right" } },
                                    { type = "label", caption = "", _style1 = { single_line = false, horizontal_align = "right" } },
                                    { type = "label", caption = "Минимум", _align = "top-right", style = "heading_2_label", _style1 = { minimal_width = 100, horizontal_align = "right" } },
                                    { type = "label", caption = "", _style1 = { single_line = false, horizontal_align = "right" } },
                                    { type = "label", caption = "Пр.", tooltip = "Приоритет", _align = "top-right", style = "heading_2_label", _style1 = { minimal_width = 25, horizontal_align = "right" } },
                                    { type = "label", caption = "", tooltip = "Приоритет", _style1 = { single_line = false, horizontal_align = "right" } },
                                    { type = "label", caption = "", style = "heading_2_label" },
                                    { type = "label", caption = "" },
                                } },
                            } },
                        } },
                        { type = "tab", caption = "Доставки" },
                        { type = "scroll-pane", style = "scroll_pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "always", _style1 = { vertically_stretchable = true, padding = 6, minimal_width = 640 }, direction = "vertical", _share = TAB_STATUS, _sub = {
                            { type = "flow", direction = "vertical", _style1 = { vertically_stretchable = true, vertical_spacing = 8 }, _sub = {

                                { type = "table", _name = TABLE_DELIVERIES, vertical_centering = false, _style1 = {  },
                                  draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                    { type = "label", caption = "Состав", style = "heading_2_label" },
                                    { type = "label", caption = "Точка А", style = "heading_2_label", _style1 = { minimal_width = 100 } },
                                    { type = "label", caption = "Точка Б", style = "heading_2_label", _style1 = { minimal_width = 100 } },
                                    { type = "label", caption = "", style = "heading_2_label" },
                                }, _row = {
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "" },
                                } },

                                --[[DEBUG]] { type = "label", caption = "Debug 1", style = "caption_label" },
                                --[[DEBUG]] { type = "label", _name = EL_DEBUG, caption = "", _style1 = { single_line = false } },
                            } },
                        } },
                        { type = "tab", caption = "Поезда" },
                        { type = "scroll-pane", style = "scroll_pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "always", _style1 = { vertically_stretchable = true, padding = 6, minimal_width = 640 }, direction = "vertical", _share = TAB_STATUS, _sub = {
                            { type = "flow", direction = "vertical", _style1 = { vertically_stretchable = true, vertical_spacing = 8 }, _sub = {

                                { type = "table", _name = TABLE_MOVERS, vertical_centering = false, _style1 = {  },
                                  draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                    { type = "label", caption = "Тип", style = "heading_2_label", _style1 = { minimal_width = 100 } },
                                    { type = "label", caption = "Депо", style = "heading_2_label", _style1 = { minimal_width = 100 } },
                                    { type = "label", caption = "Кол-во", style = "heading_2_label", _style1 = { minimal_width = 100 } },
                                    { type = "label", caption = "Свободных", style = "heading_2_label", _style1 = { minimal_width = 100 } },
                                }, _row = {
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                } },

                                --[[DEBUG]] { type = "label", caption = "Debug 1", style = "caption_label" },
                                --[[DEBUG]] { type = "label", _name = EL_DEBUG, caption = "", _style1 = { single_line = false } },
                            } },
                        } },
                        { type = "tab", caption = "Станции" },
                        { type = "scroll-pane", style = "scroll_pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "always", _style1 = { vertically_stretchable = true, padding = 6, minimal_width = 640 }, direction = "vertical", _share = TAB_STATUS, _sub = {
                            { type = "flow", direction = "vertical", _style1 = { vertically_stretchable = true, vertical_spacing = 8 }, _sub = {

                                { type = "label", caption = "Грузовые станции", style = "caption_label" },
                                { type = "table", _name = TABLE_STATIONS, vertical_centering = false, _style1 = { horizontal_spacing = 16 },
                                  draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                    { type = "label", caption = "Название", style = "heading_2_label" },
                                    { type = "label", caption = "Предложение", _align = "top-right", style = "heading_2_label", _style1 = { minimal_width = 100, horizontal_align = "right" } },
                                    { type = "label", caption = "Запрос", _align = "top-right", style = "heading_2_label", _style1 = { minimal_width = 100, horizontal_align = "right" } },
                                    { type = "label", caption = "", style = "heading_2_label" },
                                }, _row = {
                                    { type = "label", caption = "", _style1 = { single_line = true } },
                                    { type = "label", caption = "", _style1 = { single_line = false, horizontal_align = "right" } },
                                    { type = "label", caption = "", _style1 = { single_line = false, horizontal_align = "right" } },
                                    { type = "label", caption = "", _style1 = { single_line = true } },
                                } },

                                { type = "label", caption = "Депо, заправки, очистки", style = "caption_label", _style1 = { top_margin = 16 } },
                                { type = "table", _name = TABLE_UTIL_STATIONS, vertical_centering = false, _style1 = { horizontal_spacing = 16 },
                                  draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                    { type = "label", caption = "Тип", style = "heading_2_label" },
                                    { type = "label", caption = "Название", style = "heading_2_label" },
                                    { type = "label", caption = "Кол-во", _align = "top-right", style = "heading_2_label", _style1 = { minimal_width = 100, horizontal_align = "right" } },
                                    { type = "label", caption = "", style = "heading_2_label" },
                                }, _row = {
                                    { type = "label", caption = "", _style1 = { single_line = true } },
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "", _style1 = { single_line = false, horizontal_align = "right" } },
                                    { type = "label", caption = "", _style1 = { single_line = true } },
                                } },

                            } },
                        } },
                        { type = "tab", caption = "Статистика" },
                        { type = "scroll-pane", style = "scroll_pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "always", _style1 = { vertically_stretchable = true, padding = 6, minimal_width = 640 }, direction = "vertical", _share = TAB_STATUS, _sub = {
                            { type = "flow", direction = "vertical", _style1 = { vertically_stretchable = true, vertical_spacing = 8 }, _sub = {

                                { type = "table", _name = TABLE_RES_STATS, vertical_centering = false, _style1 = {  },
                                  draw_vertical_lines = false, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true, _sub = {
                                    { type = "label", caption = "Ресурс", style = "heading_2_label" },
                                    { type = "label", caption = "Перевезено", style = "heading_2_label", _style1 = { minimal_width = 100 } },
                                    { type = "label", caption = "Доставок", style = "heading_2_label", _style1 = { minimal_width = 100 } },
                                    { type = "label", caption = "", style = "heading_2_label" },
                                }, _row = {
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                    { type = "label", caption = "", _style1 = { single_line = false } },
                                } },


                                --[[DEBUG]] { type = "label", caption = "Debug 2", style = "caption_label" },
                                --[[DEBUG]] { type = "label", _name = EL_DEBUG, caption = "", _style1 = { single_line = false } },
                            } },
                        } },
                        { type = "tab", caption = "Настройки сети" },
                        { type = "scroll-pane", style = "scroll_pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "always", _style1 = { vertically_stretchable = true, padding = 6, minimal_width = 640 }, direction = "vertical", _share = TAB_STATUS, _sub = {
                            { type = "flow", direction = "vertical", _style1 = { vertically_stretchable = true, vertical_spacing = 8 }, _sub = {
                                --[[DEBUG]] { type = "label", caption = "Debug 2", style = "caption_label" },
                                --[[DEBUG]] { type = "label", _name = EL_DEBUG, caption = "", _style1 = { single_line = false } },
                            } },
                        } },
                    } }

                } },
            } }
    )
end

function NetsGui:_refreshNetList()
    local list = self.model.named[EL_NET_LIST]
    ---@type LocalisedString
    local selected = list.selected_index > 0 and list.get_item(list.selected_index) or getPlayerPref(self.player.index, PREF_GUI_NET)
    ---@type number
    self.netList = {}
    if storage.nets[self.player.force.index] then
        for _, net in pairs(storage.nets[self.player.force.index]) do
            self.netList[#self.netList + 1] = net
        end
    end

    table.sort(self.netList, function(a, b)
        return a.title < b.title
    end)
    ---@type number
    local selectedIndex
    list.clear_items()
    for i, net in pairs(self.netList) do
        if net.title == selected then
            selectedIndex = i
        end
        list.add_item(net.title)
    end
    if #self.netList > 0 then
        if not selectedIndex then
            -- todo do enhance detect default network
            selectedIndex = 1
        end
        if selectedIndex then
            list.selected_index = selectedIndex
            list.scroll_to_item(selectedIndex)
        end
    end
end

function NetsGui:_refreshNetInfo()
    local tab = getPlayerPref(self.player.index, PREF_GUI_TAB)
    if tab then
        self.model.named[EL_NET_TABS].selected_tab_index = tab
    end
    local selectedIndex = self.model.named[EL_NET_LIST].selected_index
    if selectedIndex == 0 then
        return
    end
    self.currentNet = self.netList[selectedIndex]
    self:_refreshMoversTab()
    self:_refreshStationsTab()
    self:_refreshResourcesTab()
end

--TABLE_MOVERS
--TABLE_REQ_RESOURCES
--TABLE_PROV_RESOURCES
--TABLE_DELIVERIES
--TABLE_STATIONS
--TABLE_RES_STATS
--TABLE_DEL_STATS
function NetsGui:_refreshMoversTab()
    if self.currentNet then
        ---@type table<string, {depot: string, type: TrainComposition, count: number, free: number}>
        local map = {}
        for _, mover in pairs(self.currentNet.movers) do
            local key = (mover.depot or "\t") .. "\t" .. mover.trainType
            local info = map[key]
            if not info then
                info = {
                    depot = mover.depot,
                    type = mover.trainTypeH,
                    count = 0,
                    free = 0,
                }
                map[key] = info
            end
            info.count = info.count + 1
            if mover.isFree then
                info.free = info.free + 1
            end
        end
        guiTableBeginUpdate(self.model, TABLE_MOVERS)
        for key, info in pairs(map) do
            local rowModel = guiTableAddOrGetRow(self.model, TABLE_MOVERS, key)
            rowModel.cells[1].caption = info.type
            rowModel.cells[2].caption = info.depot or "?"
            rowModel.cells[3].caption = tostring(info.count)
            rowModel.cells[4].caption = tostring(info.free)
        end
        guiTableEndUpdate(self.model, TABLE_MOVERS)
    else
        guiTableClear(self.model, TABLE_MOVERS)
    end
end

function NetsGui:_refreshStationsTab()
    ---@param rp table<TypeAndName, DispSignal>
    ---@param isReq boolean
    ---@return LocalisedString
    local function formatRP(rp, isReq)
        if rp then
            ---@type LocalisedString[]
            local items = { '' }
            for key, sig in pairs(rp) do
                if #items > 1 then
                    items[#items + 1] = '\n'
                end
                if isReq then
                    if sig.request and sig.request.unit ~= defaultUnit then
                        items[#items + 1] = countWithUnitsToString2(sig.request)
                        items[#items + 1] = '   ' .. util.format_number(sig._request, false) .. ' [' .. key .. ']'
                    else
                        items[#items + 1] = util.format_number(sig._request, false) .. ' [' .. key .. ']'
                    end
                else
                    items[#items + 1] = util.format_number(sig._provide, false) .. ' [' .. key .. ']'
                end
            end
            return items -- table.concat(items, '\n')
        else
            return ""
        end
    end
    if self.currentNet then
        ---@type table<string, {mode: MODE, name: LocalisedString, count: number}>
        local utilMap = {}
        guiTableBeginUpdate(self.model, TABLE_STATIONS)
        for uid, disp in pairs(self.currentNet.disps) do
            if disp.stopEntity then
                if disp.mode == MODE_BIDI then
                    local rowModel = guiTableAddOrGetRow(self.model, TABLE_STATIONS, uid)
                    --Название
                    --Предложение
                    --Запрос
                    --Ошибка
                    rowModel.cells[1].caption = disp.stopEntity.backer_name
                    rowModel.cells[2].caption = formatRP(disp.provide, false)
                    rowModel.cells[3].caption = formatRP(disp.request, true)
                    rowModel.cells[4].caption = disp.errorMask and tostring(disp.errorMask) or ""
                elseif disp.mode == MODE_DEPOT or disp.mode == MODE_CLEAN then
                    local key = disp.stopEntity.backer_name .. "\t" .. tostring(disp.mode)
                    local val = utilMap[key]
                    if not val then
                        val = {
                            mode = disp.mode,
                            name = disp.stopEntity.backer_name,
                            count = 0
                        }
                        utilMap[key] = val
                    end
                    val.count = val.count + 1
                end
            end
        end
        guiTableEndUpdate(self.model, TABLE_STATIONS)
        guiTableBeginUpdate(self.model, TABLE_UTIL_STATIONS)
        for key, val in pairs(utilMap) do
            local rowModel = guiTableAddOrGetRow(self.model, TABLE_UTIL_STATIONS, key)
            --Тип
            --Название
            --Кол-во
            --Ошибка
            rowModel.cells[1].caption = modeNames[val.mode]
            rowModel.cells[2].caption = val.name
            rowModel.cells[3].caption = tostring(val.count)
            rowModel.cells[4].caption = ""
        end
        guiTableEndUpdate(self.model, TABLE_UTIL_STATIONS)
    else
        guiTableClear(self.model, TABLE_STATIONS)
        guiTableClear(self.model, TABLE_UTIL_STATIONS)
    end
end

function NetsGui:_refreshResourcesTab()
    ---@param rp table<TypeAndName, DispSignal>
    ---@param isReq boolean
    ---@return LocalisedString
    local function formatRP(rp, isReq)
        if rp then
            ---@type LocalisedString[]
            local items = { '' }
            for key, sig in pairs(rp) do
                if #items > 1 then
                    items[#items + 1] = '\n'
                end
                if isReq then
                    if sig.request and sig.request.unit ~= defaultUnit then
                        items[#items + 1] = countWithUnitsToString2(sig.request)
                        items[#items + 1] = '   ' .. util.format_number(sig._request, false) .. ' [' .. key .. ']'
                    else
                        items[#items + 1] = util.format_number(sig._request, false) .. ' [' .. key .. ']'
                    end
                else
                    items[#items + 1] = util.format_number(sig._provide, false) .. ' [' .. key .. ']'
                end
            end
            return items -- table.concat(items, '\n')
        else
            return ""
        end
    end
    local filter = getPlayerPref(self.player.index, PREF_GUI_RESOURCES_FILTER)
    local onlyTypeAndName = filter and filter.typeAndName
    self.model.named[EL_FILTER_RESOURCES_TYPE].elem_value = onlyTypeAndName and typeAndNameToSignal(onlyTypeAndName) or nil

    if self.currentNet then
        guiTableBeginUpdate(self.model, TABLE_PROV_RESOURCES)
        if self.currentNet.provide then
            for network, typeDispMap in pairs(self.currentNet.provide) do
                for typeAndName, disps in pairs(typeDispMap) do
                    if not onlyTypeAndName or onlyTypeAndName == typeAndName then
                        for dispUid, disp in pairs(disps) do
                            local key = network .. "/" .. typeAndName .. "/" .. dispUid
                            local rowModel = guiTableAddOrGetRow(self.model, TABLE_PROV_RESOURCES, key)
                            rowModel.cells[1].caption = "[" .. typeAndName .. "]"
                            tags = rowModel.cells[1].tags
                            tags._filterTypeAndName = typeAndName
                            rowModel.cells[1].tags = tags
                            rowModel.cells[2].caption = network
                            rowModel.cells[3].caption = disp.stopEntity and disp.stopEntity.backer_name
                            local tags = rowModel.cells[3].tags
                            tags._unitNumber = disp.stopEntity and disp.stopEntity.unit_number
                            rowModel.cells[3].tags = tags
                            rowModel.cells[4].caption = disp.provide and disp.provide[typeAndName] and util.format_number(disp.provide[typeAndName]._provide, false) or '???'
                            rowModel.cells[5].caption = disp.provide and disp.provide[typeAndName] and util.format_number(disp.provide[typeAndName]._min, false) or '???'
                            rowModel.cells[6].caption = disp.priority
                            local errors = {}
                            if not disp.entity then
                                errors[#errors + 1] = "NO ENTITY"
                            elseif not disp.entity.valid then
                                errors[#errors + 1] = "ENTITY INVALID"
                            end
                            if not disp.stopEntity then
                                errors[#errors + 1] = "NO STOP"
                            elseif not disp.stopEntity.valid then
                                errors[#errors + 1] = "STOP INVALID"
                            end
                            rowModel.cells[7].caption = #errors > 0 and table.concat(errors, ", ") or ""
                        end
                    end
                end
            end
        end
        guiTableEndUpdate(self.model, TABLE_PROV_RESOURCES)

        guiTableBeginUpdate(self.model, TABLE_REQ_RESOURCES)
        --[[
        caption = ""
        captionn = "Станция
        caption = "Запрос
        caption = "Мин
        caption = "Сеть
        caption = "Пр
        caption= ""
        ]]
        if self.currentNet.request then
            for network, typeRqMap in pairs(self.currentNet.request) do
                for typeAndName, rq in pairs(typeRqMap) do
                    if not onlyTypeAndName or onlyTypeAndName == typeAndName then
                        for dispUid, rqi in pairs(rq.items) do
                            ---@type Tags
                            local tags
                            local key = network .. "/" .. typeAndName .. "/" .. dispUid
                            local rowModel = guiTableAddOrGetRow(self.model, TABLE_REQ_RESOURCES, key)
                            local disp = rqi.disp
                            rowModel.cells[1].caption = "[" .. typeAndName .. "]"
                            tags = rowModel.cells[1].tags
                            tags._filterTypeAndName = typeAndName
                            rowModel.cells[1].tags = tags
                            rowModel.cells[2].caption = network
                            rowModel.cells[3].caption = disp.stopEntity and disp.stopEntity.backer_name
                            tags = rowModel.cells[3].tags
                            tags._unitNumber = disp.stopEntity and disp.stopEntity.unit_number
                            rowModel.cells[3].tags = tags
                            rowModel.cells[4].caption = disp.request and disp.request[typeAndName] and util.format_number(disp.request[typeAndName]._request, false) or '???'
                            rowModel.cells[5].caption = disp.request and disp.request[typeAndName] and util.format_number(disp.request[typeAndName]._min, false) or '???'
                            rowModel.cells[6].caption = disp.priority
                            rowModel.cells[7].caption = util.formattime(game.tick - rqi.tick)

                            local errors = { rowModel.cells[7].caption }
                            if not disp.entity then
                                errors[#errors + 1] = "NO ENTITY"
                            elseif not disp.entity.valid then
                                errors[#errors + 1] = "ENTITY INVALID"
                            end
                            if not disp.stopEntity then
                                errors[#errors + 1] = "NO STOP"
                            elseif not disp.stopEntity.valid then
                                errors[#errors + 1] = "STOP INVALID"
                            end
                            rowModel.cells[7].caption = #errors > 0 and table.concat(errors, ", ") or ""
                        end
                    end
                end
            end
        end
        guiTableEndUpdate(self.model, TABLE_REQ_RESOURCES)

        --
        -----@type table<string, {name: TypeAndName, request: number, provide: number, requestCount: number, provideCount: number}>
        --local rowMap = {}
        --if self.currentNet.request then
        --    for name, order in pairs(self.currentNet.request) do
        --        for _, orderItem in pairs(order.items) do
        --            local sig = orderItem.disp.request[name]
        --            local row = rowMap[name]
        --            if not row then
        --                row = {
        --                    name = name,
        --                    request = 0,
        --                    requestCount = 0,
        --                    provide = 0,
        --                    provideCount = 0,
        --                }
        --                rowMap[name] = row
        --            end
        --            row.request = row.request + sig._request
        --            row.requestCount = row.requestCount + 1
        --        end
        --    end
        --end
        --if self.currentNet.provide then
        --    for name, disps in pairs(self.currentNet.provide) do
        --        for _, disp in pairs(disps) do
        --            local sig = disp.provide[name]
        --            local row = rowMap[name]
        --            if not row then
        --                row = {
        --                    name = name,
        --                    request = 0,
        --                    requestCount = 0,
        --                    provide = 0,
        --                    provideCount = 0,
        --                }
        --                rowMap[name] = row
        --            end
        --            row.provide = row.provide + sig._provide
        --            row.provideCount = row.provideCount + 1
        --        end
        --    end
        --end
        --guiTableBeginUpdate(self.model, TABLE_RESOURCES)
        --for name, row in pairs(rowMap) do
        --    local rowModel = guiTableAddOrGetRow(self.model, TABLE_RESOURCES, name)
        --    rowModel.cells[1].caption = "[" .. name .. "]"
        --    rowModel.cells[2].caption = row.request > 0 and "(" .. tostring(row.requestCount) .. ") " .. util.format_number(row.request, false) or ""
        --    rowModel.cells[3].caption = ""
        --    rowModel.cells[4].caption = row.provide > 0 and "(" .. tostring(row.provideCount) .. ") " .. util.format_number(row.provide, false) or ""
        --    rowModel.cells[5].caption = ""
        --end
        --guiTableEndUpdate(self.model, TABLE_RESOURCES)
    else
        guiTableClear(self.model, TABLE_PROV_RESOURCES)
        guiTableClear(self.model, TABLE_REQ_RESOURCES)
    end
end

function NetsGui:_normalizeData()
    local named = self.model.named
    local data = self.data
    data.flagUseSignals = data.flagUseSignals or nil
    data.flagUseEquals = data.flagUseEquals or nil
    data.flagTamp = data.flagTamp or nil
    data.flagTurnInserters = data.flagTurnInserters or nil
    data.flagCompounds = data.flagCompounds or nil
    data.autoItemsMin = validCountWithUnits(data.autoItemsMin, true)
    data.autoFluidMin = validCountWithUnits(data.autoFluidMin, true)
    for _, sig in pairs(self.signalByIndex) do
        sig.request = validCountWithUnits(sig.request, true)
        sig.min = validCountWithUnits(sig.min, true)
    end
    data.comps = normalizeCompositions(data.comps)
end

function NetsGui:_updateCounters()
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

function NetsGui:_updateMemButtons()
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

function NetsGui:_updateVisibleAndEnabled()
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
    guiSetVisible(shares[OPT_OUT_MODE], data.mode == MODE_BIDI)

    guiSetVisible(shares[EL_NETWORK], data.mode ~= MODE_OFF)
    guiSetVisible(shares[EL_PRIORITY], data.mode == MODE_BIDI or data.mode == MODE_CLEAN)
    guiSetVisible(shares[EL_COMPS], data.mode == MODE_BIDI or data.mode == MODE_CLEAN or data.mode == MODE_DEPOT)
    -- guiSetVisible(shares[EL_COMPS_BUTTONS], data.mode ~= MODE_OFF)

    named[EL_CARGO_STAT_TABLE].visible = data.mode == MODE_BIDI
    named[EL_DEPOT_STAT_TABLE].visible = data.mode ~= MODE_BIDI

    self:_updateCounters()
end

function NetsGui:_dataToForm()
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
    guiSetRadiobutton(self.model, OPT_OUT_MODE, self.data.out or OUT_NEED_CONTENTS_NEG)
    named[EL_NETWORK].text = tostring(self.data.network or 0)
    named[EL_PRIORITY].text = tostring(self.data.priority or 0)
    named[EL_COMPS].text = self.data.comps or ""
    self:_updateVisibleAndEnabled()
end

function NetsGui:_itemDataToForm()
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
        end
    end
end

function NetsGui:_handleGuiEvent(event)
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
                        self.data.signals[sig.typeAndName] = nil
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
        elseif _name == EL_CLOSE then
            self:close()
        elseif _name == EL_APPLY then
            local selectedButton = self.selectedButton
            self:_normalizeData()
            self.disp:setSets(self.data)
            self.disp:update()
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
                    self.data.signals[typeAndName0] = signal
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
function NetsGui:_updateElemButtons(element)
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

function NetsGui:updateDispInfo()
    local disp = self.disp
    local named = self.model.named
    -----@param typeAndName TypeAndName
    --local function registerName(self, typeAndName)
    --    if not self.ioRows[typeAndName] then
    --        local rowModel = guiAddRow(self.model, EL_IO_TABLE)
    --        rowModel.cells[1].caption = "[" .. typeAndName .. "]"
    --        self.ioRows[typeAndName] = rowModel
    --    end
    --end
    --if disp.request then
    --    for typeAndName, _ in pairs(disp.request) do
    --        registerName(self, typeAndName)
    --    end
    --end
    --if disp.provide then
    --    for typeAndName, _ in pairs(disp.provide) do
    --        registerName(self, typeAndName)
    --    end
    --end
    --if disp.deliveryChanges then
    --    for typeAndName, _ in pairs(disp.deliveryChanges) do
    --        registerName(self, typeAndName)
    --    end
    --end
    --for typeAndName, rowModel in pairs(self.ioRows) do
    --    ---@type LocalisedString, LocalisedString
    --    local state, stateTt
    --    local request = disp.request and disp.request[typeAndName]
    --    if request then
    --        rowModel.cells[2].caption = '−' .. util.format_number(-request._count, false)
    --        if request.error and request.errorTick then
    --            state = { "", request.error, " ", util.formattime(game.tick - (request.errorTick or 0)) }
    --        else
    --            state = request.error
    --        end
    --        stateTt = request.errorTt
    --        rowModel.cells[2].style.font_color = request._request > 0 and REQUEST_COLOR or UNDER_MIN_COLOR
    --        rowModel.cells[2].style.font = request._request > 0 and 'default-bold' or 'default'
    --    else
    --        local provide = disp.provide and disp.provide[typeAndName]
    --        if provide then
    --            rowModel.cells[2].caption = '+' .. util.format_number(provide._count, false)
    --            rowModel.cells[2].style.font_color = provide._provide > 0 and PROVIDE_COLOR or UNDER_MIN_COLOR
    --            rowModel.cells[2].style.font = provide._provide > 0 and 'default-bold' or 'default'
    --        else
    --            rowModel.cells[2].caption = "-"
    --            rowModel.cells[2].style.font_color = UNDER_MIN_COLOR
    --            rowModel.cells[2].style.font = 'default'
    --        end
    --    end
    --    if disp.deliveryChanges[typeAndName] then
    --        rowModel.cells[3].caption = util.format_number(disp.deliveryChanges[typeAndName], false)
    --    else
    --        rowModel.cells[3].caption = "-"
    --    end
    --    rowModel.cells[4].caption = state or ""
    --    rowModel.cells[4].tooltip = stateTt or ""
    --end
    --
    --for uid, delivery in pairs(disp.deliveries) do
    --    local rowModel = self.deliveryRows[uid]
    --    if not rowModel then
    --        rowModel = guiAddRow(self.model, EL_DELIVERIES_TABLE)
    --        self.deliveryRows[uid] = rowModel
    --    end
    --    do
    --        ---@type string[]
    --        local text = {}
    --        text[#text + 1] = delivery.provider.stopEntity.backer_name
    --        if delivery.providerPassed then
    --            text[#text + 1] = "."
    --        end
    --        for typeAndName, count in pairs(delivery.contents) do
    --            text[#text + 1] = "\n    [" .. typeAndName .. "] " .. util.format_number(count, false)
    --        end
    --        rowModel.cells[1].caption = table.concat(text)
    --    end
    --    do
    --        ---@type string[]
    --        local text = {}
    --        text[#text + 1] = delivery.requester.stopEntity.backer_name
    --        if delivery.requesterPassed then
    --            text[#text + 1] = "."
    --        end
    --        rowModel.cells[2].caption = table.concat(text)
    --    end
    --    rowModel.cells[3].caption = util.formattime(game.tick - (delivery.startTick or 0))
    --end
    --for uid, row in pairs(self.deliveryRows) do
    --    if not disp.deliveries[uid] then
    --        guiRemoveRow(row)
    --    end
    --end
    --
    --named[EL_STAT_TRAINS].caption = { "viirld2-gui.stat-trains", util.format_number(disp.statTrains or 0, false) }
    --
    --if disp.mode == MODE_BIDI then
    --    if disp.stat then
    --        for typeAndName, stat in pairs(disp.stat) do
    --            local rowModel = self.statRows[typeAndName]
    --            if not rowModel then
    --                rowModel = guiAddRow(self.model, EL_CARGO_STAT_TABLE)
    --                self.statRows[typeAndName] = rowModel
    --            end
    --            rowModel.cells[1].caption = "[" .. typeAndName .. "] " .. (stat.deliveries and util.format_number(stat.deliveries, false) or "?")
    --            rowModel.cells[2].caption = stat.provided and util.format_number(stat.provided, true) or "-"
    --            rowModel.cells[3].caption = stat.received and util.format_number(stat.received, true) or "-"
    --            rowModel.cells[4].caption = stat.lastTick and util.formattime(game.tick - stat.lastTick) or "-"
    --        end
    --    end
    --    for typeAndName, row in pairs(self.statRows) do
    --        if not disp.stat or not disp.stat[typeAndName] then
    --            guiRemoveRow(row)
    --        end
    --    end
    --else
    --    ---@type table<LocalisedString, {count: number, free: number}>
    --    local stats = {}
    --    for _, train in pairs(disp.net.trains) do
    --        local name = MoverClass.trainTypeToStr(train.trainType)
    --        if isCompatibleNetworks(disp.disp.networks, train.networks)
    --                and ((not disp.compFlags) or disp.compFlags[train.comp])
    --        then
    --            stats[name] = stats[name] or { count = 0, free = 0 }
    --            stats[name].count = stats[name].count + 1
    --            if train.isFree then
    --                stats[name].free = stats[name].free + 1
    --            end
    --        end
    --    end
    --    for name, stat in pairs(stats) do
    --        local rowModel = self.depotStatRows[name]
    --        if not rowModel then
    --            rowModel = guiAddRow(self.model, EL_DEPOT_STAT_TABLE)
    --            self.depotStatRows[name] = rowModel
    --        end
    --        rowModel.cells[1].caption = name
    --        rowModel.cells[2].caption = stat.count
    --        rowModel.cells[3].caption = stat.free
    --    end
    --    for name, row in pairs(self.depotStatRows) do
    --        if not stats[name] then
    --            guiRemoveRow(row)
    --        end
    --    end
    --end

    --[[DEBUG_BEGIN]]
    ---@type string[]
    local debugLines = {}
    debugLines[#debugLines + 1] = "net: " .. tostring(disp.net and disp.net.title)
    debugLines[#debugLines + 1] = "lastUpdateTick: " .. tostring(disp.lastUpdateTick)
    if disp.inserters then
        debugLines[#debugLines + 1] = "Inserters: " .. tostring(table_size(disp.inserters))
    end
    --[[DEBUG]]log("updateDispInfo(): disp.signals = " .. var_dump(disp.signals))
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

---@param event OnPlayerChangedSurface
function netsGuiSurfaceChanged(event)
    local netGuiModel = getIndexedModel(KEY_NETS, event.player_index)
    if netGuiModel then
        netGuiModel.self:close()
    end
end
