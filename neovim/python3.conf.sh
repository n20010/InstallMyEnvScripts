#!/bin/bash

_CONFIG_DIR="$HOME/.config/nvim"

cp ./conf/python3/{init.vim,local_bundles.vim,local_init.vim} $_CONFIG_DIR

### python3 linter

sudo apt install python3-pip
pip3 install flake8 autopep8 black isort
