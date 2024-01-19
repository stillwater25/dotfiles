#!/bin/bash

echo "DO NOT RUN THIS SCRIPT AS ROOT!!!"

echo "Updating the system..."
sudo pacman -Syu

echo "Installing yay..."
# yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin || exit
makepkg -si
cd ../
rm -rf yay-bin

# rustup
yay -S rustup; rustup default stable

# basic stuff
yay -S socat wayland wayland-utils blueman bluez bluez-utils pipewire pipewire-alsa wireplumber python base-devel pipewire-jack pipewire-pulse polkit-kde-agent plymouth brightnessctl pamixer playerctl lxappearance cronie timeshift task thermald tlp tlp-rdw inxi meson ninja mlocate lolcat ufw gufw unzip udiskie --needed --noconfirm

# git stuff
yay -S git lazygit github-cli onefetch git-delta git-annex --needed --noconfirm

# file manager
yay -S nemo thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman --needed --noconfirm 

# networking
yay -S gping networkmanager network-manager-applet nm-connection-editor httpie broadcom-wl-dkms reflector --needed --noconfirm

# monitoring and cleanup
yay -S stacer-bin --needed --noconfirm

# fonts
yay -S ttf-ms-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-iosevka-nerd ttf-inconsolata ttf-inconsolata-nerd --needed --noconfirm

# pacman stuff
yay -S pacgraph pacman-contrib --needed --noconfirm 

# first fetch signing keys for eww wayland 
curl -sS https://github.com/elkowar.gpg | gpg --import -i -
curl -sS https://github.com/web-flow.gpg | gpg --import -i -

# status bars, wallpaper
yay -S eww-wayland swww-git hyprpaper --needed --noconfirm

# Terminal applications
yay -S gdu lsd ranger bat bat-extras fzf htop neofetch --needed --noconfirm

# disks
yay -S gparted parted gnome-disk-utility duf --needed --noconfirm

# notifications
yay -S dunst-git libnotify --needed --noconfirm

# session locker
yay -S swaylock-effects-git swayidle swaybg --needed --noconfirm

echo "Setting up swaylockd..."
# swaylockd
wget https://github.com/jirutka/swaylockd/releases/download/v0.1.0/swaylockd-0.1.0-x86_64-unknown-linux.tar.gz
tar -xzf swaylockd-0.1.0-*.tar.gz
sudo install -m 755 swaylockd-0.1.0-*/swaylockd /usr/local/bin

rm -rf swaylockd*

# font stuff
yay -S fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool --needed --noconfirm

# app launchers 
yay -S rofi-lbonn-wayland-git networkmanager-dmenu-git --needed --noconfirm

# terminal
yay -S kitty alacritty-git --needed --noconfirm

# shell
yay -S bash fish zsh --needed --noconfirm

# color temperature
yay -S gammastep --needed --noconfirm

# display manager
yay -S sddm-git sddm-sugar-dark sddm-conf-git --needed --noconfirm

# hyprland and friends
yay -S hyprpicker-git hyprland-git xdg-utils xdg-desktop-portal-hyprland qt5-wayland qt6-wayland qt5ct qt6ct nwg-look wl-clipboard --needed --noconfirm

# APPLICATIONS
yay -S firefox-nightly-bin --needed --noconfirm

# text editors
yay -S vscodium-bin nano neovim vim --needed --noconfirm

# discord
yay -S discord-electron-bin discord-update-skip-git --needed --noconfirm

# spotify
yay -S spotify spotify-adblock-git --needed --noconfirm 

# gtk theme and cursor themes
yay -S catppuccin-gtk-theme-mocha bibata-cursor-theme-bin papirus-folders-catppuccin-git catppuccin-cursors-mocha papirus-icon-theme-git --needed --noconfirm

# other stuff
yay -S tldr-git yt-dlp bandwhich dmscripts-git urlview msmtp neomutt --needed --noconfirm

# silly
yay -S cmatrix sl ascii-rain-git asciiquarium ascii-image-converter-git --needed --noconfirm

# latex 
yay -S geogebra-5 texlive-core texlive texlive-bin texlive-binextra texlive-fontsrecommended texlive-fontsextra texlive-fontutils texlive-games texlive-latex texlive-latexextra texlive-latexrecommended texlive-luatex texlive-mathscience texlive-music texlive-pictures texlive-basic asymptote --noconfirm --needed

#pdf viewers
yay -S zathura evince zathura-pdf-poppler zathura-cb zathura-djvu zathura-ps --noconfirm --needed

# SET UP SDDM
sudo cp -r /usr/lib/sddm/sddm.conf.d /etc

echo "Copying files..."
# COPY FILES
mkdir -p ~/.local/bin
mkdir -p ~/.config
cp -r config/* ~/.config 
cp -r local/notify-log ~/.local/bin/notify-log
cp -r latexmkrc ~/.latexmkrc
cp -r bashrc ~/.bashrc
cp -r zshrc ~/.zshrc
sudo cp -r sddm.conf /etc/sddm.conf.d/default.conf
sudo cp fonts/feather.ttf /usr/share/fonts/TTF; fc-cache -vf
cp config.fish ~/.config/fish/config.fish
cp -r sounds ~/.sounds
cp -r wallpapers ~/
cp -r scripts ~/.scripts
cp -r texmf ~/.texmf; sudo texhash

# CREATE PYTHON VENV
echo "Creating a virtual environment for Python..."
python -m venv ~/.venv

# ENABLE SYSTEMD SERVICES
sudo systemctl enable NetworkManager.service
sudo systemctl enable thermald.service
sudo systemctl enable reflector.service
sudo systemctl enable tlp.service
sudo systemctl enable sddm.service
sudo systemctl enable ufw.service
sudo systemctl enable bluetooth.service
sudo systemctl enable cronie.service

echo "You may now reboot!"
