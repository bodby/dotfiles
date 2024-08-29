# Vim mappings. Cursor shape is defined in .inputrc
set -o vi

# Functions since aliases can't ignore extra args.
cdf() {
	cd $(find -type d | fzy -q "$*")
}

nvf() {
	file=$(find -type f | fzy -q "$*")
	if [[ -z $file ]]; then
		return 0
	fi

	nvim $file
}

# Aliases.
alias obs='wf-recorder -f ~/docs/videos/$(date -dnow +%d_%m_%Y_%I_%M).mkv \
	-r 60 -c av1_nvenc -a \
	$(pactl list sources | grep "Name: alsa_output.usb" | sed "s/\tName://")'
# grimshot
alias gs='grim -g "$(slurp)" -t png \
	~/docs/images/screenshots/"$(date -dnow +%d_%m_%Y_%I_%M_%S).png"'
# neovim
alias nv='nvim'
# ytmp3
alias yt='yt-dlp -x --audio-format flac -o ~/docs/music/%\(title\)s'
# remove trash
alias rmt="gio trash"

# backup dotfiles
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if [[ -v HYPRLAND_INSTANCE_SIGNATURE ]]; then
	export PS1="\[\e[1;35m\] \w \[\e[0;33m\]󰄾 \[\e[m\]"
	export PS2="\[\e[0;36m\]󰄾 \[\e[m\]"

	export LS_COLORS=${LS_COLORS}:"di=1;35"
fi
