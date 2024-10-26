if storage.surObs then
    for _, disp in pairs(storage.disps) do
        disp.priority = 0
    end
    for _, sur in pairs(storage.surObs) do
        sur.request = sur.request or {}
        for _, stop in pairs(sur.stops) do
            stop.disp.priority = 0
        end
    end
end
