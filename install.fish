#!/usr/bin/fish

read -P 'Run in Nvidia mode? (Y/n) ' nvidiamode
read -P 'Auto start apps? (Y/n) ' autostartmode
touch ~/.dotfiles/MODE
echo '{' > ~/.dotfiles/MODE
if test $nvidiamode = 'n'; echo '	"nvidia": false,' >> ~/.dotfiles/MODE;
else echo '	"nvidia": true,' >> ~/.dotfiles/MODE;
end
if test $autostartmode = 'n'; echo '	"autoStart": false,' >> ~/.dotfiles/MODE;
else echo '	"autoStart": true' >> ~/.dotfiles/MODE;
end
echo '}' >> ~/.dotfiles/MODE

# prepare the system
sudo pacman -Syu --noconfirm

# install yay
sudo pacman -S --noconfirm yay

# clone the repo
git clone https://github.com/SimBoi/dotfiles ~/.dotfiles

# symlink the dotfiles
alias autoyay='yay --answerclean n --answerdiff n --noconfirm --sudoloop'
autoyay -S --needed stow
cd ~/.dotfiles/stow
stow -t ~ */

# install packages
cd ~/.dotfiles/pkgbuilds/meta-simboi-de
autoyay -S --needed --asdeps $(bash -c 'source ./PKGBUILD; printf "%s\n" "${depends[@]}"')
makepkg -sifc --noconfirm && rm *.zst
cd ~/.dotfiles/pkgbuilds/meta-simboi-dev
autoyay -S --needed --asdeps $(bash -c 'source ./PKGBUILD; printf "%s\n" "${depends[@]}"')
makepkg -sifc --noconfirm && rm *.zst
cd ~/.dotfiles/pkgbuilds/meta-simboi-entertainment
autoyay -S --needed --asdeps $(bash -c 'source ./PKGBUILD; printf "%s\n" "${depends[@]}"')
makepkg -sifc --noconfirm && rm *.zst

# install lua json package for hyprland config
sudo luarocks install dkjson

# install themes
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/master/install.sh | sh
gsettings set org.gnome.desktop.interface gtk-theme "'adw-gtk3-dark'"
gsettings set org.gnome.desktop.interface color-scheme \'prefer-dark\'
gsettings set org.gnome.desktop.interface font-name "'Rubik Nerd Font 12'"
gsettings set org.gnome.desktop.interface icon-theme "'Adwaita++-Dark'"

# enable ssh server
sudo systemctl enable sshd
sudo ufw allow ssh
# require root password for sudo
if not sudo grep -qx 'Defaults rootpw' /etc/sudoers
    echo 'Defaults rootpw' | sudo tee -a /etc/sudoers >/dev/null
end
sudo visudo -c
# disable root ssh
if not sudo grep -qx 'PermitRootLogin no' /etc/ssh/sshd_config
    echo 'PermitRootLogin no' | sudo tee -a /etc/ssh/sshd_config >/dev/null
end
sudo sshd -t
and sudo systemctl restart sshd

# open the kde connect ports
sudo ufw allow 1714:1764/tcp
sudo ufw allow 1714:1764/udp
