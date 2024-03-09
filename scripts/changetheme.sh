#!/bin/bash

# Check if theme and icon theme are provided as arguments
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <new_theme> <new_icon_theme>"
	exit 1
fi

# Assign theme and icon theme from arguments
new_theme="$1"
new_icon_theme="$2"

# Define the path to the settings.ini file
settings_file="/home/florin/.config/gtk-3.0/settings.ini"

# Change the theme and icon theme in the settings.ini file
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$new_theme/" "$settings_file"
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=$new_icon_theme/" "$settings_file"

echo "Themes changed to '$new_theme' and '$new_icon_theme'."
