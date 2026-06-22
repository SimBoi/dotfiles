local scheme = require("scheme.current")

hl.config({
    decoration = {
        active_opacity = 1.0,
        inactive_opacity = 0.95,
        rounding = 10,

        blur = {
            enabled = true,
            xray = false,
            ignore_opacity = true,
            new_optimizations = true,
            popups = true,
            input_methods = true,
            size = 8,
            passes = 3,
            vibrancy = 0.3,
        },

        shadow = {
            enabled = true,
            range = 20,
            render_power = 3,
            color = "rgba(" .. scheme.surface .. "d4)",
        },
    },
    
    animations = {     
		enabled = true,
	},
})

hl.curve( "emphasizedAccel", { type = "bezier", points = { {0.3, 0}, {0.8, 0.15} } })
hl.curve( "emphasizedDecel", { type = "bezier", points = { {0.05, 0.7}, {0.1, 1} } })
hl.curve( "standard", { type = "bezier", points = { {0.2, 0}, {0, 1} } })

hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "emphasizedDecel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 4, bezier = "emphasizedAccel", style = "slide" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 5, bezier = "standard" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "emphasizedAccel" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "standard" })
hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "standard" })
