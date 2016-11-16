# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  if Vagrant::Util::Platform.windows?
      config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777","umask=007"], :owner => "vagrant", :group => "vagrant"
      # config.vm.synced_folder "./ansible", "/etc/ansible", :mount_options => ["dmode=770","fmode=770","umask=007"], :owner => "vagrant", :group => "vagrant"
      # config.vm.synced_folder "./.vagrant/machines", "/home/vagrant/.ssh", :mount_options => ["dmode=700","fmode=600","umask=007"], :owner => "vagrant", :group => "vagrant"
  else
      config.vm.synced_folder ".", "/vagrant", :nfs => { :mount_options => ["dmode=777","fmode=777"] }
  end

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.vm.provision :hostmanager

  config.vm.define "swarm-master" do |d|
    d.vm.box = "ubuntu/trusty64"
    d.vm.hostname = "swarm-master"
    d.vm.network "public_network", ip: "10.100.192.200"
    d.vm.network "forwarded_port", guest: 8080, host: 8080
    
    # If true, then any SSH connections made will enable agent forwarding.
    # Default value: false
    d.ssh.forward_agent = true
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
    d.vm.provision :shell, path: "bootstrap_ansible.sh"
  end
  (1..2).each do |i|
    config.vm.define "swarm-node-#{i}" do |d|
      d.vm.box = "ubuntu/trusty64"
      d.vm.hostname = "swarm-node-#{i}"
      d.vm.network "public_network", ip: "10.100.192.20#{i}"
      d.vm.provision :shell, path: "bootstrap_ansible.sh"
      d.vm.provider "virtualbox" do |v|
        v.memory = 1024
      end
    end
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end