### Virtual Machine connection

We need to connect VS Code to our Virtual Machine in the cloud so you will only work on that machine during the bootcamp. We'll use the [Remote - SSH Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) that we previously installed.

To create the VS Code SSH configuration, run the following in your terminal:

```bash
gcloud compute config-ssh
```

You should get an output similar to:

```bash
You should now be able to use ssh/scp with your instances.
For example, try running:

  $ ssh lw-de-vm-tswift.europe-west1-b.wagon-bootcamp
# $ ssh lw-de-vm-<GITHUB_USERNAME>.<GCP_ZONE>.<GCP_PROJECT_ID>
```

To connect to your Virtual Machine, click on the small symbol at the very far bottom-left of your VS Code:

![](/images/vscode_remote_highlight.png)

It should bring up a menu:

![](/images/vscode_remote_menu.png)

Click on the name of your Virtual Machine:

![](/images/vscode_remote_hosts.png)

A new VS Code window will open. You will be asked to _fingerprint_ the connection. This is asking if you trust the remote host you are trying to connect to. Hit enter to continue.

![](/images/vscode_remote_fingerprint.png)

And you are connected! It should look similar too:

![](/images/vscode_remote_connected.png)

Notice the connection in the very bottom-left corner of your VS Code window. It should have the Connection type (SSH), and the name of the host you are connected to.

**The setup of your local machine is over. All following commands will be run from within your 🚨 virtual machine**🚨 terminal (via VS Code)
