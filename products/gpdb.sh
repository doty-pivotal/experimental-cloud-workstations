#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

echo "Configuring System"
./gpdb/configure_system.sh
./gpdb/generate_env_scripts.sh

echo "Installing Dependencies"
./gpdb/install_dependencies.sh
./gpdb/build_dependencies.sh

echo "Installing Greenplum Database"
./gpdb/install_gpdb.sh

echo "Initializing a Cluster"
./gpdb/init_cluster.sh

echo "Starting the Cluster"
gpstart -a
