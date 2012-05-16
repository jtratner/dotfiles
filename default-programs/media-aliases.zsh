# set default programs to open files
# just type filename if a supported filetype
# TODO: write this as per-system, so can do differently for osx
#
alias -s pdf=xpdf
# I set up a separate $DEFAULTEDITORFAULTEDITOR so I can change it on the fly without
# affecting other editor calls

# let me choose which editor on the fly

function change-default-editor() {
export DEFAULTEDITOR=$1
alias -s zsh=$DEFAULTEDITOR txt=$DEFAULTEDITOR sh=$DEFAULTEDITOR py=$DEFAULTEDITOR m=$DEFAULTEDITOR rst=$DEFAULTEDITOR markdown=$DEFAULTEDITOR md=$DEFAULTEDITOR
alias -s down=$DEFAULTEDITOR
}

# set our initial editor as vim
change-default-editor vim

alias usegvim="change-default-editor gvim"
alias usevim="change-default-editor vim"
alias usegedit="change-default-editor gedit"
# use octave to open .mat files if nothing else selected
alias -s mat=octave

