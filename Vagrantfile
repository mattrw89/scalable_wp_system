# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "trusty64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64/version/1/provider/virtualbox.box"

  # config.vm.define 'loadbal_box' do |machine|
  #   machine.vm.hostname = 'loadbal-box'
  #   machine.vm.network "private_network", ip: "192.168.77.20"
  # end

  config.vm.define 'wp_box_1' do |machine|
    machine.vm.hostname = 'wp-box-1'
    machine.vm.network "private_network", ip: "192.168.77.31"
  end

  config.vm.define 'db_box' do |machine|
    machine.vm.hostname = 'db-box'
    machine.vm.network "private_network", ip: "192.168.77.21"
    
    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "init_playbook.yml"
      ansible.limit = 'all'
      ansible.inventory_path = 'inventory'
      # ansible.start_at_task = 'start site data containers'
      # ansible.start_at_task = 'copy over the Dockerfile for wp_image'
      ansible.verbose = 'vvv'
      #ansible.tags = ['docker_change']
    end
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"  
end
