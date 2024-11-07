
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
