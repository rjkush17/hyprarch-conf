# Start the swww daemon if not already running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 0.1
fi

WALLPAPER=$(find ~/Wallpapers/hyprland/ -type f | shuf -n 1)

swww img "$WALLPAPER" --transition-type wipe
wal -i "$WALLPAPER"
