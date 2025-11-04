#!/bin/bash

PACKAGE_TITLE=Timeshift
PACKAGE_BINARY=fcitx5

# check existance
if ! command -v $PACKAGE_BINARY>/dev/null 2>&1; then
    echo "$PACKAGE_TITLE not found. Exiting."
    exit 1
fi

# script directory where the current file exists
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# enable cronie for scheduled backup
sudo systemctl enable cronie

# done
echo "$PACKAGE_TITLE done"
