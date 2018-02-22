# experimental-cloud-workstations
[Experimental] Automate the creation of a workstation in the cloud

TODO: Finish the scaffolding, and then move into a Pivotal owned repo. The
current location is temporary in this regard. Until then we'll collaborate.

## Changelog

20180221 - iterate on local VM before deploying on cloud

## Dependancies

1. Vagrant

## Workflow

1. `git clone https://github.com/doty-pivotal/experimental-cloud-workstations.git`
1. Read the [notes](./notes.md)
1. `vagrant up`
1. `vagrant ssh`
1. `exit; vim <stuff>`
1. `vagrant reload --provision`
1. `vagrant destroy`

## Goals

## Anti-Goals

1. What goes here should not plaster over deficiencies in the dependency
   management in the GPDB repo.  If it is needed to compile, or develop, it
   should be part of the GDPB specific setup instructions, makefiles, scripts,
   and/or secret incantations.

## Prior Art

1. [pivotal/workstation-setup](https://github.com/pivotal/workstation-setup/)
1. [Andreas' ansible scripts](https://github.com/andreasscherbaum/gpdb-ansible)

