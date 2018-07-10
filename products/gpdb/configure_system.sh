#!/usr/bin/env bash
source "/vagrant/workstation-setup/scripts/common/common.sh"
print_script_header

# Increase open file limits, so gpinitsystem doesn't complete
echo "$USER\t\tsoft\tnofile\t\t65535" >> /etc/security/limits.conf
echo "$USER\t\thard\tnofile\t\t65535" >> /etc/security/limits.conf

# Increase system semaphore limits, to allow running multiple GPDB instances at once
echo 250 64000 100 512 > /proc/sys/kernel/sem
