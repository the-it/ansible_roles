#!/bin/bash

set -x

if [ $# -lt 2 ]
then
  echo "No arguments supplied"
  exit 1
else
  PLAYBOOK=$1
  BRANCH=$2
fi

sudo apt-get update
sudo apt-get install -y python3 python3-pip git
sudo pip3 install ansible
mkdir -p "$HOME/workspace"
REPO="ansible_roles"
REPO_PATH="$HOME/workspace/$REPO"
if [ ! -d "$REPO_PATH" ] ; then
    git clone "https://github.com/the-it/$REPO.git" "$REPO_PATH"
fi
pushd $REPO_PATH || exit
  git reset --hard
  git checkout $BRANCH
popd || exit
ansible-galaxy install -r "$REPO_PATH/requirements.yml"
ansible-playbook "$REPO_PATH/$PLAYBOOK.yml"
set +x
