-- Lighthouse Lamp Mod v0.1.0 - Night-Only Rotating Beam
local mod_name = "lighthouse_lamp"

minetest.register_node(mod_name .. ":lamp", {
    description = "Lighthouse Lamp",
    drawtype = "normal",
    tiles = {
        "default_mese_block.png^[multiply:#ffffff",
        "default_mese_block.png^[multiply:#ffffff",
        "default_mese_block.png^[multiply:#ffffff",
        "default_mese_block.png^[multiply:#ffffff",
        "default_mese_block.png^[multiply:#ffdd00",
        "default_mese_block.png^[multiply:#ffdd00"
    },
    paramtype2 = "facedir",
    groups = {cracky=3, oddly_breakable_by_hand=3},
    light_source = 14,
    drop = mod_name .. ":lamp",

    after_place_node = function(pos)
        minetest.get_node_timer(pos):start(0.05)
    end,

    on_timer = function(pos, elapsed)
        --  NIGHT CHECK
        -- Time ranges: 0.0=sunrise, 0.25=noon, 0.5=sunset, 0.75=midnight, 1.0=sunrise
        local tod = minetest.get_timeofday()
        local is_night = (tod >= 0.75 or tod <= 0.25)

        if not is_night then
            return true -- ☀️ Daytime: skip particles, keep timer alive
        end

        --  NIGHTTIME: Rotate & spawn beam
        local meta = minetest.get_meta(pos)
        local angle = meta:get_int("angle") or 0

        angle = angle + 5 -- Rotation speed (increase for faster sweep)

        local rad = math.rad(angle)
        local dir_x = math.cos(rad)
        local dir_z = math.sin(rad)

        minetest.add_particlespawner({
            amount = 50,
            time = 0.1,
            minpos = vector.add(pos, {x=0.5, y=0.6, z=0.5}),
            maxpos = vector.add(pos, {x=0.5, y=0.6, z=0.5}),
            minvel = {x=dir_x*80, y=0, z=dir_z*80},
            maxvel = {x=dir_x*120, y=0, z=dir_z*120},
            minacc = {x=0, y=0, z=0},
            maxacc = {x=0, y=0, z=0},
            minexptime = 3,
            maxexptime = 5,
            minsize = 15,
            maxsize = 20,
            texture = "default_mese_block.png^[colorize:#ffff00:255",
            glow = 14,
            playername = nil,
        })

        meta:set_int("angle", angle)
        return true
    end,
})

minetest.register_craft({
    output = mod_name .. ":lamp 2",
    recipe = {
        {"default:mese_block", "default:torch", "default:mese_block"},
        {"default:glass", "default:torch", "default:glass"},
        {"default:stone", "default:stone", "default:stone"},
    }
})