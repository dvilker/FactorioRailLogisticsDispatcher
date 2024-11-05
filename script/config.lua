dispatcherSignalSlotCount = 36
minEnergyUseTrain = 100000000 -- 100 MJ
minEnergyUseTrainMJ = 100 -- for prints
correctScheduleAtProvider = true
countingInsertersContent = true
---@type number
updateTicks = 2

debugMode = false

function configUpdate()
    minEnergyUseTrain = settings.global["viirld-minEnergyUseTrainMJ"].value * 1000000
    minEnergyUseTrainMJ = settings.global["viirld-minEnergyUseTrainMJ"].value

    correctScheduleAtProvider = settings.global["viirld-correctScheduleAtProvider"].value

    countingInsertersContent = settings.global["viirld-countingInsertersContent"].value

    if settings.global["viirld-updateTicks"].value ~= updateTicks then
        updateTicks = settings.global["viirld-updateTicks"].value
        globalUpdateTimer()
    end

    debugMode = settings.global["viirld-debug"].value
end
