alias pm="python manage.py"
compdef pm=manage.py
alias pmrs="python manage.py runserver"
alias pmsa="python manage.py startapp"
alias pmsp="python manage.py startproject"
alias pmsdb="python manage.py syncdb"
alias unset-django="unset $DJANGO_SETTINGS_MODULE"
alias set-django="export DJANGO_SETTINGS_MODULE="
p-django () {
    DJANGO_SETTINGS_MODULE=$1 python
}
compdef p-django=python
