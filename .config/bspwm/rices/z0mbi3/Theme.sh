#!/usr/bin/env bash
#  ███████╗ ██████╗ ███╗   ███╗██████╗ ██╗██████╗     ██████╗ ██╗ ██████╗███████╗
#  ╚══███╔╝██╔═████╗████╗ ████║██╔══██╗██║╚════██╗    ██╔══██╗██║██╔════╝██╔════╝
#    ███╔╝ ██║██╔██║██╔████╔██║██████╔╝██║ █████╔╝    ██████╔╝██║██║     █████╗
#   ███╔╝  ████╔╝██║██║╚██╔╝██║██╔══██╗██║ ╚═══██╗    ██╔══██╗██║██║     ██╔══╝
#  ███████╗╚██████╔╝██║ ╚═╝ ██║██████╔╝██║██████╔╝    ██║  ██║██║╚██████╗███████╗
#  ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚═╝╚═════╝     ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for z0mbi3
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 3
	bspc config bottom_padding 2
	bspc config left_padding 79
	bspc config right_padding 2
	bspc config normal_border_color "#3d414f"
	bspc config active_border_color "#3d414f"
	bspc config focused_border_color "#3d414f"
	bspc config presel_feedback_color "#90ceaa"
}

pidof -q bspc && pkill -9 bspc >/dev/null
source /home/florin/scripts/changetheme.sh Catppuccin-Mocha-Standard-Blue-Dark Tela-circle-dracula
source /home/florin/scripts/vim-theme.sh catppuccin-mocha
/home/florin/scripts/vscode.sh "Catppuccin Mocha" "file-icons"
feh --bg-fill /home/florin/.config/bspwm/rices/z0mbi3/walls/wp9024817-4k-zombie-wallpapers.jpg

# Reload terminal colors
set_term_config() {
	cat >"$HOME"/.config/alacritty/rice-colors.toml <<EOF
# (Decay, decayce variant) Color scheme for z0mbi3 Rice

# Default colors
[colors.primary]
background = "#0d0f18"
foreground = "#a5b6cf"

# Cursor colors
[colors.cursor]
cursor = "#a5b6cf"
text = "#0d0f18"

# Normal colors
[colors.normal]
black = "#3d414f"
blue = "#86aaec"
cyan = "#93cee9"
green = "#90ceaa"
magenta = "#c296eb"
red = "#dd6777"
white = "#cbced3"
yellow = "#ecd3a0"

# Bright colors
[colors.bright]
black = "#3d414f"
blue = "#86aaec"
cyan = "#93cee9"
green = "#90ceaa"
magenta = "#c296eb"
red = "#dd6777"
white = "#cbced3"
yellow = "#ecd3a0"
EOF
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/corner-radius = .*/corner-radius = 6/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#0d0f18\"/g" \
		-e "s/separator_color = .*/separator_color = \"#3d414f\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#c296eb'/g"

	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >>"$HOME"/.config/bspwm/dunstrc <<-_EOF_
		[urgency_low]
		timeout = 3
		background = "#0d0f18"
		foreground = "#a5b6cf"

		[urgency_normal]
		timeout = 6
		background = "#0d0f18"
		foreground = "#a5b6cf"

		[urgency_critical]
		timeout = 0
		background = "#0d0f18"
		foreground = "#a5b6cf"
	_EOF_
}

# Set eww colors
set_eww_colors() {
	cat >"$HOME"/.config/bspwm/eww/colors.scss <<EOF
// Eww colors for z0mbi3 rice
\$bg: #0d0f18;
\$bg-alt: #151720;
\$fg: #a5b6cf;
\$black: #3d414f;
\$lightblack: #262831;
\$red: #dd6777;
\$blue: #86aaec;
\$cyan: #93cee9;
\$magenta: #c296eb;
\$green: #90ceaa;
\$yellow: #ecd3a0;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for z0mbi3
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #0d0f18/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #a5b6cf/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #151720/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #a5b6cf/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #3d414f/'
}

# Set Rofi launcher config
set_launcher_config() {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e '22s/\(font: \).*/\1"JetBrainsMono NF Bold 9";/' \
		-e 's/\(background: \).*/\1#0d0f18;/' \
		-e 's/\(background-alt: \).*/\1#0d0f18C7;/' \
		-e 's/\(foreground: \).*/\1#a5b6cf;/' \
		-e 's/\(selected: \).*/\1#90ceaa;/' \
		-e "s/rices\/[[:alnum:]\-]*/rices\/${RICETHEME}/g"

	# NetworkManager launcher
	sed -i "$HOME/.config/bspwm/scripts/NetManagerDM.rasi" \
		-e '12s/\(background: \).*/\1#0d0f18;/' \
		-e '13s/\(background-alt: \).*/\1#151720;/' \
		-e '14s/\(foreground: \).*/\1#a5b6cf;/' \
		-e '15s/\(selected: \).*/\1#c296eb;/' \
		-e '16s/\(active: \).*/\1#90ceaa;/' \
		-e '17s/\(urgent: \).*/\1#dd6777;/'

	# WallSelect menu colors
	sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
		-e 's/\(main-bg: \).*/\1#0d0f18E6;/' \
		-e 's/\(main-fg: \).*/\1#a5b6cf;/' \
		-e 's/\(select-bg: \).*/\1#90ceaa;/' \
		-e 's/\(select-fg: \).*/\1#0d0f18;/'
}

# Launch the bar and or eww widgets
launch_bars() {
	eww -c "${rice_dir}"/bar open --toggle bar
	polybar -q tray -c "${rice_dir}"/bar/polybar_tray.ini &
}

### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
launch_bars
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
