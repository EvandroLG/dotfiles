# fix to problem with sudo on mountain lion
sudo () { ( unset LD_LIBRARY_PATH DYLD_LIBRARY_PATH; exec command sudo $* ) }

# aliases
alias sourceprofile="source ~/.bash_profile"
alias ll="ls -lah"
alias findfile="find | grep"
alias edithosts="vim /etc/hosts"

# softwares
alias subl="open -a /Applications/Sublime\ Text\ 2.app/"

# mysql
alias mysql="/usr/local/mysql/bin/mysql"
alias mysqladmin="/usr/local/mysql/bin/mysqladmin"
alias mysqlconfig="/usr/local/mysql/bin/mysql_config"
export PATH=$PATH:/usr/local/mysql/bin
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

#postgres
alias psql="/Applications/Postgres93.app/Contents/MacOS/bin/psql"
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"

# python
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pipuninstallall="pip freeze | xargs pip uninstall -y"

# scala
export PATH=/Applications/sbt/bin:$PATH

# node
alias npmclean='npm -g ls | grep -v "npm@" | awk "/@/ {print $2}" | awk -F@ "{print $1}" | xargs npm -g rm'

# colors
export LSCOLORS='DxGxcxdxCxegedabagacad'
export PS1='\[\033[01;32m\]\u\[\033[01;31m\]\w\[\033[00m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\] ($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi) $ '

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# load virtualenvwraper into a shell session
source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source /usr/local/bin/virtualenvwrapper.sh
