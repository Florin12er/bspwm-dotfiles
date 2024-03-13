#!/bin/bash

# Check if the number of arguments provided is correct
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <color_theme> <icon_theme>"
	exit 1
fi

# Set the color theme and icon theme provided as arguments
color_theme="$1"
icon_theme="$2"

# Set the path to the settings.json file
settings_file="$HOME/.config/Code - OSS/User/settings.json"

# Check if the settings file exists
if [ -f "$settings_file" ]; then
	# Update settings.json with the new color and icon themes
	jq --arg color "$color_theme" --arg icon "$icon_theme" '. + { "workbench.colorTheme": $color, "workbench.iconTheme": $icon }' "$settings_file" >temp.json && mv temp.json "$settings_file"

	echo "Color theme '$color_theme' and icon theme '$icon_theme' set successfully."
	exit 0
else
	echo "Error: Could not find settings.json file at $settings_file"
	exit 1
fi
