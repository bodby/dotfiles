function fish_right_prompt; end

# function fish_right_prompt
#     set -l exit_code $status
#
#     # if test "$exit_code" -ne 0
#     set_color f78c6c
#     echo -n " $exit_code"
#     set_color normal
#     # end
# end

# function fish_right_prompt
#   set -l exit_code $status
#   tput sc; tput cuu1; tput cuf 2
#
#   if test $exit_code -ne 0
#     set_color brred
#     echo -n "$exit_code "
#   end
#
#   if test $CMD_DURATION -ge 1000
#     set -l duration_secs (math $CMD_DURATION / 1000)
#
#     set_color bryellow
#     echo -n "$duration_secs"'s '
#   end
#
#   set_color brblack
#   echo -n (date -dnow +%I:%M\ %p)
#
#   tput rc
# end
