export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export BIN=$HOME/.local/bin
export CFG=$XDG_CONFIG_HOME
export DTA=$XDG_DATA_HOME

export EDITOR=$(which nvim)
export HISTFILE=$XDG_STATE_HOME/zsh/histfile
export HISTSIZE=300
export LESSCHARSET=utf-8
export LESSHISTFILE=-
# export MANPAGER='nvim +Man!'
export MANPAGER=$(which less)
export PAGER=$(which less)
export SAVEHIST=300
export VISUAL=$EDITOR
export ZDOTDIR=$HOME

export PATH=$PATH:$BIN:$(find "$BIN" -maxdepth 1 -type d -name '*-config' -printf '%p:')

[ "$SSH_AGENT_PID" ] || eval "$(ssh-agent)" > /dev/null

source_extra () {
	setopt localoptions nullglob
	for dir in "$CFG"/*-config; do
		if [ -d "$dir" ]; then
			for file in "$dir"/"$1"; do
				if [ -f "$file" ]; then
					. "$file"
				fi
			done
		fi
	done
}

source_extra 'zprofile.sh'