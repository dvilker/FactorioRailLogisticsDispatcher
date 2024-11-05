---@alias Network number
---@alias SurfaceIndex number
---@alias ForceIndex number
---@alias PlayerIndex number
---@alias EntityUnitNumber number
---@alias TrainId number
---@alias TypeNameQuality string
--- type .. "=" .. name .. ",quality=" .. quality
--- type .. "=" .. name -- for simple quality

---@alias TrainType string

---@class TrainTypeInfo
---@field typeName TrainType
---@field length number
---@field itemCapacity number
---@field itemWagonCount number
---@field fluidCapacity number
---@field fluidCapacityPerWagons number[]
---@field carriages string[] @ Entity names from configuration refreshing

---@alias DispNetwork uint

---@class DispSettingsItemMem
---@field allowProvide true|nil @ not (allowProvide and allowRequest)
---@field allowRequest true|nil
---@field request CountWithUnits|nil @ != nil if request
---@field requestMin CountWithUnits|nil @

---@class DispSettingsItem: DispSettingsItemMem
---@field index number
---@field type string
---@field name string
---@field quality string
---@field tnq TypeNameQuality

---@class DispSettingsMem
---@field allowAnyItemProvide true|nil
---@field allowAnyItemRequest true|nil
---@field minAnyItem CountWithUnits|nil
---@field allowAnyFluidProvide true|nil
---@field allowAnyFluidRequest true|nil
---@field minAnyFluid CountWithUnits|nil

---@class DispSettings: DispSettingsMem
---@field modeEndpoint true|nil
---@field modeDepot true|nil
---@field outExchangeCounts true|nil
---@field outTargetCounts true|nil
---@field outNegate true|nil
---@field flagUseSignals true|nil @ use signals in schedule for this stop
---@field flagUseEquals true|nil @ use strict equals in schedule for this stop
---@field flagTurnInserters true|nil @ rotate inserters when train departures (for cleaning)
---@field flagItemCompounds true|nil @ allow compound deliveries of items (no fluids)
---@field flagFluidCompounds true|nil @ allow compound deliveries of fluids
---@field flagLiquidation true|nil @ ignore minimals
---@field network DispNetwork
---@field minTrainLength number|nil
---@field maxTrainLength number|nil
---@field stationTemplate string|nil
---@field items table<TypeNameQuality, DispSettingsItem> @ cargo signals. insertion sorted by index

---@class DispSignal
---@field type string
---@field name string
---@field quality string
---@field tnq TypeNameQuality
---@field requestQueueTick number|nil
---@field provideCount number|nil @ nil - no provide
---@field requestCount number|nil @ nil - no request or < min
---@field requestMin number|nil
---@field balance number|nil @ >0 - provide, <0 - request ignores minimum
---@field _used boolean @ Flag for dispUpdate internals
---@field circuitValue number|nil
---@field debugDynamic boolean
---@field debugInTrain number|nil
---@field debugTransit number|nil

---@class DispError
---@field text LocalisedString
---@field tt LocalisedString
---@field addTick number

---@class DispTurnedInserter
---@field inserter LuaEntity
---@field drop_position MapPosition|nil @ Not null if turned not by drop_position
---@field pickup_position MapPosition|nil @ Not null if turned not by pickup_position
---@field direction defines.direction|nil @ Not null if turned not by direction

---@class DispStatPerTnq
---@field provided number
---@field received number
---@field deliveries number
---@field lastTick number

---@alias DispUid number

---@class DispClass
---@field uid number
---@field org OrgClass
---@field entity LuaEntity
---@field stopEntity LuaEntity|nil
---@field stopName string
---@field stopPosition MapPosition|nil
---@field outPort LuaEntity
---@field settings DispSettings
---@field signals table<TypeNameQuality, DispSignal> @ current state of signals
---@field transit table<TypeNameQuality, number> @ in transit >0 - to station,  <0 - from station
---@field deliveries table<DeliveryUid, DeliveryClass>
---@field _stopEntityLine LuaRenderObject|nil
---@field gui DispGui|nil @ gui if opened
---@field errors table<TypeNameQuality|string,  DispError> @
---@field lastUpdateTick number
---@field _isPaused boolean|nil
---@field _isPausedByUpdate boolean|nil
---@field _isPausedTick number|nil
---@field stoppedTrain LuaTrain|nil @ stopped train if any (complex updated)
---@field stoppedTrainType TrainType|nil
---@field readyTrainTypeDepot TrainType|nil
---@field delivery DeliveryClass|nil @ delivery at stopped train
---@field turnedInserters table<EntityUnitNumber, DispTurnedInserter>|nil @ saved turned inserters
---@field inserters table<EntityUnitNumber, LuaEntity>|nil @ inserters that load or unload cargo wagons. EntityUnitNumber <0 for unload
---@field _insertersDraw table<EntityUnitNumber, LuaRenderObject>|nil
---@field stat table<TypeNameQuality, DispStatPerTnq>|nil Statistics per cargo
---@field statTrains number|nil  Count of all trains (only registered)


---@alias DeliveryUid number

---@class DeliveryClass
---@field uid DeliveryUid
---@field requester DispClass
---@field provider DispClass|nil @ nil for dirty trains
---@field requesterPassedTick number|nil
---@field providerPassedTick number|nil
---@field contents table<TypeNameQuality, number>
---@field startTick number

---@alias MoverUid number
    ---Equals to train.id


---@alias MoverTypeName string
    --- Encoded train type. locomotive/cargo-wagon*2

---@class MoverType
---@field name MoverTypeName
---@field itemCapacity number @ stacks
---@field fluidCapacity number
---@field fluidWagons number[] @ capacity of each wagon
---@field length number @ Number of wagons


---@class MoverClass
---@field uid MoverUid @unique id of TrainOb. Equals train.id
---@field train LuaTrain
---@field org OrgClass
---@field depot string @ Name of last depot
---@field moverTypeName MoverTypeName
---@field delivery DeliveryClass|nil
---@field isFree boolean @ Is train is available to use for deliveries
---@field depotNameText number

---@class RequestQueue
---@field queuedDisps table<DispUid, DispClass>

---@class OrgClass @ Organisation: union of Force+Surface
---@field force LuaForce
---@field surface LuaSurface
---@field title LocalisedString @ Nauvis or Nauvis-34
---@field disps table<DispUid, DispClass> @ All disps
---@field depotDisps table<DispUid, DispClass> @ Depots is common for all networks
---@field depotReadyDisps table<TrainType, table<DispUid, DispClass>> @ Ready for delivery
---@field deliveries table<DeliveryUid, DeliveryClass> @ Active deliveries
---@field provide table<Network, table<TypeNameQuality, table<DispUid, DispClass>>> @Current provides
---@field requestQueue table<Network, table<TypeNameQuality, RequestQueue>> @Current request order

---@class ForcePref
---@field itemMem table<"item"|"fluid", DispSettingsItemMem[]>
---@field anyMem DispSettingsMem[]

---@class storage
---@field activeDisps table<DispUid, DispClass>
---@field activeDispsKey DispUid @for iteration in globalTick
---@field disps table<EntityUnitNumber, DispClass> @ disp by any linked entities (stop, io, ...)
---@field lastUid number @ for uid generations
---@field orgs table<ForceIndex, table<SurfaceIndex, OrgClass>>
---@field deliveries table<DeliveryUid, DeliveryClass>
---@field trainTypes table<TrainType, TrainTypeInfo>
---@field forcePrefs table<ForceIndex, ForcePref>
---@field guiNextUid number
---@field guiModels table<GuiUid, GuiModel|GuiHandlerModel>
---@field guiIndex table<GuiKey, table<PlayerIndex, GuiModel>>
---@field trainStation table<TrainId, {station: LuaEntity, text: LuaRenderObject}>

---@type storage
storage = storage

function storageInit()
    storage.activeDisps = storage.activeDisps or {}
    storage.disps = storage.disps or {}
    storage.lastUid = storage.lastUid or 100
    storage.orgs = storage.orgs or {}
    storage.deliveries = storage.deliveries or {}
    storage.trainTypes = storage.trainTypes or {}
    storage.forcePrefs = storage.forcePrefs or {}

    storage.guiNextUid = storage.guiNextUid or 100
    storage.guiModels = storage.guiModels or {}
    storage.guiIndex = storage.guiIndex or {}

    storage.trainStation = storage.trainStation or {}

    if table_size(storage.trainTypes) > 0 then
        for _, tt in pairs(storage.trainTypes) do
            refreshTrainTypeInfo(tt)
        end
    end
end

---@param forceIndex ForceIndex
---@return ForcePref
function storageGetForcePrefs(forceIndex)
    local forcePref = storage.forcePrefs[forceIndex]
    if not forcePref then
        forcePref = {
            itemMem = {
                item = {},
                fluid = {},
            },
            anyMem = {},
        }
        storage.forcePrefs[forceIndex] = forcePref
    end
    return forcePref
end

