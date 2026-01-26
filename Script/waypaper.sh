#!/bin/bash
pkill waypaper
sleep 3
WALLPAPER=$(swww query | sed -n 's/.*image: \(.*\)$/\1/p')

matugen image $WALLPAPER



