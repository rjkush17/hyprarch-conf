#!/bin/bash

# Load pywal colors
source "${HOME}/.cache/wal/colors.sh"

# Inject into dunstrc
sed -i "s/^background = .*/background = \"${color0}\"/" ~/.config/dunst/dunstrc
sed -i "s/^foreground = .*/foreground = \"${color7}\"/" ~/.config/dunst/dunstrc
sed -i "s/^frame_color = .*/frame_color = \"${color2}\"/" ~/.config/dunst/dunstrc

# Update urgency sections
sed -i "s/^\[urgency_low\].*/[urgency_low]/" ~/.config/dunst/dunstrc
sed -i "/^\[urgency_low\]/,/^\[/ s/^background = .*/background = \"${color0}\"/" ~/.config/dunst/dunstrc
sed -i "/^\[urgency_low\]/,/^\[/ s/^foreground = .*/foreground = \"${color7}\"/" ~/.config/dunst/dunstrc
sed -i "/^\[urgency_low\]/,/^\[/ s/^frame_color = .*/frame_color = \"${color2}\"/" ~/.config/dunst/dunstrc

sed -i "/^\[urgency_normal\]/,/^\[/ s/^background = .*/background = \"${color0}\"/" ~/.config/dunst/dunstrc
sed -i "/^\[urgency_normal\]/,/^\[/ s/^foreground = .*/foreground = \"${color7}\"/" ~/.config/dunst/dunstrc
sed -i "/^\[urgency_normal\]/,/^\[/ s/^frame_color = .*/frame_color = \"${color2}\"/" ~/.config/dunst/dunstrc

# Restart Dunst
killall dunst && dunst &

