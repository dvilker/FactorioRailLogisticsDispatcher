
PROVIDE_COLOR = { 0xed, 0x6e, 0x6e }
REQUEST_COLOR = { 0x69, 0xad, 0xc1 }
UNDER_MIN_COLOR = { 0xaa, 0xaa, 0xaa }

E_NO_PROVIDER = --[[---@type LocalisedString]] { "viirld2-gui.no-provider" }
E_NO_MIN_PROVIDER = --[[---@type LocalisedString]] { "viirld2-gui.no-min-provider" }
E_NO_TRAIN = --[[---@type LocalisedString]] { "viirld2-gui.no-train" }
E_LOW_PRIORITY = --[[---@type LocalisedString]] { "viirld2-gui.low-priority" }
E_IN_QUEUE = --[[---@type LocalisedString]] { "viirld2-gui.in-queue" }
E_NO_TRAIN_SLOTS = --[[---@type LocalisedString]] { "viirld2-gui.no-train-slots" }


---@type SignalID
SIG_DELIVERY_PAUSED = { type = "virtual", name = "viirld-delivery-pause" }

defaultQuality = "normal"

SIG_P = { type = "virtual", name = "signal-P", quality = defaultQuality }
SIG_R = { type = "virtual", name = "signal-R", quality = defaultQuality }
SIG_L = { type = "virtual", name = "signal-L", quality = defaultQuality }
SIG_C = { type = "virtual", name = "signal-C", quality = defaultQuality }
SIG_F = { type = "virtual", name = "signal-F", quality = defaultQuality }
SIG_E = { type = "virtual", name = "signal-E", quality = defaultQuality }
SIG_D = { type = "virtual", name = "signal-D", quality = defaultQuality }


---@type string
TAG = "viirld"


COMBINATOR_COLOR_OFF = ">"
COMBINATOR_COLOR_RED = "<"
COMBINATOR_COLOR_WHITE = "="
COMBINATOR_COLOR_GREEN = "≥"
COMBINATOR_COLOR_AQUA = "≤"
COMBINATOR_COLOR_YELLOW = "≠"

COLOR_AQUA = { r = 0, g = 1, b = 1 }
COLOR_YELLOW = { r = 1, g = 1, b = 0 }
COLOR_GREEN = { r = 0, g = 1, b = 0 }
COLOR_RED = { r = 1, g = 0, b = 0 }
COLOR_LIGHT_RED = { r = 1, g = .25, b = .25 }
COLOR_ORANGE = { r = 1, g = .6, b = 0 }
COLOR_GREEN_DARK = { r = 0, g = .5, b = 0 }
COLOR_WHITE = { r = 1, g = 1, b = 1 }

COLOR_DARK_RED = { r = .25, g = 0, b = 0, a = .05 }
COLOR_DARK_GREEN = { r = 0, g = .25, b = 0, a = .05 }

COLOR_OFF = 0
color = "#ffaaff"

--train_state_string = {
--    --- Braking before a rail signal.
--    [defines.train_state.arrive_signal] = "arrive_signal",
--    --- Braking before a station.
--    [defines.train_state.arrive_station] = "arrive_station",
--    --- Same as no_path but all candidate train stops are full
--    [defines.train_state.destination_full] = "destination_full",
--    --- Can move if user explicitly sits in and rides the train.
--    [defines.train_state.manual_control] = "manual_control",
--    --- Switched to manual control and has to stop.
--    [defines.train_state.manual_control_stop] = "manual_control_stop",
--    --- Has no path and is stopped.
--    [defines.train_state.no_path] = "no_path",
--    --- Doesn't have anywhere to go.
--    [defines.train_state.no_schedule] = "no_schedule",
--    --- Normal state -- following the path.
--    [defines.train_state.on_the_path] = "on_the_path",
--    --- Waiting at a signal.
--    [defines.train_state.wait_signal] = "wait_signal",
--    --- Waiting at a station.
--    [defines.train_state.wait_station] = "wait_station",
--}
