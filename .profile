test -e $HOME/.bashrc && . $HOME/.bashrc

# XDG Base Directory Specification
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export EDITOR=/usr/bin/nvim
export HISTFILE=$XDG_STATE_HOME/bash_history
export LC_ALL=en_US.UTF-8
export LESS='-RS'
export PAGER=/usr/bin/less
export VIM=$XDG_CONFIG_HOME/nvim
export VIMRUNTIME=/usr/share/nvim/runtime
export VISUAL=$EDITOR

test -e $XDG_CONFIG_HOME/shell/profile &&\
	. $XDG_CONFIG_HOME/shell/profile
