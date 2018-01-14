# set alias
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias dcomp='docker-compose'

alias g='git'

alias dlogs='docker logs --tail 40'

### Color setting
# for bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# git bash_completion
# git bash_completion
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# Prompt color
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
#export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
# LSCOLORS
export LSCOLORS=gxfxcxdxbxegedabagacad
export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

#spark
export SPARK_HOME=$(brew --prefix)/Cellar/apache-spark/2.2.0/libexec/
export PATH=$PATH:$SPARK_HOME/bin
export SPARK_EXECUTOR_MEMORY=8G

#jupyter spark
export PYSPARK_PYTHON=$(brew --prefix)/opt/python/libexec/bin/python

#Hadoop
export HADOOP_HOME=$(brew --prefix)/Cellar/hadoop/2.8.2

#Scala
export PATH="/usr/local/opt/scala@2.11/bin:$PATH"

