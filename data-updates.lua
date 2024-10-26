if settings.startup["viirld-version"].value == 'v1' then
    require "v1.data-updates"
else
    require "v2.data-updates"
end
