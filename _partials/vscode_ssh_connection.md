## Virtual Machine connection

### Create SSH keys

We need to connect VS Code to our Virtual Machine in the cloud so you will only work on that machine during the bootcamp. We'll use the [Remote - SSH Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) that we previously installed.

To create the VS Code SSH configuration, run the following in your terminal:

```bash
gcloud compute config-ssh
```

`gcloud` may tell you it needs to create a directory to continue. Accept and you should get an output similar to:

```bash
You should now be able to use ssh/scp with your instances.
For example, try running:

  $ ssh lw-de-vm-tswift.europe-west1-b.wagon-bootcamp
# $ ssh lw-de-vm-<GITHUB_USERNAME>.<GCP_ZONE>.<GCP_PROJECT_ID>
```

$WINDOWS_START
### SSH File Permissions

Windows has strict permissions for SSH files by default, we need to alter some permissions on the SSH configuration that was created by `gcloud` so VS Code can read the files and manage the SSH connection.

In Command Prompt run:

```cmd
icacls %USERPROFILE%\.ssh\config /inheritence:r
icacls %USERPROFILE%\.ssh\config /grant:r %USERNAME%:(R)
icacls %USERPROFILE%\.ssh\config /grant:r SYSTEM:(R)
```

And:

```cmd
icacls %USERPROFILE%\.ssh\google_compute_engine /inheritence:r
icacls %USERPROFILE%\.ssh\google_compute_engine /grant:r %USERNAME%:(R)
icacls %USERPROFILE%\.ssh\google_compute_engine /grant:r SYSTEM:(R)
```
$WINDOWS_END

### Connect with VS Code

To connect to your Virtual Machine, click on the small symbol at the very bottom-left corner of VS Code:

![](/images/vscode_remote_highlight.png)

It should bring up a menu, click on **Connect to Host...**:

![](/images/vscode_remote_menu.png)

Click on the name of your Virtual Machine:

![](/images/vscode_remote_hosts.png)

A new VS Code window will open. You may be asked to select the platform of the remote host, select **Linux**. You will then be asked to _fingerprint_ the connection. VS Code is asking if you trust the remote host you are trying to connect to. Hit enter to continue.

![](/images/vscode_remote_fingerprint.png)

And you are connected! It should look similar too:

![](/images/vscode_remote_connected.png)

Notice the connection in the very bottom-left corner of your VS Code window. It should have the Connection type (SSH), and the name of the host you are connected to.

**The setup of your local machine is over. All following commands will be run from within your 🚨 virtual machine**🚨 terminal (via VS Code)

We'll be doing some of the steps again, but that's because the virtual machine is a completely new computer!

<details>
<summary markdown='span'>Viewing your SSH Configuration</summary>

If you want to view your SSH configuration:
1. Start by clicking the symbol in the bottom-left corner of VS Code
2. Click on **Connect to Host...**
3. Click on **Configure SSH Hosts...***
4. Select the configuration file. Usually the file at the top of the list.
5. View your configuration file! You may need to edit this configuration if you change computers, or want to work on more than one computer during the bootcamp.

</details>
