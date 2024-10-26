
local modGui = require("mod-gui")
netsGuiButtonName = script.mod_name .. "_BTN"

NetsButtonGui = createClass("NetBt")


---@param player LuaPlayer
function netsGuiCreateButton(player)
    ---@type LuaGuiElement
    local buttonFlow = modGui.get_button_flow(player)
    if not buttonFlow[netsGuiButtonName] then
        buttonFlow.add {
            type = "sprite-button",
            name = netsGuiButtonName,
            sprite = "item/viirld2-dispatcher",
            tooltip = "Диспетчер железнодорожной логистики",
            style = modGui.button_style,
            tags = getGuiHandler(netsGuiButtonName).self.tags
        }
    end
end

function NetsButtonGui:onClick(event)
    NetsGui.triggerOpened(event)
end

function netsGuiAddButtonToAllPlayers()
    if not getGuiHandler(netsGuiButtonName) then
        local model = createGuiHandler(netsGuiButtonName, instanceClass(NetsButtonGui, {}))
        model.self.tags = setGuiHandlerTags(netsGuiButtonName, { onClick = NetsButtonGui.onClick })
    end
    for _, player in pairs(game.players) do
        netsGuiCreateButton(player)
    end
end

