#!/bin/bash

# Check if colorscheme name is provided as argument
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <new_colorscheme>"
	exit 1
fi

# Assign colorscheme from argument
new_colorscheme="$1"

# Define the path to the color.lua file
color_file="/home/florin/.config/nvim/lua/FlorinVim/color.lua"

# Change the colorscheme property in the color.lua file
sed -i "s|vim\.cmd(\[\[colorscheme .*]])|vim.cmd([[colorscheme $new_colorscheme]])|" "$color_file"

echo "Colorscheme changed to '$new_colorscheme'."
