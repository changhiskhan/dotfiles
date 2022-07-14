#!/bin/bash

set -e

sudo apt update
sudo apt install -y python3-pip

pip3 install --user ansible
ansible-galaxy install -r requirements.yml
ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook main.yml --ask-become-pass -i hosts
