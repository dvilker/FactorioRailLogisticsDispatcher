
data:extend({
  {
    type = "int-setting",
    name = "yatm-dispatcherSignalSlotCount",
    order = "aa",
    setting_type = "startup",
    default_value = 30,
    minimum_value = 10,
    maximum_value = 60,
  },
  {
    type = "int-setting",
    name = "yatm-minEnergyUseTrain",
    order = "ab",
    setting_type = "runtime-global",
    default_value = 100,
    minimum_value = 10,
  },
  {
    type = "int-setting",
    name = "yatm-fuelScheduleTime",
    order = "ac",
    setting_type = "runtime-global",
    default_value = 120,
    minimum_value = 0,
  },
  {
    type = "bool-setting",
    name = "yatm-correctScheduleBeforeProvider",
    order = "ad",
    setting_type = "runtime-global",
    default_value = true
  },
  {
    type = "bool-setting",
    name = "yatm-correctScheduleAndAtProvider",
    order = "ae",
    setting_type = "runtime-global",
    default_value = true
  },
  {
    type = "bool-setting",
    name = "yatm-countingInsertersContent",
    order = "af",
    setting_type = "runtime-global",
    default_value = true
  },
  {
    type = "int-setting",
    name = "yatm-updateTicks",
    order = "ag",
    setting_type = "runtime-global",
    default_value = 2,
    minimum_value = 1,
    maximum_value = 120,
  },
})
