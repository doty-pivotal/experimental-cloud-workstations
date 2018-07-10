#!/bin/bash

BASE=$HOME/workspace
cd $BASE
set -ex

echo "Installing Centos packages"
yum install -y epel-release
yum groupinstall "Development Tools"

yum install -y apr-devel
yum install -y binutils
yum install -y bzip2
yum install -y compat-gcc-44
yum install -y curl-devel
yum install -y gcc
yum install -y gcc-c++
yum install -y java-devel
yum install -y json-c-devel
yum install -y libevent-devel
yum install -y libxml2-devel
yum install -y libyaml-devel
yum install -y make
yum install -y openssl-devel
yum install -y perl-devel
yum install -y perl-ExtUtils-Embed
yum install -y python-devel
yum install -y readline-devel
yum install -y zlib-devel

yum install -y cmake3
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
