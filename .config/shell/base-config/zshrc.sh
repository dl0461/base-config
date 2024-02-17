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

if [[ $- == *i* ]]; then
	stty stop undef
	stty start undef
fi

autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zmodload zsh/complist
compinit
_comp_options+=(globdots)
fpath=($DTA/zsh/site-functions $fpath) # put completion scripts in site-functions (like _docker)

zle-keymap-select() {
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;
        viins|main) echo -ne '\e[6 q';;
    esac
}
zle-line-init() {
    zle -K viins
    echo -ne "\e[6 q"
}

zle -N zle-keymap-select
zle -N zle-line-init

#bindkey -M menuselect '^N' down-line-or-search
#bindkey -M menuselect '^P' up-line-or-search
bindkey -M menuselect '^N' vi-forward-char
bindkey -M menuselect '^P' vi-backward-char

bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^W' backward-delete-word

bindkey -s '^O' 'cd ..^M'

alias \
	cp='cp -i' \
	grep='grep -E' \
	less='less -SIR' \
	mv='mv -i' \
	rsync='rsync --progress'\

alias sgpt='if [[ -z "$OPENAI_API_KEY" ]]; then
				export OPENAI_API_KEY=$(gpg --decrypt $CFG/openai/key.txt.gpg 2>/dev/null)
				if [[ -z "$OPENAI_API_KEY" ]]; then
					echo "Error: Unable to decrypt OPENAI_API_KEY."
					return 1
				fi
			fi
			"$BIN/sgpt"'

source_extra() {
	setopt localoptions nullglob
	for d in $(find "$CFG"/shell -name '*-config' | grep -v 'base-config'); do
		if [ -f "$d"/"$1" ]; then
			. "$d"/"$1"
		fi
	done
}

source_extra 'zshrc.sh'
