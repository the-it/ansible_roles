#!/bin/sh
ansible-galaxy install -r requirements.yml
ansible-playbook -e 'ansible_python_interpreter=/usr/bin/python3' -K $1 $2 $3 $4 $5 $6 $7 $8 $9
