#!/bin/bash

# Check if the theme file path is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <theme_file>"
    exit 1
fi

# Assign the theme file path provided as an argument
theme_file="$1"

# Check if the theme file exists
if [ ! -f "$theme_file" ]; then
    echo "Error: File '$theme_file' not found."
    exit 1
fi

# Define the keymap pattern
keymap_pattern="super + shift + w"

# Define the existing theme path pattern
theme_pattern="~/.config/rofi/launchers/type-[0-9]+/style-[0-9]+.rasi"

# Generate the new line with the updated theme path
new_line="rofi -show wifi -modi 'wifi:iwdrofimenu' -theme $theme_file"

# Use sed to replace the theme path in the line containing the keymap
sed -i "s|\($keymap_pattern.*\)$theme_pattern|\1$theme_file|" /home/florin/.config/bspwm/sxhkdrc2

echo "Theme file updated successfully."

