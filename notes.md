## Future things:

1. Automate building of images?
	1. Stuff Gary says suggests [VeeWee](https://github.com/jedi4ever/veewee)
	1. Packer would make sense
1. Some other examples of Puppet + Vagrant
	1. https://github.com/patrickdlee/vagrant-examples
	1. https://github.com/jantman/puppet-archlinux-workstation
	1. https://github.com/phinze/puppet-workstation
	1. http://garylarizza.com/blog/2013/02/15/puppet-plus-github-equals-laptop-love/
	1. [BOXEN](https://github.com/boxen/our-boxen/#our-boxen)
1. Set up a DNS forwarder (in the give me a secure connection setup bit) that would allow for the services running on the workstation to have their name resolved on the laptop connecting to the the setup.
1. Additional software:
	1. https://github.com/pivotal/tmux-config
	1. tumx, tigervnc, and a lightweight window manager

## Notes: 

Used http://garylarizza.com/blog/2013/02/01/repeatable-puppet-development-with-vagrant/ as a good starting point.

Getting GCP up - https://realguess.net/2015/09/07/setup-development-environment-with-vagrant-on-google-compute-engine/


## Scratch

There are some competing concerns, but lets try this pattern on:
1. workstation setup
2. product setup
3. team setup
4. individuals setup

This way by combining choices in 1-4 you get your workstation.  There may be
some conflicts, but I think I want to see this play out, and then figure out how to consolidate and refactor
