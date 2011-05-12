parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
  }
#PS1="\w\$(parse_git_branch) $ "


PATH=/usr/local/bin:$PATH:/opt/local/bin:/opt/local/sbin
export PATH

JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home
PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME PATH
#JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home
#PATH=$JAVA_HOME/bin:$PATH
#export JAVA_HOME PATH

MAVEN_HOME=/opt/local/mvn
export MAVEN_HOME

# MySQL
#
PATH=$PATH:/usr/local/mysql/bin
export PATH


# GIT
PATH=/usr/local/git/bin:$PATH
export PATH

PATH=$PATH:/sw/bin
export PATH

#postgres
PATH=$PATH:/opt/local/lib/postgresql83/bin
export PATH

#groovy
PATH=$PATH:/opt/local/groovy/bin
export PATH

#jruby
PATH=$PATH:/opt/local/jruby/bin
export PATH

PATH=$PATH:~/bin
export PATH

# xuggler
XUGGLE_HOME=/usr/local/xuggler
PATH=$XUGGLE_HOME/bin:$PATH
DYLD_LIBRARY_PATH=$XUGGLE_HOME/lib
export XUGGLE_HOME PATH DYLD_LIBRARY_PATH

#DYLD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/sw/lib:/opt/local/lib
#export DYLD_LIBRARY_PATH

RED5_HOME=/Users/ssayles/src/red5-trunk/dist
export RED5_HOME

EDITOR=vim
export EDITOR

export PS1="\u@\h:\W$ "
alias ls='ls -G'
alias clj='java -jar /opt/local/clojure/clojure.jar'

# adding subversion
PATH=/opt/subversion/bin:$PATH
export PATH


PATH=/opt/local/node/bin:$PATH
export PATH

alias "aptana"="open /Applications/development/Aptana\ Studio\ 3/AptanaStudio3.app/"


[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm



