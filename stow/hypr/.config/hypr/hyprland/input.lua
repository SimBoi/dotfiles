hl.config({
	input = {
		kb_layout = "us,ara,il",
		repeat_rate = 35,
		repeat_delay = 250,

		sensitivity = 0.0,
		accel_profile = "flat",

		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.3,
		},
	},
	binds = {
		scroll_event_delay = 0,
	},
})

hl.device({
	name = "asue140a:00-04f3:3134-touchpad",
	accel_profile = "adaptive",
})

hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace",
})

mainMod = "SUPER"
secondaryMod = "ALT"

function dsp_submap(submap)
	return function()
		hl.dispatch(hl.dsp.submap(submap))
		hl.exec_cmd('notify-send "' .. submap .. ' submap activated"')
	end
end

hl.define_submap("oh31", function()
	-- Clipboard
	hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard"))
	-- Screenshot
	hl.bind("Print", hl.dsp.global("caelestia:screenshotFreezeClip"))
	hl.bind(secondaryMod .. " + Print", hl.dsp.global("caelestia:screenshotFreeze"))
	-- Launcher
	hl.bind(mainMod .. " + N", hl.dsp.global("caelestia:launcher"))
	-- Window management
	hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("ghostty"))
	hl.bind(mainMod .. " + Q", hl.dsp.window.close())
	hl.bind(mainMod .. " + " .. secondaryMod .. " + Q", hl.dsp.window.kill())
	hl.bind(mainMod .. " + comma", hl.dsp.window.float({ action = "toggle" }))
	hl.bind(mainMod .. " + backspace", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
	-- Layout management
	hl.bind(mainMod .. " + period", hl.dsp.layout("togglesplit"))
	-- Focus Management
	hl.bind(mainMod .. " + R", hl.dsp.focus({ direction = "l"}))
	hl.bind(mainMod .. " + A", hl.dsp.focus({ direction = "r"}))
	hl.bind(mainMod .. " + E", hl.dsp.focus({ direction = "u"}))
	hl.bind(mainMod .. " + T", hl.dsp.focus({ direction = "d"}))
	-- Workspace management
	hl.bind(mainMod .. " + J", hl.dsp.focus({ workspace = 1}), { release = true })
	hl.bind(mainMod .. " + D", hl.dsp.focus({ workspace = 2}), { release = true })
	hl.bind(mainMod .. " + Y", hl.dsp.focus({ workspace = 3}), { release = true })
	hl.bind(mainMod .. " + L", hl.dsp.focus({ workspace = 4}), { release = true })
	hl.bind(mainMod .. " + B", hl.dsp.focus({ workspace = 5}), { release = true })
	hl.bind(mainMod .. " + J", hl.dsp.window.move({ workspace = 1 }), { long_press = true })
	hl.bind(mainMod .. " + D", hl.dsp.window.move({ workspace = 2 }), { long_press = true })
	hl.bind(mainMod .. " + Y", hl.dsp.window.move({ workspace = 3 }), { long_press = true })
	hl.bind(mainMod .. " + L", hl.dsp.window.move({ workspace = 4 }), { long_press = true })
	hl.bind(mainMod .. " + B", hl.dsp.window.move({ workspace = 5 }), { long_press = true })
	-- Tabs inside program
	hl.bind(mainMod .. " + C", hl.dsp.send_shortcut({ mods = "ALT", key = "1" }))
	hl.bind(mainMod .. " + S", hl.dsp.send_shortcut({ mods = "ALT", key = "2" }))
	hl.bind(mainMod .. " + I", hl.dsp.send_shortcut({ mods = "ALT", key = "3" }))
	hl.bind(mainMod .. " + O", hl.dsp.send_shortcut({ mods = "ALT", key = "4" }))
	hl.bind(mainMod .. " + F", hl.dsp.send_shortcut({ mods = "ALT", key = "5" }))
	hl.bind(mainMod .. " + Delete", hl.dsp.send_shortcut({ mods = "ALT", key = "6" }))
	-- TODO switch tabs inside programs

	hl.bind(mainMod .. " + SHIFT + SHIFT_L", dsp_submap("GenericKeyboard"), { release = true })
end)

hl.define_submap("GenericKeyboard", function()
	-- Clipboard
	hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard"))
	-- Screenshot
	hl.bind("Print", hl.dsp.global("caelestia:screenshotFreezeClip"))
	hl.bind(secondaryMod .. " + Print", hl.dsp.global("caelestia:screenshotFreeze"))
	-- Launcher
	hl.bind(mainMod .. " + R", hl.dsp.global("caelestia:launcher"))
	-- Window management
	hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("ghostty"))
	hl.bind(mainMod .. " + Q", hl.dsp.window.close())
	hl.bind(mainMod .. " + " .. secondaryMod .. " + Q", hl.dsp.window.kill())
	hl.bind(mainMod .. " + " .. secondaryMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
	hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
	-- Layout management
	hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit"))
	-- Workspace management
	hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1}), { release = true })
	hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2}), { release = true })
	hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3}), { release = true })
	hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4}), { release = true })
	hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5}), { release = true })
	hl.bind(mainMod .. " + 1", hl.dsp.window.move({ workspace = 1 }), { long_press = true })
	hl.bind(mainMod .. " + 2", hl.dsp.window.move({ workspace = 2 }), { long_press = true })
	hl.bind(mainMod .. " + 3", hl.dsp.window.move({ workspace = 3 }), { long_press = true })
	hl.bind(mainMod .. " + 4", hl.dsp.window.move({ workspace = 4 }), { long_press = true })
	hl.bind(mainMod .. " + 5", hl.dsp.window.move({ workspace = 5 }), { long_press = true })
	-- TODO switch tabs inside programs

	hl.bind(mainMod .. " + SHIFT + SHIFT_L", dsp_submap("oh31"), { release = true })
end)

-- G502 binds
hl.bind(mainMod .. " + equal", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard"), { submap_universal = true })
hl.bind(mainMod .. " + X", hl.dsp.window.close(), { submap_universal = true })
hl.bind(mainMod .. " + M", hl.dsp.window.drag(), { mouse = true, submap_universal = true })
hl.bind(mainMod .. " + G", hl.dsp.window.resize(), { mouse = true, submap_universal = true })
-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.global("caelestia:brightnessUp"), { submap_universal = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.global("caelestia:brightnessDown"), { submap_universal = true })
-- Media
hl.bind("XF86AudioPlay", hl.dsp.global("caelestia:mediaToggle"), { submap_universal = true })
hl.bind("XF86AudioPause", hl.dsp.global("caelestia:mediaToggle"), { submap_universal = true })
hl.bind("XF86AudioNext", hl.dsp.global("caelestia:mediaNext"), { submap_universal = true })
hl.bind("XF86AudioPrev", hl.dsp.global("caelestia:mediaPrev"), { submap_universal = true })
hl.bind("XF86AudioStop", hl.dsp.global("caelestia:mediaStop"), { submap_universal = true })
-- Volume
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { submap_universal = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { submap_universal = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%+"), { submap_universal = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"), { submap_universal = true })
-- TODO Cycle submaps

-- default to oh31 submap
hl.on("hyprland.start", function () 
	hl.dispatch(hl.dsp.submap("oh31"))
end)
