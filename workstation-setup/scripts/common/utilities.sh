#!/usr/bin/env bash
source "/vagrant/workstation-setup/scripts/common/common.sh"
print_script_header


echo
echo "-- Installing commonly expected utilities"

yum install -d1 -y psmisc the_silver_searcher jq
