# ✨ My .dotfiles

What | I use
-----|-----
System | CachyOS
Shell | fish
Terminal | Ghostty
File Manager | Yazi
Browser | Zen

## 🚀 Installation

### Packages

[rustup](https://wiki.archlinux.org/title/Rust)

```shell
sudo pacman -S rustup
rustup default stable
```

[yay](https://github.com/Jguer/yay)

```shell
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

[wl-clipboard](https://github.com/bugaevc/wl-clipboard)
[7zip](https://wiki.archlinux.org/title/7-Zip)
[ripgrip](https://github.com/BurntSushi/ripgrep)
[bat](https://github.com/sharkdp/bat?tab=readme-ov-file)
[fd](https://github.com/sharkdp/fd)
[fzf](https://github.com/junegunn/fzf)
[zoxide](https://github.com/ajeetdsouza/zoxide)
[yazi](https://yazi-rs.github.io/docs/installation)
[vesktop](https://vesktop.vencord.dev/install/linux/)
[gitui](https://github.com/gitui-org/gitui?tab=readme-ov-file#6--installation-top-)
[zen](https://aur.archlinux.org/packages/zen-browser-bin)
[spotify](https://wiki.archlinux.org/title/Spotify)

```shell
sudo pacman -S yazi wl-clipboard ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick bat gitui zen-browser-bin vesktop spotify-launcher
```

[spicetify](https://spicetify.app/docs/advanced-usage/installation)

```shell
# run spotify-launcher atleast once to install the current spotify version
spotify-launcher
```

```shell
yay -S spicetify-cli
```

### .dotfiles

create symlinks for the dotfiles using stow

```shell
sudo pacman -S stow
git clone https://github.com/SimBoi/dotfiles .dotfiles
cd .dotfiles
stow -t ~ */
```

enable spicetify

```shell
spicetify backup apply
```
