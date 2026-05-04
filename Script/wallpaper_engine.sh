#!/bin/bash

# Start the swww daemon if not already running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 0.1
fi

# Infinite loop to change wallpaper every 5 minutes
while true; do
    # Select a random wallpaper
    WALLPAPER=$(find ~/Wallpapers/hyprland/ -type f | shuf -n 1)

    # Set the wallpaper using swww
    swww img "$WALLPAPER" --transition-type random

    # Apply color scheme with pywal
    wal -i "$WALLPAPER"

    # Wait for 5 minutes (300 seconds)
    sleep 300
done
