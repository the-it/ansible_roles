#!/bin/bash

apt-get update
apt-get install -y python-pip libssl-dev sudo
pip install ansible
su vagrant -c "mkdir -p /home/vagrant/Desktop"