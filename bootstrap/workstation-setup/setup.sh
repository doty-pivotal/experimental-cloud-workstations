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

set -x
  cp /tmp/git-together/target/debug/git-together /usr/local/bin/
  echo "git author cp failed due to permissions - rerunning"
  cp /tmp/git-author/git-author /usr/local/bin/
set +x

su -c "source ${PWD}/scripts/common/git-aliases.sh" vagrant
cp $BOOTSTRAP_DIR/files/.git-together ~/.git-together
 

su -c "source ${PWD}/scripts/common/cloud-foundry.sh" vagrant
su -c "source ${PWD}/scripts/common/applications-common.sh" vagrant

source ${PWD}/scripts/common/unix.sh
 
# For each command line argument, try executing the corresponding script in opt-in/
for var in c golang java docker
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

echo
echo "TODO: install a newer version of vim, to support vim-go"
echo "Installing Vundle during Vagrant bootstrap causes issues with STDOUT"
echo " after the installation is finished run this inside the VM if you want:"
echo "$ source ${PWD}/scripts/common/configurations.sh"

su -c "source ${PWD}/scripts/common/finished.sh" vagrant
