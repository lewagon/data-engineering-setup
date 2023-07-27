### VS Code Remote SSH Extension

We need to connect VS Code to a virtual machine in the cloud so you will only work on that machine during the bootcamp. A pretty useful [**Remote SSH Extension**](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) is available on the VS Code Marketplace.

- Open VS Code > Open the [command palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) > Type `Extensions: Install Extensions`

<img alt="VSCode extensions - Search - Remote" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-extensions-search-remote.png" width=500>

- Install the extension

<img alt="VS Code extensions - Remote - Details" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-extensions-remote.png" width=500>

That's the only extension you should install on your _local_ machine, we will install additional VS Code extensions on your _virtual machine_.

### Virtual Machine connection

- Open VS Code > Open the [command palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) > Type `Remote-SSH: Connect to Host...`

<img alt="vscode-connect-to-host" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-connect-to-host.png" width=500>

- Click on `Add a new host`
- Type `ssh -i <path/to/your/private/key> <username>@<ip address>`, for instance, my username is `somedude`, and private key at `~/.ssh/id_rsa`, with a public IP of `34.77.50.76`, I'll type `ssh -i ~/.ssh/id_rsa somedude@34.77.50.76`

<img alt="vscode-ssh-connection-command" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-ssh-connection-command.png" width=500>


- When prompted to `Select SSH configuration file to update`, pick the one in your home directory, under the `.ssh` folder, `~/.ssh/config` basically. Usually VS Code will pick automatically the best option, so their default should work.

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

```bash
# For instance
Host "data engineering bootcamp"
  HostName 35.240.107.210
  IdentityFile <file path for your ssh key>
  User <username>
```

**The setup of your local machine is over. All following commands will be run from within your 🚨 virtual machine**🚨 terminal (via VS code for instance)
