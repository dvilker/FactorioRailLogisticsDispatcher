local function processMap(namedMap, hint)
    if namedMap then
        for name, x in pairs(namedMap) do
            if not string.find(name, "=", 1, true) then
                local typeAndName = toTypeAndName(game.item_prototypes[name] and "item" or "fluid", name)
                namedMap[typeAndName] = x
                namedMap[name] = nil
                log("Migration toTypeAndName: " .. hint .. ": " .. name .. " -> " .. typeAndName)
            end
        end
    end
end

if storage.surObs then
    for _, sur in pairs(storage.surObs) do
        processMap(sur.provide, "sur.provide")
        processMap(sur.request, "sur.request")
        processMap(sur.provideUpdate, "sur.provideUpdate")
        for _, stop in pairs(sur.stops) do
            processMap(stop.signalStates, "stop.signalStates")
            processMap(stop.request, "stop.request")
            processMap(stop.provide, "stop.provide")
            processMap(stop.stat, "stop.stat")
            processMap(stop.deliveryChanges, "stop.deliveryChanges")
            processMap(stop.lastTickMap, "stop.lastTickMap")
            for _, del in pairs(stop.deliveries) do
                processMap(del.contents, "del.contents")
            end
        end
        for _, del in pairs(sur.deliveries) do
            processMap(del.contents, "del.contents")
        end
    end
end
