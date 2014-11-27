# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Change system varibles
PS1="[\u@\h \W]\$"

########################################
######## User specific functions #######
########################################

# Language
export LANG="zh_CN.UTF-8"
# tools directory
MYTOOLS=$MYTOOLS
# Path
PATH=$PATH
export PATH
# c headers directory
C_INCLUDE_PATH="$C_INCLUDE_PATH"
export C_INCLUDE_PATH
# cpp headers directory
CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH
# static library direcotry
LIBRARY_PATH="$LIBRARY_PATH"
export LIBRARY_PATH
# shared library directory
LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
# user's alias
alias rm="rm -rf"
