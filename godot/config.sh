#!/bin/bash

# check existance
if ! command -v godot >/dev/null 2>&1; then
    echo "Godot not found. Exiting."
    exit 1
fi

# script directory where the current file exists
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# configs
ln -s -f "$script_dir/local_share_godot" ~/.local/share/godot
ln -s -f "$script_dir/config_godot" ~/.config/godot

# done
echo "Godot done"
