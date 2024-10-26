---@alias PREF [PREF_*]
PREF_GUI_NET = 1001
PREF_GUI_TAB = 1002

PREF_GUI_RESOURCES_FILTER = 1003

---@param playerIndex number
---@param pref PREF
---@param value any
---@return any
function setPlayerPref(playerIndex, pref, value)
    storage.playerPrefs = storage.playerPrefs or {} -- TODO remove
    local playerPref = storage.playerPrefs[playerIndex]
    if not playerPref then
        playerPref = {}
        storage.playerPrefs[playerIndex] = playerPref
    end
    local pred = playerPref[pref]
    playerPref[pref] = value
    return pred
end

---@param playerIndex number
---@param pref PREF
---@return any
function getPlayerPref(playerIndex, pref)
    storage.playerPrefs = storage.playerPrefs or {} -- TODO remove
    local playerPref = storage.playerPrefs[playerIndex]
    if playerPref then
        return playerPref[pref]
    end
    return nil
end
