#!/usr/bin/bash

BASEDIR="/home/cheecho/backup"

# Notify that process has started
dunstify "Syncing backup" "Started syncing backup repo" -u critical

# Remove old
rm -rf ${BASEDIR}/config
rm -rf ${BASEDIR}/scripts
rm -rf ${BASEDIR}/zshrc
rm -rf ${BASEDIR}/texmf
rm -rf ${BASEDIR}/bashrc

mkdir ${BASEDIR}/config

# Copy files
for elem in starship.toml geogebra hypr rofi nvim alacritty kitty doom eww systemd zathura neofetch
do
    cp -R ~/.config/$elem ${BASEDIR}/config
done

cp -r ~/.texmf ${BASEDIR}/texmf
cp -r  ~/.scripts/ ${BASEDIR}/scripts
cp -r /usr/local/bin/snapbackup.sh ${BASEDIR}/scripts
cp  ~/.zshrc ${BASEDIR}/zshrc
cp  ~/.bashrc ${BASEDIR}/bashrc
cp  /etc/sddm.conf.d/default.conf ${BASEDIR}/sddm.conf

dunstify "Complete!" "Finished syncing backup locally"
