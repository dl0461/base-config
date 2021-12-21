autoload -U compinit

PS1="%B%F{12}%n@%m %~%F{reset_color}%b"$'\n'

export KEYTIMEOUT=1

setopt CHASE_LINKS
setopt HASH_CMDS
setopt HASH_DIRS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS

stty stop undef

zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

zle-keymap-select() {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;
        viins|main) echo -ne '\e[5 q';;
    esac
}
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}

zle -N zle-keymap-select
zle -N zle-line-init

bindkey -M menuselect '^N' vi-forward-char
bindkey -M menuselect '^P' vi-backward-char
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^W' backward-delete-word

bindkey -s '^O' 'cd ..^M'

alias \
	cp='cp -iv' \
	grep='grep -E' \
	less='less -SIR' \
	mv='mv -iv' \
	rm='rm -i' \
	rmdir='rmdir -v' \
	rsync='rsync --progress'\
	tmux='tmux -f $CFG/tmux/tmux.conf'

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

[ -f "$S1/zshrc.sh" ] && . "$S1/zshrc.sh"
