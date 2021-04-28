#!/bin/bash

_VAGRANT_DIR="$HOME/vagrantBoxes"

vagrant -v &> /dev/null
if [ $? -ne 0 ]; then
    sudo apt install vagrant
    echo 'install vagrant'
else
    echo 'vagrant is exits'
fi

if [ ! -d $_VAGRANT_DIR ]; then
    mkdir -p $_VAGRANT_DIR
    echo 'mkdir'
else
    echo 'dir is exits'
fi
