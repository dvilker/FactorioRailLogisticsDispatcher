-- Restoring technology after some smart mods
if mods["pyindustry"] then
    local recipe = data.raw["recipe"]["viirld-dispatcher"]
    for i, ing in ipairs(recipe.ingredients) do
        if ing[1] == "advanced-circuit" then
            ing[1] = 'electronic-circuit'
        elseif ing.name == "advanced-circuit" then
            ing.name = 'electronic-circuit'
        end
    end
    local tech = data.raw["technology"]["viirld-dispatcher"]
    tech.unit = data.raw["technology"]["rail-signals"].unit
    tech.prerequisites = { "rail-signals" }
end
