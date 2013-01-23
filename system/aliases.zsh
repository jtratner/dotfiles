
# in linux, -G just omits the group from -l listing.  gg apple, or bsd, or whomever
case $OSTYPE in
    linux*)
        alias ls='ls --color=auto -h'
    ;;
    darwin*)
        alias ls='ls -GHh'
    ;;
esac

alias sr='screen -r'
alias hgst='hg st'

#alias vimdiff="vimdiff -c 'map q :qa!<CR>'"
# Inline aliases, zsh -g aliases can be anywhere in command line
alias -g G='| grep -'
alias -g L='| less'

#this reduces a command like
#ls | grep foo | less
#to 
#ls G foo L
# 
alias -g T=' | tee ~/scratch/tee.txt '       # tee
alias -g F=' | fmt -'                     # format
alias -g W=' | wc -l'                     # wc

# .. aliases
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# deep shortcuts
hash -d d="$HOME/Dropbox"
hash -d dot="$HOME/dotfiles"
hash -d b="$HOME/bridge"

