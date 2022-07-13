#!bin/bash

echo "Installing AWS cli"

mkdir -p $HOME/Downloads
pushd $HOME/Downloads
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
