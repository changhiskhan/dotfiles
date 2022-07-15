#!/bin/bash

set -e

sudo apt update
sudo apt install -y python3 python3-pip git
pip3 install --user ansible
touch ~/.zsh_local

pushd "${XDG_CONFIG_HOME:=$HOME/.config}"
git clone https://github.com/changhiskhan/dotfiles dotfiles

pushd dotfile
ansible-galaxy install -r requirements.yml
ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook main.yml --ask-become-pass -i hosts