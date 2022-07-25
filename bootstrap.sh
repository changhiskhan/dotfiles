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

OUTPUT=$(basename "$(git rev-parse --show-toplevel)" || echo "NOT_REPO")
if [ "$OUTPUT" == "NOT_REPO" ]; then
  git clone https://github.com/changhiskhan/dotfiles
  pushd dotfiles
fi

pushd ansible
export ANSIBLE_STDOUT_CALLBACK=debug
if sudo -n true 2> /dev/null; then
    ansible-playbook main.yml -vv
elif [ -z "$PS1" ]; then
    echo "Need sudo password but not in interactive prompt"
    exit 1
else
    ansible-playbook main.yml -vv --ask-become-pass
fi
