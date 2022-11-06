
---@alias DeliveryUid number


---@class DeliveryClass
    ---@field uid DeliveryUid @unique id of DeliveryOb. Equals surface.index
    ---@field valid boolean
    ---@field provider StopClass
    ---@field requester StopClass
    ---@field contents table<string, number>
    ---@field providerPassed boolean
    ---@field requesterPassed boolean
    ---@field train TrainClass @nullable
    ---@field startTick number
DeliveryClass = { }


---@return DeliveryClass
function DeliveryClass:new()
    global.lastUid = (global.lastUid or 0) + 1
    return instanceClass(self, {
        uid = global.lastUid,
        valid = true,
        startTick = game.tick
    })
end


---@param stopOrTrain StopClass|TrainClass
function DeliveryClass:isRelated(stopOrTrain)
    return self.train == stopOrTrain or self.provider == stopOrTrain or self.requester == stopOrTrain
end