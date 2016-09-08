#
# ~/.bashrc
#
export EDITOR="vim"
export TERMINAL="urxvt"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#dont put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# append to the history file, dont overwrite it
shopt -s histappend

#eval $(dircolors -b ~/.dir_colors)

#base16 shell
#BASE16_SHELL= "$HOME/.config/base16-shell/base16-default.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

[[ "$PS1" ]] && echo -e "\e[1;36m$(/usr/bin/fortune)\e[0m"


#aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias bc='bc -l'
alias startx='startx &> ~/.xlog'
alias killchrome='sudo kill -9 `pgrep chrome`'
