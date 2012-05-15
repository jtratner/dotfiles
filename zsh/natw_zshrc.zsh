## ENVIRONMENT

# add natw's neat custom files (TODO: change this because probably unnecessary with Holman's sourcing setup)
# however, there seem to be some conflicts between files, so I'm disabling a lot of stuff
#fpath=(
#    "$HOME/.zsh/zsh-completions"
#    "$HOME/.zsh/functions"
#    "/usr/local/share/zsh/site-functions"
#    "/usr/local/share/zsh/4.3.10/functions"
#    "/usr/local/share/zsh/4.3.9/functions"
#    "/usr/share/zsh/functions"
#    "/usr/share/zsh/functions/Completion"
#    "$fpath[@]"
#)
# remove duplicates from fpath
#typeset -U fpath
#export fpath
export VISUAL="vim"
export EDITOR="vim"
export LC_CTYPE=en_US.UTF-8
export LC_TYPE=$LC_CTYPE
#export MANPATH=$MANPATH:/usr/local/man:/opt/local/share/man
#export LESS="FSRX"

export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENV_USE_DISTRIBUTE=true
export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_LOG_DIR="$HOME/.virtualenvs"
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true # best option

#export RUBYOPT=rubygems
export GRIN_ARGS="--force-color"

export HISTFILE=~/.zhistory
export HISTSIZE='100000'
export SAVEHIST='100000'
export WORDCHARS=${WORDCHARS//[\/.]}

# for stupid BSD ls (osx)
export LSCOLORS="Dxgxcxdxcxegedabagacad"
# for GNU ls (linux) (I wonder what this looks like)
export LS_COLORS='di=93:fi=0:ln=96:pi=5:so=5:bd=5:cd=5:or=31:mi=31:ex=32'


#### OPTIONS
#
setopt extendedglob
setopt hist_ignore_dups
setopt extended_history # append history entries w/ timestamp
setopt inc_append_history
setopt hist_fcntl_lock # better locking for history file.  maybe doesn't work everywhere
setopt HIST_IGNORE_SPACE # don't write commands starting with space to history

setopt multibyte # maybe enabled by default
#setopt no_beep # HATE. BEEPS.
setopt short_loops # they see me loopin', they hatin'

setopt autocd # evaluating a dir name cds to that dir
setopt auto_pushd # push dirs to the stack
setopt pushd_ignore_dups
setopt pushd_silent
#
#ulimit -c 0 # no process limit?
setopt prompt_subst # allow variable substitution in the prompt
setopt c_bases # output hex and octal in better format.  what the hell?

### ALIASES

# in linux, -G just omits the group from -l listing.  gg apple, or bsd, or whomever
case $OSTYPE in
    linux*)
        alias ls='ls --color=auto -Hh'
    ;;
    darwin*)
        alias ls='ls -GHh'
    ;;
esac

alias sr='screen -r'
alias svns='svn status -u'
alias pgrep='pgrep -fiL'
alias hgst='hg st'
#alias vimdiff="vimdiff -c 'map q :qa!<CR>'"

# fancy renaming
autoload -U zmv
alias mmv='noglob zmv -W'
#
#alias vims='mvim --servername VIM'
#
#vimr() {
#    vim_instances=( $(mvim --serverlist) )
#    if (( ${#vim_instances} )); then
#        mvim --servername $vim_instances[-1] --remote-tab-silent $argv
#    else
#        mvim --servername VIM $argv
#    fi
#}
#
#vimcd() {
#    # change the working directory of the newest macvim instance to the current directory
#    # or, if argument provided, use macvim instance with that name
#    vim_instances=( $(mvim --serverlist) )
#    local inst
#    if [[ -n $argv ]] then
#        inst=$argv
#    else
#        inst=$vim_instances[-1]
#    fi
#    mvim --servername $inst --remote-send ":cd `pwd`<CR>"
#}
#
alias rl="tail -f log/development.log"
alias sc="script/console"
alias ss="script/server"
alias be='bundle exec'

#autoload edit-command-line
#zle -N edit-command-line
#bindkey "^X" edit-command-line
#bindkey -M vicmd v edit-command-line



#### Key Bindings

bindkey -v
# vim key bindings, but there are a few emacs bindings I like
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# somehow I survived for years without this.  They called it living, but I'm not so sure.
bindkey "^R" history-incremental-search-backward

# pushes the current command to a buffer, lets you do something else, then
# brings you back to what you were doing
bindkey "^P" push-line
bindkey "^L" clear-screen

# the magic history, just like tcsh has
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# up arrow or ^o will complete the current command based on a history search from most recent back
# ^o because sometimes that up arrow is just so far away
bindkey '\e[A' history-beginning-search-backward-end # up
bindkey "^O" history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end # down
bindkey "^N" history-beginning-search-forward-end # ^N

bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line # end
bindkey "^[[3~" delete-char # delete


### COMPLETION

#setopt correct # correct commands
#setopt autolist # list completion candidates

#zmodload -i zsh/complist
#autoload -U zstyle+
#autoload -U compinit
#compinit -C

#_force_rehash() {
#    (( CURRENT ==1 )) && rehash
#    return 1
#}

#zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix

#local _myhosts
#_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
#zstyle ':completion:*' hosts $_myhosts

## formatting and messages
#zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors "${LS_COLORS}" # just setting ZLS_COLORS works too, I guess
## describe options presented at completion
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}%d%{\e[0m%}'
zstyle ':completion:*:messages' format $'%{\e[0;31m%}%d%{\e[0m%}'
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for: %d%{\e[0m%}'
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*' group-name ''

## determine in which order the names (files) should be
## listed and completed when using menu completion.
## `size' to sort them by the size of the file
## `links' to sort them by the number of links to the file
## `modification' or `time' or `date' to sort them by the last modification time
## `access' to sort them by the last access time
## `inode' or `change' to sort them by the last inode change time
## `reverse' to sort in decreasing order
## If the style is set to any other value, or is unset, files will be
## sorted alphabetically by name.
zstyle ':completion:*' file-sort name

## case-insensitive (uppercase from lowercase) completion
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
### case-insensitive (all) completion
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## case-insensitive,partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

## insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

## ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

## completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zcompcache/$HOST

## add colors to completions
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-colors $ZLS_COLORS
# zstyle ':completion:*:default' list-colors ''

## don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

## filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.(o|c~|old|pro|zwc|pyc)'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' command 'ps -axco pid,user,command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

## the only candidates for completion after 'nosetests' will be .py files
zstyle ':completion:*:*:nosetests:*:*' file-patterns '*.py' 

# commands that have nice --help output and I want to complete arguments for
compdef _gnu_generic nosetests

# pip zsh completion start
export COMP_WORDS=""
function _pip_completion {
#   print "HELLO"
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS=$words
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end



### FUNCTIONS

#
#autoload -Uz vcs_info # for pulling info from version control systems
## precmd is a builtin function that is called before every rendering of the command prompt
#precmd() {
#    echo -ne "\033]0;${host_nick}: ${PWD/#$HOME/~}\007"
#    vcs_info
#}
#
#
# # use vimdiff for hg diffs (new version on right side)
# hgdiff() {
#     vimdiff <(hg cat "$1") "$1";
# }
# 
# 
# # I hope I never need this again
# function hg-svn-merge-branch() {
#     local targetrev
#     local striprev
#     targetrev=$(hg id | cut -d ' ' -f 1)
#     hg merge $1
#     hg ci -m "Merging $1"
#     striprev=$(hg id | cut -d ' ' -f 1)
#     hg co $targetrev
#     hg diff -r$targetrev:$striprev | hg import - -m "Merged branch $1."
#     hg strip $striprev
# }

# cd to the current git or hg repo root
rr() {
    local dir="."
    until ( [[ -a "$dir/.git" ]] || [[ -a "$dir/.hg" ]] ); do
        dir="../$dir"
        if [[ $dir -ef / ]]; then
            return 1
        fi
    done
    cd $dir
}



### Version Control Info (rprompt)

# TODO: Fix my 'the system knows it's colored but the shell doesn't issue. For now I'm just autoloading all colors stuff
#if (($(tput colors) == 256)) {
    autoload spectrum && spectrum # this way, if the terminal doesn't support 256 colors,
                                  # the spectrum arrays just won't exist, and there won't be any color
#}

#zstyle ':vcs_info:*' enable svn hg git bzr cvs darcs
#zstyle ':vcs_info:*' get-revision true
#zstyle ':vcs_info:*' get-unapplied true
#zstyle ':vcs_info:(hg*|git*):*' check-for-changes true
## zstyle ':vcs_info:hg*:*' use-simple true # a little faster, but I like seeing if there are outstanding changes.
#                                           # maybe only for bzr?
#                                           #
#zstyle ':vcs_info:*' formats "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %i%m$FG[015]]$FG[167]%u%c$FX[reset]"
#zstyle ':vcs_info:*' actionformats "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %i%m $FG[167]$FX[bold]%a$FX[reset]$FG[015]]$FG[167]%u$FX[reset]"
#zstyle ':vcs_info:*' branchformat "%b" # don't show rev in branchformat, use %i for that to pick up head marker
#
## mercurial-specific stuff
#zstyle ':vcs_info:hg*:*' get-mq true
#zstyle ':vcs_info:hg*:*' get-unapplied true
#zstyle ':vcs_info:hg*:*' get-bookmarks true
#zstyle ':vcs_info:hg*:*' unstagedstr "+" # uncommitted changes
#zstyle ':vcs_info:hg*:*' hgrevformat "%r" # only show local revision
#zstyle ':vcs_info:hg*:*' patch-format " $FG[103]%n$FX[reset]/$FG[103]%c %p$FX[reset]" # this should show when patches are applied, but it doesn't
#zstyle ':vcs_info:hg*:*' nopatch-format " $FG[103]Q$FX[reset]" # mq present, but no applied patches
#zstyle ':vcs_info:hg*+set-hgrev-format:*' hooks hg-storerev hg-hashfallback
#zstyle ':vcs_info:hg*+set-message:*' hooks mq-vcs hg-branchhead
#
## git stuff
#zstyle ':vcs_info:git*' unstagedstr "+" # fix these once I learn how git works
#zstyle ':vcs_info:git*' stagedstr "S"
#zstyle ':vcs_info:git*' formats "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %8>>%i%<<%m$FG[015]]$FG[167]%u%c$FX[reset]"
#zstyle ':vcs_info:git*' actionformats "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %8.8i%m $FG[167]$FX[bold]%a$FX[reset]$FG[015]]$FG[167]%u$FX[reset]"
##zstyle ':vcs_info:git*' actionformats "$FG[015]($FG[107]%s$FG[015]|$FG[167]%a$FG[015])-[$FG[221]%u%b%m %12.12i$FG[015]]$FX[reset]"
#
#
#### Store the localrev and global hash for use in other hooks
#function +vi-hg-storerev() {
#    user_data[localrev]=${hook_com[localrev]}
#    user_data[hash]=${hook_com[hash]}
#}
#
#### Show marker when the working directory is not on a branch head
## 'marker' is just coloring the rev red
## This may indicate that running `hg up` will do something
#function +vi-hg-branchhead() {
#    local branchheadsfile i_tiphash i_branchname
#    local -a branchheads
#
#    local branchheadsfile=${hook_com[base]}/.hg/branchheads.cache
#
#    # Bail out if any mq patches are applied
#    [[ -s ${hook_com[base]}/.hg/patches/status ]] && return 0
#
#    if [[ -r ${branchheadsfile} ]] ; then
#        while read -r i_tiphash i_branchname ; do
#            branchheads+=( $i_tiphash )
#        done < ${branchheadsfile}
#
#        if [[ ! ${branchheads[(i)${user_data[hash]}]} -le ${#branchheads} ]] ; then
#            hook_com[revision]="$FX[bold]$FG[124]${hook_com[revision]}$FX[reset]"
#        fi
#    fi
#}
#
#
#export RPROMPT='${vcs_info_msg_0_}'
#
#
#### OTHER
#
#if [ -z host_nick ]; then
#    host_nick = '%m'
#fi
#
## render machine name in red for root users
## this is probably dumb, as it uses root's rc for a root shell, right?
#if [ "x`whoami`" = "xroot" ]; then
#    ucolor=$fg_bold[red]
#else
#    ucolor=$fg_bold[green]
#fi
#
#local _override_ps1
#_override_ps1=false
#
## machine specific settings
#if [[ -a ~/.zshrc-local ]]; then
#    source ~/.zshrc-local
#fi
#
## PS1 depends on info from the local zsh config, but I want the option to
## override it completely from within there as well
#
#if [[ $_override_ps1 = false ]]; then
#    PS1="$FG[015][$FG[107]${host_nick} $FG[173]%~$FG[015]]$FG[107]%# $FX[reset]"
#fi
