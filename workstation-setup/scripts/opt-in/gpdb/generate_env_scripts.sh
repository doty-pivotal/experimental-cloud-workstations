#!/bin/bash

mkdir $HOME/scripts
cp env_scripts/*.sh $HOME/scripts

cat env_scripts/.bashrc >> $HOME/.bashrc
