
---@shape RemovedSettings: DispSettings
---@field _tick number

---@alias Network number
---@alias SurfaceIndex number
---@alias ForceIndex number
---@alias PlayerIndex number

---@type storage
storage = storage


util = {
    ---@type fun<T> (t: T): T
    copy = nil,
    ---@type fun (amount: number, append_suffix: boolean): string
    format_number = nil,
}
