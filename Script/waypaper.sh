#!/bin/bash
pkill waypaper
sleep 3
WALLPAPER=$(swww query | sed -n 's/.*image: \(.*\)$/\1/p')

matugen image "$WALLPAPER" --source-color-index 0 -m dark --type scheme-vibrant


