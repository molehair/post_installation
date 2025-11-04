#!/bin/bash

# configuration script for each package
CONFIG_SCRIPT_FILENAME="config.sh"


# do not run this script with root permission
if (( $EUID == 0 )); then
  echo "This script should not be run as root."
  exit 1
fi


# update mirror list
sudo pacman -S reflector --noconfirm
sudo reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

# install yay
sudo pacman -S --needed git base-devel --noconfirm
orig_working_directory=$(pwd)
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd $orig_working_directory
yay --save --answerdiff None --answerclean None --removemake

# install packages from yay
yay -Sy github-desktop-bin brave-bin spoofdpi-bin ttf-nanum noto-fonts-cjk

# install packages from official repo
sudo pacman -S krita godot flatpak mpv vivaldi syncthing alacarte timeshift fcitx5 fcitx5-hangul fcitx5-gtk fcitx5-config-qt dconf-editor mpv bash-completion alacarte --noconfirm

# install packages from flatpak
flatpak install flathub com.usebottles.bottles com.github.tchx84.Flatseal com.mattjakeman.ExtensionManager io.github.realmazharhussain.GdmSettings -y


# config
for dir in */; do
    config_filepath=${dir}config.sh
    if [ -f "$config_filepath" ]; then
        bash "$config_filepath"
    fi
done

# manual intervention notice
for dir in */; do
    config_filepath=${dir}manual_intervention_notice.sh
    if [ -f "$config_filepath" ]; then
        bash "$config_filepath"
    fi
done
