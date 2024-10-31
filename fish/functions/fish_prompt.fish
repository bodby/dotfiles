# Variables:
# fish_prompt_bracket_style: 0 for (), 1 for [].
# fish_prompt_multiline: 0 for :, 1 for $ on second line.

function __prompt_segment -S
    if test "$previous_segment" = true
        set_color brcyan
        echo -n ', '
    end
end

function fish_prompt
    set -l exit_code $status
    set -l previous_segment false

    # Current working directory.
    set_color brblue
    echo -n (prompt_pwd -d 0)

    # Extra info in parenthesis.
    set_color brcyan
    if test "$fish_prompt_bracket_style" = 1
        echo -n '['
    else
        echo -n '('
    end

    # Warn if git isn't installed.
    if not command -sq git
        __prompt_segment

        set_color brred
        echo -n "git not found"
        set previous_segment true
    else
        if not set -l branch (command git symbolic-ref --short HEAD 2>/dev/null)
            set branch (command git describe --contains --all HEAD 2>/dev/null)
        end

        # Current git branch.
        __prompt_segment
        set_color normal
        if test -n "$branch"
            echo -n "$branch"
            set previous_segment true
        # else
            # echo -n 'none'
            # set previous_segment true
        end
    end

    # Show if user is in nix-shell.
    if test -n "$IN_NIX_SHELL"
        __prompt_segment

        set_color normal
        echo -n "nix-shell"
        set previous_segment true
    end
    # Return code if not zero.
    if test "$exit_code" != 0
        __prompt_segment

        set_color f78c6c
        echo -n "$exit_code"
        set previous_segment true
    end

    set_color brcyan
    if test "$fish_prompt_bracket_style" = 1
        echo -n ']'
    else
        echo -n ')'
    end

    if test "$fish_prompt_multiline" = 1
        echo -ne '\n> '
    else
        echo -n ': '
    end

    set_color normal

    __fish_prompt_newline
end
