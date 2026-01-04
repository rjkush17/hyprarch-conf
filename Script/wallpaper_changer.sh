#!/bin/bash

# Check if swww-daemon is running, start if not
if ! pgrep -x swww-daemon > /dev/null; then
    swww-daemon &
    swww clear
    # Increased sleep to ensure daemon is fully ready
    sleep 0.5
fi

# Pick a random wallpaper from directory
WALLPAPER=$(find "$HOME/Wallpapers/hyprland/" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

# Exit if no wallpaper found
if [ -z "$WALLPAPER" ]; then
    notify-send -i error "Wallpaper Error" "No valid wallpaper found!"
    exit 1
fi

# Define array of transition types, excluding 'none'
TRANSITION_TYPES=("wipe" "center" "outer" "left" "right" "top" "bottom")

# Select a random transition type
RANDOM_TRANSITION=${TRANSITION_TYPES[$((RANDOM % ${#TRANSITION_TYPES[@]}))]}

# Set wallpaper with random transition type and shorter duration
swww img "$WALLPAPER" --transition-type "$RANDOM_TRANSITION" --transition-duration 1.5
# Wait for transition to complete
sleep 1.6

# Generate Pywal colors silently
wal -i "$WALLPAPER" -q

# Generate Matugen color
matugen image "$WALLPAPER"

# Wait for wal to finish writing
# sleep 0.5
#
# Restart Waybar
# if pgrep -x "waybar" > /dev/null; then
#    killall waybar
#    sleep 0.5
# fi

# waybar &
# Update Dunst colors
~/.config/Script/update_dunst_colors.sh
