## VM configuration with Ansible

We'll be using **ansible** to configure your Virtual Machine with some software, configurations, packages, and frameworks that you'll use in the bootcamp.

Let's start by confirming that ansible is installed. In your terminal run:

```bash
ansible --version
```

You should get an output similar to (some version numbers might change, that's fine):

```bash
ansible [core 2.17.9]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/tswift/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/tswift/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.12.3 (main, Feb  4 2025, 14:48:35) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
```

If not, raise a ticket with a teacher.

### Ansible Playbook 1

If everything looks ok, lets create a folder and download the ansible files:

```bash
mkdir -p ~/vm-ansible-setup/playbooks

curl -L -o ~/vm-ansible-setup/ansible.cfg https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/vm-ansible-setup/ansible.cfg
curl -L -o ~/vm-ansible-setup/hosts https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/vm-ansible-setup/hosts
curl -L -o ~/vm-ansible-setup/playbooks/setup_vm_part1.yml https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/vm-ansible-setup/playbooks/setup_vm_part1.yml
```

And run with:

```bash
cd ~/vm-ansible-setup
ansible-playbook playbooks/setup_vm_part1.yml
```

And the playbook should start running!

❗ If any errors occur, raise a ticket with a teacher. You can safely run the playbook again.

### What is the playbook installing?

This playbook is installing a few things, while the playbook is running, let's go through them:
- Updating system packages. Ubuntu uses the `APT` package manager.
- Changing the default shell from **bash** to **zsh**, a more customizable shell that is extensible and looks great!
- Installing the **Oh-My-ZSH** plugin for the **zsh** shell. We'll use it a bit later to add some quality of life plugins and extensions for `zsh`.
- Installing **Docker** on your Virtual Machine. Docker is an open platform for developing, shipping, and running applications. You will use it throughout the bootcamp
- Installing some **Kubernetes (k8s)** tooling: Kubernetes is a system designed to for auto-scaling containerized applications.
    - Installing **kubectl**: `kubectl` is the CLI tool for interacting with kubernetes clusters.
    - Installing **minikube**: Minikube is a way to quickly spin up a local kubernetes cluster. Great for developing!
- Installing **terraform**: we've already installed it once, but we need to install it on our VM! **Terraform** is an Infrastructure as Code (IaC) tool.
- Install the **GitHub CLI**: the CLI tool that we'll use to interact with your GitHub account directly from the terminal.

The playbook is also running checks to see if things are installed or not. This is so you can safely re-run the playbook without any problems.

Once the playbook has finished running. Kill your terminal (little trash can) and re-open it (you might have to do it a few times) until it looks similar to:

![](/images/vscode_after_ansible1.png)
