#!/bin/bash

# Fail immediately if any errors occur
set -e

PWD="$(dirname "$0")"

clear

# Collected yum installs
yum install -d1 -y coreutils vim git

# Note: Homebrew needs to be set up first
su -c "source ${PWD}/scripts/common/configuration-bash.sh" vagrant

# source ${PWD}/scripts/common/git.sh
# source ${PWD}/scripts/common/git-aliases.sh
# source ${PWD}/scripts/common/cloud-foundry.sh
# source ${PWD}/scripts/common/applications-common.sh
# source ${PWD}/scripts/common/unix.sh
# source ${PWD}/scripts/common/configuration-osx.sh
# source ${PWD}/scripts/common/configurations.sh
# 
# # For each command line argument, try executing the corresponding script in opt-in/
# for var in "$@"
# do
#     echo "$var"
#     FILE=${PWD}/scripts/opt-in/${var}.sh
#     echo "$FILE"
#     if [ -f $FILE ]; then
#         source ${FILE}
#     else
#        echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
#     fi
# done
# 
# source ${PWD}/scripts/common/finished.sh
