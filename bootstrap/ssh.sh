#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Usage: sh devtools.sh <email>@<address>"
  exit 1
fi

ssh-keygen -t ed25519 -C "$1"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "Adding ssh key to github"
gh ssh-key add ~/.ssh/id_ed25519.pub
