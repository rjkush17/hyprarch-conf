#!/bin/bash

# Use awk to remove the first column (number and hash) from the cliphist list output
selected=$(cliphist list | awk '{$1=""; print substr($0,2)}' | rofi -theme ~/.config/rofi/clipboard.rasi -dmenu -p "Clipboard" -show-icons)

if [ -n "$selected" ]; then
  cliphist decode <<< "$selected" | wl-copy
  sleep 0.1  # small delay to ensure clipboard is updated
  wtype "$selected"
fi
