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
	accel_profiles = "adaptive",
})
