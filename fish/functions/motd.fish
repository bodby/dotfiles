function __motd_variable
    if test "$argv[3]" = true
        set_color brblue
    else
        set_color brblack
    end
    echo -n $argv[1]

    set_color brcyan
    echo -n ': '

    set_color normal
    echo -n $argv[2]

    echo -ne '\n'
end

function motd
    __motd_variable 'User' 'admin'
    __motd_variable 'Hostname' 'dumpster-fire'
    __motd_variable 'Uptime' '3 days'
    __motd_variable 'CPU usage' '32.4%'
    __motd_variable 'Memory usage' '4.2 / 8.0 GiB'
    __motd_variable 'Disk usage'
    set_color brcyan; echo -ne "  - "; __motd_variable '/' '4.2 / 8.0 GiB' true
    set_color brcyan; echo -ne "  - "; __motd_variable '/home' '4.2 / 8.0 GiB' true
end
