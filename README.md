![screenshots](https://github.com/SimBoi/dotfiles/blob/caelestia/screenshots/preview.png)

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

## 🚀 Installation

clone the repo

```shell
git clone https://github.com/SimBoi/dotfiles ~/.dotfiles
```

install packages

```shell
yay --answerclean n --answerdiff n --noconfirm
cd ~/.dotfiles/pkgbuilds/meta-simboi-de
makepkg -si
cd ~/.dotfiles/pkgbuilds/meta-simboi-dev
makepkg -si
cd ~/.dotfiles/pkgbuilds/meta-simboi-entertainment
makepkg -si
```

create symlinks for the dotfiles using stow

```shell
yay -S --answerclean n --answerdiff n --noconfirm stow
cd ~/.dotfiles/stow
stow -t ~ */
```

run spotify-launcher atleast once to install the current spotify version

```shell
spotify-launcher
```

spotify modding using spicetify

```shell
yay -Sy --answerclean n --answerdiff n --noconfirm spicetify-cli
spicetify backup apply
```

enable ssh server on startup for remote access

```shell
sudo systemctl enable sshd
sudo ufw allow ssh
```

### Manual Configuration

* zen
* betterbird
