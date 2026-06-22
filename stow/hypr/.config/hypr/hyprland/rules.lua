-- Window rules
-- Ignore maximize requests from apps
hl.window_rule({
  name = "suppress_maximize",
  match = { class = ".*" },
  suppress_event = "maximize"
})
-- Float rules
hl.window_rule({ match = { class = "org\\.gnome\\.FileRoller" }, float = true })
hl.window_rule({ match = { class = "file-roller" }, float = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true })
hl.window_rule({ match = { class = "system-config-printer" }, float = true })
hl.window_rule({ match = { class = "org\\.quickshell" }, float = true })
-- Dialog float rules
hl.window_rule({ match = { title = "(Select|Open)( a)? (File|Folder)(s)?" }, float = true })
hl.window_rule({ match = { title = "File (Operation|Upload)( Progress)?" }, float = true })
hl.window_rule({ match = { title = "Export Image (A|a)s" }, float = true })
hl.window_rule({ match = { title = "Export (A|a)s" }, float = true })
hl.window_rule({ match = { title = "Save (A|a)s" }, float = true })
-- Picture in Picture
-- Initial move so window doesn't shoot across the screen from the center
hl.window_rule({
  match = { title = "Picture(-| )in(-| )[Pp]icture" },
  float = true,
  keep_aspect_ratio = true,
  pin = true,
  move = { "monitor_w - window_w - (monitor_w * 0.02)", "monitor_h - window_h - (monitor_h * 0.03)" }
})
-- Xwayland popups
hl.window_rule({
  match = { xwayland = true, title = "win[0-9]+" },
  no_dim = true,
  no_shadow = true,
  rounding = 10
})
hl.window_rule({
  match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
  no_focus = true
})

-- Workspace assignment rules
hl.window_rule({ match = { class = "^(vesktop)$" }, workspace = "5" })
hl.window_rule({ match = { class = "^(Spotify)$" }, workspace = "5" })
hl.window_rule({ match = { class = "^(org\\.mozilla\\.Thunderbird)$" }, workspace = "6" })

-- Layer rules
hl.layer_rule({
  match = { namespace = "logout_dialog" },  -- wlogout
  animation = "fade"
})
hl.layer_rule({
  match = { namespace = "selection" },  -- slurp
  animation = "fade"
})
hl.layer_rule({
  match = { namespace = "wayfreeze" },
  animation = "fade"
})
-- Fuzzel
hl.layer_rule({
  match = { namespace = "launcher" },
  animation = "popin 80%",
  blur = true
})
-- Shell
hl.layer_rule({
  match = { namespace = "caelestia-(border-exclusion|area-picker)" },
  no_anim = true
})
hl.layer_rule({
  match = { namespace = "caelestia-(drawers|background)" },
  animation = "fade"
})
hl.layer_rule({
  match = { namespace = "caelestia-drawers" },
  blur = true,
  ignore_alpha = 0.57
})
