#!/bin/bash

echo "Installing base libs and tools"
sudo apt update
sudo apt install -y \
     build-essential

echo "Install sdkman"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

echo "Install python poetry"
curl -sSL https://install.python-poetry.org | python3 -


conda install -c conda-forge gh  # github cli

. terraform.sh
. jvm.sh
. nodejs.sh

if [ -n "$XDG_CURRENT_DESKTOP" ]; then
  . desktop.sh
fi
