# ✨ My .dotfiles

What | I use
-----|-----
System | CachyOS
Window Manager | Hyprland
Shell | fish
Terminal | Ghostty
File Manager | Yazi
Browser | Zen

### Packages

This assumes a working installation of CachyOS with all the default packages + from Hyprlands section:
* hyprland
* xdg-desktop-portal-hyprland
* sddm
* xorg-xwayland
* wl-clipboard

CLI Tools:

* [yay](https://github.com/Jguer/yay): AUR helper
* [ripgrip](https://github.com/BurntSushi/ripgrep): better grip
* [bat](https://github.com/sharkdp/bat?tab=readme-ov-file): better cat
* [fd](https://github.com/sharkdp/fd): better find
* [fzf](https://github.com/junegunn/fzf): fuzzy finder
* [zoxide](https://github.com/ajeetdsouza/zoxide): better cd
* [playerctl](https://github.com/altdesktop/playerctl): control media players
* [wl-clip-persist](): persist clipboard after app exits
* [cliphist](): clipboard history

TUI Apps:

* [yazi](https://yazi-rs.github.io/docs/installation): tui file manager
* [lazygit](https://github.com/jesseduffield/lazygit): git tui

GUI Apps:

* [ghostty](https://ghostty.org/docs/install/binary#linux-(official)): terminal emulator
* [vs code](https://aur.archlinux.org/packages/visual-studio-code-bin): code editor
* [unity hub](https://aur.archlinux.org/packages/unityhub): game engine
* [bitwarden](https://archlinux.org/packages/extra/x86_64/bitwarden/): password manager
* [vesktop](https://vesktop.vencord.dev/install/linux/): modded discord
* [zen](https://aur.archlinux.org/packages/zen-browser-bin): browser
* [spotify](https://wiki.archlinux.org/title/Spotify): music
* [spicetify](https://spicetify.app/docs/advanced-usage/installation): spotify modding
* [helvum](https://github.com/relulz/helvum): patchbay for pipewire
* [kolourpaint](https://apps.kde.org/kolourpaint/): basic paint
* [gimp](): advanced paint
* [loupe](https://apps.gnome.org/Loupe/): image viewer
* [nwg-look](https://github.com/nwg-piotr/nwg-look): gtk ricing
* qt5ct + qt6ct + kvantum: qt ricing
* [wf-osk](https://github.com/WayfireWM/wf-osk): on-screen keyboard
* [gnome-disk-utility](https://apps.gnome.org/DiskUtility/): disk and partition management
* [clapper](https://github.com/Rafostar/clapper?tab=readme-ov-file): video player
* [stremio](): media streaming
* [jellyfin-media-player](): self-hosted media streaming
* [valent](https://aur.archlinux.org/valent-git.git): gtk implementation of kde connect without the million kde dependencies
* [betterbird](https://aur.archlinux.org/packages/betterbird-bin/): mail client

DE (Hyprland):

* [xdg-desktop-portal-gtk](https://wiki.hypr.land/Hypr-Ecosystem/xdg-desktop-portal-hyprland/): fallback for xdg-desktop-portal-hyprland
* [hyprpolkitagent](): gui authentication handler
* [hyprlock](https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/): lock screen
* [hypridle](https://wiki.hypr.land/Hypr-Ecosystem/hypridle/): lock/suspend on idle
* [hyprpanel](https://hyprpanel.com/getting_started/hyprpanel.html): top bar, notifications, osd, and more
* hyprpanel optional: python-gpustat pywal pacman-contrib grimblast wf-recorder hyprsunset btop matugen swww

## 🚀 Installation

```shell
# rustup for compiling rust applications
sudo pacman -Sy rustup
rustup default stable
```

```shell
# yay for installing AUR packages
sudo pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -r yay
```

### .dotfiles

create symlinks for the dotfiles using stow

```shell
yay -Sy stow
git clone https://github.com/SimBoi/dotfiles ~/.dotfiles
cd ~/.dotfiles
stow -t ~ */
```

### Packages

```shell
yay -Sy ghostty visual-studio-code-bin unityhub bitwarden yazi wl-clipboard ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick bat lazygit zen-browser-bin vesktop spotify-launcher helvum playerctl kolourpaint loupe nwg-look qt5ct qt5-wayland qt6ct qt6-wayland kvantum wf-osk xdg-desktop-portal-gtk hyprpolkitagent hyprlock hypridle ags-hyprpanel-git gnome-disk-utility clapper stremio jellyfin-media-player valent-git betterbird-bin
yay -Sy --needed python-gpustat pywal pacman-contrib grimblast wf-recorder hyprsunset btop matugen swww
```

```shell
# run spotify-launcher atleast once to install the current spotify version
spotify-launcher
```

```shell
# spotify modding using spicetify
yay -Sy spicetify-cli
spicetify backup apply
```

enable ssh server on startup for remote access

```shell
sudo systemctl enable sshd
sudo ufw allow ssh
```

### Manual Configuration

* zen
* vesktop
* betterbird