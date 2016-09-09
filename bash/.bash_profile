#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

setleds -D +num

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    exec startx
fi
