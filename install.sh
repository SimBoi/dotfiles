# prepare the system
sudo pacman -Syu

# install yay
sudo pacman -S yay

# clone the repo
git clone https://github.com/SimBoi/dotfiles ~/.dotfiles

# symlink the dotfiles
yay -S --answerclean n --answerdiff n --noconfirm --sudoloop stow
cd ~/.dotfiles/stow
stow -t ~ */

# install packages
yay --answerclean n --answerdiff n --noconfirm --sudoloop
cd ~/.dotfiles/pkgbuilds/meta-simboi-de
yay -S --answerclean n --answerdiff n --noconfirm --sudoloop --asdeps $(bash -c 'source ./PKGBUILD; printf "%s\n" "${depends[@]}"')
makepkg -si --noconfirm
cd ~/.dotfiles/pkgbuilds/meta-simboi-dev
yay -S --answerclean n --answerdiff n --noconfirm --sudoloop --asdeps $(bash -c 'source ./PKGBUILD; printf "%s\n" "${depends[@]}"')
makepkg -si --noconfirm
cd ~/.dotfiles/pkgbuilds/meta-simboi-entertainment
yay -S --answerclean n --answerdiff n --noconfirm --sudoloop --asdeps $(bash -c 'source ./PKGBUILD; printf "%s\n" "${depends[@]}"')
makepkg -si --noconfirm

# install themes
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/master/install.sh | sh
gsettings set org.gnome.desktop.interface gtk-theme "'adw-gtk3-dark'"
gsettings set org.gnome.desktop.interface color-scheme \'prefer-dark\'
gsettings set org.gnome.desktop.interface font-name "'Rubik Nerd Font 12'"
gsettings set org.gnome.desktop.interface icon-theme "'Adwaita++-Dark'"

# enable ssh server
sudo systemctl enable sshd
sudo ufw allow ssh

# open the kde connect ports
sudo ufw allow 1714:1764/tcp
sudo ufw allow 1714:1764/udp