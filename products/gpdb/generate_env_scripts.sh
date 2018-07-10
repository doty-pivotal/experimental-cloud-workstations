#!/usr/bin/env bash
source "/vagrant/workstation-setup/scripts/common/common.sh"
print_script_header

mkdir -p $HOME/scripts
cp env_scripts/*.sh $HOME/scripts

cat env_scripts/.bashrc >> $HOME/.bashrc
