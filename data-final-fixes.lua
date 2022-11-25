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

if mods["nullius"] then
    -- Place dispatcher in the same subgroup as the regular train stop
    data.raw["recipe"]["viirld-dispatcher"].subgroup = data.raw["train-stop"]["train-stop"].subgroup
    data.raw["item"]["viirld-dispatcher"].subgroup = data.raw["item"]["train-stop"].subgroup
end