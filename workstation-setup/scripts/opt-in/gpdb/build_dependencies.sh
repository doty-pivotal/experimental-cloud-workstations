#!/bin/bash

BASE=$HOME/workspace
cd $BASE
set -ex

echo "Installing GPOS"
git clone git@github.com:greenplum-db/gpos.git
cd gpos
mkdir build
cd build
cmake ../
make
sudo make install
cd $BASE

echo "Installing GP-Xerces"
git clone git@github.com:greenplum-db/gp-xerces.git
cd gp-xerces
mkdir build
cd build
../configure --prefix=/usr/local
make
sudo make install
cd $BASE

echo "Installing Orca"
git clone git@github.com:greenplum-db/gporca.git
cd gporca
mkdir build
cd build
cmake ../
make
sudo make install
cd $BASE
