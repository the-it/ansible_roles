#!/bin/sh
ansible-galaxy install -r requirements.yml
ansible-playbook -K -v $1 $2 $3 $4 $5 $6 $7 $8 $9
