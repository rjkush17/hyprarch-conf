#!/bin/bash

# Paths
DUNST_CONFIG="$HOME/.config/dunst/dunstrc"
PYWAL_CACHE="$HOME/.cache/wal/colors"

# Check pywal cache exists
if [ ! -f "$PYWAL_CACHE" ]; then
    notify-send -u critical "Dunst Update Failed" "Pywal cache not found!"
    exit 1
fi

# Read Pywal colors
bg=$(sed -n '1p' "$PYWAL_CACHE")    # color0 - background
fg=$(sed -n '3p' "$PYWAL_CACHE")    # color2 - text
accent=$(sed -n '2p' "$PYWAL_CACHE") # color1 - frame/accent

# Use sed to update all urgency sections
sed -i -E \
    -e "/^\[urgency_low\]/,/^\[.*\]/ s/^background = .*/background = \"$bg\"/" \
    -e "/^\[urgency_low\]/,/^\[.*\]/ s/^foreground = .*/foreground = \"$fg\"/" \
    -e "/^\[urgency_low\]/,/^\[.*\]/ s/^frame_color = .*/frame_color = \"$accent\"/" \
    -e "/^\[urgency_normal\]/,/^\[.*\]/ s/^background = .*/background = \"$bg\"/" \
    -e "/^\[urgency_normal\]/,/^\[.*\]/ s/^foreground = .*/foreground = \"$fg\"/" \
    -e "/^\[urgency_normal\]/,/^\[.*\]/ s/^frame_color = .*/frame_color = \"$accent\"/" \
    "$DUNST_CONFIG"

# Make sure correct xdg-desktop-portal backend is active
# (Prevents KDE portal from overriding Dunst colors)
if systemctl --user is-active --quiet xdg-desktop-portal-kde.service; then
    systemctl --user stop xdg-desktop-portal-kde.service
fi
systemctl --user start xdg-desktop-portal-hyprland.service

# Restart Dunst cleanly
if pgrep -x dunst >/dev/null; then
    killall dunst
    sleep 0.3
fi
dunst &

# Notify user
sleep 0.5
notify-send -i "$HOME/.config/Script/icons/color.png" "🎨 Dunst Theme Updated" "Applied Pywal colors successfully"

