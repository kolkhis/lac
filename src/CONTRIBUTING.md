![196572350](https://github.com/user-attachments/assets/6e1b8001-a88d-45cb-b551-c9359b70e1e7)

# Contibuting to the ProLUG Linux Sysadmin Course Book

The Professional Linux Users Group (ProLUG) has a set of requirements and guidelines to
contribute to this project. Below are a set of steps to ensure contributors are adhering 
to those guidelines and fostering a productive version control environment.

## Table of Contents
* [Signing your Git Commits with SSH](#signing-your-git-commits-with-ssh) 
* [Syncing your Fork with the Upstream ProLUG Repo](#syncing-your-fork-with-the-upstream-prolug-repo) 
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
  ssh-keygen -t ed25519
  ```
* Add SSH public key to github as "Signing Key".
  ![image](https://github.com/user-attachments/assets/01ce50dc-3ad2-4c53-a211-1b06e5d11c21)

    * Settings -> GPG and SSH Keys -> Add SSH Key -> Dropdown -> Signing Key
* Configure git locally to use the SSH key to sign your commits.
    * Here's a script that will do that, edit accordingly.  
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
Your commits should now be verified from your account. This helps us ensure that valid users are
contributing to this project. Unverified commits will be scrutinized and likely discarded.

![image](https://github.com/user-attachments/assets/9d6adb35-9b0e-49fa-9918-a0c5d0387188)

## Syncing your Fork with the Upstream ProLUG Repo 
![image](https://github.com/user-attachments/assets/a0eda533-446a-4674-a1a3-d299a7c2bfea)

In an effort to minimize merge conflicts we strongly suggest forks remain up to date with 
the original repository before committing changes. This will help us reduce pull request management overhead.
Note: Pull requests with substantial merge conflicts may be rejected.

You can do this from the GitHub web UI easily with the `Sync Fork` button. If you want to do this from the terminal, you can add a new `git remote` called `upstream`.  
```bash
git remote add upstream https://github.com/ProfessionalLinuxUsersGroup/lac.git
```
Then, to sync your local fork with the original repo, do a `git pull` from the `upstream` remote.  
```bash
git pull upstream main
```
Then your fork is up to date with the original upstream repo.

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
Whenever making changes, it is common to create a branch with an appropriate name, switch to
that branch, then make changes there.  
For example, if you're working on the Unit 1 Worksheet:
```bash
git branch unit1-worksheet
git switch unit1-worksheet
# Or, simply:
git switch -c unit1-worksheet
```
Make changes to the `u1ws.md`.  


### Commit and Push your Changes
First make sure your forked repo is [up-to-date with the original](#syncing-your-fork-with-the-original).
Create your commit (make sure it's [signed](#signing-your-git-commits-with-ssh)!), then push changes to **your own fork** on the new branch.  
  
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

