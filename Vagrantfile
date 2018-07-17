# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |box|
      box.linked_clone = true
      box.customize [ "modifyvm", :id, "--memory", "2048", "--cpus", "1" ]
  end
  
  config.vm.define :jenkins do |box|
      box.vm.hostname = "jenkins"
      box.vm.box = "ubuntu/xenial64"
      box.vm.network "private_network", ip: "192.168.33.55"
      box.vm.synced_folder ".", "/vagrant"
    
      box.vm.provision :shell,
          :path => "provision.sh",
          :run => "always"
    
      box.vm.provision "docker" do |d|
        d.run "registry:2",
        args: "-d -p 5000:5000 --restart=always --name registry"
      end
    
  end
  
    config.vm.define :dev do |box|
      box.vm.hostname = "dev"
      box.vm.box = "ubuntu/xenial64"
      box.vm.network "private_network", ip: "192.168.33.56"
      box.vm.synced_folder ".", "/vagrant"
    
      box.vm.provision :shell,
          :path => "provision-env.sh",
          :run => "always"
  end
  
      
      config.vm.define :qa do |box|
      box.vm.hostname = "qa"
      box.vm.box = "ubuntu/xenial64"
      box.vm.network "private_network", ip: "192.168.33.57"
      box.vm.synced_folder ".", "/vagrant"
    
      box.vm.provision :shell,
          :path => "provision-env.sh",
          :run => "always"
      end
end