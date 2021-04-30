#!/bin/bash

_VAGRANT_DIR="$HOME/vagrantBoxes"

vagrant -v &> /dev/null
if [ $? -ne 0 ]; then
    sudo apt install vagrant
else
    echo 'Vagrant command has already exists.'
fi

if [ ! -d $_VAGRANT_DIR ]; then
    mkdir -p $_VAGRANT_DIR
fi

