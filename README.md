# Setup a dev machine quickly

The following command will clone the repo and run the setup on your localhost

```bash
bash <(curl -s https://raw.githubusercontent.com/changhiskhan/dotfiles/main/bootstrap.sh)
```

## Notes

DO NOT PUT SECRETS in .zshrc

## Post install
2. Restart is required for nvidia drivers
3. aws configure import --csv <credentials>
4. gh auth login --with-token $GH_TOKEN
5. gh ssh-key add ~/.ssh/id_ed25519.pub


TODOs:

- where to put conda init?
- conda config --set changeps1 False
- terraform autocomplete?
