## VM configuration with Ansible

We'll be using [Ansible 🔗](https://docs.ansible.com/ansible/latest/getting_started/introduction.html) to configure your Virtual Machine with some software, configurations, packages, and frameworks that you'll use in the bootcamp.

Let's start by installing ansible:

```bash
sudo apt install ansible-core
```

Then, in your terminal run:

```bash
ansible --version
```

You should get an output similar to (some version numbers might change, that's fine):

```
ansible [core 2.19.5]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/tswift/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/tswift/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.12.3 (main, Feb  4 2025, 14:48:35) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
```

❗ If not, raise a ticket with a teacher 🙋

### Ansible Playbook 1

Create a folder and download the ansible files:

```bash
mkdir -p ~/vm-ansible-setup/playbooks
```

```bash
curl -L -o ~/vm-ansible-setup/ansible.cfg https://raw.githubusercontent.com/lewagon/data-engineering-setup/main-automation/automation/vm-ansible-setup/ansible.cfg \
&& curl -L -o ~/vm-ansible-setup/hosts https://raw.githubusercontent.com/lewagon/data-engineering-setup/main-automation/automation/vm-ansible-setup/hosts \
&& curl -L -o ~/vm-ansible-setup/playbooks/setup_vm_part1.yml https://raw.githubusercontent.com/lewagon/data-engineering-setup/main-automation/automation/vm-ansible-setup/playbooks/setup_vm_part1.yml
```

And run with:

```bash
cd ~/vm-ansible-setup && ansible-playbook -K playbooks/setup_vm_part1.yml
```

You will be asked for a password, enter your password for the VM user. This is because some of the installation steps require `sudo` access.

And the playbook should start running!

❗ If an error occur, raise a ticket with a teacher. The ansible playbooks are designed so that they can be run again, and again, and again and only make the changes that are required (a cool concept called _Idempotency_ that you'll learn about later 😉).

### What is the playbook installing?

While this playbook is running, lets go through what is being installed and configured:
- Updating system packages. Ubuntu (and other Debian based linux distributions) uses the `apt` package manager
- Changing the default shell from **bash** to **zsh**, a more customizable shell that is extensible and looks great!
- Installing the [**Oh-My-ZSH** 🔗](https://ohmyz.sh/) plugin for the **zsh** shell. We'll use it a bit later to add some quality of life plugins and extensions to `zsh`
- Installing [**Docker** 🔗](https://www.docker.com/) on your Virtual Machine. Docker is an open platform for developing, shipping, and running applications. You will use it throughout the bootcamp
- Installing [**Terraform** 🔗](https://developer.hashicorp.com/terraform). **Terraform** is an Infrastructure as Code (IaC) tool
- Install the [**GitHub CLI** 🔗](https://cli.github.com/): the CLI tool that we'll use to interact with your GitHub account directly from the terminal

The playbook is also running checks to see if things are installed or not. This is so you can safely re-run the playbook without any problems.

💡 Curious about how Ansible playbooks are defined, take a look at the playbooks' source code at this [link here 🔗](https://github.com/lewagon/data-engineering-setup/blob/main-automation/automation/vm-ansible-setup/playbooks/setup_vm_part1.yml). You might not understand exactly what is happening, but should be able to identify the different tasks.
