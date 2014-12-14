# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "roundcube"
  config.vm.box_url = config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"

  # vagrant-omnibus plugin
  config.omnibus.chef_version = :latest
  
  # set this to the IP address of your LAN's router, comment out if not using public_network/bridged
  #default_router = "10.10.2.1"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # View the documentation for the provider you're using for more
  # information on available options.
  config.vm.provider :virtualbox do |vb|
    #vb.customize ["modifyvm", :id, "--cpus", 4]
    vb.customize ["modifyvm", :id, "--memory", "2048"]

    # assign a minimal amount of reasonable video memory
    vb.customize ["modifyvm", :id, "--vram", "16"]

    # assign enough video memory for higher resolutions
    #vb.customize ["modifyvm", :id, "--vram", "128"]

    # assign reasonable video memory for higher resolutions
    #vb.customize ["modifyvm", :id, "--vram", "256"]
    
    # enable 3D video acceleration
    #vb.customize ["modifyvm", :id, "--accelerate3d", "on"]

    # Don't boot with headless mode
    vb.gui = true
  end

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network :public_network
  #config.vm.network :public_network, ip: "10.10.2.245"     # with static IP, useful for server sharing

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network :private_network, ip: "192.168.33.10"

  # workaround because the official vagrant precise64.box does not include the update-notifier-common package
  #config.vm.provision :shell, :inline => "which apt-get && apt-get -y update && apt-get -y install update-notifier-common"

  # change/ensure the default route via the local network's WAN router, useful for public_network/bridged mode
  #config.vm.provision :shell, :inline => "ip route delete default 2>&1 >/dev/null || true; ip route add default via #{default_router}"

  # share the host's /media to the guest for sections
  #config.vm.synced_folder "/media", "/media/host"
  
  # provisioning with chef solo
  config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = 'cookbooks'
      chef.json.merge!(JSON.parse(File.read('node.json')))
      chef.run_list = JSON.parse(File.read('node.json'))['run_list']
      #chef.run_list = []
      #chef.log_level = :debug
  end
end
