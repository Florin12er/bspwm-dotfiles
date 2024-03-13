#!/bin/bash

# Hide or show Polybar
polybar_msg() {
    if pgrep -x "polybar" > /dev/null; then
        polybar-msg cmd toggle
    fi
}

# Hide or show eww
eww_msg() {
    if pgrep -x "eww" > /dev/null; then
        eww -c "$HOME"/.config/bspwm/rices/z0mbi3/bar open --toggle bar
    fi
}

# Main script starts here

# Hide or show Polybar and eww
if pgrep -x "polybar" > /dev/null; then
    polybar_msg
else
    eww_msg
fi

