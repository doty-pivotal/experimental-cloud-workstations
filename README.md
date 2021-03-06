# experimental-cloud-workstations
[Experimental] Automate the creation of a linux workstation.

TODO: Finish the scaffolding, and then move into a Pivotal owned repo. The
current location is temporary in this regard. Until then we'll collaborate.

## Changelog

20180221 - iterate on local VM before deploying on cloud

## Dependancies

1. Vagrant
1. Ansible
1. TEMP: the gcc compiler tar from `s3://toolchain-snowflakes/gcc-6.2.0-rhel7_x86_64.tar.gz` in `~/Downloads`

## Workflow

1. `git clone https://github.com/doty-pivotal/experimental-cloud-workstations.git`
1. Read the [notes](./notes.md)
1. `vagrant up`
1. `vagrant ssh`
1. `vagrant destroy` will throw the entire experiment away

## Goals

## Anti-Goals

1. What goes here should not plaster over deficiencies in the dependency
   management in the GPDB repo.  If it is needed to compile, or develop, it
   should be part of the GDPB specific setup instructions, makefiles, scripts,
   and/or secret incantations.

## Related Efforts

1. [pivotal/workstation-setup](https://github.com/pivotal/workstation-setup/)
1. [pivotal-sprout/sprout-wrap](https://github.com/pivotal-sprout/sprout-wrap)
1. [Andreas' ansible scripts](https://github.com/andreasscherbaum/gpdb-ansible)
1. [Pivotal Seattle Beach - workstation setup in ansible](https://github.com/seattle-beach/alfalfa)
1. [Vagrant boxes for experimenting with technologies](https://github.com/bltavares/vagrant-baseline)
1. [CF Garden Windows Team](https://github.com/cloudfoundry/garden-windows-ci/tree/master/workstation)
1. [Jason V's](https://github.com/vigiljt/ansible-role-workstation-configuration)

## Keep at end for ease of tail'ing this file
