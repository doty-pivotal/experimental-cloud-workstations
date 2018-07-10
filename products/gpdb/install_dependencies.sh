#!/usr/bin/env bash
source "/vagrant/workstation-setup/scripts/common/common.sh"
print_script_header

BASE=$HOME/workspace
cd $BASE
set -ex

echo "Installing Centos packages"
yum install -y -d1 epel-release
yum groupinstall -y -d1 "Development Tools"

yum install -y -d1 \
apr-devel \
binutils \
bzip2 \
compat-gcc-44 \
curl-devel \
gcc \
gcc-c++ \
java-devel \
json-c-devel \
libevent-devel \
libxml2-devel \
libyaml-devel \
make \
openssl-devel \
perl-devel \
perl-ExtUtils-Embed \
python-devel \
readline-devel \
zlib-devel \
cmake3 \

# Symlink cmake3 in case the default install is cmake2
(cmake --version | grep cmake3) || (cd /usr/bin; sudo mv cmake cmake2; sudo ln -s cmake3 cmake; cd $BASE)

echo "Installing Python packages"
# pip should come with python by default
# TODO: determine whether pip is installed, install it if not present
pip install lockfile
pip install paramiko
pip install psutil
pip install setuptools

# Make configure --with-perl work
ln -s /usr/share/perl5/vendor_perl/ExtUtils/xsubpp /usr/share/perl5/ExtUtils/xsubpp
