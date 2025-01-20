dispatcherSignalSlotCount = 36
minEnergyUseTrain = 100000000 -- 100 MJ
minEnergyUseTrainMJ = 100 -- for prints
correctScheduleAtProvider = true
countingInsertersContent = true
---@type number
updateTicks = 2
timeOfStuckDelivery = 60 * 300
useHackToSaveInterrupts = true
setTrainGroup = true
pauseNewDispatchers = true

loadOrCondFull = false
unloadOrCondZeros = false

debugMode = false

function configUpdate()
    minEnergyUseTrain = settings.global["viirld-minEnergyUseTrainMJ"].value * 1000000
    minEnergyUseTrainMJ = settings.global["viirld-minEnergyUseTrainMJ"].value

    correctScheduleAtProvider = settings.global["viirld-correctScheduleAtProvider"].value

    countingInsertersContent = settings.global["viirld-countingInsertersContent"].value

    useHackToSaveInterrupts = settings.global["viirld-use-hack-to-save-interrupts"].value
    setTrainGroup = settings.global["viirld-set-train-group"].value
    pauseNewDispatchers = settings.global["viirld-pauseNewDispatchers"].value

    loadOrCondFull = settings.global["viirld-load-or-cond-full"].value
    unloadOrCondZeros = settings.global["viirld-unload-or-cond-zeros"].value

    if settings.global["viirld-updateTicks"].value ~= updateTicks then
        updateTicks = settings.global["viirld-updateTicks"].value
        globalUpdateTimer()
    end

    debugMode = settings.global["viirld-debug"].value
end
