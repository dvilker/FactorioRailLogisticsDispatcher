
---@alias DeliveryUid number


---@shape DeliveryPoint
    ---@field stop StopClass
    ---@field needContent table<string, number> @nullable Content expected after load/unload
    ---@field exchangeMul number @ 1 - from station to train (provider), -1 - from train to station (requester)
    ---@field exchange table<string, number> @  (exchange[*] * exchangeMul):  > 0 - from station to train (provider), ...
    ---@field passed boolean @nullable


---@class DeliveryClass
    ---@field uid DeliveryUid @unique id of DeliveryOb. Equals surface.index
    ---@field valid boolean
    ---@field points DeliveryPoint[]
    ---@field train TrainClass @nullable
    ---@field startTick number
DeliveryClass = { }


---@return DeliveryClass
function DeliveryClass:new()
    global.lastUid = (global.lastUid or 0) + 1
    return instanceClass(self, {
        uid = global.lastUid,
        valid = true,
        points = {},
        startTick = game.tick
    })
end


---@param stopOrTrain StopClass|TrainClass
function DeliveryClass:isRelated(stopOrTrain)
    if self.train == stopOrTrain then
        return true
    end
    for _, point in pairs(self.points) do
        if point.stop == stopOrTrain then
            return true
        end
    end
    return false
end
