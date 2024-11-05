storage.guiNextUid = storage.guiNextUid or 100
storage.guiModels = storage.guiModels or {}
storage.guiIndex = storage.guiIndex or {}
storage.trainTypes = storage.trainTypes or {}
storage.trainStation = storage.trainStation or {}



---@param trainTypeInfo TrainTypeInfo
function refreshTrainTypeInfo(trainTypeInfo)
    trainTypeInfo.length = table_size(trainTypeInfo.carriages)
    trainTypeInfo.itemCapacity = 0
    trainTypeInfo.itemWagonCount = 0
    trainTypeInfo.fluidCapacity = 0
    trainTypeInfo.fluidCapacityPerWagons = {}

    for _, car in pairs(trainTypeInfo.carriages) do
        local proto = prototypes.entity[car]
        if proto.type == "cargo-wagon" then
            local stackCount = proto.get_inventory_size(defines.inventory.cargo_wagon)
            if stackCount and stackCount > 0 then
                trainTypeInfo.itemWagonCount = trainTypeInfo.itemWagonCount + 1
                trainTypeInfo.itemCapacity = trainTypeInfo.itemCapacity + stackCount
            end
        end
        if proto.type == "fluid-wagon" then
            local fluidCapacity = proto.fluid_capacity
            if fluidCapacity and fluidCapacity > 0 then
                trainTypeInfo.fluidCapacity = trainTypeInfo.fluidCapacity + fluidCapacity
                trainTypeInfo.fluidCapacityPerWagons[#trainTypeInfo.fluidCapacityPerWagons + 1] = fluidCapacity
            end
        end
    end
end


if table_size(storage.trainTypes) > 0 then
    for _, tt in pairs(storage.trainTypes) do
        refreshTrainTypeInfo(tt)
    end
end

for _, disp in pairs(storage.disps) do
    disp.stopName = disp.stopEntity and disp.stopEntity.backer_name or nil
end

log("MIGRATED _gui")