if storage.surObs then
    for _, disp in pairs(storage.disps) do
        if disp.networks == 0 then
            disp.networks = -1
        end
    end
end
