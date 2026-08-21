## Virtual Machine connection

### Configuring the remote connection

- Open VS Code > Open the [command palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) > Type `Remote-SSH: Connect to Host...`

  <img alt="vscode-connect-to-host" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-connect-to-host.png" width=500>

- Click on `Add a new host`

- Type `ssh -i ~/.ssh/vmware <username>@<ip address>`, for instance, my username is `itisi`, my VM has an IP of `172.16.999.999`: I'll type `ssh -i ~/.ssh/vmware itisi@172.16.999.999`

  <img alt="vscode-ssh-connection-command" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-ssh-connection-command.png" width=500>

- When prompted to `Select SSH configuration file to update`, pick the one in your home directory, under the `.ssh` folder, {% if os == "macos" %}`/Users/<username>/.ssh/config`{% elsif os == "linux" %}`/home/<username>/.ssh/config`{% elsif os == "windows" %}`C:\Users\<username>\.ssh\config`{% endif %%} basically. Usually VS Code will automatically pick the best option, so the default should work.

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


{% if os == "macos" %}

If the connection fails on macOS Sequoia 14 or newer, try this:
1. Check your macOS version, make sure you upgraded to 26.6.2 or newer. To check: *Menu - Apple icon - About This Mac*.
1. Check your VS Code version, make sure you upgraded to 1.134 or newer. To check: *Menu - Code - About Visual Studio Code*.
1. Restart VS Code and reconnect to the VM.

If that didn't help:
1. Quit VS Code with `Cmd-Q`, or *Quit* from the *Code* menu.
1. Go to *System Settings* of your Mac.
1. Go to the *Privacy & Security* tab.
1. Select *Local Networks* from the list.
1. Find *Visual Studio Code* and make sure the toggle is blue.
1. Close *System Settings*.
1. Restart VS Code and reconnect to the VM.

If that didn't help:
1. Quit VS Code with `Cmd-Q`, or *Quit* from the *Code* menu.
1. Then from your local terminal:
   ```bash
   ~/Library/Caches/com.microsoft.VSCode
   ```
1. Restart VS Code and reconnect to the VM.

{% endif %}

### Giving the remote connection a human-friendly name

Still on your *local* computer, lets create a more readable version of your machine to connect to!

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
Host "vmware-myvm"
  HostName 172.16.999.999 # replace with your VM's public IP address
  IdentityFile <file path for your ssh key>
  User <username>
```

Congratulations, the setup of your local computer is complete 🎉 We just need to fine tune your Virtual Machine 🪛

---

# Part 2: Configure your Virtual Machine 1

🚨🚨🚨 **All following terminal commands will be run from within your virtual machine terminal, via VS Code** 🚨🚨🚨
