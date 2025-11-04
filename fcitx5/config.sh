#!/bin/bash

PACKAGE_TITLE=Fcitx5
PACKAGE_BINARY=fcitx5

# check existance
if ! command -v $PACKAGE_BINARY>/dev/null 2>&1; then
    echo "$PACKAGE_TITLE not found. Exiting."
    exit 1
fi

# script directory where the current file exists
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# configs
ln -s -f "$script_dir/fcitx5" ~/.config/
echo 'export GTK_IM_MODULE=fcitx' | sudo tee -a /etc/environment
echo 'export QT_IM_MODULE=fcitx' | sudo tee -a /etc/environment
echo 'export XMODIFIERS=@im=fcitx' | sudo tee -a /etc/environment
echo 'export SDL_IM_MODULE=fcitx' | sudo tee -a /etc/environment

# add locale
echo 'ko_KR.UTF-8 UTF-8' | sudo tee -a /etc/locale.gen
sudo locale-gen
echo 'LC_COLLATE=ko_KR.UTF-8' | sudo tee -a /etc/locale.conf

# done
echo "$PACKAGE_TITLE done"
