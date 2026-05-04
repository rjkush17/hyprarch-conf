# Aliases

alias fucking='sudo-rs'
alias n='nvim'

alias ..='cd ..'
alias home='cd ~'
alias c='clear'
alias q='exit'
alias conf='cd ~/.config'
alias here='xdg-open .'
alias lg='lazygit'

alias ffind='find . -iname'
alias dus='du -sh * | sort -h'

if command -q eza
    alias ls='eza --icons=always --color=always'
    alias ll='eza --long --icons=always --color=always'
    alias la='eza --long --git --icons=always'
    alias lsa='eza --color=always --long --git --icons=always --time=modified --sort=name'
end

alias t='tmux'
alias ta='tmux attach -t'
alias tl='tmux ls'
alias tk='tmux kill-session -t'
alias tn='tmux new-session "nvim ."'

alias tsrun='npx ts-node --compiler-options "{\"module\":\"CommonJS\"}"'
alias aa='alias'
