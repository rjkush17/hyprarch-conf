function _fzf_compgen_dir
    fd --type=d --hidden --exclude .git . $argv[1]
end
