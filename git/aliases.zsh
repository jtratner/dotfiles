# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
# hub_path=$(which hub)
# if [[ -f $hub_path ]]
# then
#   alias git=$hub_path
# fi

# The rest of my fun git aliases
alias gl='git lol'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit --amend -C HEAD'
alias ga="git add -p"
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias grc="git rebase --continue"
alias gpb="git pb"

gcm() {
    ARGS="$@"
    git commit -m "$ARGS"
}


# cd to the current git or hg repo root
rr() {
    local dir="."
    until ( [[ -a "$dir/.git" ]] || [[ -a "$dir/.hg" ]] ); do
        dir="../$dir"
        if [[ $dir -ef / ]]; then
            return 1
        fi
    done
    pushd $dir
}
