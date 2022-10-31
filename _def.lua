
---@shape RemovedSettings: DispSettings
---@field _tick number

---@shape global
---@field surObs table<SurUid, SurClass>
---@field disps table<DispUid, DispClass>
---@field activeStops table<StopUid, StopClass>
---@field stopKey SurUid
---@field guis table<number, DispGui>
---@field lastUid number
---@field removedSettings table<DispUid, RemovedSettings>
---@field minRemovedSettingsTick number @nullable

---@type global
global = global


util = {
    ---@type fun<T> (t: T): T
    copy = nil,
    ---@type fun (amount: number, append_suffix: boolean): string
    format_number = nil,
}
