#!/usr/bin/env bash
source "/vagrant/workstation-setup/scripts/common/common.sh"
print_script_header

mkdir $HOME/s
cp env_scripts/*.sh $HOME/s

cat env_scripts/.bashrc >> $HOME/.bashrc
