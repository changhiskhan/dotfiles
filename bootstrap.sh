#!/bin/bash

set -e

sudo apt update
sudo apt install -y python3 python3-pip git
pip3 install --user ansible
touch ~/.zsh_local

mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}"
pushd "${XDG_CONFIG_HOME:=$HOME/.config}"
git clone https://github.com/changhiskhan/dotfiles dotfiles

pushd dotfiles
export PATH=~/.local/bin:$PATH  # for ansible galaxy
ansible-galaxy install -r requirements.yml
export ANSIBLE_STDOUT_CALLBACK=debug

read -s -p "Enter a ssh-key passphrase: " ssh_passphrase
ansible-playbook main.yml -vv --ask-become-pass -i hosts \
                          --extra-vars "ssh_passphrase=$ssh_passphrase"