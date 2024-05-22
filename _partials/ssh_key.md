## SSH key

We want to safely communicate with your virtual machine using [SSH protocol](https://en.wikipedia.org/wiki/Secure_Shell). We need to generate a SSH key to authenticate.

- Open your terminal

<details>
  <summary markdown='span'>💡 Windows tip</summary>

We highly recommend installing [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=fr-fr&gl=FR) from the Windows Store (installed on Windows 11 by default) to perform this operation
</details>

- Create a SSH key

<details>
  <summary markdown='span'>Windows</summary>

```bash
# replace "your_email@example.com" with your GCP account email
ssh-keygen.exe -t ed25519 -C "your_email@example.com"
```
</details>

<details>
  <summary markdown='span'>MacOS & Linux</summary>

```bash
# replace "your_email@example.com" with your GCP account email
ssh-keygen -t ed25519 -C "your_email@example.com"
```
</details>


You should get the following message: `> Generating public/private algorithm key pair.`
- When you are prompted `> Enter a file in which to save the key`, press Enter
- You should be asked to `Enter a passphrase` - this is optional if you want additional security. To continue without a passphrase press enter without typing anything when asked to enter a passphrase.

ℹ️ Don't worry if nothing prompt when you type, that is perfectly normal for security reasons.

- You should be asked to `Enter same passphrase again`, do it.

**❗️ You must remember this passphrase.**

<details>
  <summary markdown='span'> ❗️ /home/your_username/.ssh/id_ed25519 already exists.</summary>
If you receive this message, you may already have an SSH Key with the same name (if you are a Le Wagon Alumni or are using SSH Authentication with Github).

To create a separate SSH key to exclusively use for this bootcamp use the following:

```bash
# replace "your_email@example.com" with your GCP account email
ssh-keygen -t ed25519 -f ~/.ssh/de-bootcamp -C "your_email@example.com"
```

Your new SSH Key will be named `de-bootcamp`. Make sure to remember it for later!
</details>
