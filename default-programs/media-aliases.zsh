# set default programs to open files
# just type filename if a supported filetype
# TODO: write this as per-system, so can do differently for osx
#
alias -s pdf=`where xpdf`
# I set up a separate $DEFAULTEDITORFAULTEDITOR so I can change it on the fly without
# affecting other editor calls
export DEFAULTEDITOR=`where vim`
alias -s zsh=$DEFAULTEDITOR txt=$DEFAULTEDITOR sh=$DEFAULTEDITOR py=$DEFAULTEDITOR m=$DEFAULTEDITOR rst=$DEFAULTEDITOR markdown=$DEFAULTEDITOR md=$DEFAULTEDITOR
alias -s down=$DEFAULTEDITOR

# let me choose which editor on the fly
alias usegvim="export DEFAULTEDITOR=`where gvim`"
alias usevim="export DEFAULTEDITOR=`where vim`"
alias usegedit="export DEFAULTEDITOR=`where gedit`"

# use octave to open .mat files if nothing else selected
alias -s mat=`where octave`

