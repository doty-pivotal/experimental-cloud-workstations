#!/bin/bash

BASE=$HOME/workspace
pushd $BASE > /dev/null
  set -ex

  echo "Installing GPOS"
  git clone git@github.com:greenplum-db/gpos.git
  pushd gpos > /dev/null
    mkdir build
    cd build
    cmake ../
    make
    sudo make install
  popd

  echo "Installing GP-Xerces"
  git clone git@github.com:greenplum-db/gp-xerces.git
  pushd gp-xerces > /dev/null
    mkdir build
    cd build
    ../configure --prefix=/usr/local
    make
    sudo make install
  popd

  echo "Installing Orca"
  git clone git@github.com:greenplum-db/gporca.git
  cd gporca > /dev/null
    mkdir build
    cd build
    cmake ../
    make
    sudo make install
  popd > /dev/null
popd > /dev/null
