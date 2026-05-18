#!/usr/bin/env bash

RICE_DIR="$HOME/rices"
CURRENT="$RICE_DIR/.current"
CONFIGS=(hypr waybar wofi mako kitty nvim)

if [[ -z "$1" ]]; then
    echo "Usage: switch-rice <name>"
    echo "Available: $(ls $RICE_DIR | grep -v '^\.')"
    exit 1
fi

if [[ ! -d "$RICE_DIR/$1" ]]; then
    echo "Rice '$1' not found in $RICE_DIR"
    exit 1
fi

for cfg in "${CONFIGS[@]}"; do
    rm -f ~/.config/$cfg
    ln -s "$RICE_DIR/$1/.config/$cfg" ~/.config/$cfg
done

echo "$1" > "$CURRENT"
echo "Switched to $1"
