# Interactive startup commands
function fish_greeting
    echo -ne '\x1b[38;5;16m'  # Set colour to primary
    figlet -f slant Hypr Arch | sed 's/^/    /'
    set_color normal
    fastfetch --key-padding-left 5
end
