#!/bin/bash


# script directory where the current file exists
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# configs
ln -s -f "$script_dir/OpenTabletDriver" ~/.config/

# done
echo "Open Tablet Driver done"
