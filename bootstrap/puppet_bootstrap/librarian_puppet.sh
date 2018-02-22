#!/usr/bin/env bash

gem install librarian-puppet
pushd /vagrant/puppet > /dev/null
  echo "Updating Puppet modules with librarian-puppet"
  /usr/local/bin/librarian-puppet install
popd > /dev/null
