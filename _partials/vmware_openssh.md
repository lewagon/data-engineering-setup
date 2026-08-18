### Setting up OpenSSH

We will need this to be able to use SSH to connect to our VM.

> Because we are using VMware locally, we don't really need this. But we want to make a setup that is almost identical as if you were using a VM running on the cloud. That's why we'll use SSH.

Inside your VM, run `hostname -I`. Take note of the IP address that is shown.

<details>
  <summary>Troubleshooting if it doesn't work
  </summary>

  Make sure OpenSSH is running: `sudo systemctl status ssh`.

  If the server isn’t running, start it using: `sudo systemctl start ssh`.

  If it's not installed, install it using: `sudo apt install openssh-server`. Then go back in the reverse order.

</details>

Now, let's try to connect from your local machine's terminal to be sure everything works.

In your local terminal:

```bash
# Replace username with your firstname
# Replace ipadddress with the IP address you obtained above
ssh username@ipaddress
```

You should see your prompt change.

Let's check if you're in the VM:

```bash
hostname
```

This should return the name you gave to your VM: `myvm`.

Finally, exit, to disconnect from the VM and go back to your physical machine:

```bash
exit
```

