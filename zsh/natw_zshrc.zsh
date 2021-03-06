### Some settings from natw's dotfiles/zshrc
#
# many of these settings are great. many of them I don't understand.
# I'm slowly copying things out to named folders as I decide what I do and
# don't want from them.  For now, it's mostly completions &c
#
## ENVIRONMENT

export LC_CTYPE=en_US.UTF-8
export LC_TYPE=$LC_CTYPE

export HISTFILE=~/.zhistory
export HISTSIZE='100000'
export SAVEHIST='100000'
export WORDCHARS=${WORDCHARS//[\/.]}



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


# fancy renaming
autoload -U zmv
alias mmv='noglob zmv -W'
#

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
setopt autolist # list completion candidates

#zmodload -i zsh/complist
#autoload -U zstyle+
#autoload -U compinit
#compinit -C


#zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix

### Colors (they're important!!)

# for stupid BSD ls (osx)
export LSCOLORS="Dxgxcxdxcxegedabagacad"
# for GNU ls (linux) (I wonder what this looks like)
export LS_COLORS='di=93:fi=0:ln=96:pi=5:so=5:bd=5:cd=5:or=31:mi=31:ex=32'

# TODO: Fix my 'the system knows it's colored but the shell doesn't issue. For now I'm just autoloading all colors stuff
#if (($(tput colors) == 256)) {
    autoload spectrum && spectrum # this way, if the terminal doesn't support 256 colors,
                                  # the spectrum arrays just won't exist, and there won't be any color
#}
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
# zstyle ':completion:*:*:nosetests:*:*' file-patterns '*.py' 


