#!/bin/bash

set -e

sudo apt update
sudo apt install -y python3 python3-pip git
pip3 install --user ansible
touch ~/.zsh_local

# pushd dotfiles
export PATH=~/.local/bin:$PATH  # for ansible galaxy
ansible-galaxy install -r requirements.yml
export ANSIBLE_STDOUT_CALLBACK=debug

if sudo -n true 2> /dev/null; then
    # for codespaces
    ansible-playbook main.yml -vv -i hosts
    mkdir -p ~/.emacs.d/
    ln -s init.el ~/.emacs.d/init.el
    conda init zsh  # conda path is diff    
    conda config --set changeps1 False
    conda install -y -c conda-forge gh    
    # gh auth git-credential
    # AWS creds using secrets
else
    read -s -p "Enter a ssh-key passphrase: " ssh_passphrase
    ansible-playbook main.yml -vv --ask-become-pass -i hosts \
                     --extra-vars "ssh_passphrase=$ssh_passphrase"
fi
