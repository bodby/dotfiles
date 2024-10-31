function __fish_fzf
  set -lx FZF_DEFAULT_OPTS_FILE '/home/bodby/.config/fzf/fzf.cfg'
  fzf $argv
end
