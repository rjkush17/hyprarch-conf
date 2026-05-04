#!/bin/bash

pkill waypaper
sleep 1
WALLPAPER=$(awww query | sed -n 's/.*image: \(.*\)$/\1/p')

# apply KDE colors only if Plasma
if [[ "$XDG_CURRENT_DESKTOP" == *"KDE"* ]]; then
    plasma-apply-wallpaperimage "$WALLPAPER"
fi

matugen image "$WALLPAPER" --source-color-index 0 -m dark --type scheme-vibrant
