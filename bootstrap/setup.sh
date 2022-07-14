#!/bin/bash

echo "Install sdkman"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

sdk install java 11.0.12-open
sdk install sbt
sdk install scala 2.13.8

echo "Install python poetry"
curl -sSL https://install.python-poetry.org | python3 -

aws configure import --csv $2

terraform -install-autocomplete
cat <<EOT >> $HOME/.zsh_local
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
EOT

# Pip conf
cat <<EOT >> $HOME/.config/pip/pip.conf
trusted-host = pypi.org
extra-index-url = https://pypi.org/simple
EOT

echo "Adding ssh key to github"
gh ssh-key add ~/.ssh/id_ed25519.pub
