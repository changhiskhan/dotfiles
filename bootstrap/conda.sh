#!bin/bash

echo "Installing Miniconda"

pushd $HOME/Downloads
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b

pushd $HOME/miniconda3/bin
./conda update -y conda
./conda init zsh
source $HOME/.zshrc

conda --version
