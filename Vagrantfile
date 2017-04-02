# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu16.04"
  config.vm.hostname = "dev"
  config.vm.box_url = "https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box"
  config.ssh.forward_agent = true
  config.ssh.insert_key = true

  config.vm.network :private_network, ip: "192.168.50.12"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
end
