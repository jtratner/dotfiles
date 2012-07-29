### some functions for macvim, from natw's dotfiles
alias vims='mvim --servername VIM'

vimr() {
    vim_instances=( $(mvim --serverlist) )
    if (( ${#vim_instances} )); then
        mvim --servername $vim_instances[-1] --remote-tab-silent $argv
    else
        mvim --servername VIM $argv
    fi
}

vimcd() {
    # change the working directory of the newest macvim instance to the current directory
    # or, if argument provided, use macvim instance with that name
    vim_instances=( $(mvim --serverlist) )
    local inst
    if [[ -n $argv ]] then
        inst=$argv
    else
        inst=$vim_instances[-1]
    fi
    mvim --servername $inst --remote-send ":cd `pwd`<CR>"
}

