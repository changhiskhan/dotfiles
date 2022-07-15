#!/bin/bash

set -e

sudo apt update
sudo apt install -y python3 python3-pip git
pip3 install --user ansible
touch ~/.zsh_local

mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}"
pushd "${XDG_CONFIG_HOME:=$HOME/.config}"
git clone -b ansible https://github.com/changhiskhan/dotfiles dotfiles

pushd dotfiles
export PATH=~/.local/bin:$PATH  # for ansible galaxy
ansible-galaxy install -r requirements.yml
export ANSIBLE_STDOUT_CALLBACK=debug