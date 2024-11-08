function var_dump(var)
    return serpent.block(var, { nocode = true, sortkeys = false })
end

function var_line(var)
    return serpent.line(var, { nocode = true, sortkeys = false })
end

---@param holder {type: string|nil, name: string, quality: string|nil}
---@return TypeNameQuality
function toTypeNameQuality(holder)
    return toTypeNameQuality2(holder.type, holder.name, holder.quality)
end

---@return string|nil
---@return string
---@return string|nil
function toTypeNameQuality2(type, name, quality)
    type = type or "item"
    if quality and quality ~= defaultQuality then
        return type .. "=" .. name .. ",quality=" .. quality
    else
        return type .. "=" .. name
    end
end

---@param tnq TypeNameQuality
---@param forceQuality boolean
---@return SignalID|nil
function parseTypeNameQuality(tnq, forceQuality)
    local type, name = tnq:match("^([^=]+)=([^,]+)$")
    if type and name then
        return {
            type = type,
            name = name,
            quality = forceQuality and defaultQuality or nil,
        }
    end

    local quality
    type, name, quality = tnq:match("^([^=]+)=([^,]+),quality=(.+)$")
    if type and name then
        if not forceQuality and quality == defaultQuality then
            quality = nil
        end
        return {
            type = type,
            name = name,
            quality = quality,
        }
    end

    return nil
end

function toInt32Range(i)
    if i then
        if i < -2147483648 then
            i = -2147483648
        elseif i > 2147483647 then
            i = 2147483647
        end
    end
    return i
end

---@param str string
---@param def number @nullable
---@return number @nullable
---@overload fun (str: string): number|nil
function toPosNumber(str, def)
    local num = tonumber(str) or def
    if num then
        if num <= 0 then
            num = nil
        end
    end
    return num
end

function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function escape_pattern(s)
    local matches = {
        ["%"] = "%%",
        ["^"] = "%^",
        ["$"] = "%$",
        ["("] = "%(",
        [")"] = "%)",
        ["."] = "%.",
        ["["] = "%[",
        ["]"] = "%]",
        ["*"] = "%*",
        ["+"] = "%+",
        ["-"] = "%-",
        ["?"] = "%?",
        ["\0"] = "%z"
    }
    return s:gsub(".", matches)
end

---@generic K, V
---@param tbl table<K, V>
---@return V|nil
function first(tbl)
    return tbl[next(tbl)]
end

---@param disp DispClass
---@param tnq TypeNameQuality
---@return boolean @ true - added, not first in queue, false - first in queue
function rqAddToQueueIfNotFirst(disp, tnq)
    local requestQueues = disp.org.requestQueue[disp.settings.network]
    if not requestQueues then
        return false
    end
    local requestQueue = requestQueues[tnq]
    if not requestQueue then
        return false
    end
    if table_size(requestQueue.queuedDisps) == 0 or next(requestQueue.queuedDisps) == disp.uid then
        return false
    else
        requestQueue.queuedDisps[disp.uid] = disp
        return true
    end
end

---@param disp DispClass
---@param tnq TypeNameQuality
function rqAddToQueue(disp, tnq)
    local requestQueues = disp.org.requestQueue[disp.settings.network]
    if not requestQueues then
        requestQueues = {}
        disp.org.requestQueue[disp.settings.network] = requestQueues
    end
    local requestQueue = requestQueues[tnq]
    if not requestQueue then
        requestQueue = {
            queuedDisps = {}
        }
        requestQueues[tnq] = requestQueue
    end
    if not requestQueue.queuedDisps[disp.uid] then
        requestQueue.queuedDisps[disp.uid] = disp
    end
end

---@param disp DispClass
---@param tnq TypeNameQuality
function rqRemoveFromQueue(disp, tnq)
    local requestQueues = disp.org.requestQueue[disp.settings.network]
    if not requestQueues then
        return
    end
    local requestQueue = requestQueues[tnq]
    if not requestQueue then
        return
    end
    requestQueue.queuedDisps[disp.uid] = nil
end

---@param disp DispClass
function rqRemoveFromAllQueues(disp)
    for _, requestQueues in pairs(disp.org.requestQueue) do
        for _, requestQueue in pairs(requestQueues) do
            requestQueue.queuedDisps[disp.uid] = nil
        end
    end
end

---@param disp DispClass
---@param exceptTnqs table<TypeNameQuality, any>
function rqRemoveFromQueueExcept(disp, exceptTnqs)
    local requestQueues = disp.org.requestQueue[disp.settings.network]
    if not requestQueues then
        return
    end
    for tnq, requestQueue in pairs(requestQueues) do
        if not exceptTnqs[tnq] then
            requestQueue.queuedDisps[disp.uid] = nil
        end
    end
end

---@param disp DispClass
---@param tnq TypeNameQuality
---@param result table
---@return LocalisedString
function rqFormatQueue(disp, tnq, result)
    local requestQueues = disp.org.requestQueue[disp.settings.network]
    if not requestQueues then
        return { "viirld.RQ-no" }
    end
    local requestQueue = requestQueues[tnq]
    if not requestQueue or table_size(requestQueue.queuedDisps) == 0 then
        return { "viirld.RQ-no" }
    end
    local index = 1
    result = result or {}
    for _, qDisp in pairs(requestQueue.queuedDisps) do
        result[#result + 1] = { (disp == qDisp) and "viirld.RQ-line_me" or "viirld.RQ-line", index, qDisp.stopName }
        index = index + 1
    end
    return result
end

---@param a number[]|nil
---@param b number[]|nil
---@return number @ -1, 0 or 1
function compareNumberTuples(a, b)
    if a == nil and b == nil then
        return 0
    elseif a == nil or b == nil then
        return b == nil and 1 or -1
    end
    local index = 1
    while true do
        local aa = a[index]
        local bb = b[index]
        index = index + 1
        if aa == nil and bb == nil then
            return 0
        elseif aa == nil or bb == nil then
            return bb == nil and 1 or -1
        elseif aa ~= bb then
            return aa > bb and 1 or -1
        end
    end
end

---@param a number
---@return number
function sqr(a)
    return a * a
end

local wagonSimpleNames = {
    ["cargo-wagon"] = "G",
    ["fluid-wagon"] = "F",
}

---@param train LuaTrain
---@return TrainType, TrainTypeInfo
function getTrainType(train)
    local nameBuffer = {}
    for _, car in ipairs(train.carriages) do
        if car.type == "cargo-wagon" or car.type == "fluid-wagon" then
            local name = wagonSimpleNames[car.name] or car.name
            if #nameBuffer > 0 and nameBuffer[#nameBuffer] == name then
                local old = nameBuffer[#nameBuffer - 1]
                nameBuffer[#nameBuffer - 1] = (old == "") and 2 or (old + 1)
            else
                if #nameBuffer > 0 then
                    nameBuffer[#nameBuffer + 1] = "/"
                end
                nameBuffer[#nameBuffer + 1] = ""
                nameBuffer[#nameBuffer + 1] = name
            end
        end
    end
    local name = table.concat(nameBuffer)
    ---@type TrainTypeInfo
    local trainTypeInfo = storage.trainTypes[name]
    if not trainTypeInfo then
        trainTypeInfo = {
            typeName = name,
            carriages = {},
        }
        for _, car in pairs(train.carriages) do
            trainTypeInfo.carriages[#trainTypeInfo.carriages + 1] = car.name
        end
        refreshTrainTypeInfo(trainTypeInfo)
        storage.trainTypes[name] = trainTypeInfo
    end
    return name, trainTypeInfo
end

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

---@param dispErrors table<string, DispError>
---@param code string|TypeNameQuality
---@param text LocalisedString
---@param tt LocalisedString
---@return table<string, DispError>
function errorsAdd(dispErrors, code, text, tt)
    if not dispErrors then
        dispErrors = {}
    end
    local exists = dispErrors[code]
    if exists then
        exists.text = text
        exists.tt = tt
        exists._used = true
    else
        dispErrors[code] = {
            text = text,
            tt = tt,
            addTick = game.tick,
            _used = true,
        }
    end
    return dispErrors
end

---@param dispErrors table<string, DispError>
---@param code string|TypeNameQuality
function errorsSetUsedIfExists(dispErrors, code)
    if not dispErrors then
        return
    end
    local exists = dispErrors[code]
    if exists then
        exists._used = true
    end
end


---@param dispErrors table<string, DispError>
---@return table<string, DispError>
function errorsCommit(dispErrors)
    if not dispErrors then
        return nil
    end
    for code, err in pairs(dispErrors) do
        if err._used then
            err._used = nil
        else
            dispErrors[code] = nil
        end
    end
    if table_size(dispErrors) == 0 then
        dispErrors = nil
    end
    return dispErrors
end


---@param amount number
---@param appendSuffix boolean|nil
---@return string
function formatNumber(amount, appendSuffix)
    if math.abs(amount) < 0.0000001 then
        return "0" -- fix "-0"
    end
    return util.format_number(amount, appendSuffix)
end

---@param num number
---@return number
function round(num)
    if num >= 0 then
        return math.floor(num + 0.5)
    else
        return math.ceil(num - 0.5)
    end
end

---@param amount number
---@param appendSuffix boolean|nil
---@return string
function formatNumberInt(amount, appendSuffix)
    amount = round(amount)
    if math.abs(amount) < 0.0000001 then
        return "0" -- fix "-0"
    end
    return util.format_number(amount, appendSuffix)
end

---@param amount number
---@param appendSuffix boolean|nil
---@return string
function formatNumber100(amount, appendSuffix)
    amount = round(amount * 100) / 100
    if math.abs(amount) < 0.0000001 then
        return "0" -- fix "-0"
    end
    return util.format_number(amount, appendSuffix)
end

---@param disp DispClass
---@param trainTypeInfo TrainTypeInfo
---@return boolean
function isTrainRightSize(disp, trainTypeInfo)
    local min = disp.settings.minTrainLength
    local max = disp.settings.maxTrainLength
    return (not min or trainTypeInfo.length >= min) and (not max or trainTypeInfo.length <= max)
end