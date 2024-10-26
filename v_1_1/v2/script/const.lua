---@alias MODE [MODE_*]
MODE_OFF = 0
MODE_BIDI = 1
MODE_DEPOT = 2
MODE_CLEAN = 4
MODE_INFO = 5
MODE_MASK = 0x7 -- 000111

---@type table<MODE, LocalisedString>
modeNames = {
    [MODE_OFF] = "Выключена",
    [MODE_BIDI] = "Грузовая",
    [MODE_DEPOT] = "Депо",
    [MODE_CLEAN] = "Очистка",
    [MODE_INFO] = "Инфо",
}

---@alias OUT [OUT_*]
OUT_OFF = 0
OUT_NEED_CONTENTS_NEG = 8
OUT_NEED_CONTENTS_POS = 16
OUT_EXCHANGE = 24
OUT_MASK = 0x38 -- 111000

---@alias FLAG [FLAG_*]
FLAG_AUTO_ITEMS = 0x40
FLAG_AUTO_FLUID = 0x80
FLAG_USE_SIGNALS = 0x100
FLAG_USE_EQUALS = 0x200
FLAG_TAMP = 0x400
FLAG_TURN_INSERTERS = 0x800
FLAG_COMPOUNDS = 0x1000
FLAG_AUTO_ITEMS_NO_PROVIDE = 0x2000
FLAG_AUTO_FLUID_NO_PROVIDE = 0x4000
FLAG_LIQUIDATION = 0x8000


---@class CaptionAndTooltip
---@field caption LocalisedString
---@field tooltip LocalisedString


---@type table<MODE, MODE>
MODES = {
    [MODE_OFF] = MODE_OFF,
    [MODE_BIDI] = MODE_BIDI,
    [MODE_DEPOT] = MODE_DEPOT,
    [MODE_CLEAN] = MODE_CLEAN,
    [MODE_INFO] = MODE_INFO,
}
---@type table<OUT, OUT>
OUTS = {
    [OUT_OFF] = OUT_OFF,
    [OUT_NEED_CONTENTS_NEG] = OUT_NEED_CONTENTS_NEG,
    [OUT_NEED_CONTENTS_POS] = OUT_NEED_CONTENTS_POS,
    [OUT_EXCHANGE] = OUT_EXCHANGE,
}

PROVIDE_COLOR = { 0xed, 0x6e, 0x6e }
REQUEST_COLOR = { 0x69, 0xad, 0xc1 }
UNDER_MIN_COLOR = { 0xaa, 0xaa, 0xaa }

E_NO_PROVIDER = --[[---@type LocalisedString]] { "viirld2-gui.no-provider" }
E_NO_MIN_PROVIDER = --[[---@type LocalisedString]] { "viirld2-gui.no-min-provider" }
E_NO_TRAIN = --[[---@type LocalisedString]] { "viirld2-gui.no-train" }
E_LOW_PRIORITY = --[[---@type LocalisedString]] { "viirld2-gui.low-priority" }
E_IN_QUEUE = --[[---@type LocalisedString]] { "viirld2-gui.in-queue" }
E_NO_TRAIN_SLOTS = --[[---@type LocalisedString]] { "viirld2-gui.no-train-slots" }

---@type string
TAG = "viirld"

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
