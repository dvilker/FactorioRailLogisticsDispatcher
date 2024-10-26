--[[DEBUG_BEGIN]]
if script.active_mods["gvv"] then
    require("__gvv__.gvv")()
end
--[[DEBUG_END]]

if settings.startup["viirld-version"].value == 'v1' then
    require "v1.control"
else
    require "v2.control"
end
