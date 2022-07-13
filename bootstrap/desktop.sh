#!/bin/bash

echo "Installing desktop tools"

sudo apt install -y terminator

sudo snap refresh
sudo snap install zoom-client
sudo snap install slack

pushd $HOME/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb


sudo snap install intellij-idea-ultimate --classic
sudo snap install pycharm-professional --classic
sudo snap install clion --classic

# nvidia (requires restart)
sudo apt install nvidia-drivers-510 nvidia-dkms-510
echo "You must restart your computer for nvidia driver installation to complete"





