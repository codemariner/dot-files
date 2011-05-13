JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home
PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME PATH

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
DYLD_LIBRARY_PATH=$XUGGLE_HOME/lib:$DYLD_LIBRARY_PATH
export XUGGLE_HOME PATH DYLD_LIBRARY_PATH

#DYLD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/sw/lib:/opt/local/lib
#export DYLD_LIBRARY_PATH

RED5_HOME=/Users/ssayles/src/red5-trunk/dist
export RED5_HOME


# adding subversion
PATH=/opt/subversion/bin:$PATH
export PATH


# node.js
PATH=/opt/local/node/bin:$PATH
export PATH

alias "aptana"="open /Applications/development/Aptana\ Studio\ 3/AptanaStudio3.app/"
alias clj='java -jar /opt/local/clojure/clojure.jar'
