#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

setleds -D +num

xrdb ~/.Xresources

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    exec startx
fi
