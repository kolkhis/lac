
## Signing your Git Commits with SSH
* Generate an SSH key pair if you don't have one:
  ```bash
  ssh-keygen -t ed25519 -C "optional comment"
  ```
* Add SSH public key to github as "Signing Key".  
    * Settings -> GPG and SSH Keys -> Add SSH Key -> Dropdown -> Signing Key
* Configure git locally.
  ```bash
  git config --global user.signingkey "/home/YOUR_USERNAME/.ssh/id_ed25519"
  git config --global gpg.format ssh
  git config --global tag.gpgsign true
  git config --global user.signingkey ~/.ssh/id_ed25519.pub
  git config --global commit.gpgSign true
  mkdir -p ~/.config/git
  touch ~/.config/git/allowed_signers
  echo "YOUR_USERNAME $(cat ~/.ssh/id_ed25519.pub)" > ~/.config/git/allowed_signers
  git config --global gpg.ssh.allowedSignersFile ~/.config/git/allowed_signers
  # Make a commit to verify
  git log --show-signature -1
  ```

