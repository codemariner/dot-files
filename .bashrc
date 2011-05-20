. ~/etc/aliases.sh
. ~/bin/bash_colors.sh
. ~/bin/git-completion.sh

_hostname=`hostname -s`


# source in platform specific config
os=`uname -s`
if [ -f ~/etc/platform.d/$os.sh ]; then
    . ~/etc/platform.d/$os.sh
fi

# source in any extra profile files
if [ -d ~/etc/profile.d ]; then
  for i in ~/etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

# source in any extra alias files
if [ -d ~/etc/aliases.d ]; then
  for i in ~/etc/aliases.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi





# common paths
PATH=~/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/sbin:/sbin:$PATH
export PATH


EDITOR=vim
export EDITOR


# make sure the terminal is colored
export TERM='xterm-color'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend


# command edit with vi
set -o vi

# source in any host specific config
_hostfile=~/etc/hosts.d/$_hostname.sh
if [ -f $_hostfile ]; then
    . $_hostfile
fi


[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
