if global.surObs then
    for _, disp in pairs(global.disps) do
        disp.priority = 0
    end
    for _, sur in pairs(global.surObs) do
        sur.request = sur.request or {}
        for _, stop in pairs(sur.stops) do
            stop.disp.priority = 0
        end
    end
end
