#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export RANGER_LOAD_DEFAULT_RC=false

export EDITOR=nvim

if ! [ -x "$command -v nvim)" ]; then
  alias vim='nvim'
fi

source $HOME/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

set -o vi

set completion-ignore-case on
set show-all-if-ambiguous on
