#!/bin/bash

# mysql
PATH=/opt/local/lib/mysql5/bin:$PATH

# mongo
PATH=$PATH:/opt/local/mongodb/bin

export PATH



ulimit -n 4096

# NVM
. ~/.nvm/nvm.sh

