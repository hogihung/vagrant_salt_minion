Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-14.04"
  config.vm.hostname = "minion-dave" 
  #config.vm.network "public_network", type: "dhcp"  # leave disabled until we get thunderbolt to ethernet adapter

  # Setup static ip address to be used with Salt Master who has IP of: 192.168.50.10  
  config.vm.network "private_network", ip: "192.168.50.12"

  # Use an inline shell provisioner for basic setup 
  config.vm.provision 'shell', inline: shell, privileged: false
  
  # Copy over salt related files
  config.vm.provision "file", source: "files/etc/salt/minion", destination: "/home/vagrant/CONFIG_FILES/etc/salt/minion"
  
  # Run provisioning specific to setting up Salt 
  config.vm.provision "shell", path: 'provisioning/salt_provision.sh'
 
  # Restart salt for minion and master 
  config.vm.provision "shell", path: 'provisioning/salt_restart.sh'
end

def shell
  <<-eos
    echo Installing basic tools and create temporary directory
    sudo apt-get update
    sudo apt-get -y install vim git-core toilet

    toilet --gay Create Directory
    cd ~
    mkdir -p CONFIG_FILES/etc/salt
  eos
end
