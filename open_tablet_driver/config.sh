#!/bin/bash


# script directory where the current file exists
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# configs
ln -s -f "$script_dir/OpenTabletDriver" ~/.config/

# enable service
systemctl --user enable --now opentabletdriver.service

# done
echo "Open Tablet Driver done"
