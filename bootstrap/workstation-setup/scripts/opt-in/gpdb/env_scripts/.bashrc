# .bashrc

PS1_USER='\[\e[1;32m\]\u\[\e[m\]'
PS1_DIR='\[\e[1;34m\]\w\[\e[m\]'
PS1_SHELL='\[\e[1;32m\]\$\[\e[m\] \[\e[0;37m\]'
PS1_GPDB4='\[\e[38;5;9m\]GPDB 4\[\e[m\]'
PS1_GPDB5='\[\e[38;5;214m\]GPDB 5\[\e[m\]'
PS1_GPDB6='\[\e[38;5;226m\]GPDB 6\[\e[m\]'

PS1="$PS1_USER $PS1_DIR $PS1_SHELL"

export HISTCONTROL=ignoredups

export PATH= # Will be overridden by appropriate $V_env.sh script below

export GPDB4="$HOME/workspace/4.3/gpdb4"
export GPDB5="$HOME/workspace/5.X/gpdb"
export GPDB6="$HOME/workspace/6.X/gpdb"

source ~/scripts/6_env.sh # This must be sourced so some ssh localhost commands work

export GIT_SSL_NO_VERIFY=true
export PGUSER=$USER
export PGDATABASE=$USER
