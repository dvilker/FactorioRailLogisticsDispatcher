
---@alias DeliveryUid number


---@class DeliveryClass
    ---@field uid DeliveryUid @unique id of DeliveryOb. Equals surface.index
    ---@field valid boolean
    ---@field provider DispClass
    ---@field requester DispClass
    ---@field contents table<TypeAndName, number>
    ---@field providerPassed boolean
    ---@field requesterPassed boolean
    ---@field mover MoverClass @nullable
    ---@field trainType TrainType @ type of train with which this delivery was created
    ---@field startTick number

DeliveryClass = --[[---@type DeliveryClass]] createClass("Del")


function DeliveryClass:restoreClass()
    restoreClass(self.provider)
    restoreClass(self.requester)
    restoreClass(self.mover)
end



-----@return DeliveryClass
--function DeliveryClass:new()
--    storage.lastUid = (storage.lastUid or 0) + 1
--    return instanceClass(self, {
--        uid = storage.lastUid,
--        valid = true,
--        startTick = game.tick
--    })
--end


---@param provider DispClass
---@param requester DispClass
---@param mover MoverClass
---@param contents table<TypeAndName, number>
---@param existsDelivery DeliveryClass
---@return DeliveryClass @nullable
function DeliveryClass:new(provider, requester, mover, contents, existsDelivery)
    local availStacks = mover.itemCapacity
    local availFluid = mover.fluidCapacity
    requester.lastTickMap = requester.lastTickMap or {} -- TODO remove
    ---@type table<string, number>
    local lastMap = requester.lastTickMap
    ---@type number
    local current = 0
    while current do
        ---@type number
        local next
        for typeAndName, count in pairs(contents) do
            local nameLastTick = table_size(contents) ~= 1 and lastMap[typeAndName] or 0
            if current == nameLastTick then
                if typeAndNameIsItem(typeAndName) then
                    local _, name = fromTypeAndName(typeAndName)
                    local itemProto = game.item_prototypes[name]
                    local stacks = math.ceil(count / itemProto.stack_size)
                    if availStacks > stacks then
                        availStacks = availStacks - stacks
                    elseif availStacks > 0 then
                        contents[typeAndName] = availStacks * itemProto.stack_size
                        availStacks = 0
                    else
                        contents[typeAndName] = nil
                    end
                else
                    -- todo allow to combine fluids
                    if availFluid > 0 then
                        if availFluid < contents[typeAndName] then
                            contents[typeAndName] = availFluid
                        end
                        availFluid = 0
                    else
                        contents[typeAndName] = nil
                    end
                end
            elseif nameLastTick > current then
                if next == nil or nameLastTick < next then
                    next = nameLastTick
                end
            end
        end
        current = next
    end

    if table_size(contents) == 0 then
        return nil
    end

    local delivery = existsDelivery
    if not delivery then
        storage.lastUid = (storage.lastUid or 0) + 1
        delivery = instanceClass(self, {
            uid = storage.lastUid,
            valid = true,
            startTick = game.tick
        })
    end
    delivery.mover = mover
    delivery.provider = provider
    delivery.requester = requester
    delivery.contents = contents
    for typeAndName, _ in pairs(contents) do
        requester.lastTickMap[typeAndName] = game.tick
    end
    return delivery
end



---@param stopOrTrain DispClass|MoverClass
function DeliveryClass:isRelated(stopOrTrain)
    return self.mover == stopOrTrain
            or (self.provider == stopOrTrain and not self.providerPassed)
            or (self.requester == stopOrTrain and not self.requesterPassed)
end




