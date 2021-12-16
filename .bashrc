[[ $- != *i* ]] && { export PATH="$PATH:$HOME/.local/bin"; exit; }

export PS1='\e[0;32m⟨\w⟩\e[0m\n'

set -o vi
set -P

alias cp='cp -uiv'
alias l='ls -C --group-directories-first -F --color=never'
alias la='ls -1Alh --group-directories-first -F --color=never'
alias less='less -SI'
alias ll='ls -1 --group-directories-first -F --color=never'
alias mv='mv -uiv'
alias rm='rm -vi'
alias rmdir='rmdir -v'

alias git0='git --git-dir=$HOME/.git-global'

alias v='nvim -i $XDG_STATE_HOME/nvim/shada'

test -e $(which doas) &&\
	alias doas='doas -u root'

test -e $XDG_CONFIG_HOME/shell/bashrc &&\
	. $XDG_CONFIG_HOME/shell/bashrc
