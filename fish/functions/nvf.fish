function nvf
    set -l files

    if test "$argv" != ""
        set files (find -type f | __fish_fzf --select-1 -q "$argv")
    else
        set files (find -type f | __fish_fzf)
    end

    if test "$status" = 0
        nvim $files
    else
        return 1
    end
end
