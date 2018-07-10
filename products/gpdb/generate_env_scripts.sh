#!/bin/bash

mkdir $HOME/s
cp env_scripts/*.sh $HOME/s

cat env_scripts/.bashrc >> $HOME/.bashrc
