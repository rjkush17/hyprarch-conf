#!/bin/bash

# Directory containing images
img_dir="$HOME/.config/fastfetch/Images"

# Get all PNG images in the folder
mapfile -t images < <(find "$img_dir" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \))

# Exit if no images found
[[ ${#images[@]} -eq 0 ]] && echo "No images found in $img_dir" && exit 1

# Pick a random image
random_img="${images[RANDOM % ${#images[@]}]}"

# Run fastfetch with the random image
fastfetch --kitty-direct "$random_img"

