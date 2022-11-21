dispatcherSignalSlotCount = 30
defaultNetworks = 1
minEnergyUseTrain = 100000000 -- 100 MJ
--minEnergyUseTrainAtDepot = 400000000


depotScheduleType = --[[---@type string]] "time"
depotScheduleTime = --[[---@type number]] 0

fuelScheduleTime = --[[---@type number]] 120

correctScheduleBeforeProvider = true
correctScheduleAndAtProvider = true

countingInsertersContent = true

updateTicks = --[[---@type number]]2

function updateConfig()
    --[[DEBUG]]log("YATM: updateConfig(): dispatcherSignalSlotCount: " .. var_dump(dispatcherSignalSlotCount) .. " -> " .. var_dump(settings.startup["yatm-dispatcherSignalSlotCount"].value))
    dispatcherSignalSlotCount = settings.startup["yatm-dispatcherSignalSlotCount"].value

    --[[DEBUG]]log("YATM: updateConfig(): minEnergyUseTrain: " .. var_dump(minEnergyUseTrain) .. " -> " .. var_dump(settings.global["yatm-minEnergyUseTrain"].value * 1000000))
    minEnergyUseTrain = settings.global["yatm-minEnergyUseTrain"].value * 1000000

    --[[DEBUG]]log("YATM: updateConfig(): fuelScheduleTime: " .. var_dump(fuelScheduleTime) .. " -> " .. var_dump(settings.global["yatm-fuelScheduleTime"].value))
    fuelScheduleTime = settings.global["yatm-fuelScheduleTime"].value

    --[[DEBUG]]log("YATM: updateConfig(): correctScheduleBeforeProvider: " .. var_dump(correctScheduleBeforeProvider) .. " -> " .. var_dump(settings.global["yatm-correctScheduleBeforeProvider"].value))
    correctScheduleBeforeProvider = settings.global["yatm-correctScheduleBeforeProvider"].value

    --[[DEBUG]]log("YATM: updateConfig(): correctScheduleAndAtProvider: " .. var_dump(correctScheduleAndAtProvider) .. " -> " .. var_dump(settings.global["yatm-correctScheduleAndAtProvider"].value))
    correctScheduleAndAtProvider = settings.global["yatm-correctScheduleAndAtProvider"].value

    --[[DEBUG]]log("YATM: updateConfig(): countingInsertersContent: " .. var_dump(countingInsertersContent) .. " -> " .. var_dump(settings.global["yatm-countingInsertersContent"].value))
    countingInsertersContent = settings.global["yatm-countingInsertersContent"].value

    --[[DEBUG]]log("YATM: updateConfig(): updateTicks: " .. var_dump(updateTicks) .. " -> " .. var_dump(settings.global["yatm-updateTicks"].value))
    if settings.global["yatm-updateTicks"].value ~= updateTicks then
        updateTicks = settings.global["yatm-updateTicks"].value
        SurClass.updateTimer()
    end
end
