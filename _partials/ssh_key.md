## SSH key

We want to safely communicate with your virtual machine using [SSH protocol](https://en.wikipedia.org/wiki/Secure_Shell). We need to generate a SSH key to authenticate.

- Open your terminal (the one of your local machine!)

{% if os == "windows" %}

We highly recommend installing [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=fr-fr&gl=FR) from the Windows Store (installed on Windows 11 by default) to perform this operation

{% endif %}

- Create a SSH key

{% if os == "windows" %}

```bash
# replace "yourfirstname" with ... your first name
ssh-keygen.exe -t ed25519 -C "yourfirstname@local"
```

{% else %}

```bash
# replace "yourfirstname" with ... your first name
ssh-keygen -t ed25519 -C "yourfirstname@local"
```
</details>

{% endif %}


You should get the following message: `> Generating public/private algorithm key pair.`
- When you are prompted `> Enter a file in which to save the key`, type in `vmware` and hit `<Enter>`.
- You should be asked to `Enter a passphrase` - continue without a passphrase: press `<Enter>` without typing anything when asked to enter a passphrase.

- You should be asked to `Enter same passphrase again`, hit `<Enter>` again.

You will see some lines with a sort of graphic output, ending with a line containing `SHA256`. That's expected.

- Now we'll copy the ssh key into the VM:

  ```bash
  # Replace yourusername by your first name (lowercase)
  # Replace the numbers by the IP address of your VM obtained a few steps ago
  ssh-copy-id -i ~/.ssh/vmware yourusername@172.16.999.999
  ```

- You will be prompted `Are you sure you want to continue connecting (yes/no/[fingerprint])?`. Type in `yes` and `<Enter>`.

- Next you will be prompted for your password. That is the password you chose for the VM. We recommended you to use the same as for your physical machine. Type it. Nothing will appear, that's normal. Then `<Enter>`.

- Then it should say:


```text
Number of key(s) added:        1

Now try logging into the machine, with: "ssh -i /Users/yourusername/.ssh/vmware 'yourusername@172.16.999.999'" and check to make sure that only the key(s) you wanted were added.
```

- Let's do that: copy the part that says `sssh - i .... 999` (the IP address will be different for you), and paste it in your terminal. Hit `<Enter>`.

- Your prompt will change: you are now inside the VM!

- Check it by running `hostname` followed by `<Enter>`. It should say `myvm` (unless you chose another name for your vm earlier).

All good!

Type `exit` to get back to your local machine.

