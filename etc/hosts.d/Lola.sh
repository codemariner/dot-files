#!/bin/bash

# mysql
PATH=/opt/local/lib/mysql5/bin:$PATH

# mongo
PATH=$PATH:/opt/local/mongodb/bin

export PATH


ulimit -n 4096

export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=tcp://localhost:2376
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH=/Users/ssayles/.docker/machine/machines/default
export DOCKER_MACHINE_NAME=default

alias docker-create='docker-machine create --driver virtualbox --virtualbox-disk-size 40000 --virtualbox-cpu-count "4"  --virtualbox-memory "4096"  default'

alias integration='~/bin/kube --kubeconfig=/Users/ssayles/src/ua3/v7-staging/kube-config.yaml'


# skytap v7

export SKYTAP_IP='184.170.226.180'
alias ssh-qa='ssh -i ~/.ssh/ua-iad-qa'
alias skytap='~/bin/kube --kubeconfig=/Users/ssayles/src/ua3/kube-specs/kube-config-skytap.yaml'

# mongo, mssql, ui-pim
alias skytap_tunnel='ssh-qa -N -L30001:localhost:30001 -L30002:localhost:30002 -L30053:localhost:30053 -L30015:localhost:30015 ua@$SKYTAP_IP'

# NVM
. ~/.nvm/nvm.sh

nvm use 4.1.1
