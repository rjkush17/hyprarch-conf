#!/bin/bash



# Read battery percentage
battery_level=$(cat /sys/class/power_supply/BAT*/capacity)

# Read charging status
status=$(cat /sys/class/power_supply/BAT*/status)

# Only notify if discharging
if [[ "$status" == "Discharging" ]]; then

    if (( battery_level <= 3 )); then
        notify-send \
            -u critical 
            -i  "$HOME/.config/Script/icons/warning.png" \
            -h "string:sound-name:alarm-clock-elapsed" \
            "󰂎  Hey Human! HELP!" \
            "⚡ I’m running on fumes — only ${battery_level}% left! Plug me in NOW before I black out!"

    elif (( battery_level <= 5 )); then
        notify-send \
            -u critical
            -i "$HOME/.config/Script/icons/warning.png" \
            -h "string:sound-name:alarm-clock-elapsed" \
            "󰢤  Laptop Begs..." \
            "  Battery's at ${battery_level}%. I’m seeing spots. Charger. Now. Please!"

    elif (( battery_level <= 10 )); then
        notify-send \
            -u normal \
            -i "$HOME/.config/Script/icons/battery10.png" \
            -h "string:sound-name:dialog-warning" \
            "󰚥  Just Saying..." \
            "Down to ${battery_level}% battery. Don’t blame me if I pass out mid-code!"

    elif (( battery_level <= 20 )); then
       notify-send \
            -u low \
            -i "$HOME/.config/Script/icons/battery20.png" \
            -h "string:sound-name:message-new-instant" \
            "󰂑  Friendly Battery Memo" \
            "  Hey buddy! I’m at ${battery_level}%. Not panicking yet… but maybe grab my charger?"
    fi

fi
