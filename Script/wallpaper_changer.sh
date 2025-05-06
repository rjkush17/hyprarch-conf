#!/bin/bash

# Start swww daemon if not already running
pgrep -x swww-daemon > /dev/null || swww-daemon &

# Wait briefly to ensure daemon is ready
sleep 0.3

# Pick a random wallpaper
WALLPAPER=$(find "$HOME/Wallpapers/hyprland/" -type f | shuf -n 1)

# Set wallpaper with transition
swww img "$WALLPAPER" --transition-type wipe --transition-duration 1.8

sleep 0.5

# Generate Pywal colors (no extra output, background process)
wal -i "$WALLPAPER" --backend wal &> /dev/null

# Wait for wal to write color files
sleep 0.5

# Apply updated colors
~/.config/Script/update_dunst_colors.sh

# Restart Waybar
pkill waybar && waybar

# Send notification
notify-send -i "$HOME/.config/Script/icons/color.png" "🎨 Theme Updated" "Wallpaper & system colors applied"

