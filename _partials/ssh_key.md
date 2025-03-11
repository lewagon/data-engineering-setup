## SSH key

We want to safely communicate with your virtual machine using [SSH protocol](https://en.wikipedia.org/wiki/Secure_Shell). We need to generate a SSH key to authenticate.

<details>
  <summary markdown='span'>Windows</summary>

  - We highly recommend installing [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701) from the Windows Store (installed on Windows 11 by default) to perform this operation.
  - Open Windows Terminal
  - Run one of the following commands:
    - If you're using _Windows PowerShell_:
      ```bash
      # replace "your_email@example.com" with your GCP account email
      ssh-keygen.exe -t ed25519 -f $HOME\.ssh\de-bootcamp -C "your_email@example.com"
      ```
    - If you're using the classic _Command Prompt_:
      ```bash
      # replace "your_email@example.com" with your GCP account email
      ssh-keygen.exe -t ed25519 -f %HOMEPATH%\.ssh\de-bootcamp -C "your_email@example.com"
      ```


</details>

<details>
  <summary markdown='span'>MacOS & Linux</summary>

  - Open your Terminal
  - Run the following command:
    ```bash
    # replace "your_email@example.com" with your GCP account email
    ssh-keygen -t ed25519 -f ~/.ssh/de-bootcamp -C "your_email@example.com"
    ```
</details>


You should get the following message: `> Generating public/private algorithm key pair.`

You should be asked to `Enter a passphrase` - this is optional if you want additional security. To continue without a passphrase press _Enter_ without typing anything when asked to enter a passphrase.

ℹ️ Don't worry if nothing is shown when you are typing, that is perfectly normal for security reasons.

You should be asked to `Enter same passphrase again`, do it.

**❗️ You must remember this passphrase.**

Your new SSH Key will be named `de-bootcamp`.
