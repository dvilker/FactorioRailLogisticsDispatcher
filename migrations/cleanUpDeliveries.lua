if global.surObs then
    for _, sur in pairs(global.surObs) do
        for dUid, delivery in pairs(sur.deliveries) do
            if (delivery.requesterPassed and delivery.providerPassed)
                    or not delivery.requester.valid
                    or not delivery.provider.valid
                    or not delivery.train.valid
            then
                sur.deliveries[dUid] = nil
                for _, stop in pairs(sur.stops) do
                    stop.deliveries[dUid] = nil
                end
            end
        end
    end
end
