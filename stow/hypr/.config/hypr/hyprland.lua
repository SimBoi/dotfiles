-- local open = io.open
-- local file = open("~/.dotfiles/MODE", "rb")
-- if not file then return nil end
-- local jsonString = file:read "*a"
-- file:close()
-- local json = require("dkjson")
-- local mode = json.decode(jsonString, 1, nil)

-- externally managed by other apps
require("monitors")
require("workspaces")

-- default monitor conf
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

require("./hyprland/env")
require("./hyprland/general")
require("./hyprland/input")
require("./hyprland/decoration")
require("./hyprland/execs")
require("./hyprland/rules")
