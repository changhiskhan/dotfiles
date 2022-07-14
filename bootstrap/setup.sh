#!/bin/bash

echo "Install sdkman"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

echo "Install python poetry"
curl -sSL https://install.python-poetry.org | python3 -

. terraform.sh
. jvm.sh
