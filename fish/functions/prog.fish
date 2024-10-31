function __prog_variable
    set_color brblack
    echo -n $argv[1]

    set_color brcyan
    echo -n ': '

    set_color normal
    echo -n $argv[2]

    echo -ne '\n'
end

function prog
    if test "$argv[1]" = "done"
        echo -n 'Finished rebuilding in '
        set_color brmagenta
        echo -n '302 seconds'
        set_color normal
        echo '.'
    else
        __prog_variable 'Hostname' 'fbi-surveillance-vehicle'
        __prog_variable 'Config file' '/etc/nixos/flake.nix'
        __prog_variable 'Action' 'switch'

        echo -ne '\n'

        set_color normal
        echo -n 'Rebuilding system... '

        set_color brblack
        echo -n '3214 '
        set_color brcyan
        echo -n '/ '
        set_color brblack
        echo -n '8424'

        echo -ne '\n'

        set_color brcyan
        echo -n '['

        set_color brgreen
        echo -n '============'

        set_color brblack
        echo -n '--------------------'

        set_color brcyan
        echo -n '] '

        set_color brblack
        echo -n '/'

        echo -ne '\n'
    end
end
