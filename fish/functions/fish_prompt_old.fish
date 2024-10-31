set __first_prompt false

# Variables:
# fish_prompt_use_icons: 0 or 1
# fish_prompt_dark_icons: 0 or 1
# fish_prompt_dark_prompt: 0 or 1

function __section_icon
  if test "$fish_prompt_use_icons" = 1 2>/dev/null
    if test "$fish_prompt_dark_icons" = 1 2>/dev/null
      set_color brblack
    else
      set_color $argv[2]
    end

    echo -n $argv[1]' '
  end
end

function fish_prompt
  set -l exit_code $status

  __section_icon '󰟀' brmagenta
  set_color brmagenta
  echo -n (hostname)' '

  set_color normal

  __section_icon '󰝰' bryellow
  set_color bryellow
  echo -n (prompt_pwd -d 0)' '

  if not command -sq git
    __section_icon '󰘬' brred
    set_color brred
    echo -n "git not found "
    set_color normal
  else
    if not set -l branch (command git symbolic-ref --short HEAD 2>/dev/null)
      set branch (command git describe --contains --all HEAD 2>/dev/null)
    end

    __section_icon '󰘬' brcyan
    set_color brcyan
    if test -n "$branch"
      echo -n "$branch "
    else
      echo -n "none "
    end
  end

  set_color normal

  if test $exit_code -ne 0
    __section_icon '󰀩' brred
    set_color brred
    echo -n "$exit_code "
  end

  if test $CMD_DURATION -ge 1000
    set -l duration_secs (math $CMD_DURATION / 1000)

    __section_icon '󱎫' brgreen
    set_color brgreen
    echo -n "$duration_secs"'s '
  end

  # __section_icon '󰥔' brblue
  # set_color brblue
  # echo -n (date -dnow +%I:%M\ %p)

  echo -ne '\n'

  # set_color normal
  # switch $fish_bind_mode
  #   case default
  #     set_color brcyan
  #     echo -n 'normal '
  #   case insert
  #     set_color brmagenta
  #     echo -n 'insert '
  #   case visual
  #     set_color brgreen
  #     echo -n 'visual '
  #   case replace
  #     set_color brblue
  #     echo -n 'replace '
  #   case '*'
  #     set_color brcyan
  #     echo -n 'normal '
  # end

  # set_color brcyan
  # echo -ne (whoami)' '

  if test "$fish_prompt_dark_prompt" = 1 2>/dev/null
    set_color brblack
  else
    set_color brwhite
  end

  echo -n '󰄾 '

  set_color normal

  __fish_prompt_newline
end
