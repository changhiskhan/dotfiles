# Setup a dev machine quickly

The following command will clone the repo and run the setup on your localhost

```bash
export GH_TOKEN=<github access token> (to setup ssh key)
sudo apt update
sudo apt install -y curl
curl -s https://raw.githubusercontent.com/changhiskhan/dotfiles/ansible/bootstrap.sh | bash
ansible-playbook main.yml -vv --ask-become-pass -i hosts
```


## Notes

1. DO NOT PUT SECRETS in .zshrc
2. Restart is required for nvidia drivers
3. aws configure import --csv <credentials>

