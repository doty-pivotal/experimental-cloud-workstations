#!/bin/bash
BOOTSTRAP_DIR=/vagrant/workstation-setup
VAGRANT_HOME=/home/vagrant

# Fail immediately if any errors occur
set -e

PWD="$(dirname "$0")"
source "${PWD}/scripts/common/common.sh"
print_script_header

echo ""
echo "- Installing basics necessary to bootstrap"
yum install -d1 -y wget git

echo ""
echo "- Setup git related resources"
su -c "${PWD}/scripts/common/git.sh" vagrant
su -c "${PWD}/scripts/common/git-aliases.sh" vagrant
# TODO: seed the .git-together file
# cp $BOOTSTRAP_DIR/files/.git-together ~/.git-together

echo ""
echo "- Setup editors"
# TODO: dependencies for neovim
# TODO: build and install neovim
# TODO: dependencies for vim
# TODO: build and install vim
# TODO: set one vim up as the default
# TODO: setup vim preferences

echo ""
echo "- Install some expected utilities"
${PWD}/scripts/common/utilities.sh

echo ""
echo "- Installing opt-in resources"
OPT_IN=(
c
docker
)

for var in "${OPT_IN[@]}"
do
    echo "- opt'ing into $var"
    FILE=${PWD}/scripts/opt-in/${var}.sh
    echo "$FILE"
    if [ -f $FILE ]; then
        ${FILE}
    else
       echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
    fi
done

## TODO: setup bash prompt
## TODO: setup git repos and remotes
