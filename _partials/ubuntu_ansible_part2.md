## VM configuration with Ansible - Part 2

### Ansible Playbook 2

We'll be using a second **Ansible** playbook to further configure your Virtual Machine.

Start by downloading the ansible playbook:

```bash
curl -L -o ~/vm-ansible-setup/playbooks/setup_vm_part2.yml https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/vm-ansible-setup/playbooks/setup_vm_part2.yml
```

And run with:

```bash
cd ~/vm-ansible-setup
ansible-playbook playbooks/setup_vm_part2.yml
```

And the playbook should start running!

❗ If any errors occur, raise a ticket with a teacher. You can safely run the playbook again.

<details>
<summary markdown='span'>❓ Why two Ansible playbooks?</summary>

This second ansible playbook requires GitHub authorisation to fork the `lewagon/data-engineering-challenges` repository and it is also editing some of the Le Wagon recommended **dotfiles**. So we separated the process into two steps.
</details>

### What is the playbook installing?

This playbook is installing and configuring a things, while the playbook is running, let's go through them:

**Python and Poetry**

Ubuntu 22.04 has Python pre-installed, but not the version we're going to use. We are going to use Python [3.12.8](https://www.python.org/downloads/release/python-3128/)

- Install **pyenv** and **pyenv-virtualenv**. We'll use **pyenv** to manage the Python versions installed on the VM
- Install Python 3.12.8 with pyenv
- Install **pipx**: [Pipx](https://pipx.pypa.io/stable/) is used to install python packages we want _globally_ available while still using virtual environments, like Poetry!
- Installing a few global python packages with **pipx**:
    - **Poetry:** [Poetry](https://python-poetry.org/) is a modern Python package manager we will use throughout the bootcamp.
    - **Ruff:** [Ruff](https://docs.astral.sh/ruff/) Is used to format and lint Python code.
    - **tldr:** [tldr](https://github.com/tldr-pages/tldr) has much more readable version of `man` pages. Useful for quickly finding out how a program works.

**VS Code Configuration**

- Installing some **VS Code** extensions, but only on your VM. Here's a list of the extensions that are being installed:
    - [Sublime Text Keymap and Settings Importer](https://marketplace.visualstudio.com/items?itemName=ms-vscode.sublime-keybindings)
    - [VSCode Great Icons](https://marketplace.visualstudio.com/items?itemName=emmanuelbeziat.vscode-great-icons)
    - [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
    - [Python Indent](https://marketplace.visualstudio.com/items?itemName=KevinRose.vsc-python-indent)
    - [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
    - [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
    - [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
    - [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)
- Update the VS Code Python Interpreter path.

**Shell and System Configuration**

- Create the **direnv** poetry function. The same one from the lecture! This makes it easier to work with poetry.
- Adding some **Oh-My-ZSH** Plugins: by modifying your `.zshrc` file. Here's a list of the extra plugins:
    - **pyenv**: Auto-complete for pyenv, a tool used to manage python virtual environments
    - **gcloud**: Auto-complete for the gcloud CLI tool
    - **ssh-agent**: Saves your SSH password so you only have to enter it once per session.
    - **direnv**: A tool to load `.envrc` files when you `cd` into a directory. Great for loading environment variables.
- Installing **Spark**: Spark is a distributed data processing framework

**Data Engineering Challenges Repository**

The challenges that you'll be working on throughout the bootcamp! The playbook is forking the **data-engineering-challenges** repository from **lewagon** to your own GitHub user. Then cloning that repository from your GitHub account down onto your Virtual Machine.

### Restart Virtual Machine

Once the playbook has finished running, you need to completely shutdown your Virtual Machine so that some of the configuration updates (specifically **pyenv** and **Docker**).

To shutdown your VM, navigate to the GCP Compute Engine Instances [console page 🔗](https://console.cloud.google.com/compute/instances).

Select your VM instance and click on the stop button:

![](/images/gcp_vm_stop.png)

Wait for a few minutes until the VM shows that it is completely off. You may need to refresh the page, the GCP Console doesn't dynamically update.

When the VM is completely off, turn it on again by selecting the check box next to your instance and clicking **START/RESUME**. Give it a minute to spin up, then connect via VS Code.
