#!/bin/bash
echo <<EOF
Expectations:

Multiple clusters should be usable
- Concurrently-running clusters
- Should be able to swap between them instantly
- All source/datadir/ports should follow the same pattern
- Source/dir/port patterns should match GPDB version
- Should be able to navigate segment dirs, utility mode, etc. through aliases/variables

Should be easy to work with 4x vs. 5x vs. 6x code lines
- Separate clones/directories for 5x and 6x
- Consistently-named remotes for the other versions, for cherry-picking between versions
- Swapping between versions should change source trees
EOF

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
