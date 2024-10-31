function fish_title
  set -l ssh
  set -q SSH_TTY
  and set ssh 'sshed into ' (prompt_hostname | string collect)

  # SSH hostname
  set -q ssh
  and echo -n -- $ssh

  # Current command
  if set -q argv[1]
    echo -n (string trim $argv[1])
  else
    echo -n (status current-command | string trim)
  end

  echo -n ' in '(prompt_pwd -d 0)
end
