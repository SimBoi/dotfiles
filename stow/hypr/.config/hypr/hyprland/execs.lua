hl.on("hyprland.start", function () 
	-- Auth
	hl.exec_cmd("/usr/lib/polkit-gnomme/polkit-gnome/authentication-agent-1")

	-- Auto mount removable media
	hl.exec_cmd("udiskie")

	-- Clipboard
	hl.exec_cmd("wl-clip-persist --clipboard regular")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Cursors
	hl.exec_cmd("hyprctl setcursor sweet-cursors 24")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'sweet-cursors'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")

	-- Forward bluetooth media commands to MPRIS
	hl.exec_cmd("mpris-proxy")

	-- Resize and move wundows based on matches
	hl.exec_cmd("caelestia resizer -d")

	-- Start shell
	hl.exec_cmd("sleep 1 && caelestia shell -d")
	
	-- Sync with other devices
	hl.exec_cmd("sleep 2 && kdeconnect-indicator")

	if mode.autoStart then
		hl.exec_cmd("sleep 2 && vesktop --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy")
		hl.exec_cmd("sleep 2 && spotify-launcher")
		hl.exec_cmd("sleep 2 && thunderbird")
		hl.exec_cmd("sleep 2 && steam -silent")
		hl.exec_cmd("sleep 2 && heroic")
	end
end)
