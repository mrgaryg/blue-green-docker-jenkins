#!/bin/bash

set -e

echo "Installing Ansible..."
sudo apt-get update -y
# apt-get install -y python-pip python-dev
# pip install ansible==1.9.2

sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get -y update
sudo apt-get -y install ansible
# sudo apt-get -y autoremove

# mkdir -p /etc/ansible
mkdir -p $HOME/.ssh && chmod 700 $HOME/.ssh
if [[ -d $HOME/.ssh ]] ; then 
	
	echo "Copying vagrant private keys" 
	cp /vagrant/.vagrant/machines/$(hostname)/virtualbox/private_key $HOME/.ssh/
	chmod 700 $HOME/.ssh/
fi
#touch /etc/ansible/hosts
#ln -s /etc/ansible/hosts /vagrant/ansible/hosts/prod
# cp -r /vagrant/ansible/hosts/prod /home/vagrant 
# ansible-playbook /vagrant/ansible/swarm.yml -i /vagrant/ansible/hosts/prod