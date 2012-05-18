# set default programs to open files
# just type filename if a supported filetype
# TODO: write this as per-system, so can do differently for osx
#
alias -s pdf=xpdf
alias -s mat=octave
# I set up a separate $DEFAULTEDITORFAULTEDITOR so I can change it on the fly without
# affecting other editor calls

# let me choose which editor on the fly

function change-default-editor() {
export DEFAULTEDITOR=$1
alias -s zsh=$DEFAULTEDITOR txt=$DEFAULTEDITOR sh=$DEFAULTEDITOR py=$DEFAULTEDITOR m=$DEFAULTEDITOR rst=$DEFAULTEDITOR 
alias -s down=$DEFAULTEDITOR markdown=$DEFAULTEDITOR md=$DEFAULTEDITOR
}

function remove-default() {
    unalias -s $1
}

# doesn't remove pdf or octave
function remove-all-defaults() {
    unalias -s zsh txt sh py m down markdown md
}
# set our initial editor as vim

alias usegvim="change-default-editor gvim"
alias usevim="change-default-editor vim"
alias usegedit="change-default-editor gedit"
alias usemvim="change-default-editor mvim"
# use octave to open .mat files if nothing else selected
alias radef="remove-all-defaults"
alias rd="remove-default"
