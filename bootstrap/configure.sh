#!bin/bash

if [ "$#" -ne 2 ]
then
  echo "Usage: . configure.sh <ssh-key-email> <aws credentials csv>"
  exit 1
fi

. ssh.sh $1
aws configure import --csv $2

cat <<EOT >> $HOME/.zsh_local
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
EOT
