<div class="flex-container">
        <img src="https://github.com/ProfessionalLinuxUsersGroup/img/blob/main/Assets/Logos/ProLUG_Round_Transparent_LOGO.png?raw=true" width="64" height="64"></img>
    <p>
        <h1>Unit 14 Lab: Ansible Automation</h1>
    </p>
</div>

## Intro

This **Unit 14 Lab** provides hands-on practice with Ansible, from basic environment setup and ad-hoc commands to creating playbooks and pushing configurations to multiple servers. By completing these exercises, you’ll gain a clearer understanding of how Ansible fits into your day-to-day administrative tasks.

---

## Resources / Important Links

- [Ansible Documentation](https://docs.ansible.com/)
- [Killercoda – Ansible Labs](https://killercoda.com/het-tanis/course/Ansible-Labs)
- [HPC_Deploy Repo](https://github.com/het-tanis/HPC_Deploy.git)

---

## Required Materials
- Putty  
- Rocky Server  
- Root or sudo command access  

---

## Warmup Exercises
Quickly run through your system and familiarize yourself:

```bash
mkdir /root/ansible_madness
cd /root/ansible_madness
dnf whatprovides ansible   # Where is Ansible installed from?
ansible --version          # What version of Ansible is installed?
ansible-<TAB>              # What other ansible-* tools are available?
ansible localhost -m shell -a uptime  # Compare with standalone `uptime`
ansible -vvv localhost -m shell -a uptime  # What extra info does -vvv show?
```

---

## Lab Exercises

### Create an Inventory File

While in `/root/ansible_madness`, create a file called `hosts`:

```bash
vi /root/ansible_madness/hosts
```

Add the following contents:

```ini
[servers]
192.168.200.101
192.168.200.102
192.168.200.103
```

---

### Run Ad Hoc Commands

Test connectivity into the servers:

```bash
ansible servers -i hosts -u inmate -k -m shell -a uptime
```

- Use password: `LinuxR0cks1!`

Verbose version:

```bash
ansible -vvv servers -i hosts -u inmate -k -m shell -a uptime
```

---

### Create a Playbook to Push Files

1. Create a test file:
```bash
echo "This is my file <yourname>" > somefile
```

2. Create `deploy.yaml`:

```yaml
---
- name: Start of push playbook
  hosts: servers
  vars:
  gather_facts: True
  become: False
  tasks:
    - name: Copy somefile over at {{ ansible_date_time.iso8601_basic_short }}
      copy:
        src: /root/ansible_madness/somefile
        dest: /tmp/somefile.txt
```

3. Run the playbook:
```bash
ansible-playbook -i hosts -k deploy.yaml
```

4. Verify the file was pushed everywhere:
```bash
ansible servers -i hosts -u inmate -k -m shell -a "ls -l /tmp/somefile"
```

---

### Pull Down a GitHub Repo

```bash
git clone https://github.com/het-tanis/HPC_Deploy.git
cd HPC_Deploy
```

Then reflect:
- What do you see in here?  
- What do you need to learn more about to deploy some of these tools?  
- Can you execute some of these? Why or why not?
 
## Downloads
#### - <a href="./assets/downloads/u14/u14_lab.pdf" target="_blank" download>📥 Download (`.pdf`)</a>
