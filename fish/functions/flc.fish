function flc --description 'Fuzzy open a config file in Neovim'
    set -l target (find ~/.config -mindepth 1 -maxdepth 2 \( -type d -printf "%P/\n" -o -type f -printf "%P\n" \) | fzf --height=40% --reverse --border)
    or return

    cd ~/.config
    and nvim $target
end
