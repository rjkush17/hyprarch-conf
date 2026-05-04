#!/bin/bash

# Read battery percentage
battery_level=$(cat /sys/class/power_supply/BAT*/capacity)

# Read charging status
status=$(cat /sys/class/power_supply/BAT*/status)

# Only notify if discharging
if [[ "$status" == "Discharging" ]]; then

    if (( battery_level <= 3 )); then
        notify-send \
            -u critical \
            -i "$HOME/.config/Script/icons/warning.png" \
            -h "string:sound-name:alarm-clock-elapsed" \
            "󰂎  Critical Battery" \
            "⚡ ${battery_level}% left. Connect power immediately."

    elif (( battery_level <= 5 )); then
        notify-send \
            -u critical \
            -i "$HOME/.config/Script/icons/warning.png" \
            -h "string:sound-name:alarm-clock-elapsed" \
            "󰢤  Low Battery" \
            " ${battery_level}% remaining. Plug in soon."

    elif (( battery_level <= 10 )); then
        notify-send \
            -u normal \
            -i "$HOME/.config/Script/icons/battery10.png" \
            -h "string:sound-name:dialog-warning" \
            "󰚥  Battery Warning" \
            "${battery_level}% left. Save your work."

    elif (( battery_level <= 20 )); then
        notify-send \
            -u low \
            -i "$HOME/.config/Script/icons/battery20.png" \
            -h "string:sound-name:message-new-instant" \
            "󰂑  Battery Notice" \
            " ${battery_level}% remaining. Consider charging soon."
    fi

fi

