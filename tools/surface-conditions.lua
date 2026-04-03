local lib = require("lib")


local Local

--- @private
Local.surface_conditions = { -- Нужно будет переделать для нескольких условий
    nauvis = {
        property = "pressure",
        min = 1000,
        max = 1000,
    },
    vulcanus = {
        property = "pressure",
        min = 4000,
        max = 4000,
    },
    gleba = {
        property = "pressure",
        min = 2000,
        max = 2000,
    },
    fulgora = {
        property = "magnetic-field",
        min = 99,
    },
    aquilo = {
        property = "pressure",
        min = 300,
        max = 300,
    },
    space = {
        property = "gravity",
        min = 0,
        max = 0,
    }
}


local Public

--- @param planet LuaPlanet
--- @param surface_conditions SurfaceCondition 
--- @return boolean
function Public.add_surface(planet, surface_conditions)
    if planet and planet.valid then return false end

    if not Local.surface_conditions[planet.name] then return false end

    lib.add(Local.surface_conditions, planet.name, surface_conditions)

    return true
end

--- @param planet LuaPlanet
--- @return boolean
function Public.delete_surface(planet)
    if planet and planet.valid then return false end

    if Local.surface_conditions[planet.name] then return false end

    lib.delete(Local.surface_conditions, planet.name)

    return true
end

--- @param planet LuaPlanet
--- @return SurfaceCondition|false
function Public.read_table_surface(planet)
    if planet and planet.valid then return false end

    if not Local.surface_conditions[planet.name] then return false end

    return Local.surface_conditions[planet.name]
end

--- @param planet LuaPlanet
--- @param surface_conditions SurfaceCondition 
--- @return SurfaceCondition|false
function Public.edit_table_surface(planet, surface_conditions)
    if planet and planet.valid then return false end

    if not Local.surface_conditions[planet.name] then return false end

    Local.surface_conditions[planet.name] = surface_conditions

    return Local.surface_conditions[planet.name]
end

return Public