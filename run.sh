#!/bin/sh
ansible-galaxy install --force -r requirements.yml
ansible-playbook -K --ask-vault-pass $1 $2 $3 $4 $5 $6 $7 $8 $9
