#!/bin/bash

# Paths
DUNST_CONFIG="$HOME/.config/dunst/dunstrc"
PYWAL_CACHE="$HOME/.cache/wal/colors"

# Read Pywal colors
bg=$(sed -n '1p' "$PYWAL_CACHE")    # color0 - background
fg=$(sed -n '3p' "$PYWAL_CACHE")    # color2 - text
accent=$(sed -n '2p' "$PYWAL_CACHE") # color1 - frame/accent

# Use sed to update all urgency sections
sed -i -E \
    -e "/^\[urgency_low\]/,/^\[.*\]/ s/^background = .*/background = \"$bg\"/" \
    -e "/^\[urgency_low\]/,/^\[.*\]/ s/^foreground = .*/foreground = \"$fg\"/" \
    -e "/^\[urgency_low\]/,/^\[.*\]/ s/^frame_color = .*/frame_color = \"$accent\"/" \
    -e "/^\[urgency_normal\]/,/^\[.*\]/ s/^background = .*/background = \"$bg\"/" \
    -e "/^\[urgency_normal\]/,/^\[.*\]/ s/^foreground = .*/foreground = \"$fg\"/" \
    -e "/^\[urgency_normal\]/,/^\[.*\]/ s/^frame_color = .*/frame_color = \"$accent\"/" \

    # for enable color chnage the urgency notification uncomment the below lines
    # -e "/^\[urgency_critical\]/,/^\[.*\]/ s/^background = .*/background = \"$bg\"/" \
    # -e "/^\[urgency_critical\]/,/^\[.*\]/ s/^foreground = .*/foreground = \"$fg\"/" \
    # -e "/^\[urgency_critical\]/,/^\[.*\]/ s/^frame_color = .*/frame_color = \"$accent\"/" \
    "$DUNST_CONFIG"

# Restart Dunst
killall dunst && dunst &
