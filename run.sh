#!/bin/bash

# configuration script for each package
CONFIG_SCRIPT_FILENAME="config.sh"


# update mirror list
sudo pacman -S reflector
sudo reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist


# install packages
sudo pacman -S krita godot --noconfirm

# for each package
for dir in */; do
    # config
    config_filepath=${dir}config.sh
    if [ -f "$config_filepath" ]; then
        bash "$config_filepath"
    fi

    # manual intervention notice

done
