# softwares
alias mate="open -a TextMate.app"

# mysql
alias mysql="/usr/local/mysql/bin/mysql"
alias mysqladmin="/usr/local/mysql/bin/mysqladmin"
alias mysqlconfig="/usr/local/mysql/bin/mysql_config"

# django
alias django-start="python ./manage.py runserver"
alias django-projectproject="django-admin.py startproject"
alias django-syncdb="python manage.py syncdb"
alias django-startapp="python manage.py startapp"
alias django-sql="python manage.py sql"
alias django-validate="python manage.py validate"
alias django-shell="python manage.py shell"

# python
alias pyclean='find . -name "*.pyc" -exec rm {} \;'

# colors
export LSCOLORS='DxGxcxdxCxegedabagacad'
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
