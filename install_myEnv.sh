#!bin/bash

source ./vimrc/myVimrc.sh
source ./vagrant/myVagrantEnv.sh


_BASH_P="$HOME/.bash_profile"
if [ ! -e $_BASH_P ]; then
    touch $_BASH_P
fi

cp bash_profile $_BASH_P

source $_BASH_P

echo '----------------------------------------------------------------------'
echo '----------------------------------------------------------------------'
echo ''
echo 'Install process has successfully! Enjoy your Linux life! - Koki Satani'
echo ''
echo '----------------------------------------------------------------------'
echo '----------------------------------------------------------------------'
