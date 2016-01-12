# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu15.04"
  config.vm.hostname = "dev"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/vivid/current/vivid-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :private_network, ip: "192.168.50.12"
  config.vbguest.no_install = true

  config.vm.provision "itamae" do |itamae|
    itamae.sudo = true
    itamae.recipes = ['./roles/dev.rb']
    itamae.json = 'node.json'
    itamae.shell = "/bin/bash"
  end
end
