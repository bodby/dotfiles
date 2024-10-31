function __fish_prompt_newline --on-event fish_prompt
    set -l new_line ''
    set new_line "\n"

    echo -ne "$new_line"
end

# Don't show the ^C when Ctrl-C'ing a command.
# function __fish_prompt_clean_clear --on-event fish_cancel
    # tput cuu 2
# end

#function __fish_prompt_prep_transient --on-event fish_preexec
    #set -l line_count (string split '\n' $argv[1] | count)
    # echo $line_count

    # printf \\033\[1A moves up a line.
    # printf \\u001b\[2K clears the current line.
    # printf \\u001b\[0G goes to the start of the line.
    #printf \\033\[1A
    #printf \\033\[K
    #for i in (seq $line_count)
    #    printf \\033\[1A
    #    printf \\033\[K
    #end

    # printf \\u001b\[0G
    #printf \\033\[4B
    #echo -n '> ' $argv[1]
    #printf \\033\[2B
    #printf \\033\[20C
# end

# Short name.
#function __fish_prompt_transient_error_wrapper --on-event fish_posterror
#    __fish_prompt_prep_transient
#end

#function __fish_prompt_transient --on-event fish_postexec
    #printf \\033\[1A
#end
