## Virtual Machine connection

- Open VS Code > Open the [command palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) > Type `Remote-SSH: Connect to Host...`

<img alt="vscode-connect-to-host" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-connect-to-host.png" width=500>

- Click on `Add a new host`

{% if os == "windows" %}

- Type `ssh -i C:\Users\<username>\.ssh\vmware <username>@<ip address>`, for instance, my Windows username is `itisi`, so my VM username would also be `itisi`, my VM has an IP of `172.16.999.999`: I'll type `ssh -i C:\Users\itisi\.ssh\vmware itisi@172.16.999.999`

{% else %}

- Type `ssh -i ~/.ssh/vmware <username>@<ip address>`, for instance, my username is `itisi`, my VM has an IP of `172.16.999.999`: I'll type `ssh -i ~/.ssh/vmware itisi@172.16.999.999`

{% endif %}

<img alt="vscode-ssh-connection-command" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-ssh-connection-command.png" width=500>

- When prompted to `Select SSH configuration file to update`, pick the one in your home directory, under the `.ssh` folder, `~/.ssh/config` or `C:\Users\<username>\.ssh\config` basically. Usually VS Code will pick automatically the best option, so their default should work.

<img alt="vscode-add-host-ssh-config" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-add-host-ssh-config.png" width=500>

- You should get a pop-up on the bottom right notifying you the host has been added

<img alt="vscode-host-added" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-host-added.png" width=500>

- Open again the [command palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) > Type `Remote-SSH: Connect to Host...` > Pick your VM IP address

<img alt="vscode-add-new-host" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-add-new-host.png" width=500>

- The first time, VSCode might ask you for a security permission like below, say yes / continue.

<img alt="vscode-remote-connection-confirm" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-remote-connection-confirm.png" width=500>

- Open again the [command palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) > Type `Terminal: Create New Terminal (in active workspace)` > You now have a Bash terminal in your virtual machine!

<img alt="vscode-command-palette-new-terminal" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-command-palette-new-terminal.png" width=500>
<br>
<img alt="vscode-terminal" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-terminal.png" width=500>

- Still on your *local* computer, lets create a more readable version of your machine to connect to!

```bash
code ~/.ssh/config
```

You should see something like the following:

```bash
Host <machine ip>
  HostName <machine ip>
  IdentityFile <file path for your ssh key>
  User <username>
```
You can now change Host to whatever you would like to see as the name of your connection or in terminal with `ssh <Host>`!

❗️ It is important that the `Host` alias does not contain any whitespaces ❗️

```bash
# For instance
Host "{{ vm_hostname }}"
  HostName 172.16.999.999 # replace with your VM's public IP address
  IdentityFile <file path for your ssh key>
  User <username>
```

**The setup of your local machine is over. All following commands will be run from within your 🚨 virtual machine**🚨 terminal (via VS code for instance)


{% if os == "windows" %}
### Confirm Your SSH Settings

Let's take a look at the SSH configuration that was just created and verify it. In VS Code:

1. Open the **command palette** with `ctrl + shift + P` and type in: _remote ssh config_
2. Select the option: **Remote-SSH: Open SSH Configuration File...**
3. In the next menu, select: the file that looks like: **C:\Users\YOUR_USERNAME\.ssh\config**
4. And a file should open that looks similar too:
{% endif %} 

### Connect with VS Code

To connect to your Virtual Machine, click on the small symbol at the very bottom-left corner of VS Code:

![](/images/vscode_remote_highlight.png)

It should bring up a menu, click on **Connect to Host...**:

![](/images/vscode_remote_menu.png)

Click on the name of your Virtual Machine:

![](/images/vscode_remote_hosts.png)

A new VS Code window will open. You may be asked to select the platform of the remote host, select **Linux**. You will then be asked to _fingerprint_ the connection. VS Code is asking if you trust the remote host you are trying to connect to. Hit enter to continue.

![](/images/vscode_remote_fingerprint.png)

And you are connected 🎉 It should look similar to the below image.

If you don't see a terminal open at the bottom or side of VS Code, you can open a terminal by selecting **Terminal** from the top ribbon menu and selecting **New Terminal** (makes sure to remember the key binding for later 😎)

![](/images/vscode_remote_connected.png)

Notice the connection in the very bottom-left corner of your VS Code window. It should have the Connection type (SSH), and the name of the host you are connected to.

<details>
<summary markdown='span'>Viewing your SSH Configuration</summary>

If you want to view your SSH configuration:
1. Start by clicking the symbol in the bottom-left corner of VS Code
2. Click on **Connect to Host...**
3. Click on **Configure SSH Hosts...**
4. Select the configuration file. Usually the file at the top of the list.
5. View your configuration file! You may need to edit this configuration if you change computers, or want to work on more than one computer during the bootcamp.

</details>

Congratulations, the setup of your local computer is complete 🎉 We just need to fine tune your Virtual Machine 🪛

---

# Part 2: Configure your Virtual Machine 1

🚨🚨🚨 **All following terminal commands will be run from within your virtual machine terminal, via VS Code** 🚨🚨🚨
