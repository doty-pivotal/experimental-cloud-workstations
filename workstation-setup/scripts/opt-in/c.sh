#!/usr/bin/env bash
source "/vagrant/workstation-setup/scripts/common/common.sh"
print_script_header

echo
echo "-- Installing common C development tools and libraries"
yum install -d1 -y ccache ctags cmake cscope
