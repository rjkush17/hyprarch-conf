function _fzf_compgen_path
    fd --hidden --exclude .git . $argv[1]
end
