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
export S0=$XDG_CONFIG_HOME/shell/0
export S1=$XDG_CONFIG_HOME/shell/1

export B0=$BIN/0
export EDITOR=$(which nvim)
export HISTFILE=$XDG_STATE_HOME/zsh/histfile
export HISTSIZE=300
export LESSCHARSET=utf-8
export LESSHISTFILE=-
export MANPAGER='nvim +Man!'
export NO_COLOR='nocolor'
export PAGER=$(which less)
export SAVEHIST=300
export VISUAL=$EDITOR
export ZDOTDIR=$HOME

export PATH=$PATH:$BIN:$(find "$BIN" -type d -name '[0-9]' -printf '%p:')

[ "$SSH_AGENT_PID" ] || eval "$(ssh-agent)" > /dev/null

[ "$TMUX" ] || trap "ssh-agent -k > /dev/null" EXIT

[ -f "$S1/zprofile.sh" ] && . "$S1/zprofile.sh"
