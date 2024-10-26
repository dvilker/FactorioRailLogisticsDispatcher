---@shape storage
---@field activeDisps table<DispUid, DispClass>
---@field disps table<number, DispClass>
---@field dispKey DispUid @for iteration in globalTick
---@field lastUid number
---@field nets table<ForceIndex, table<SurfaceIndex, NetClass>>
---@field mem table<number, table>
---@field movers table<MoverUid, MoverClass>
---@field deliveries table<DeliveryUid, DeliveryClass>
---@field guiNextUid number
---@field guiModels table<GuiUid, GuiModel|GuiHandlerModel>
---@field guiIndex table<GuiKey, table<PlayerIndex, GuiModel>>
---@field playerPrefs table<number, table>

function globalInit()
    storage.nets = storage.nets or {}
    storage.activeDisps = storage.activeDisps or {}
    storage.disps = storage.disps or {}
    storage.lastUid = storage.lastUid or 100
    storage.mem = storage.mem or {}
    storage.playerPrefs = storage.playerPrefs or {}
    storage.movers = storage.movers or {}
    storage.deliveries = storage.deliveries or {}

    storage.guiNextUid = 100
    storage.guiModels = {}
    storage.guiIndex = {}
end

function globalRestoreClasses()
    for fi, surfaces in pairs(storage.nets) do
        for si, net in pairs(surfaces) do
            log("RESTORED CLASS NET: " .. net.surface.index .. " / "..net.title)
            restoreClass(net)
        end
    end
    for _, disp in pairs(storage.disps) do
        restoreClass(disp)
    end
    for _, model in pairs(storage.guiModels) do
        restoreClass(model.self)
    end
end

---@param disp DispClass
function globalAddDisp(disp)
    --[[DEBUG_BEGIN]]
    if storage.disps[disp.uid] then
        error("Disp already added")
    end
    --[[DEBUG_END]]
    storage.disps[disp.uid] = disp
end


---@param disp DispClass
function globalRemoveDisp(disp)
    --[[DEBUG_BEGIN]]
    if not storage.disps[disp.uid] then
        error("There is no disp added")
    end
    --[[DEBUG_END]]
    globalSetDispActive(disp, false)
    storage.disps[disp.uid] = nil
    --[[DEBUG_BEGIN]]
    for k, d in pairs(storage.disps) do
        if d.uid == disp.uid then
            error("Removing disp with exists links")
            -- storage.disps[k] = nil
        end
    end
    --[[DEBUG_END]]
end

---@param disp DispClass
---@param entityNumber number
function globalLinkDispEntity(disp, entityNumber)
    --[[DEBUG]]log("Link disp " .. tostring(disp.uid) .. " to " .. tostring(entityNumber))
    --[[DEBUG_BEGIN]]
    if not storage.disps[disp.uid] then
        error("There is no disp added")
    end
    if storage.disps[entityNumber] then
        error("Entity already linked")
    end
    --[[DEBUG_END]]
    storage.disps[entityNumber] = disp
end

---@param disp DispClass
---@param entityNumber number
function globalUnLinkDispEntity(disp, entityNumber)
    --[[DEBUG]]log("Unlink disp " .. tostring(disp.uid) .. " from " .. tostring(entityNumber))
    --[[DEBUG_BEGIN]]
    if storage.disps[entityNumber] ~= disp then
        error("Entity is no linked to this entity")
    end
    --[[DEBUG_END]]
    storage.disps[entityNumber] = nil
end


---@param entityUnitNumber number
---@return DispClass @nullable
function globalDispByEntity(entityUnitNumber)
    return storage.disps[entityUnitNumber]
end

---@param entityUnitNumber number
---@return NetClass @nullable
function globalNetByEntity(entityUnitNumber)
    local disp = globalDispByEntity(entityUnitNumber)
    return disp and disp.net or nil
end


---@param force ForceIndex
---@param surface SurfaceIndex
---@return NetClass
function globalGetOrAddNet(force, surface)
    local f = storage.nets[force]
    if not f then
        f = {}
        storage.nets[force] = f
    end
    local net = f[surface]
    if not net then
        net = NetClass:new(force, surface)
        f[surface] = net
    end
    return net
end

---@param force ForceIndex
---@param surface SurfaceIndex
---@return NetClass @nullable
function globalGetNet(force, surface)
    return storage.nets[force] and storage.nets[force][surface]
end

---@param force ForceIndex
---@param surface SurfaceIndex
function globalRemoveNet(force, surface)
    if not storage.nets[force] then
        error("There is no force for remove net")
    end
    if not storage.nets[force][surface] then
        error("There is no surface for remove net")
    end
    storage.nets[surface][force] = nil
    if table_size(storage.nets[force]) == 0 then
        storage.nets[force] = nil
    end
end


---@return number
function globalGenUid()
    storage.lastUid = storage.lastUid + 1
    return storage.lastUid
end

---@type table<DispUid, DispClass>
local nextTickUpdates = {}

---@param disp DispClass
function globalUpdateNextTick(disp)
    disp._globalUpdateNextTick = game.tick
    nextTickUpdates[disp.uid] = disp
end


function globalTick()
    if nextTickCb then -- todo remove
        nextTickCb()
        nextTickCb = nil
    end
    if table_size(nextTickUpdates) > 0 then
        for uid, disp in pairs(nextTickUpdates) do
            if game.tick > disp._globalUpdateNextTick then
                disp._globalUpdateNextTick = nil
                if storage.activeDisps[uid] then
                    disp:update(true)
                end
                nextTickUpdates[uid] = nil
            end
        end
    end
    local i = math.max(math.min(table_size(storage.activeDisps), 1), 32)
    local tick = game.tick
    while i > 0 do
        i = i - 1
        storage.dispKey = next(storage.activeDisps, storage.dispKey and storage.activeDisps[storage.dispKey] and storage.dispKey)
        if storage.dispKey then
            local disp = storage.activeDisps[storage.dispKey]
            if disp.lastUpdateTick and tick - disp.lastUpdateTick > 60 then
                i = i - disp:update(true)
                if disp.mode == MODE_BIDI then
                    break
                end
            end
        end
    end
end

function globalUpdateTimer()
    script.on_nth_tick(nil)
    if storage.activeDisps and table_size(storage.activeDisps) > 0 then
        script.on_nth_tick(updateTicks, globalTick)
    end
end

---@param disp DispClass
---@param active boolean
function globalSetDispActive(disp, active)
    if active then
        if not storage.activeDisps[disp.uid] then
            storage.activeDisps[disp.uid] = disp
            globalUpdateTimer()
        end
    else
        if storage.activeDisps[disp.uid] then
            storage.activeDisps[disp.uid] = nil
            globalUpdateTimer()
        end
    end
end
