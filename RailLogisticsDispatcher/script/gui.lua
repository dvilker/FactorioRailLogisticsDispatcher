---@alias GuiName string|number
---@alias GuiUid string
---@alias GuiKey string
---@alias GuiRowId Any

---@class GuiSelf
---@field eventHandlers string

---@class GuiRowModelInfo
---@field updateIndex number
---@field rows table<GuiRowId, GuiModel>
---@field rowDefs GuiDef[]

---@class GuiHandlerModel
---@field uid GuiUid
---@field self GuiSelf

------@class GuiModel: GuiHandlerModel
---@field self GuiSelf
---@field named table<GuiName, LuaGuiElement>
---@field tables table<GuiName, GuiRowModelInfo>
---@field shares table<GuiName, LuaGuiElement[]>
---@field root LuaGuiElement
---@field cells LuaGuiElement[]
---@field onAfterEvent string @ function name for: fun(self: GuiSelf, event:EventData, model:GuiModel)
---@field _valid number|nil @ temporary field for cleanup and table update
---@field _key GuiKey|nil

---@class GuiDefHandlers
---@field onAny fun(self: GuiSelf, event:EventData, model:GuiModel)|nil
---@field onCheckedStateChanged fun(self: GuiSelf, event:OnGuiCheckedStateChanged, model:GuiModel)|nil
---@field onClick fun(self: GuiSelf, event:OnGuiClick, model:GuiModel)|nil
---@field onElemChanged fun(self: GuiSelf, event:OnGuiElemChanged, model:GuiModel)|nil
---@field onLocationChanged fun(self: GuiSelf, event:OnGuiLocationChanged, model:GuiModel)|nil
---@field onSelectedTabChanged fun(self: GuiSelf, event:OnGuiSelectedTabChanged, model:GuiModel)|nil
---@field onSelectionStateChanged fun(self: GuiSelf, event:OnGuiSelectionStateChanged, model:GuiModel)|nil
---@field onSwitchStateChanged fun(self: GuiSelf, event:OnGuiSwitchStateChanged, model:GuiModel)|nil
---@field onTextChanged fun(self: GuiSelf, event:OnGuiTextChanged, model:GuiModel)|nil
---@field onValueChanged fun(self: GuiSelf, event:OnGuiValueChanged, model:GuiModel)|nil
---@field onClosed fun(self: GuiSelf, event:OnGuiClosed, model:GuiModel)|nil


---@class GuiDef: LuaGuiElement_add_params
---@field _key GuiKey|nil
---@field _name GuiName|nil
---@field _share GuiName|nil
---@field _value AnyBasic|nil
---@field _style1 table|nil
---@field _style2 table|nil
---@field _sub GuiDef[]|nil
---@field _row GuiDef[]|nil
---@field _dragTarget GuiName|nil
---@field _autoSharesFrom number|nil
---@field _align Alignment|nil
---@field _skip true|nil
---@field column_count number|nil
---@field elem_value string|SignalID|nil
---@field state boolean|nil
---@field onChanged fun(self: GuiSelf, event:EventData, model:GuiModel)|nil @ auto detection on...Changed by type
---@field onAny fun(self: GuiSelf, event:EventData, model:GuiModel)|nil
---@field onCheckedStateChanged fun(self: GuiSelf, event:OnGuiCheckedStateChanged, model:GuiModel)|nil
---@field onClick fun(self: GuiSelf, event:OnGuiClick, model:GuiModel)|nil
---@field onElemChanged fun(self: GuiSelf, event:OnGuiElemChanged, model:GuiModel)|nil
---@field onLocationChanged fun(self: GuiSelf, event:OnGuiLocationChanged, model:GuiModel)|nil
---@field onSelectedTabChanged fun(self: GuiSelf, event:OnGuiSelectedTabChanged, model:GuiModel)|nil
---@field onSelectionStateChanged fun(self: GuiSelf, event:OnGuiSelectionStateChanged, model:GuiModel)|nil
---@field onSwitchStateChanged fun(self: GuiSelf, event:OnGuiSwitchStateChanged, model:GuiModel)|nil
---@field onTextChanged fun(self: GuiSelf, event:OnGuiTextChanged, model:GuiModel)|nil
---@field onValueChanged fun(self: GuiSelf, event:OnGuiValueChanged, model:GuiModel)|nil
---@field onClosed fun(self: GuiSelf, event:OnGuiClosed, model:GuiModel)|nil

---@type table<string, table<string, function>>
guiHandlers = {}

guiModelUniquePrefix = script.mod_name .. "_"

---@type defines.events
local definesEventsAny = -1000
local definesEventsAnyString = "-1000"

---@type table<defines.events, string>
local eventMap = {
    [definesEventsAny] = "onAny",
    [defines.events.on_gui_checked_state_changed] = "onCheckedStateChanged",
    [defines.events.on_gui_confirmed] = "onConfirmed",
    [defines.events.on_gui_click] = "onClick",
    [defines.events.on_gui_elem_changed] = "onElemChanged",
    [defines.events.on_gui_location_changed] = "onLocationChanged",
    [defines.events.on_gui_selected_tab_changed] = "onSelectedTabChanged",
    [defines.events.on_gui_selection_state_changed] = "onSelectionStateChanged",
    [defines.events.on_gui_switch_state_changed] = "onSwitchStateChanged",
    [defines.events.on_gui_text_changed] = "onTextChanged",
    [defines.events.on_gui_value_changed] = "onValueChanged",
    [defines.events.on_gui_closed] = "onClosed",
    --[defines.events.on_gui_hover] = "onHover",
    --[defines.events.on_gui_leave] = "onLeave",
}
---@type table<defines.events, string>
guiEventsToString = {
    [definesEventsAny] = tostring(definesEventsAny),
    [defines.events.on_gui_checked_state_changed] = tostring(defines.events.on_gui_checked_state_changed),
    [defines.events.on_gui_confirmed] = tostring(defines.events.on_gui_confirmed),
    [defines.events.on_gui_click] = tostring(defines.events.on_gui_click),
    [defines.events.on_gui_elem_changed] = tostring(defines.events.on_gui_elem_changed),
    [defines.events.on_gui_location_changed] = tostring(defines.events.on_gui_location_changed),
    [defines.events.on_gui_selected_tab_changed] = tostring(defines.events.on_gui_selected_tab_changed),
    [defines.events.on_gui_selection_state_changed] = tostring(defines.events.on_gui_selection_state_changed),
    [defines.events.on_gui_switch_state_changed] = tostring(defines.events.on_gui_switch_state_changed),
    [defines.events.on_gui_text_changed] = tostring(defines.events.on_gui_text_changed),
    [defines.events.on_gui_value_changed] = tostring(defines.events.on_gui_value_changed),
    [defines.events.on_gui_closed] = tostring(defines.events.on_gui_closed),
    --[defines.events.on_gui_hover] = "onHover",
    --[defines.events.on_gui_leave] = "onLeave",
}

---@type table<defines.events, string>
local guiChangedEventByType = {
    ["checkbox"] = "onCheckedStateChanged",
    ["radiobutton"] = "onCheckedStateChanged",
    ["textfield"] = "onTextChanged",
    ["text-box"] = "onTextChanged",
    ["drop-down"] = "onSelectionStateChanged",
    ["list-box"] = "onSelectionStateChanged",
    ["choose-elem-button"] = "onElemChanged",
    ["frame"] = "onLocationChanged",
    ["tabbed-pane"] = "onSelectedTabChanged",
    ["switch"] = "onSwitchStateChanged",
    ["slider"] = "onValueChanged",
}

---@param def GuiDef
---@param model GuiModel
---@param tags Tags
---@return Tags
local function processDefFunctions(def, model, tags)
    if def.onChanged then
        local eventName = guiChangedEventByType[def.type]
        if not eventName then
            error("Unknown type " .. def.type .. " for use onChanged smart-field")
        end
        if def[eventName] then
            error("Event " .. eventName .. " already defined and can not be redefined by onChanged smart-field")
        end
        def[eventName] = def.onChanged
        def.onChanged = nil
    end

    for defineEvent, prop in pairs(eventMap) do
        if def[prop] then
            local func = def[prop]
            if not model.self or type(model.self) ~= "table" then
                error("model.self must be table")
            end

            local handlers = guiHandlers[model.self.eventHandlers]
            local funcName
            for name, f in pairs(handlers) do
                if f == func then
                    funcName = name
                    break
                end
            end
            if not funcName then
                error("Can not find function in model.self.eventHandlers: " .. var_dump(func) .. " for " .. var_dump(def))
            end

            tags = tags or {}
            tags._model = model.uid
            tags._modelEvents = tags._modelEvents or {}
            tags._modelEvents[guiEventsToString[defineEvent]] = funcName
            def[prop] = nil
        end
    end
    return tags
end

---@param target LuaGuiElement
---@param def GuiDef
---@param model GuiModel
---@return LuaGuiElement
local function addElement(target, def, model)
    if def.type == "checkbox" then
        def.state = def.state or false
    end
    ---@type Tags
    local tags = def.tags
    if def._name then
        tags = tags or {}
        tags._name = def._name
    end
    if def._share then
        tags = tags or {}
        tags._share = def._share
    end
    if def._value then
        tags = tags or {}
        tags._value = def._value
    end
    local defSub = def._sub
    def._sub = nil
    local defRow = def._row
    def._row = nil

    if def.type == "table" and not defRow and not def.column_count then
        local sub = {}
        defRow = {}
        for i = 1, #defSub, 2 do
            sub[#sub + 1] = defSub[i]
            defRow[#defRow + 1] = defSub[i + 1]
        end
        defSub = sub
    end

    tags = processDefFunctions(def, model, tags)

    if not model.root and not model.cells --[[ Not a table ]] then
        tags = tags or {}
        tags._model = model.uid
        def.name = def.name or model.uid
    end
    def.tags = tags
    if defRow and not def.column_count then
        def.column_count = #defRow
    end
    local element = target.add(def)
    if def.elem_value then
        element.elem_value = def.elem_value
    end
    if def.auto_center then
        element.auto_center = true
    end
    if def._name then
        model.named[def._name] = element
    end
    if def._share then
        ---@type LuaGuiElement[]
        local share = model.shares[def._share]
        if not share then
            share = {}
            model.shares[def._share] = share
        end
        share[#share + 1] = element
    end
    if def._style1 then
        for k, v in pairs(def._style1) do
            element.style[k] = v
        end
    end
    if def._style2 then
        for k, v in pairs(def._style2) do
            element.style[k] = v
        end
    end
    if def._dragTarget then
        if def._dragTarget == "" then
            element.drag_target = model.root
        else
            element.drag_target = model.named[def._dragTarget]
        end
    end
    if defRow and def._name then
        for _, rowDef in pairs(defRow) do
            rowDef.tags = processDefFunctions(rowDef, model, rowDef.tags)
        end
        model.tables[def._name] = model.tables[def._name] or {
            updateIndex = 0,
            rows = {},
            rowDefs = defRow,
        }
    end
    if not model.root then
        model.root = element
    end
    if defSub then
        if def._autoSharesFrom and def.column_count then
            for i, sub in pairs(defSub) do
                local j = i - 1 - (i - 1) % def.column_count + def._autoSharesFrom
                local fromElement = defSub[j]
                if fromElement.type == "flow" and not (fromElement._share or fromElement._name) then
                    fromElement = fromElement._sub[1]
                end
                sub._share = fromElement._share or fromElement._name
            end
        end
        for i, sub in pairs(defSub) do
            if not sub._skip then
                if defRow and sub._align then
                    element.style.column_alignments[i] = sub._align
                end
                addElement(element, sub, model)
            end
        end
        if def.type == "tabbed-pane" then
            --for _, sub in pairs(defSub) do
            --    if sub.type == "tab" then
            --        addElement(element, sub, model, ex)
            --    end
            --end
            --for _, sub in pairs(defSub) do
            --    if sub.type ~= "tab" then
            --        addElement(element, sub, model, ex)
            --    end
            --end
            --local half = math.floor(#element.children / 2)
            --for i = 1, half do
            --    element.add_tab(element.children[i], element.children[i + half])
            --end
            ---@type LuaGuiElement
            local tab
            for _, sub in pairs(element.children) do
                if tab then
                    element.add_tab(tab, sub)
                    tab = nil
                else
                    tab = sub
                end
            end
            element.selected_tab_index = 1
        end
    end
    return element
end

---@param target LuaGuiElement
---@param self GuiSelf @nullable
---@param rootDef GuiDef
---@return GuiModel
function createGuiModel(target, self, rootDef)
    local uid = storage.guiNextUid or 100
    storage.guiNextUid = uid + 1

    ---@type GuiModel
    local model = {
        uid = guiModelUniquePrefix .. tostring(uid),
        self = self,
        named = {},
        shares = {},
        tables = {},
        root = nil,
        cells = nil,
        _handlers = {},
        _valid = nil,
    }
    model.root = addElement(target, rootDef, model)

    storage.guiModels = storage.guiModels or {}
    storage.guiModels[model.uid] = model
    if rootDef._key then
        model._key = rootDef._key
        storage.guiIndex = storage.guiIndex or {} -- todo REMOVE
        local p = storage.guiIndex[model._key]
        if not p then
            p = {}
            storage.guiIndex[model._key] = p
        end
        p[target.player_index] = model
    end
    return model
end

---@param model GuiModel
function destroyGuiModel(model)
    storage.guiModels[model.uid] = nil
    if model._key then
        if storage.guiIndex then
            -- TODO remove
            if storage.guiIndex[model._key] then
                storage.guiIndex[model._key][model.root.player_index] = nil
            end
        end
    end
    if model.root and model.root.valid then
        model.root.destroy()
    end
end

--@deprecated Эта функция будет удалять все модели, которые сейчас не отображаются. Но возможно они нужны еще
function cleanupGuiModels()
    -- Избавиться от этой
    if storage.guiModels and table_size(storage.guiModels) > 0 then
        for _, player in pairs(game.connected_players) do
            for _, rootGui in pairs(player.gui.children) do
                for _, someGui in pairs(rootGui.children) do
                    ---@type GuiUid
                    local modelUid = someGui.tags._model
                    if storage.guiModels[modelUid] then
                        storage.guiModels[modelUid]._valid = 1
                    end
                end
            end
        end
        for uid, model in pairs(storage.guiModels) do
            if model._valid then
                model._valid = nil
            else
                storage.guiModels[uid] = nil
                -- [[DEBUG]]log("Model removed by cleanup: " .. var_dump(model))
            end
        end
    end
end

---@param model GuiModel
---@param name GuiName
---@return GuiModel
function guiAddRow(model, name)
    ---@type GuiModel
    local rowModel = {
        uid = model.uid,
        self = model.self,
        named = {},
        shares = {},
        tables = {},
        root = nil,
        cells = { },
        _handlers = nil,
        _valid = nil,
    }
    for _, rowDef in pairs(model.tables[name].rowDefs) do
        rowModel.cells[#rowModel.cells + 1] = addElement(model.named[name], rowDef, rowModel)
    end
    return rowModel
end

---@param row GuiModel
function guiRemoveRow(row)
    for _, el in pairs(row.cells) do
        el.destroy()
    end
end

---@param model GuiModel
---@param element LuaGuiElement
---@return AnyBasic
function guiHandleRadiobutton(model, element)
    ---@type string
    local shareName = element.tags._share
    if shareName then
        local value
        for _, el in pairs(model.shares[shareName]) do
            if el == element then
                value = el.tags._value
            else
                el.state = false
            end
        end
        return value
    end
    return nil
end

---@param model GuiModel
---@param shareName GuiName
---@param value AnyBasic
function guiSetRadiobutton(model, shareName, value)
    for _, e in ipairs(model.shares[shareName]) do
        e.state = e.tags._value == value
    end
end

---@param element LuaGuiElement
---@param text string|number|boolean|nil
function guiSetText(element, text)
    element.text = tostring(text or "")
end

---@param share LuaGuiElement[]|nil
---@param visible boolean|nil
function guiSetVisible(share, visible)
    if not share then
        return
    end
    visible = visible or false
    for _, e in pairs(share) do
        e.visible = visible
    end
end

---@param share LuaGuiElement[]|nil
---@param enabled boolean|nil
function guiSetEnabled(share, enabled)
    if not share then
        return
    end
    enabled = enabled or false
    for _, e in pairs(share) do
        e.enabled = enabled
    end
end

---@param number number
---@return string
function emptyIfZero(number)
    return number ~= 0 and tostring(number or "") or ""
end

---@param count LuaGuiElement
---@param unit LuaGuiElement
---@param countWithUnits CountWithUnits
function guiSetCountWithUnits(count, unit, countWithUnits)
    ---@type UnitCode
    local setUnit
    if validCountWithUnits(countWithUnits) then
        count.text = tostring(countWithUnits.count)
        setUnit = countWithUnits.unit
        --unit.value = countWithUnits.unit
    else
        count.text = ""
        setUnit = defaultUnit
        --unit.value = defaultUnit
    end
    if unit then
        ---@type CountUnit
        local unitInfo = getCountUnits()[setUnit]
        if not unitInfo then
            setUnit = defaultUnit
            unitInfo = getCountUnits()[setUnit]
        end
        unit.caption = unitInfo.caption
        unit.tooltip = unitInfo.tooltip
    end
end

---@param button LuaGuiElement
---@param countWithUnits CountWithUnits
---@param type string
---@return CountWithUnits
function guiNextUnit(button, countWithUnits, type)
    countWithUnits = nextUnit2(type, countWithUnits)
    local unitInfo = getCountUnits()[countWithUnits.unit]
    button.caption = unitInfo.caption
    button.tooltip = unitInfo.tooltip
    return countWithUnits
end

---@param event OnGuiClick
---@overload fun(e: EventData)
local function guiHandleEvent(event)
    -- [[DEBUG]]log("GUI HANDLER " .. var_dump(event) .. " TAGS " .. var_dump(event.element.tags))
    if event.element.tags._modelEvents then
        local byEventFuncName = event.element.tags._modelEvents[guiEventsToString[event.name]]
        local byAnyFuncName = event.element.tags._modelEvents[definesEventsAnyString]
        -- [[DEBUG]]log("GUI byEvent " .. var_dump(byEvent) .. ", byAny: " .. var_dump(byAny))
        if byEventFuncName or byAnyFuncName then
            ---@type GuiUid
            local modelUid = event.element.tags._model
            -- [[DEBUG]]log("GUI modelUid " .. var_dump(modelUid))
            if modelUid then
                local model = storage.guiModels[modelUid]
                -- [[DEBUG]]log("GUI model " .. var_dump(model))
                if model then
                    if byEventFuncName then
                        guiHandlers[model.self.eventHandlers][byEventFuncName](model.self, event, model)
                    end
                    if byAnyFuncName then
                        guiHandlers[model.self.eventHandlers][byAnyFuncName](model.self, event, model)
                    end
                end
                if model.onAfterEvent then
                    guiHandlers[model.self.eventHandlers][model.onAfterEvent](model.self, event, model)
                end
            end
        end
    end
end

function guiSetup()
    script.on_event(defines.events.on_gui_checked_state_changed, guiHandleEvent)
    script.on_event(defines.events.on_gui_click, guiHandleEvent)
    script.on_event(defines.events.on_gui_confirmed, guiHandleEvent)
    script.on_event(defines.events.on_gui_elem_changed, guiHandleEvent)
    script.on_event(defines.events.on_gui_location_changed, guiHandleEvent)
    script.on_event(defines.events.on_gui_selected_tab_changed, guiHandleEvent)
    script.on_event(defines.events.on_gui_selection_state_changed, guiHandleEvent)
    script.on_event(defines.events.on_gui_switch_state_changed, guiHandleEvent)
    script.on_event(defines.events.on_gui_text_changed, guiHandleEvent)
    script.on_event(defines.events.on_gui_value_changed, guiHandleEvent)
    script.on_event(defines.events.on_gui_closed, function(event)
        if event.element then
            guiHandleEvent(event)
        end
    end)
end

---@param model GuiModel
---@param name GuiName
function guiTableBeginUpdate(model, name)
    local table = model.tables[name]
    table.updateIndex = table.updateIndex + 1
end

---@param model GuiModel
---@param name GuiName
---@return table<GuiRowId, GuiModel>
function guiTableGetRows(model, name)
    return model.tables[name].rows
end

---@param model GuiModel
---@param name GuiName
---@param rowId GuiRowId
---@return GuiModel, boolean|nil
function guiTableAddOrGetRow(model, name, rowId)
    local table = model.tables[name]
    local rowModel = table.rows[rowId]
    if rowModel then
        rowModel._valid = table.updateIndex
        return rowModel, false
    end
    ---@type GuiModel
    rowModel = {
        uid = model.uid,
        self = model.self,
        named = {},
        shares = {},
        tables = {},
        root = nil,
        cells = { },
        _handlers = nil,
        _valid = table.updateIndex,
    }
    table.rows[rowId] = rowModel
    for _, rowDef in pairs(table.rowDefs) do
        rowModel.cells[#rowModel.cells + 1] = addElement(model.named[name], rowDef, rowModel)
    end
    return rowModel, true
end

---@param model GuiModel
---@param name GuiName
function guiTableEndUpdate(model, name)
    local table = model.tables[name]
    for uid, row in pairs(table.rows) do
        if row._valid ~= table.updateIndex then
            table.rows[uid] = nil
            for _, el in pairs(row.cells) do
                el.destroy()
            end
        end
    end
    -- todo may be add sorting
end

---@param model GuiModel
---@param name GuiName
function guiTableClear(model, name)
    guiTableBeginUpdate(model, name)
    guiTableEndUpdate(model, name)
end

---@param key GuiKey
---@param playerIndex PlayerIndex
---@return GuiModel
function getIndexedModel(key, playerIndex)
    if storage.guiIndex then
        -- todo remove
        local p = storage.guiIndex[key]
        if p then
            return p[playerIndex]
        end
    end
    return nil
end

---@param uid GuiUid
---@return GuiHandlerModel
function getGuiHandler(uid)
    return storage.guiModels[uid]
end

---@param uid GuiUid
---@param self GuiSelf
---@return GuiHandlerModel
function createGuiHandler(uid, self)
    local handler = { self = self }
    storage.guiModels[uid] = handler
    return handler
end

---@param uid GuiUid
---@param handlers GuiDefHandlers
---@param tags Tags|nil
---@return Tags
function setGuiHandlerTags(uid, handlers, tags)
    local model = storage.guiModels[uid]
    local self = model.self
    for defineEvent, prop in pairs(eventMap) do
        if handlers[prop] then
            local func = handlers[prop]
            if not self or type(self) ~= "table" then
                error("self must be table")
            end

            model._eventHandlerIndexByFunction = model._eventHandlerIndexByFunction or {}
            model._eventHandlerFunctions = model._eventHandlerFunctions or {}
            if not model._eventHandlerIndexByFunction[func] then
                model._eventHandlerFunctions[#model._eventHandlerFunctions + 1] = func
                model._eventHandlerIndexByFunction[func] = #model._eventHandlerFunctions
            end

            tags = tags or {}
            tags._model = model.uid
            tags._modelEvents = tags._modelEvents or {}
            tags._modelEvents[guiEventsToString[defineEvent]] = model._eventHandlerIndexByFunction[func]
        end
    end
    return tags
end
