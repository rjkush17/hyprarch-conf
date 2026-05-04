function fp --description 'Fuzzy open a project in Neovim'
    set -l proj (find ~/Projects -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | fzf --height=40% --reverse --border)
    or return

    cd ~/Projects/$proj
    and nvim .
end
