autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

# this can be slow (but ofen it's other conflicts), if it's slowing down
# try disabling this for a bit
git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo " on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo " on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  /usr/bin/git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}



directory_name(){
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

user_name() {
    echo "%{$fg_bold[green]%}%n%{$reset_color%}"
}

host_name(){
  echo "%{$fg_bold[blue]%}%m%{$reset_color%}"
}

export PROMPT=$'$(user_name) on $(host_name) in $(directory_name)$(git_dirty)$(need_push)\n›› '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}$(TZ='America/New_York' date +'%l:%M %b%e')%{$reset_color%}"
}

virtualenv_prompt(){
  echo "%{$fg_bold[yellow]%}$(%M | awk '{print $1}')%{$reset_color%}"
}

alias rvm-prompt="$HOME/.rvm/bin/rvm-prompt"

# basically, only show the rvm-prompt if it exists
rvm_prompt () {
  if [[ -e `which rvm-prompt`]]; then
      echo "%{$fg_bold[yellow]%}$(rvm-prompt)%{reset_color%}"
  else
      echo ""
  fi
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
