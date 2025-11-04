#!/bin/bash

PACKAGE_TITLE=Timeshift
PACKAGE_BINARY=timeshift

# check existance
if ! command -v $PACKAGE_BINARY>/dev/null 2>&1; then
    echo "$PACKAGE_TITLE not found. Exiting."
    exit 1
fi

# script directory where the current file exists
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# configs
ln -s -f "$script_dir/fcitx5" ~/.config/
sudo echo "export GTK_IM_MODULE=fcitx" >> /etc/environment
sudo echo "export QT_IM_MODULE=fcitx" >> /etc/environment
sudo echo "export XMODIFIERS=@im=fcitx" >> /etc/environment
sudo echo "export SDL_IM_MODULE=fcitx" >> /etc/environment

# add locale
sudo echo "ko_KR.UTF-8" >> /etc/locale.gen
sudo locale-gen
sudo echo "LC_COLLATE=ko_KR.UTF-8" >> /etc/locale.conf

# done
echo "$PACKAGE_TITLE done"
