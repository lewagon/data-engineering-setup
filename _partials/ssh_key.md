## SSH key

We want to safely communicate with your virtual machine using [SSH protocol](https://en.wikipedia.org/wiki/Secure_Shell). We need to generate a SSH key to authenticate.

- Open your terminal

<details>
  <summary markdown='span'>💡 Windows tip</summary>

We highly recommend installing [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=fr-fr&gl=FR) from the Windows Store (installed on Windows 11 by default) to perform this operation
</details>

- Create a SSH key
```bash
EMAIL="your_email@example.com" # replace with your GCP account email
ssh-keygen -t ed25519 -C $EMAIL
```
You should get the following message: `> Generating public/private algorithm key pair.`
- When you are prompted `> Enter a file in which to save the key`, press Enter
- You should be asked to `Enter a passphrase`, type a secure passphrase, it is like a password, but longer.
ℹ️ Don't worry if nothing prompt when you type, that is perfectly normal for security reasons.
- You should be asked to `Enter same passphrase again`, do it.
**❗️ You must remember this passphrase.**

