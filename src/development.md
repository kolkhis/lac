<head>
    <style> .flex-container { display: flex; align-items: center; gap: 20px; } </style>
</head>
<div class="flex-container">
        <img src="./assets/images/logo.png" width="64" height="64">
    <p>
        <h1>Developing the Systems Administration Course Locally</h1>
    </p>
</div>

It is strongly encouraged for contributors to test their changes before making 
commits. To help facilitate this process a set of instructions and guidelines 
are provided below. These guidelines are by no means a requirement or the only 
set of procedures to locally develop on this project.

The examples, code, and commands provided below were developed using such 
technologies as Ansible, containers, bash scripts, and more.

## Build Dependencies

---

The ProLUG Linux Administration Course (LAC) utilizes [mdBook](https://github.com/rust-lang/mdBook) 
(markdown Book), a friendly and popular markdown utility that quickly exports 
files and web structures for documentation or general website use cases.


Utilizing mdBook, this course then deploys the exported web structure to a 
[Git Pages workflow](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages) and runner that then produces an easily navigable website.


Below is the current workflow that deploys the Git Page for the course:

<img src="./assets/images/flow.png"></img>


To achieve this workflow locally the following environment and dependencies are 
required:

<dl>
    <dt>1. A localhost, this could be a container, virtual machine, or local machine</dt>
    <dt>2. The following packages installed on such machine:</dt>
    <dd>- httpd or apache</dd>
    <dd>- git</dd>
    <dd>- gcc</dd>
    <dd>- rust</dd>
    <dd>- cargo</dd>
    <dt>3. And a clone of the ProLUG LAC repository</dt>
</dl>

## Building, Deploying, and Developing Locally

---

Below is a set of scripts and Ansible-Playbooks that can quickly achieve this 
environment in an automated fashion. They are only designed to "standup" these 
machines, they are otherwise unintelligent and will not manage or cleanup 
environments if things go awry.  

### Ansible-Playbook

<https://github.com/ProfessionalLinuxUsersGroup/lac/src/assets/ansible-playbook.yml>

To use this playbook, your machine(s) must be configured correctly for Ansible. 
If you don't know the requirements to administer and Ansible machine, documentation 
has been provided below.

Getting started with Ansible:  
<https://docs.ansible.com/ansible/latest/getting_started/index.html>


### Bash Script

Export and execute this script to your Rocky Linux machine/container.

```bash
{Placeholder}
```

#### From here you can use such commands from your localhost to implement changes:  

```bash
cd {working lac directory}
~/.cargo/bin/mdbook build -d /var/www/html
systemctl restart {httpd or apache}
```

These commands will switch your shell into the appropriate directory, execute 
the necessary cargo binaries located in its installed PATH, build the mdBook 
from any files that were changed, and then finally restart the web server.

From there you should be able to see any changes you have made are reflected.  

#### Or send commands over to a networked container or machine:  

```bash
scp {working directory}/{targeted document} {TARGET_IP}:/root/lac/src/{targeted document}
ssh {TARGET_IP} "cd ~/lac && ~/.cargo/bin/mdbook build -d /var/www/html && systemctl restart httpd"
```
