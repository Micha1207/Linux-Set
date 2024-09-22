#!/bin/bash

# linux-set.sh
# This script is for setting Debian or Debian-based Linux distros automatically.
# Requiers Internet connnection.
# Confused? Read 'README.md'

# Get username
user=$(whoami)

# Welcome user
echo "Hi there, ${user^}! linux-set.sh: start"
echo " "

# Coment out if need.
echo "Linux Update. To be continued..." && echo " " && sudo apt update && sdo apt upgrade

# Packages Lists
apt=("arduino" "thonny" "geany" "code" "mu-editor" "rhythmbox" "vlc" "gimp" "rpi-imager" "gparted" "lm-sensors" "neofetch" "libreoffice" "gnome-shell-extensions" "gnome-control-center" "gnome-calendar" "gnome-mahjongg" "sdl-ball" "cheese" "sl" "espeak" "nudoku")
piapps=("Audacity" "Box64" "Box86" "Conky" "Minecrafi Pi (Modded)" "Pacman (SDL)" "Scratch 3" "Wine (x86)" "Snap Store" "Github Desktop" 'Angry IP scanner')
snap=("tux-paint")

# Drive name (README.md)
drive=("USBMEMORY")
# INSTALL

# Install Pi-Apps program
git clone https://github.com/Botspot/pi-apps 
~/pi-apps/install

# Install 'apt' programs
sudo apt install ${apt[@]}

# Install 'snap' programs
sudo snap install ${snap[@]}

# Install 'Pi-apps' programs
~/pi-apps/manage install ${piapps[@]}

# COPY
echo " "
echo "Copying files from: $drive"
sudo rm -rf $HOME/Bookshelf && sudo cp -r "/media/$user/$drive/Bookshelf" $HOME
sudo rm -rf $HOME/Codes     && sudo cp -r "/media/$user/$drive/Codes"     $HOME
sudo rm -rf $HOME/Documents && sudo cp -r "/media/$user/$drive/Documents" $HOME
sudo rm -rf $HOME/Music     && sudo cp -r "/media/$user/$drive/Music"     $HOME
sudo rm -rf $HOME/Pictures  && sudo cp -r "/media/$user/$drive/Pictures"  $HOME
sudo rm -rf $HOME/Scripts   && sudo cp -r "/media/$user/$drive/Scripts"   $HOME
sudo rm -rf $HOME/TESTS     && sudo cp -r "/media/$user/$drive/TESTS"     $HOME

# RM not needed
sudo apt autoremove

# :>END<
echo "linux-set.sh: DONE!"
