# Exports for GPDB 5 builds

PS1="$PS1_USER $PS1_GPDB6 $PS1_DIR $PS1_SHELL"

export V=6
export GPDB=$GPDB6

source ~/scripts/environment_variables.sh

export PYTHONPATH=$GPHOME/lib/python:$BIN/pythonSrc/ext/mock-1.0.1:$BIN/pythonSrc/ext/install/lib/python2.7/site-packages:/usr/lib/python2.7:/usr/lib64/python2.7
export PATH=$PATH:$HOME/go/bin:$GPHOME/bin:$GOROOT/bin:$GOPATH:.

# Various functions

source ~/scripts/aliases_and_functions.sh
