# thanks goes to Doug Hellman and his wonderful tips page
# http://www.doughellmann.com/docs/virtualenvwrapper/tips.html#zsh-prompt

for postactivate:
PS1="$_OLD_VIRTUAL_PS1"
_OLD_RPROMPT="$RPROMPT"
RPROMPT="%{${fg_bold[white]}%}(env: %{${fg[green]}%}`basename \"$VIRTUAL_ENV\"`%{${fg_bold[white]}%})%{${reset_color}%} $RPROMPT"
rehash

for postdeactivate

RPROMPT="$_OLD_RPROMPT"
rehash
