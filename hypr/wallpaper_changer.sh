# Start the swww daemon if not already running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 0.3
fi

WALLPAPER=$(find ~/Wallpapers/hyprland/ -type f | shuf -n 1)
swww img "$WALLPAPER" --transition-type wipe
sleep 1 
wal -i "$WALLPAPER" && ~/.config/wal/set_dunst_colors.sh

pkill waybar && waybar &
