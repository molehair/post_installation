#!/bin/bash

#!/bin/bash

# check existance
if ! command -v krita >/dev/null 2>&1; then
    echo "Krita not found. Exiting."
    exit 1
fi

# script directory where the current file exists
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# configs
ln -s -f "$script_dir/kritadisplayrc" ~/.config/
ln -s -f "$script_dir/kritarc" ~/.config/
ln -s -f "$script_dir/kritashortcutsrc" ~/.config/


# brush tags
ln -s -f "$script_dir/resourcecache.sqlite" ~/.local/share/krita/

# done
echo "Krita done"
