local lib = require("lib")


local Public

Public.surface_conditions = {
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

--- @param planet LuaPlanet
--- @param surface_conditions SurfaceCondition 
--- @return boolean
function Public.add_surface(planet, surface_conditions)
    if planet and planet.valid then return false end

    lib.add(Public.surface_conditions, planet.name, surface_conditions)

    return true
end