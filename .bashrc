#
# ~/.bashrc
#
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $- = *i* ]] && source ~/Build/liquidprompt/liquidprompt

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
WORKON_HOME=~/.virtualenv
source /usr/bin/virtualenvwrapper.sh

export PATH="$PATH:$HOME/bin"

export EDITOR="nvim"
export BROWSER="iceweasel"

alias vim="nvim"
alias nv="nvim"

alias cd..="cd .."
alias ..="cd .."

alias startphp="php -S localhost:8000"

export PATH="$PATH:/usr/bin/elixir"
