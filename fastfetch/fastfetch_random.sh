#!/bin/bash

# Define an array of image paths
images=(
    "~/.config/fastfetch/arch.png"
    "~/.config/fastfetch/logo.png"
)
# Pick a random image
random_img="${images[RANDOM % ${#images[@]}]}"

# Run fastfetch with the random image
fastfetch --kitty-direct "$random_img"

