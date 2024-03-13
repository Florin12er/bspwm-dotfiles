# Function to modify sxhkdrc file to change Rofi theme
modify_sxhkdrc() {
    local launcher_script="$1"
    local sxhkdrc_file="$HOME/.config/bspwm/sxhkdrc"
    local rofi_pattern="^.*rofi.*$"
    local theme_command="   exec $launcher_script"

    echo "Launcher Script: $launcher_script"
    echo "sxhkdrc File: $sxhkdrc_file"

    # Check if the sxhkdrc file exists
    if [ -f "$sxhkdrc_file" ]; then
        # Replace any line containing "rofi" with the provided theme command
        sed -i "s#$rofi_pattern#$theme_command#" "$sxhkdrc_file"
        echo "Rofi theme command updated successfully."
    else
        echo "sxhkdrc file not found. Make sure it exists at $sxhkdrc_file."
    fi
}

# Main script starts here

# Check if a launcher script is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_launcher_script>"
    echo "Example: $0 ~/.config/rofi/launchers/type-5/launcher.sh"
    exit 1
fi

# Pass the provided launcher script to the modification function
modify_sxhkdrc "$1"

