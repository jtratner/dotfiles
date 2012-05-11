# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
else
  alias ls="ls --color=auto"
fi

# Inline aliases, zsh -g aliases can be anywhere in command line
alias -g G='| grep -'
alias -g L='| less'
#this reduces a command like
#ls | grep foo | less
#to 
#ls G foo L
# 
alias -g R=' > /c/aaa/tee.txt '           # redirect
alias -g T=' | tee /c/aaa/tee.txt '       # tee
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


