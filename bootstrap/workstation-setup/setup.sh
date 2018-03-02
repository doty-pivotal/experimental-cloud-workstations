#!/bin/bash

BOOTSTRAP_DIR=/vagrant/bootstrap/workstation-setup
VAGRANT_HOME=/home/vagrant
# Fail immediately if any errors occur
set -e

PWD="$(dirname "$0")"

clear

yum install -d1 -y wget git vim

# dependancies for configuration-bash
yum install -d1 -y coreutils gcc
su -c "source ${PWD}/scripts/common/configuration-bash.sh" vagrant

# depandancies for git.sh
yum install -d1 -y cmake curl openssl-devel
su -c "source ${PWD}/scripts/common/git.sh" vagrant
su -c "source ${PWD}/scripts/common/git-aliases.sh" vagrant
mv /tmp/git-together/target/debug/git-together /usr/local/bin/
cp $VAGRANT_HOME/files/.git-together ~/.git-together
 

su -c "source ${PWD}/scripts/common/cloud-foundry.sh" vagrant
su -c "source ${PWD}/scripts/common/applications-common.sh" vagrant

source ${PWD}/scripts/common/unix.sh
 
# For each command line argument, try executing the corresponding script in opt-in/
for var in "c golang java docker"
do
    echo "$var"
    FILE=${PWD}/scripts/opt-in/${var}.sh
    echo "$FILE"
    if [ -f $FILE ]; then
        source ${FILE}
    else
       echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
    fi
done

clear
su -c "source ${PWD}/scripts/common/configurations.sh" vagrant
clear

su -c "source ${PWD}/scripts/common/finished.sh" vagrant
