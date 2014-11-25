#!/bin/bash

if [ ! -e .backup ]
then
	echo "You don't install VIM_IDE! If you want to install, as follows:"
	echo "Usage: chmod u+x install.sh; ./install.sh"
	exit 127
fi

rm -rf $HOME/.bashrc $HOME/.vimrc $HOME/.vim
[ -e .backup/.bashrc ] && cp .backup/.bashrc $HOME/
[ -e .backup/.vimrc ] && cp .backup/.vimrc $HOME/
[ -e .backup/.vim ] && cp -r .backup/.vim $HOME/
rm -rf ./.backup

echo "Uninstall OK!"
