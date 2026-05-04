function extract --description 'Extract common archive formats'
    if test (count $argv) -eq 0
        echo 'Usage: extract FILE'
        return 1
    end

    set -l archive $argv[1]

    if not test -f $archive
        echo "'$archive' is not a valid file"
        return 1
    end

    switch $archive
        case '*.tar.bz2' '*.tbz2'
            tar xjf $archive
        case '*.tar.gz' '*.tgz'
            tar xzf $archive
        case '*.tar.xz' '*.tar'
            tar xf $archive
        case '*.bz2'
            bunzip2 $archive
        case '*.rar'
            unrar x $archive
        case '*.gz'
            gunzip $archive
        case '*.zip'
            unzip $archive
        case '*.Z'
            uncompress $archive
        case '*.7z'
            7z x $archive
        case '*'
            echo "'$archive' cannot be extracted via extract"
            return 1
    end
end
