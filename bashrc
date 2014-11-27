# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# change system varibles
PS1="[\u@\h \W]\$"

###### User specific funtions ####
# chinese language
export LANG="zh_CN.UTF-8"

# Path
BEFOREPATH=
AFTERPATH=
PATH=${BEFORPATH}:${PATH}:${AFTERPATH}
export PATH
# c headers path
C_INCLUDE_PATH="${C_INCLUDE_PATH}:${MYTOOLS}/libevent/include:${MYTOOLS}/libevhtp/include:${GTEST_HOME}/include:${MYTOOLS}/libcurl/include:${MYTOOLS}/lzo/include:${MYTOOLS}/protobuf/include"
CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}${MYTOOLS}/libevent/include:${MYTOOLS}/libevhtp/include:${GTEST_HOME}/include:${MYTOOLS}/lzo/include:\
${MYTOOLS}/protobuf/include"

LIBRARY_PATH="${LIBRARY_PATH}:${MYTOOLS}/libevent/lib:${MYTOOLS}/libevhtp/lib:${GTEST_HOME}/lib:${MYTOOLS}/libcurl/lib:${MYTOOLS}/lzo/lib:\
		${MYTOOLS}/protobuf/lib"
LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${MYTOOLS}/libevent/lib:${MYTOOLS}/libevhtp/lib:${GTEST_HOME}/lib:${MYTOOLS}/libcurl/lib:${MYTOOLS}/lzo/lib:\
		${MYTOOLS}/protobuf/lib"
export C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH
export LIBRARY_PATH
export LD_LIBRARY_PATH
#user's alias
alias rm="rm -rf"
