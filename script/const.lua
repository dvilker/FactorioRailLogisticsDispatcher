---@alias ST_MODE [ST_MODE_*]
ST_MODE_OFF = 0
ST_MODE_BIDI = 3
ST_MODE_DEPOT = 4
ST_MODE_CLEAN = 5
ST_MODE_FUEL = 6

---@type table<ST_MODE, ST_MODE>
ST_MODES = {
    [ST_MODE_OFF] = ST_MODE_OFF,
    [ST_MODE_BIDI] = ST_MODE_BIDI,
    [ST_MODE_DEPOT] = ST_MODE_DEPOT,
    [ST_MODE_CLEAN] = ST_MODE_CLEAN,
    [ST_MODE_FUEL] = ST_MODE_FUEL,
}

---@alias ST_OUT [ST_OUT_*]
ST_OUT_NEED_CONTENTS_NEG = 1
ST_OUT_NEED_CONTENTS_POS = 2
ST_OUT_EXCHANGE = 3

---@type table<ST_OUT, { caption: LocalisedString, tooltip: LocalisedString | nil }>
ST_OUTS = {
    [ST_OUT_NEED_CONTENTS_NEG] = { caption = "Выводить требуемое содержимое (−)", tooltip = "На выходном порту будет отображено требуемое для отправки содержимое поезда со знаком минус. Например, на станции снабжения будет отражен загружаемый груз (со знаком минус). А на станции запроса - пусто - в поезде ничего не должно оставаться." },
    [ST_OUT_NEED_CONTENTS_POS] = { caption = "Выводить требуемое содержимое (+)", tooltip = "На выходном порту будет отображено требуемое для отправки содержимое поезда. Например, на станции снабжения будет отражен загружаемый груз. А на станции запроса - пусто - в поезде ничего не должно оставаться." },
    [ST_OUT_EXCHANGE] = { caption = "Выводить требуемый обмен", tooltip = "На выходном порту будет отображен груз, который необходимо погрузить (>0) или выгрузить (<0) для отправки поезда. Например, на станции снабжения будет отражен загружаемый груз со знаком плюс. А на станции запроса - то же, но со знаком минус." },
}

PROVIDE_COLOR = { 0xed, 0x6e, 0x6e }
REQUEST_COLOR = { 0x69, 0xad, 0xc1 }
UNDER_MIN_COLOR = { 0xaa, 0xaa, 0xaa }

E_NO_PROVIDER = --[[---@type LocalisedString]] { "yatm-gui.no-provider" }
E_NO_MIN_PROVIDER = --[[---@type LocalisedString]] { "yatm-gui.no-min-provider" }
E_NO_TRAIN = --[[---@type LocalisedString]] { "yatm-gui.no-train" }

---@type string
ST_TAG = "yatm"

DISP_COLOR_OFF = --[[---@type string]]"*"
DISP_COLOR_BLUE = --[[---@type string]]"/"
DISP_COLOR_RED = --[[---@type string]]"+"
DISP_COLOR_GREEN = --[[---@type string]]"-"
DISP_COLOR_YELLOW = --[[---@type string]]"%"
DISP_COLOR_PINK = --[[---@type string]]"^"
DISP_COLOR_AQUA = --[[---@type string]]"<<"
DISP_COLOR_WHITE = --[[---@type string]]">>"
DISP_COLOR_GREEN_DARK = --[[---@type string]]"AND"
DISP_COLOR_YELLOW_DARK = --[[---@type string]]"OR"
DISP_COLOR_LIGHT_RED = --[[---@type string]]"XOR"
