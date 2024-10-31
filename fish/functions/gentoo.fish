function gentoo
    set -l options[1] 'Upgrade system'
    set -l options[2] 'Update all packages'
    set -l options[3] 'Clean unused packages and dependencies'
    set -l options[4] 'Sync all repositories'
    set -l options[5] 'Switch to dark wallpaper'
    set -l options[6] 'Switch to light wallpaper'
    set -l options[7] 'Power off'

    set -l args
    for entry in $options
        set args (string join '\n' $args $entry)
    end

    set -l choice (echo -e $args | __fish_fzf +m)

    if test "$status" = 0
        echo "Running command."
    else
        return 1
    end

    switch $choice
        case $options[1]
            echo "NO!"
        case $options[2]
            echo "YES!"
        case $options[5]
            killall swaybg 2>/dev/null
            swaybg -m fill -i ~/.local/share/wallpapers/dark-topography-nix.png 2>/dev/null &; disown
        case $options[6]
            killall swaybg 2>/dev/null
            swaybg -m fill -i ~/.local/share/wallpapers/light-topography.jpg 2>/dev/null &; disown
        case $options[7]
            sudo poweroff
        case '*'
            echo "How did you get here?"
    end
end
