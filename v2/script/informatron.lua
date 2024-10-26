function informatronMenu(player_index)
    return { }
end

function informatronPageContent(page_name, player_index, element)
    -- local player = game.players[player_index]
    if page_name == "viirld" then
        element.add { type = "label", name = "text_1", caption = { "viirld.informatron" } }
    end
end
