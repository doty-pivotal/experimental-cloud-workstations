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

## Notes: 

Used http://garylarizza.com/blog/2013/02/01/repeatable-puppet-development-with-vagrant/ as a good starting point.

Need to find a method of installing modules:
1. Fast start - use `puppet module`:
	+ puppet module install puppetlabs/apache --target-dir /vagrant/puppet/modules/
	+ puppet module install puppetlabs/mysql  --target-dir /vagrant/puppet/modules/
   This will add all those files to the modules directory, and thus to our repo
   > Once the modules are in puppet/modules, we’re good. You only ever need to
   > do this step ONCE. Because this folder is a shared folder, you can now
   > vagrant up and vagrant destroy to your heart’s content – Vagrant will not
   > remove the content in our shared folder when a VM is destroyed. Remember,
   > too, that any changes made to those modules from either the VM or on your
   > Workstation will be IMMEDIATELY available to both.
1. We could use something else
    + Shell provisioner to download from github
	+ [librarian-puppet](http://librarian-puppet.com/)
	+ Other??
