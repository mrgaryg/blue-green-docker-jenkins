#!/bin/bash

set -e

echo "Installing Ansible..."
apt-get update -y
apt-get install -y python-pip python-dev
pip install ansible==1.9.2
# mkdir -p /etc/ansible
mkdir -p $HOME/.ssh && chmod 700 $HOME/.ssh
if [[ -d $HOME/.ssh ]] ; then 
	
	echo "Copying vagrant private keys to /tmp" 
	find /vagrant/.vagrant/machines -iname "private_key" | xargs cp $HOME/.ssh
fi
#touch /etc/ansible/hosts
#ln -s /etc/ansible/hosts /vagrant/ansible/hosts/prod
# cp /vagrant/ansible/hosts/prod /home/vagrant 
# ansible-playbook /vagrant/ansible/swarm.yml -i /vagrant/ansible/hosts/prod