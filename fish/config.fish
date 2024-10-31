if status is-interactive
  __fish_abbrevs

  # Get these from https://www.bigsoft.co.uk/blog/2008/04/11/configuring-ls_colors and from running dircolors -b
  set LS_COLORS '*.md=00;96:di=00;92:ec=\033[00;96\m:no=00;38'
end
export LS_COLORS
