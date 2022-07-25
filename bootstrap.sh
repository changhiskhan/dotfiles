#!/bin/bash

set -e

sudo apt update
sudo apt install -y python3 python3-pip git
pip3 install --user ansible
touch ~/.zsh_local

# pushd dotfiles
pushd ansible
export PATH=~/.local/bin:$PATH  # for ansible galaxy
ansible-galaxy install -r requirements.yml

export ANSIBLE_STDOUT_CALLBACK=debug
if sudo -n true 2> /dev/null; then
    ansible-playbook main.yml -vv
else
    set -i
    ansible-playbook main.yml -vv --ask-become-pass
fi
