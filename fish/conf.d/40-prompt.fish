# Starship prompt

if status is-interactive; and command -q starship
    starship init fish | source
end
