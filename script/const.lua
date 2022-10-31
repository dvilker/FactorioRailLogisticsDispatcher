---@alias ST_MODE [ST_MODE_*]
ST_MODE_OFF = 0
ST_MODE_BIDI = 3
ST_MODE_DEPOT = 4
ST_MODE_CLEAN = 5

---@type table<ST_MODE, ST_MODE>
ST_MODES = {
    [ST_MODE_OFF] = ST_MODE_OFF,
    [ST_MODE_BIDI] = ST_MODE_BIDI,
    [ST_MODE_DEPOT] = ST_MODE_DEPOT,
    [ST_MODE_CLEAN] = ST_MODE_CLEAN,
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

PROVIDE_COLOR = { 0xed, 0x6e, 0x6e, 0xFF }
REQUEST_COLOR = { 0x69, 0xad, 0xc1, 0xFF }


---- -@alias ST_ITEMMODE [ST_ITEMMODE_*]
--ST_ITEMMODE_AUTO = 0
--ST_ITEMMODE_REQUEST = 1
--ST_ITEMMODE_PROVIDE = 2
---- -@type table<ST_ITEMMODE, ST_ITEMMODE>
--ST_ITEMMODES = {
--    [ST_ITEMMODE_AUTO] = ST_ITEMMODE_AUTO,
--    [ST_ITEMMODE_REQUEST] = ST_ITEMMODE_REQUEST,
--    [ST_ITEMMODE_PROVIDE] = ST_ITEMMODE_PROVIDE,
--}


---@alias ST_STATE [ST_STATE_*]
ST_STATE_OFF = 0
ST_STATE_ERROR = 1
ST_STATE_DEPOT_FREE = 10
ST_STATE_DEPOT_AWAIT = 11
ST_STATE_DEPOT_OCCUPIED = 12
ST_STATE_CLEAN_FREE = 20
ST_STATE_CLEAN_AWAIT = 21
ST_STATE_CLEAN_OCCUPIED = 22
ST_STATE_DELIVERY_NO = 30
ST_STATE_DELIVERY_ACTIVE = 31
ST_STATE_DELIVERY_LOAD = 32
ST_STATE_DELIVERY_UNLOAD = 33
ST_STATE_DELIVERY_NO_PROVIDER = 40
ST_STATE_DELIVERY_NO_TRAIN = 41
---@type table<ST_STATE, { caption: string, signal: string, disp: string }>
ST_STATES = {
    [ST_STATE_OFF] = { caption = "Выключен", signal = "signal-grey", disp = "+"--[[empty]] },
    [ST_STATE_ERROR] = { caption = "Ошибка", signal = "signal-red", disp = "-"--[[Err]] },

    [ST_STATE_DEPOT_FREE] = { caption = "Свободное депо", signal = "signal-green", disp = "*" --[[white W]] },
    [ST_STATE_DEPOT_AWAIT] = { caption = "Депо ожидает поезд", signal = "signal-yellow", disp = "/" --[[yellow W]] },
    [ST_STATE_DEPOT_OCCUPIED] = { caption = "Поезд в депо", signal = "signal-cyan", disp = "|" --[[D]] },
    [ST_STATE_CLEAN_FREE] = { caption = "Свободные очистные", signal = "signal-green", disp = "*" --[[white W]] },
    [ST_STATE_CLEAN_AWAIT] = { caption = "Очистные ожидают поезд", signal = "signal-yellow", disp = "/" --[[yellow W]] },
    [ST_STATE_CLEAN_OCCUPIED] = { caption = "Поезд в очистных", signal = "signal-cyan", disp = "&" --[[CL]] },

    [ST_STATE_DELIVERY_NO] = { caption = "Ожидает", signal = "signal-green", disp = "*"--[[white W]] },
    [ST_STATE_DELIVERY_ACTIVE] = { caption = "Доставка", signal = "signal-yellow", disp = "/"--[[yellow W]] },
    [ST_STATE_DELIVERY_LOAD] = { caption = "Погрузка в поезд", signal = "signal-cyan", disp = "%"--[[L]] },
    [ST_STATE_DELIVERY_UNLOAD] = { caption = "Разгрузка поезда", signal = "signal-cyan", disp = "^"--[[U]] },
    [ST_STATE_DELIVERY_NO_PROVIDER] = { caption = "Нет предложения", signal = "signal-pink", disp = "<<"--[[NP]] },
    [ST_STATE_DELIVERY_NO_TRAIN] = { caption = "Нет подходящего поезда", signal = "signal-pink", disp = ">>"--[[NT]] },
}

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
--DISP_COLOR_ = "XOR"
