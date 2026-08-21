# Part 3: Configure your Virtual Machine 2

## VM configuration with Ansible - Part 2

### Ansible Playbook 2

We'll be using a second **Ansible** playbook to further configure your Virtual Machine.

Start by downloading the ansible playbook:

```bash
curl -L -o ~/vm-ansible-setup/playbooks/setup_vm_part2.yml https://raw.githubusercontent.com/lewagon/data-engineering-setup/vmware-automation/automation/vm-ansible-setup/playbooks/setup_vm_part2.yml
```

And run with:

```bash
cd ~/vm-ansible-setup && ansible-playbook -K playbooks/setup_vm_part2.yml
```

And the playbook should start running! If you're asked if you want VS Code to behave more like Sublime Text, click accept.

❗ **If you created a password for your GitHub SSH key**
- You may be asked to type in your password during the playbook run
- The task: **Clone data-engineering-challenges from your GitHub to VM** will fail. This is OK and expected with how SSH keys work and how the playbooks are modifying your configuration. To resolve, in your terminal run: `exec zsh`, and then re-run the playbook.

❗ If any other errors occur, or you are unsure, raise a ticket with a teacher. You can safely run the playbook again and again. Generally, if the playbook runs from start to finish with no errors, everything should be good!

### What is the playbook installing?

While the playbook is running, let's go through what is being installed and configured.

**Python and Poetry**

Ubuntu 24.04 has Python pre-installed, but not the version we're going to use. We are going to use Python [3.12.8](https://www.python.org/downloads/release/python-3128/)

- Install [**pyenv** 🔗](https://github.com/pyenv/pyenv) and [**pyenv-virtualenv** 🔗](https://github.com/pyenv/pyenv-virtualenv). We'll use **pyenv** to manage the Python versions installed on the VM
- Install Python 3.12.8 with pyenv
- Install [**pipx** 🔗](https://pipx.pypa.io/stable/): Pipx is used to install python packages we want _globally_ available while still using virtual environments, like Poetry!
- Installing a few global python packages with **pipx**:
    - [**Poetry** 🔗]((https://python-poetry.org/)): Poetry is a modern Python package manager we will use throughout the bootcamp.
    - [**Ruff** 🔗]((https://docs.astral.sh/ruff/)): Ruff Is used to format and lint Python code.
    - [**tldr** 🔗]((https://github.com/tldr-pages/tldr)): tldr has much more readable version of `man` pages. Useful for quickly finding out how a program works.

**VS Code Configuration**

- Installing some **VS Code** extensions, but only on your VM. Here's a list of the extensions that are being installed:
    - [Sublime Text Keymap and Settings Importer](https://marketplace.visualstudio.com/items?itemName=ms-vscode.sublime-keybindings)
    - [VSCode Great Icons](https://marketplace.visualstudio.com/items?itemName=emmanuelbeziat.vscode-great-icons)
    - [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
    - [Python Indent](https://marketplace.visualstudio.com/items?itemName=KevinRose.vsc-python-indent)
    - [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
    - [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
    - [Containers](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-containers)
    - [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)
- Update the VS Code Python Interpreter path.

**Shell and System Configuration**

- Create the **direnv** poetry function. The same one from the lecture! This makes it easier to work with poetry.
- Adding some **Oh-My-ZSH** Plugins: by modifying your `.zshrc` file. Here's a list of the extra plugins:
    - **pyenv**: Auto-complete for pyenv, a tool used to manage python virtual environments
    - **gcloud**: Auto-complete for the gcloud CLI tool
    - **ssh-agent**: Saves your SSH password so you only have to enter it once per session.
    - **direnv**: A tool to load `.envrc` files when you `cd` into a directory. Great for loading environment variables.

**Data Engineering Challenges Repository**

The challenges that you'll be working on throughout the bootcamp! The playbook is forking the **data-engineering-challenges** repository from **lewagon** to your own GitHub user. Then cloning that repository from your GitHub account down onto your Virtual Machine.

💡 Curious about how Ansible playbooks are defined, take a look at the playbook being run at this [link here 🔗](https://github.com/lewagon/data-engineering-setup/blob/main-automation/automation/vm-ansible-setup/playbooks/setup_vm_part2.yml)

<details>
<summary markdown='span'>❓ Why two Ansible playbooks?</summary>

This second ansible playbook requires GitHub authorisation to fork the `lewagon/data-engineering-challenges` repository and it is also editing some of the Le Wagon recommended **dotfiles**. So we separated the process into two steps.
</details>

### Restart Virtual Machine

Once the playbook has finished running, you need to completely shutdown your Virtual Machine so that some of the configuration updates properly (specifically **pyenv** and **Docker**).

To shutdown your VM, go back to VMware.

In the menu, find *Virtual Machine*, and click on *Restart*.

Wait until the VM shows that it's rebooted. You won't have to login, because we can connect with VS Code through SSH.

It is possible that a certain point your IP address changes, and you're unable to connect.

In that case:

- In VMware, login to the machine. Your username should be your (lowercase) firstname. The password the same as your physical machine.
- Once logged in, run `hostname -I`. That will show your (new) IP address.

Back in VS Code:

- `Cmd-Shift-P` on macOS or `Ctrl-Shift-P` on Windows/Linux.
- Type in: _remote ssh config_.
- Select the option: **Remote-SSH: Open SSH Configuration File...**
- The first option is probably the correct one.
- Edit the file to replace the IP address.