data:extend({
  {
    type = "string-setting",
    name = "viirld-version",
    order = "aa",
    setting_type = "startup",
    default_value = 'v1',
    allowed_values = {'v1', 'v2'},
  },
  {
    type = "int-setting",
    name = "viirld-dispatcherSignalSlotCount",
    order = "aa",
    setting_type = "startup",
    default_value = 30,
    minimum_value = 10,
    maximum_value = 60,
  },
  {
    type = "int-setting",
    name = "viirld-minEnergyUseTrain",
    order = "ab",
    setting_type = "runtime-global",
    default_value = 100,
    minimum_value = 10,
  },
  {
    type = "int-setting",
    name = "viirld-fuelScheduleTime",
    order = "ac",
    setting_type = "runtime-global",
    default_value = 120,
    minimum_value = 0,
  },
  {
    type = "bool-setting",
    name = "viirld-correctScheduleBeforeProvider",
    order = "ad",
    setting_type = "runtime-global",
    default_value = true
  },
  {
    type = "bool-setting",
    name = "viirld-correctScheduleAndAtProvider",
    order = "ae",
    setting_type = "runtime-global",
    default_value = true
  },
  {
    type = "bool-setting",
    name = "viirld-countingInsertersContent",
    order = "af",
    setting_type = "runtime-global",
    default_value = true
  },
  {
    type = "int-setting",
    name = "viirld-updateTicks",
    order = "ag",
    setting_type = "runtime-global",
    default_value = 2,
    minimum_value = 1,
    maximum_value = 120,
  },
})
