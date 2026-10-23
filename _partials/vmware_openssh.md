### Setting up OpenSSH

We will need this to be able to use SSH to connect to our VM.

> Because we are using VMware locally, we don't really need this. But we want to make a setup that is almost identical as if you were using a VM running on the cloud. That's why we'll use SSH.

Still **inside your VM**, run `hostname -I`. Take note of the IP address that is shown.

<details>
  <summary>Troubleshooting if it doesn't work
  </summary>

  Make sure OpenSSH is running: `sudo systemctl status ssh`.

  If the server isn’t running, start it using: `sudo systemctl start ssh`.

  If it's not installed, install it using: `sudo apt install openssh-server`. Then go back in the reverse order.

</details>

Now, let's try to connect from your local machine's terminal to be sure everything works.

{% if os == "windows" %}

The following instructions assume you are using **Powershell** or **Windows Powershell**, not the basic *Command Prompt*. Normally you should already have one of both on your Windows machine.

:warning: **If you have WSL** on your Windows machine, make sure to open a (Windows) Powershell prompt, not an Ubuntu or other linux prompt!

{% endif %}


In **your local terminal**:

```bash
# Replace username with your firstname
# Replace ipadddress with the IP address you obtained above
ssh username@ipaddress
```

You might be asked *Are you sure you want to continue connecting (yes/no/[fingerprint])?*. Type in `yes` and `<Enter>`.

You should see your prompt change. If asked for a password, type the password you chose for your VM and `<Enter>`. Nothing will appear on the screen while you type, that's normal. 

Let's check if you're in the VM:

```bash
hostname
```

This should return the name you gave to your VM: `myvm`.

Finally, exit, to disconnect from the VM and go back to your physical machine:

```bash
exit
```

