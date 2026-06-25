hl.config({
    general = {
        layout = "dwindle",

        allow_tearing = false,

        gaps_workspaces = 0,
        gaps_in = 7,
        gaps_out = 20,
        border_size = 3,

        col = {
		active_border = "rgba(" .. scheme.primary .. "e6)",
        	inactive_border = "rgba(" .. scheme.onSurfaceVariant .. "11)",
	},
    },

    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
    },

    misc = {
        vrr = 2,
        
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,

        disable_hyprland_logo = true,
        force_default_wallpaper = 0,

        on_focus_under_fullscreen = 2,
        allow_session_lock_restore = false,
        middle_click_paste = false,
        focus_on_activate = true,
        session_lock_xray = false,

        mouse_move_enables_dpms = false,
        key_press_enables_dpms = true,

        background_color = "rgb(" .. scheme.surfaceContainer .. ")",
    },
})
