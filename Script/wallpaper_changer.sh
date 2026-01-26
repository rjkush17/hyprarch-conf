#!/bin/bash
# ==========================================================
# Wallpaper Manager — Hyprland (swww + wal + matugen)
# ----------------------------------------------------------

# ----------------------------------------------------------
# 1. Ensure swww daemon is running
# ----------------------------------------------------------
if ! pgrep -x swww-daemon > /dev/null; then
    swww-daemon &
    swww clear
    # Give the daemon time to initialize
    sleep 0.5
fi

# ----------------------------------------------------------
# 2. Select a random wallpaper
# ----------------------------------------------------------
WALLPAPER=$(find "$HOME/Wallpapers/hyprland/" \
    -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

# Abort if no wallpaper is found
if [ -z "$WALLPAPER" ]; then
    notify-send -i error "Wallpaper Error" "No valid wallpaper found!"
    exit 1
fi

# ----------------------------------------------------------
# 3. Pick a random transition for swww
# ----------------------------------------------------------
TRANSITION_TYPES=(
    "wipe"
    "center"
    "outer"
    "left"
    "right"
    "top"
    "bottom"
)

RANDOM_TRANSITION=${TRANSITION_TYPES[$((RANDOM % ${#TRANSITION_TYPES[@]}))]}

# ----------------------------------------------------------
# 4. Apply wallpaper with smooth transition
# ----------------------------------------------------------
swww img "$WALLPAPER" \
    --transition-type "$RANDOM_TRANSITION" \
    --transition-duration 1.8

# Wait for transition to complete
sleep 2.2

# ----------------------------------------------------------
# 5. Regenerate colors (pywal + matugen)
# ----------------------------------------------------------
wal -i "$WALLPAPER" -q
matugen image "$WALLPAPER"

# ----------------------------------------------------------
# 6. Update notification daemon colors
# ----------------------------------------------------------
# ~/.config/Script/update_dunst_colors.sh
