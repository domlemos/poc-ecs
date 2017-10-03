#!/bin/bash

# where the ambientum cache will live
A_BASE=$HOME/.cache/autodocker

# define specific cache directories
A_CONFIG=$A_BASE/.config
A_CACHE=$A_BASE/.cache
A_LOCAL=$A_BASE/.local
A_SSH=$HOME/.ssh
A_COMPOSER=$A_BASE/.composer

# create directories
mkdir -p $A_CONFIG
mkdir -p $A_CACHE
mkdir -p $A_LOCAL
mkdir -p $A_COMPOSER

chown -R $(whoami):$(whoami) $A_BASE
A_USER_HOME=/home/application


docker run \
    -it \
    --rm \
    --user=application \
    -w $A_USER_HOME/tmp \
    -v $(pwd):$A_USER_HOME/tmp \
    -v $A_COMPOSER:$A_USER_HOME/.composer \
    -v $A_CONFIG:$A_USER_HOME/.config \
    -v $A_CACHE:$A_USER_HOME/.cache \
    -v $A_LOCAL:$A_USER_HOME/.local \
    -v $A_SSH:$A_USER_HOME/.ssh \
    autodoc/php7.1-apache dep "$@"