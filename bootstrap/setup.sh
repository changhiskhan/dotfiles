#!/bin/bash

echo "Installing base libs and tools"
sudo apt update
sudo apt install -y \
     build-essential \
     apt-transport-https ca-certificates \
     software-properties-common gnupg lsb-release


echo "Install sdkman"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

echo "Install python poetry"
curl -sSL https://install.python-poetry.org | python3 -

. conda.sh
conda config --set changeps1 False  # ohmyzsh is prettier
conda install -c conda-forge gh  # github cli

. aws.sh
. docker.sh
. terraform.sh
. jvm.sh
. nodejs.sh

# Pip conf
cat <<EOT >> $HOME/.config/pip/pip.conf
trusted-host = pypi.org
extra-index-url = https://pypi.org/simple
EOT


if [ -n "$XDG_CURRENT_DESKTOP" ]; then
  . desktop.sh
fi
