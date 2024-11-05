dispatcherSignalSlotCount = 36
minEnergyUseTrain = 100000000 -- 100 MJ
minEnergyUseTrainMJ = 100 -- for prints
correctScheduleAtProvider = true
countingInsertersContent = true
---@type number
updateTicks = 2

function configUpdate()
    --[[DEBUG]]log("VIIRLD: updateConfig(): minEnergyUseTrainMJ: " .. var_dump(minEnergyUseTrain) .. " -> " .. var_dump(settings.global["viirld-minEnergyUseTrainMJ"].value * 1000000))
    minEnergyUseTrain = settings.global["viirld-minEnergyUseTrainMJ"].value * 1000000
    minEnergyUseTrainMJ = settings.global["viirld-minEnergyUseTrainMJ"].value

    --[[DEBUG]]log("VIIRLD: updateConfig(): correctScheduleAtProvider: " .. var_dump(correctScheduleAtProvider) .. " -> " .. var_dump(settings.global["viirld-correctScheduleAtProvider"].value))
    correctScheduleAtProvider = settings.global["viirld-correctScheduleAtProvider"].value

    --[[DEBUG]]log("RLD: updateConfig(): countingInsertersContent: " .. var_dump(countingInsertersContent) .. " -> " .. var_dump(settings.global["viirld-countingInsertersContent"].value))
    countingInsertersContent = settings.global["viirld-countingInsertersContent"].value

    --[[DEBUG]]log("RLD: updateConfig(): updateTicks: " .. var_dump(updateTicks) .. " -> " .. var_dump(settings.global["viirld-updateTicks"].value))
    if settings.global["viirld-updateTicks"].value ~= updateTicks then
        updateTicks = settings.global["viirld-updateTicks"].value
        globalUpdateTimer()
    end
end
