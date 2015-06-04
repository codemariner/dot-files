#!/bin/bash

# mysql
PATH=/opt/local/lib/mysql5/bin:$PATH

# mongo
PATH=$PATH:/opt/local/mongodb/bin

export PATH


# docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ssayles/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export DOCKER_OPTS="-H unix:///var/run/docker.sock"
if [ -f ~/.boot2dockercfg ]; then
    source ~/.boot2dockercfg
fi

ulimit -n 4096

# NVM
. ~/.nvm/nvm.sh

nvm use 0.10.28
