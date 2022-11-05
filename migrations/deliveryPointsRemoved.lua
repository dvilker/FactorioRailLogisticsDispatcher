local function processDelivery(delivery)
    if delivery.points then
        --[[DEBUG]] log("Apply deliveryPointsRemoved.lua to delivery " .. tostring(delivery.uid))
        delivery.provider = delivery.points[1].stop
        delivery.providerPassed = delivery.points[1].passed
        delivery.requester = delivery.points[2].stop
        delivery.requesterPassed = delivery.points[2].passed
        delivery.contents = delivery.points[1].needContent
        delivery.points = nil
    end
end
for _, sur in pairs(global.surObs) do
    for _, stop in pairs(sur.stops) do
        stop.deliveryPoint = nil
        for _, delivery in pairs(stop.deliveries) do
            processDelivery(delivery)
        end
        if stop.delivery then
            processDelivery(stop.delivery)
        end
    end
    for _, delivery in pairs(sur.deliveries) do
        processDelivery(delivery)
    end
    for _, train in pairs(sur.trains) do
        if train.delivery then
            processDelivery(train.delivery)
        end
    end
end
