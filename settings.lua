data:extend({
  {
    type = "int-setting",
    name = "viirld-minEnergyUseTrainMJ",
    order = "ab",
    setting_type = "runtime-global",
    default_value = 100,
    minimum_value = 10,
  },
  {
    type = "bool-setting",
    name = "viirld-correctScheduleAtProvider",
    order = "ad",
    setting_type = "runtime-global",
    default_value = true
  },
  {
    type = "bool-setting",
    name = "viirld-countingInsertersContent",
    order = "ae",
    setting_type = "runtime-global",
    default_value = true
  },
  {
    type = "int-setting",
    name = "viirld-updateTicks",
    order = "af",
    setting_type = "runtime-global",
    default_value = 2,
    minimum_value = 1,
    maximum_value = 120,
  },
  {
    type = "bool-setting",
    name = "viirld-use-hack-to-save-interrupts",
    order = "ag",
    setting_type = "runtime-global",
    default_value = true
  },
  {
    type = "bool-setting",
    name = "viirld-debug",
    order = "az",
    setting_type = "runtime-global",
    default_value = false
  },
})
