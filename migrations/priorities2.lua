if global.surObs then
    for _, sur in pairs(global.surObs) do
        for typeAndName, requestStops in pairs(sur.request) do
            for stopUid, stop in pairs(requestStops) do
                if not stop.valid or not stop.stopEntity.valid or not stop.disp or not stop.disp.entity.valid then
                    requestStops[stopUid] = nil
                end
            end
            if table_size(requestStops) == 0 then
                sur.request[typeAndName] = nil
            end
        end
    end
end
