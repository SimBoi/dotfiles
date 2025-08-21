# ✨ My .dotfiles

What | I use
-----|-----
System | CachyOS
Shell | fish
Terminal | Ghostty
File Manager | Yazi
Browser | Zen

## 🚀 Installation

This assumes a working installation of CachyOS + Hyprland with all the default packages that come with it.

### Packages

CLI Tools:

* [yay](https://github.com/Jguer/yay) - AUR helper
* [ripgrip](https://github.com/BurntSushi/ripgrep) - better grip
* [bat](https://github.com/sharkdp/bat?tab=readme-ov-file) - better cat
* [fd](https://github.com/sharkdp/fd) - better find
* [fzf](https://github.com/junegunn/fzf) - fuzzy finder
* [zoxide](https://github.com/ajeetdsouza/zoxide) - better cd

TUI Apps:

* [yazi](https://yazi-rs.github.io/docs/installation) - tui file manager
* [lazygit](https://github.com/jesseduffield/lazygit) - git tui

GUI Apps:

* [vesktop](https://vesktop.vencord.dev/install/linux/) - modded discord
* [zen](https://aur.archlinux.org/packages/zen-browser-bin) - browser
* [spotify](https://wiki.archlinux.org/title/Spotify) - music
* [spicetify](https://spicetify.app/docs/advanced-usage/installation) - spotify modding
* [helvum](https://github.com/relulz/helvum) - patchbay for pipewire

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
```

```shell
yay -Sy yazi wl-clipboard ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick bat lazygit zen-browser-bin vesktop spotify-launcher helvum
```

```shell
# run spotify-launcher atleast once to install the current spotify version
spotify-launcher
```

```shell
# spotify modding using spicetify
yay -Sy spicetify-cli
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
