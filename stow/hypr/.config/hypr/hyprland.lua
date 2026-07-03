-- allow loading lua packages
local ver = _VERSION:match("(%d+%.%d+)")
package.path = package.path
    .. ";/usr/share/lua/" .. ver .. "/?.lua"
    .. ";/usr/share/lua/" .. ver .. "/?/init.lua"

local modeFile = io.open("/home/sim/.dotfiles/MODE", "rb")
local modeJson = modeFile:read("*a")
modeFile:close()
local json = __require("dkjson")
mode = json.decode(modeJson, 1, nil)

-- externally managed by other apps
require("monitors")
require("workspaces")
scheme = require("scheme.current")

-- default monitor conf
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

require("hyprland.env")
require("hyprland.general")
require("hyprland.input")
require("hyprland.decoration")
require("hyprland.execs")
require("hyprland.rules")
