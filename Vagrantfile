# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.4"

  config.vm.host_name = "data.pivotal.vm"

  config.vm.network "forwarded_port", guest: 5432, host: 5432
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "8192"
    vb.cpus = "2"
  end
  

  config.vm.provision "shell", inline: "/vagrant/bootstrap/workstation-setup/setup.sh"

  # config.vm.synced_folder "~/workspace", "/home/vagrant/workspace", owner: "vagrant", group: "vagrant"

end
