#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#enable color output for common commands
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color-auto'
alias egrep='egrep --clor=auto'
alias bc='bc -l'


alias wuvt='ssh -t pi@192.168.1.7 /bin/bash -ic wuvt'
alias stopwuvt='ssh -t pi@192.168.1.7 /bin/bash -ic stopwuvt'


export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m' #begin blink
export LESS_TERMCAP_md=$'\E[1;36m' #begin bold
export LESS_TERMCAP_me=$'\E[0m' #reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' #begin reverse video
export LESS_TERMCAP_se=$'\E[0m' #reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m' #begin underline
export LESS_TERMCAP_ue=$'\E[0m' #reset underline
export LESS_TERMCAP_=$'\E[1;31m'

#code syntax highlighting in less
#export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
#export LESS='-R '

#colored man pages
man() {
LESS_TERMCAP_mb=$'\E[1;31m'
LESS_TERMCAP_md=$'\E[1;36m'
LESS_TERMCAP_me=$'\E[0m'
LESS_TERMCAP_so=$'\E[01;44;33m'
LESS_TERMCAP_se=$'\E[0m'
LESS_TERMCAP_us=$'\E[1;32m'
LESS_TERMCAP_ue=$'\E[0m'
command man "$@"
}



export EDITOR="vim"
#export TERMINAL="gnome-terminal"
#export TERM="gnome-terminal"
export BROWSER="firefox"

#prompt
#PS1='[\u@\h \W]\$ '
[[ "$PS1" ]] && echo -e "\e[1;36m$(/usr/games/fortune)\e[0m"


#command not found hook
#source /usr/lib/command-not-found

#additional bash completion
#source /usr/share/bash-completion/bash_completion

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
if [ -f /usr/share/bash-completion/bash_completion ]; then
. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
fi


#auto enter path without cd
shopt -s autocd

#prevent overwrite of files
#to manually overwrite: 'echo "foo" >| file.txt'
set -o noclobber

#line wrap on window resize
shopt -s checkwinsize

#append to history file, don't overwrite it
shopt -s histappend

# Unlimited history list / file size
HISTSIZE=1000
HISTFILESIZE=2000

#don't put duplicate liens or lines starting with space in the history
#see bash(1) fro more options
HISTCONTROL=ignoreboth

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

#dotnet core env variables
#export DOTNET_ROOT=/opt/dotnet
#export MSBuildSdksPath="/opt/dotnet/sdk/2.2.108/Sdks/";
#export DOTNET_ROOT=/opt/dotnet
#export MSBuildSDKsPath="/opt/dotnet/sdk/3.1.101/Sdks"
export DOTNET_ROOT=/usr/share/dotnet
export MSBuildSDKsPath="/usr/share/dotnet/sdk/3.1.101/Sdks/"

#disable vs coode telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT='true'

#enable wayland support
#export MOZ_ENABLE_WAYLAND=1
#export BEMENU_BACKEND=wayland
#export QT_QPA_PLATFORM=wayland-egl
#export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
#export _JAVA_AWT_WM_NONREPARENTING=1

#source nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#nvm bash completion
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
