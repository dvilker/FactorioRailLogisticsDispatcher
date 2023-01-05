if global.surObs then
    for _, disp in pairs(global.disps) do
        if disp.networks == 0 then
            disp.networks = -1
        end
    end
end
