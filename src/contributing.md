# Contibuting to the ProLUG Linux Sysadmin Course Book


## Table of Contents
* [Signing your Git Commits with SSH](#signing-your-git-commits-with-ssh) 
* [Syncing your Fork with the Original](#syncing-your-fork-with-the-original) 
* [Basic Contribution Workflow](#basic-contribution-workflow) 
    * [Create a Fork](#create-a-fork) 
    * [Clone the Fork to your Local Machine](#clone-the-fork-to-your-local-machine) 
    * [Create a New Branch](#create-a-new-branch) 
    * [Commit and Push your Changes](#commit-and-push-your-changes) 
    * [Comment your Changes](#comment-your-changes) 
    * [Create a Pull Request](#create-a-pull-request) 


## Signing your Git Commits with SSH
* Generate an SSH key pair if you don't have one:
  ```bash
  ssh-keygen -t ed25519 -C "optional comment"
  ```
* Add SSH public key to github as "Signing Key".  
    * Settings -> GPG and SSH Keys -> Add SSH Key -> Dropdown -> Signing Key
* Configure git locally to use the SSH key to sign your commits.
    * Here's a script that will do that.  
      ```bash
      #!/bin/bash
      GH_USERNAME="YourUsername"
      git config --global user.signingkey "/home/${GH_USERNAME}/.ssh/id_ed25519"
      git config --global gpg.format ssh
      git config --global tag.gpgsign true
      git config --global user.signingkey ~/.ssh/id_ed25519.pub
      git config --global commit.gpgSign true
      mkdir -p ~/.config/git
      touch ~/.config/git/allowed_signers
      echo "${GH_USERNAME} $(cat ~/.ssh/id_ed25519.pub)" > ~/.config/git/allowed_signers
      git config --global gpg.ssh.allowedSignersFile ~/.config/git/allowed_signers
      # Make a commit to verify
      git log --show-signature -1
      ```

## Syncing your Fork with the Original 
You'll need to keep your local fork of the repository up to date with the original repository.  
You can do this from the GitHub web UI easily with the `Sync Fork` button.  
If you want to do this from the terminal, you can add a new `git remote` called `upstream`.  
```bash
git remote add upstream https://github.com/ProfessionalLinuxUsersGroup/lac.git
```
Then, to sync your local fork with the original repo, do a `git pull` from the `upstream` remote.  
```bash
git pull upstream main
```
Then your repo is up to date with the original.  
You'll need to then use `git push `

## Basic Contribution Workflow
You'll create your own fork of the repository using the GitHub web UI, create a
branch, make changes, push to your fork, then open a pull request.  



### Create a Fork
- Go to the [original repository link](https://github.com/ProfessionalLinuxUsersGroup/lac).  
- Click on "Fork" on the top right.  
- Now you'll have your own version of the repository that you can clone.  
  ```bash
  git clone git@github.com:YOUR_USERNAME/lac.git
  # or, with https:
  git clone https://github.com/YOUR_USERNAME/lac.git
  ```


### Clone the Fork to your Local Machine
Then you'll need to clone your fork down to your local machine in order to work on it.  
```bash
git clone git@github.com:yourname/lac.git
```


### Create a New Branch
Whenever making changes, always create a branch with an appropriate name, switch to
that branch, then make changes there.  
If you're working on the Unit 1 Worksheet:
```bash
git branch unit1-worksheet
git switch unit1-worksheet
# or, simply:
git switch -c unit1-worksheet
```
Make changes to the `u1ws.md`.  


### Commit and Push your Changes
Create your commit (make sure it's [signed](#signing-your-git-commits-with-ssh)!), then push changes to **your own fork** on the new branch.  

Make sure your forked repo is [up-to-date with the original](#syncing-your-fork-with-the-original).  
```bash
git commit -m "descriptive commit message"
git push origin unit1-worksheet
```

### Comment your Changes
Before creating a pull request, make a comment on the issue containing your changes.  
We're doing this since the GitHub organization feature is paid and we are doing this for free, so there is only one person who is able to merge pull requests at the moment. 


### Create a Pull Request
Now you'll be able to go to the [original repository link](https://github.com/ProfessionalLinuxUsersGroup/lac) and go to the "Pull Requests" tab, and create a new pull request.  
Select your branch `unit1-worksheet`, and create a description and mention an issue by number (e.g., `#5`).  

