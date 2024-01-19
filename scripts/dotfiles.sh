#!/usr/bin/bash

BASEDIR="/home/cheecho/dotfiles"

# Remove old
rm -rf ${BASEDIR}/config
rm -rf ${BASEDIR}/scripts
rm -rf ${BASEDIR}/zshrc
rm -rf ${BASEDIR}/bashrc
rm -rf ${BASEDIR}/wallpapers
rm -rf ${BASEDIR}/local/
rm -rf ${BASEDIR}/config.fish

mkdir ${BASEDIR}/config
mkdir ${BASEDIR}/local/

# Copy files
cp -r ~/.config/alacritty ${BASEDIR}/config/
cp -r ~/.config/dunst ${BASEDIR}/config/
#cp -r ~/.config/hypr ${BASEDIR}/config/
cp -r ~/.config/rofi ${BASEDIR}/config/
cp -r ~/.config/cava ${BASEDIR}/config/
cp -r ~/.config/neofetch ${BASEDIR}/config/
cp -r ~/.config/networkmanager-dmenu ${BASEDIR}/config/
cp -r ~/.config/eww ${BASEDIR}/config/
cp -r ~/.texmf ${BASEDIR}/texmf
cp -r  ~/.scripts/ ${BASEDIR}/scripts
cp -r  ~/.fonts ${BASEDIR}/fonts
cp -r ~/wallpapers ${BASEDIR}/
cp -r ~/.local/bin/notify-log ${BASEDIR}/local/
cp -r ~/.config/zathura ${BASEDIR}/config/
cp -r ~/.sounds ${BASEDIR}/sounds/

cp ~/.config/fish/config.fish ${BASEDIR}/
cp ~/.bashrc ${BASEDIR}/bashrc
cp ~/.zshrc ${BASEDIR}/zshrc
cp ~/.latexmkrc ${BASEDIR}/latexmkrc

cp  /etc/sddm.conf.d/default.conf ${BASEDIR}/sddm
cp  /etc/xdg/reflector/reflector.conf ${BASEDIR}/
