#!/usr/bin/env bash
#  ╔═╗╔═╗╔═╗╔═╗╔╦╗╦═╗╔═╗╔═╗╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ║╣ ╚═╗║ ║╚═╗ ║ ╠╦╝║╣ ╠╣ ║╚═╗  ╠╦╝║║  ║╣
#  ╚═╝╚═╝╚═╝╚═╝ ╩ ╩╚═╚═╝╚  ╩╚═╝  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

## Theme
BDIR="$HOME/.config/bspwm"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration for aing
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 2
	bspc config bottom_padding 30
	bspc config normal_border_color "#6E91BA"
	bspc config active_border_color "#6E91BA"
	bspc config focused_border_color "#E3C4BA"
	bspc config presel_feedback_color "#E3C4BA"
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config window_gap 6
}
/home/florin/scripts/changetheme.sh Nord-Black-Frost Tela-circle-nord
source /home/florin/scripts/vim-theme.sh nord
/home/florin/scripts/rofi_theme.sh "rofi -theme /home/florin/.config/rofi/launchers/type-6/style-7.rasi -show drun"
/home/florin/scripts/vscode.sh "Nord Deep" "file-icons"
feh --bg-fill /home/florin/.config/bspwm/rices/nord/walls/wall-04.webp

# Reload terminal colors
set_term_config() {
	cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# (Aing) Aing Rice

# Default colors
[colors.primary]
background = "#161a22"
foreground = "#cadee7"

# Cursor colors
[colors.cursor]
cursor = "#cadee7"
text = "#cadee7"

# Normal colors
[colors.normal]
black = "#1e232e"
blue = "#D2ACA9"
cyan = "#99A9CC"
green = "#6E91BA"
magenta = "#E3C4BA"
red = "#927887"
white = "#edf4f7"
yellow = "#A393A2"

# Bright colors
[colors.bright]
black = "#8d9ba1"
blue = "#D2ACA9"
cyan = "#99A9CC"
green = "#6E91BA"
magenta = "#E3C4BA"
red = "#927887"
white = "#cadee7"
yellow = "#A393A2"
EOF
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
		-e "s/inactive-opacity = .*/inactive-opacity = 1.0;/g" \
		-e "s/active-opacity = .*/active-opacity = 1.0;/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/method = .*/method = \"none\"/g" \
		-e "s/background = .*/background = false/g" \
		-e "s/background-frame = .*/background-frame = false/g" \
		-e "s/background-fixed = .*/background-fixed = false/g" \
		-e "s/corner-radius = .*/corner-radius = 6/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g" \
		-e "s/\".*:class_g = 'Updating'\"/\"100:class_g = 'Updating'\"/g" \
		-e "s/\".*:class_g = 'MusicPlayer'\"/\"100:class_g = 'MusicPlayer'\"/g" \
		-e "s/\".*:class_g = 'Sysfetch'\"/\"100:class_g = 'Sysfetch'\"/g" \
		-e "s/\".*:class_g = 'scratch'\"/\"90:class_g = 'scratch'\"/g"
}

# Set stalonetray config
set_stalonetray_config() {
	sed -i "$HOME"/.config/bspwm/stalonetrayrc \
		-e "s/background .*/background \"#161a22\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-36+705/" \
		-e "s/grow_gravity .*/grow_gravity SE/" \
		-e "s/icon_gravity .*/icon_gravity SE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#161a22\"/g" \
		-e "s/separator_color = .*/separator_color = \"#927887\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#6E91BA'/g" \
		-e "s/origin = .*/origin = bottom-right/g" \
		-e "s/offset = .*/offset = 8x36/g" \
		-e "s/icon_position = .*/icon_position = left/g" \
		-e "s/max_icon_size = .*/max_icon_size = 50/g" \
		-e "s/corner_radius = .*/corner_radius = 0/g"

	
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
		[urgency_low]
		timeout = 3
		background = "#161a22"
		foreground = "#cadee7"

		[urgency_normal]
		timeout = 6
		background = "#161a22"
		foreground = "#cadee7"

		[urgency_critical]
		timeout = 0
		background = "#161a22"
		foreground = "#cadee7"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Aing rice
\$bg: #161a22;
\$bg-alt: #262c3a;
\$fg: #cadee7;
\$black: #1e232e;
\$lightblack: #2d3546;
\$red: #927887;
\$blue: #D2ACA9;
\$cyan: #99A9CC;
\$magenta: #E3C4BA;
\$green: #6E91BA;
\$yellow: #A393A2;
\$archicon: #0f1116;
EOF
}

# Set jgmenu colors for Aing
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #161a22/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #cadee7/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #262c3a/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #cadee7/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #1e232e/'
}

# Set Rofi launcher config
set_launcher_config () {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e 's/\(background: \).*/\1#161a22;/' \
		-e '22s/\(font: \).*/\1"Terminess Nerd Font Mono Bold 10";/' \
		-e 's/\(background-alt: \).*/\1#161a22E0;/' \
		-e 's/\(foreground: \).*/\1#cadee7;/' \
		-e 's/\(selected: \).*/\1#E3C4BA;/' \
		-e 's/[^/]*-rofi/ai-rofi/'

	# WallSelect menu colors	
	sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
		-e 's/\(main-bg: \).*/\1#161a22E0;/' \
		-e 's/\(main-fg: \).*/\1#cadee7;/' \
		-e 's/\(select-bg: \).*/\1#E3C4BA;/' \
		-e 's/\(select-fg: \).*/\1#161a22;/'
}

# Set color cava #bak-e "78s/gradient_color_1 = .*/gradient_color_1 = '#D2ACA9'/g"
set_cava() {
	sed -i "$HOME/.config/cava/config" \
		-e "s/foreground = .*/foreground = 'cyan'/g"
}

# Appearance
set_appearance() {
	XFILE="$BDIR/xsettingsd"
	GTK2FILE="$HOME/.gtkrc-2.0"
	GTK3FILE="$HOME/.config/gtk-3.0/settings.ini"

	# apply gtk theme, icons, cursor & fonts
	if [[ `pidof xsettingsd` ]]; then
		sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"Nord-Black-Frost\"|g" ${XFILE}
		sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"Tela-circle-nord\"|g" ${XFILE}
		sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"phinger-cursors\"|g" ${XFILE}
	else
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"Noto Sans 9\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"Nord-Black-Frost\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"Tela-circle-nord\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"phinger-cursors\"/g" ${GTK2FILE}
		
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=Noto Sans 9/g" ${GTK3FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=Nord-Black-Frost/g" ${GTK3FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Tela-circle-nord/g" ${GTK3FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=phinger-cursors/g" ${GTK3FILE}
	fi
	
	# inherit cursor theme
	if [[ -f "$HOME"/.icons/default/index.theme ]]; then
		sed -i -e "s/Inherits=.*/Inherits=phinger-cursors/g" "$HOME"/.icons/default/index.theme
	fi	
}

# Launch the bar and or eww widgets
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q aing-bar -c ${rice_dir}/config.ini &
	done

}

### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_stalonetray_config
launch_bars
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
set_cava
set_appearance
