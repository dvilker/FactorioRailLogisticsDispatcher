---@alias GuiName string|number

---@shape GuiModel
    ---@field named table<GuiName, LuaGuiElement>
    ---@field rowDefs table<GuiName, GuiDef[]>
    ---@field shares table<GuiName, LuaGuiElement[]>
    ---@field root LuaGuiElement
    ---@field cells LuaGuiElement[]
    ---@field ex GuiExtraSettings

---@shape GuiDef: LuaGuiElement_add_params
    ---@field _name GuiName|nil
    ---@field _share GuiName|nil
    ---@field _value AnyBasic|nil
    ---@field _style1 table|nil
    ---@field _style2 table|nil
    ---@field _sub GuiDef[]|nil
    ---@field _row GuiDef[]|nil
    ---@field _dragTarget GuiName|nil
    ---@field _autoSharesFrom number|nil
    ---@field column_count number|nil
    ---@field elem_value string|SignalID|nil
    ---@field state boolean|nil

---@alias GuiExtraSettings { namedTag: string, namedTagValue: AnyBasic|nil }


---@param target LuaGuiElement
---@param def GuiDef
---@param model GuiModel
---@param ex GuiExtraSettings @nullable
---@return LuaGuiElement
local function addElement(target, def, model, ex)
    if def.type == "checkbox" then
        def.state = def.state or false
    end
    local tags = --[[---@type Tags]] def.tags
    if ex and ex.namedTag and (def._name or def._share) then
        tags = tags or {}
        tags[ex.namedTag] = ex.namedTagValue or 1
    end
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
    def.tags = tags
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
        local share = --[[---@type LuaGuiElement[] ]] model.shares[def._share]
        if not share then
            share = {}
            model.shares[def._share] = share
        end
        share[#share + 1] = element
    end
    if def._style1 then
        for k, v in pairs(def._style1) do
            (--[[---@type table ]]element.style)[k] = v
        end
    end
    if def._style2 then
        for k, v in pairs(def._style2) do
            (--[[---@type table ]]element.style)[k] = v
        end
    end
    if def._dragTarget then
        if def._dragTarget == "" then
            element.drag_target = model.root
        else
            element.drag_target = model.named[def._dragTarget]
        end
    end
    if def._row and def._name then
        model.rowDefs[def._name] = def._row
    end
    if not model.root then
        model.root = element
    end
    if def._sub then
        if def._autoSharesFrom and def.column_count then
            for i, sub in pairs(def._sub) do
                local j = i - 1 - (i - 1) % def.column_count + def._autoSharesFrom
                local fromElement = (--[[---@not nil]]def._sub)[j]
                if fromElement.type == "flow" and not (fromElement._share or fromElement._name) then
                    fromElement = (--[[---@not nil]]fromElement._sub)[1]
                end
                sub._share = fromElement._share or fromElement._name
            end
        end
        for _, sub in pairs(def._sub) do
        addElement(element, sub, model, ex)
        end
        if def.type == "tabbed-pane" then
            --for _, sub in pairs(def._sub) do
            --    if sub.type == "tab" then
            --        addElement(element, sub, model, ex)
            --    end
            --end
            --for _, sub in pairs(def._sub) do
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
---@param ex GuiExtraSettings @nullable
---@param rootDef GuiDef
---@return GuiModel
function createGuiModel(target, ex, rootDef)
    local model = {
        named = {},
        shares = {},
        rowDefs = {},
        root = nil,
        cells = nil,
        ex = ex,
    }
    model.root = addElement(target, rootDef, model, ex)
    return model
end

---@param model GuiModel
---@param name GuiName
---@return GuiModel
function guiAddRow(model, name)
    ---@type GuiModel
    local rowModel = {
        named = {},
        shares = {},
        rowDefs = {},
        root = nil,
        cells = { },
        ex = model.ex,
    }
    for _, rowDef in pairs(model.rowDefs[name]) do
        rowModel.cells[#rowModel.cells + 1] = addElement(model.named[name], rowDef, rowModel, model.ex)
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
    local shareName = --[[---@type string]]element.tags._share
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

---@param share LuaGuiElement[]
---@param visible boolean
function guiSetVisible(share, visible)
    for _, e in pairs(share) do
        e.visible = visible
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
    local unitInfo =  getCountUnits()[countWithUnits.unit]
    button.caption = unitInfo.caption
    button.tooltip = unitInfo.tooltip
    return countWithUnits
end
