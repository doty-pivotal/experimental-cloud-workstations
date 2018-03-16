# Reset PATH so multiple calls won't keep appending to PATH indefinitely
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$HOME/.local/bin:$HOME/bin
export LD_LIBRARY_PATH=/lib
source "/usr/local/gpdb$V/greenplum_path.sh"

# Variables for navigating a GPDB installation

export PGPORT=$V$V\32
export MASTER_DATA_DIRECTORY="$HOME/data/$V/master/gpseg-1"
export PRIMARY_DIRECTORY_0="$HOME/data/$V/primary/gpseg0"
export PRIMARY_DIRECTORY_1="$HOME/data/$V/primary/gpseg1"
export MIRROR_DIRECTORY_0="$HOME/data/$V/mirror/gpseg0"
export MIRROR_DIRECTORY_1="$HOME/data/$V/mirror/gpseg1"

# Port values for primaries and mirrors, for use with the utility mode psql aliases
export PGP_P_0=$V\0000
export PGP_P_1=$V\0001
export PGP_M_0=$V\1000
export PGP_M_1=$V\1001
