#!/bin/bash

PACKAGE_TITLE=Mpv
PACKAGE_BINARY=mpv

# check existance
if ! command -v $PACKAGE_BINARY>/dev/null 2>&1; then
    echo "$PACKAGE_TITLE not found. Exiting."
    exit 1
fi

# script directory where the current file exists
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# config
ln -s -f "$script_dir/mpv" ~/.config/

# done
echo "$PACKAGE_TITLE done"
