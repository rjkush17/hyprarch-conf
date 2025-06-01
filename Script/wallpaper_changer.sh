#!/bin/bash

# Start swww daemon if not already running
pgrep -x swww-daemon > /dev/null || swww-daemon &

# Wait briefly to ensure daemon is ready
sleep 1.3

# Pick a random wallpaper
WALLPAPER=$(find "$HOME/Wallpapers/hyprland/" -type f | shuf -n 1)

# Set wallpaper with transition
swww img "$WALLPAPER" --transition-type random --transition-duration 3

# Wait a bit before color generation
sleep 1.2

# Generate Pywal colors (silent)
wal -i "$WALLPAPER" --backend wal &> /dev/null

# Wait for wal to finish writing
sleep 1.5

# Update Dunst colors
~/.config/Script/update_dunst_colors.sh

# Restart Waybar
pkill waybar && waybar &

# Notify user
notify-send -i "$HOME/.config/Script/icons/color.png" "🎨 Theme Updated" "Wallpaper & system colors applied"

