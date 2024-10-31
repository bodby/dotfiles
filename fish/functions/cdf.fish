function cdf
    set -l files

    if test "$argv" != ""
        set files (find -type d | __fish_fzf +m -q "$argv")
    else
        set files (find -type d | __fish_fzf +m)
    end

    if test "$status" = 0
        cd $files
    else
        return 1
    end
end
