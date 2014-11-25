#!/bin/sh

#info of the package and the author
clear
echo;
echo "============>> VIM IDE for C/C++ Quick Install <<============="
echo "* Author: unix1986                                           *"
echo "* Email:  unix1986@qq.com                                    *"
echo "* Blog:   http://blog.csdn.net/challenge_c_plusplus          *"
echo "* Github: https://github.com/unix1986                        *"
echo "=============================================================="
echo "The Installation will need a few seconds... ..."
sleep 5

#save the files for restoring
if [ ! -d .backup ]
then
	mkdir .backup
	[ -e "$HOME/.bashrc" ] && cp $HOME/.bashrc .backup || echo "Warning: $HOME/.bashrc is not exist!"
	[ -e "$HOME/.vimrc" ] && cp $HOME/.vimrc .backup   || echo "Warning: $HOME/.vimrc is not exist!"
	[ -e "$HOME/.vim" ] && cp -r $HOME/.vim .backup    || echo "Warning: $HOME/.vim is not exist!"
fi

#installation by some steps
echo
echo "Create .vimrc and .vim..."
echo
sleep 3

(
rm -rf $HOME/.vimrc $HOME/.vim
cp vimrc $HOME/.vimrc
cp -r vim $HOME/.vim
)

echo
echo "Compile ncurses..."
echo
sleep 3
tar -xzvf ncurses.tar.gz || (echo "tar -xzvf ncurses.tar.gz err!"; exit 127)

( 
cd ncurses
./configure
make 
if [ $? -ne 0 ]
then
	echo "Compile ncurses err!"
	exit 127
else
    echo "Compile ncurses ok!"
fi
)

echo
echo "Compile and Install Cscope..."
echo
sleep 3
tar -xzvf cscope.tar.gz || (echo "tar -xzvf cscope.tar.gz err!"; exit 127)

cp -r ncurses/include ncurses/lib cscope


(
cd cscope
./configure --prefix=$HOME/.vim/cscope --with-ncurses=$(dirname `pwd`)/ncurses
make CFLAGS="-D RENAMED_NCURSES" && make install
if [ $? -ne 0 ]
then
	echo "Compile and Install Cscope err!"
	exit 127
else
    echo "Compile and Install Cscope ok!"
fi
)

echo
echo "Compile and Install Ctags..."
echo
sleep 3
tar -xzvf ctags.tar.gz || (echo "tar -xzvf ctags.tar.gz err!"; exit 127)

(
cd ctags
./configure --prefix=$HOME/.vim/ctags
make && make install
if [ $? -ne 0 ]
then
	echo "Compile and Install Ctags err!"
	exit 127
else
    echo "Compile and Install Ctags ok!"
fi
)

echo
echo "Set the .bashrc for \$PATH..."
sleep 3

grep "CSCOPE_CTAGS_PATH" $HOME/.bashrc

if [ $? -ne 0 ]
then
	echo -e "CSCOPE_CTAGS_PATH=\$PATH" >> $HOME/.bashrc
	echo -e "export PATH=\$HOME/.vim/cscope/bin:\$HOME/.vim/ctags/bin:\$CSCOPE_CTAGS_PATH" >> $HOME/.bashrc
    source $HOME/.bashrc
fi

sed -i 's/^-e *//' $HOME/.bashrc
rm -rf ncurses || (echo "rm -rf ncurses err!"; exit 127)
rm -rf cscope  || (echo "rm -rf cscope err!"; exit 127)
rm -rf ctags   || (echo "rm -rf ctags err!"; exit 127)

echo
echo "OK,install successfuly!"
echo
