alias pm="python manage.py"
alias pmrs="python manage.py runserver"
alias pmsa="python manage.py startapp"
alias pmsp="python manage.py startproject"
alias pmsdb="python manage.py syncdb"
alias unset-django="unset $DJANGO_SETTINGS_MODULE"
alias set-django="export DJANGO_SETTINGS_MODULE="
# either you can pass a directory with "settings" in it OR
# it will just grab the name of the current working directory
pdjango () {
    if (( $# == 0))
    then
        DJANGO_SETTINGS_MODULE=${PWD##*/}.settings python
    else
        DJANGO_SETTINGS_MODULE=$1.settings python
    fi
}
alias pd=pdjango
