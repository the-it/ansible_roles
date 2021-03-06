#!/bin/bash

set -x
apt-get update
apt-get install -y python-pip libssl-dev sudo
pip install ansible
su vagrant -c "mkdir -p /home/vagrant/Desktop"
ansible-galaxy install --roles-path /etc/ansible/roles -r /vagrant/requirements.yml