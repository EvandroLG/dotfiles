# fix to problem with sudo on mountain lion
sudo () { ( unset LD_LIBRARY_PATH DYLD_LIBRARY_PATH; exec command sudo $* ) }

# aliases
alias sourceprofile="source ~/.bash_profile"

# softwares
alias subl="open -a /Applications/Sublime\ Text\ 2.app/"

# mysql
alias mysql="/usr/local/mysql/bin/mysql"
alias mysqladmin="/usr/local/mysql/bin/mysqladmin"
alias mysqlconfig="/usr/local/mysql/bin/mysql_config"
export PATH=$PATH:/usr/local/mysql/bin
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# python
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pipuninstallall="pip freeze | xargs pip uninstall -y"

# colors
export LSCOLORS='DxGxcxdxCxegedabagacad'
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# load virtualenvwraper into a shell session
source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source /usr/local/bin/virtualenvwrapper.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
