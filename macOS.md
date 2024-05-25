# Setup instructions

You will find below the instructions to set up your computer for [Le Wagon Data Engineering course](https://www.lewagon.com/)

A part of the setup will be done on your **local machine** but most of the configuration will be done on a **virtual machine**.

Please **read instructions carefully and execute all commands in the following order**. If you get stuck, don't hesitate to ask a teacher for help :raising_hand:

Let's start :rocket:


## Zoom

To be able to interact when we are not in the same physical room, we will be using [Zoom](https://zoom.us/), a video conferencing tool.

:warning: If you already have Zoom installed, please make sure that the version is at least **5.6**.

Go to [zoom.us/download](https://zoom.us/download).

Under **Zoom Client** click the **Download** button.

Open the file you have just downloaded to install the app.

Open the Zoom app.

If you already have a Zoom account, sign in using your credentials.

If not, click on the **Sign Up Free** link:

![Sign Up Free to Zoom](https://github.com/lewagon/setup/blob/master/images/zoom_sign_up_free.png)

You will be redirected to Zoom's website to complete a form.

When it's done, go back to the Zoom app and sign in using your credentials.

You should then see a screen like this:

![Zoom Home Screen](https://github.com/lewagon/setup/blob/master/images/zoom_home_screen.png)

You can now close the Zoom app.


## Slack

[Slack](https://slack.com/) is a communcation platform pretty popular in the tech industry.

### Installation

[Download the Slack app](https://itunes.apple.com/us/app/slack/id803453959?mt=12) and install it.

:warning: If you are already using Slack in your browser, please download and install **the desktop app** which is fully featured.


### Settings

Launch the app and sign in to `lewagon-alumni` organization.

Make sure you **upload a profile picture** :point_down:

![How to upload a profile picture on Slack](https://github.com/lewagon/setup/blob/master/images/slack_profile_picture.gif)

The idea is that you'll have Slack open all day, so that you can share useful links / ask for help / decide where to go to lunch / etc.

To ensure that everything is working fine for video calls, let's test your camera and microphone:
- Open the Slack app
- Click your profile picture in the top right.
- Select `Preferences` from the menu.
- Click `Audio & video` in the left-side column.
- Below `Troubleshooting`, click `Run an audio, video and screensharing test`. The test will open in a new window.
- Check that your preferred speaker, microphone and camera devices appear in the drop-down menus, then click `Start test`.

![Check microphone and webcam with Slack](https://github.com/lewagon/setup/blob/master/images/slack_call_test.png)

:heavy_check_mark: When the test is finished, you should see green "Succeed" messages at least for your microphone and camera. :+1:

:x: If not, **contact a teacher**.

You can also install Slack app on your phone and sign in `lewagon-alumni`!


## GitHub account

Have you signed up to GitHub? If not, [do it right away](https://github.com/join).

:point_right: **[Upload a picture](https://github.com/settings/profile)** and put your name correctly on your GitHub account. This is important as we'll use an internal dashboard with your avatar. Please do this **now**, before you continue with this guide.

![GitHub picture](https://github.com/lewagon/setup/blob/master/images/github_picture.png)

:point_right: **[Enable Two-Factor Authentication (2FA)](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication#configuring-two-factor-authentication-using-text-messages)**. GitHub will send you text messages with a code when you try to log in. This is important for security and also will soon be required in order to contribute code on GitHub.


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


## Google Cloud Platform setup

[GCP](https://cloud.google.com/) is a cloud solution that you are going to use in order to work on a virtual machine.

### Project setup

**👌 Note: Skip to the next section if you already have a GCP project**

- Go to [Google Cloud](https://console.cloud.google.com/) and create an account if you do not already have one
- In the Cloud Console, on the project list, select or create a Cloud project

![](images/gcp-create-project.png)

- Give it a name such as `Wagon Bootcamp` for example
- Notice the `ID` automatically created for the project, e.g. `wagon-bootcamp-123456`

![](images/gcp_project.png)

### Account language

In order to facilitate the following of the instructions during the bootcamp, open your GCP account preferences:

https://myaccount.google.com/language

If the *preferred language* is not:
- **English**
- **United States**

Then switch the language to english:
- Click on the edit pen logo
- Select **English**
- Select **United States**
- Click on **Select**

### Billing account

**👌 Note: Skip to the next section if you already have a valid billing account**

You will now link your account to your credit card. This step is required or you will not be able to use the services provided by GCP. Do not worry, you will be able to consume most GCP services through free credits throughout the bootcamp.

![](images/gcp-billing.png)

- Click on **Billing**
- Click on **MANAGE BILLING ACCOUNTS**
- Click on **ADD BILLING ACCOUNT**
- Give a name to your billing account, e.g. `My Billing Account`
- Click on "I have read..." and agree the to the terms of service
- Click on **CONTINUE**
- Select your account type: `Individual`
- Fill your name and address

You should see that you have a free credit of "$300 credits over the next 90days".

- Click on card details
- Enter your credit card info
- Click on **START MY FREE TRIAL**

Once this is done, verify that your billing account is linked to your GCP project.

- Select your project
- Go to **Billing**
- Select **LINK A BILLING ACCOUNT**
- Select `My Billing Account`
- Click on **SET ACCOUNT**

You should now see:

```
Free trial status: $300 credit and 91 days remaining - with a full account, you'll get unlimited access to all of Google Cloud Platform.
```

<details>
  <summary>👉 If you do not own a credit card 👈</summary>


If you do not own a credit card, an alternative is to setup a **Revolut** account.
Revolut is a financial app that will allow you to create a virtual credit card linked to your mobile phone billing account.

Skip this step if you own a credit card and use your credit card for the setup.

Download the Revolut app, or go to [revolut](https://www.revolut.com/a-radically-better-account) and follow the steps to download the app (enter your mobile phone number and click on Get Started).

- Open the Revolut app
- Enter your mobile phone number
- Enter the verification code received by SMS
- The app will ask for your country, address, first and last name, date of birth, email address
- The app will also ask for a selfie and request your profession
- The app will require a photo of your identification card or passport

Once this is done, select the standard (free) plan. No need to add the card to Apple pay, or ask for a the delivery of a physical card, or add money securely.

You now have a virtual card which we will use for the GCP setup.

In the main view of the Revolut the app
- Click on Ready to use
- Click on the card
- Click on Show card details
- Note down the references of the virtual credit card and use them in order to proceed with the GCP setup

</details>

<details>
  <summary>👉 If you receive an email from Google saying "Urgent: your billing account XXXXXX-XXXXXX-XXXXXX has been suspended" 👈</summary>


This may happen especially in case you just setup a Revolut account.

- Click on PROCEED TO VERIFICATION
- You will be asked to send a picture of your credit card (only the last 4 digits, no other info)
- In case you used **Revolut**, you can send a screenshot of your virtual credit card (do not forget to remove the validity date from the screenshot)
- Explain that you are attending the Le Wagon bootcamp, do not own a credit card, and have just created a Revolut account in order to setup GCP for the bootcamp using a virtual credit card

You may receive a validation or requests for more information within 30 minutes.

Once the verification goes through, you should receive an email stating that "Your Google Cloud Platform billing account XXXXXX-XXXXXX-XXXXXX has been fully reinstated and is ready to use.".

</details>

## GCP APIs

You will use different GCP services during the bootcamp which needs to be activated and configured.

### Default APIs

Go to your project [APIs dashboard](https://console.cloud.google.com/apis/dashboard), you can see a bunch of APIs are already enabled:

<img alt='GCP APIs dashboard' src="images/gcp_apis_dashboard.png" width=200>

### Enable Compute Engine (virtual machines) API

**👌 Note: Skip to the next section if you already have Compute Engine enabled**

- In the search bar, type _compute_ and click on the Compute Engine result
    <img alt='APIs search' src="images/gcp_apis_search.png" width=500>
- Click on `ENABLE`

    <img alt='APIs enable' src="images/gcp_apis_enable.png" width=300>
- Compute Engine is now enabled on your project


## Virtual Machine (VM)

**👌 Note: Skip to the next section if you already have a VM set up**

_Note: The following section requires you already have a [Google Cloud Platform](https://cloud.google.com/) account associated with an active [Billing account](https://console.cloud.google.com/billing)._

- Go to console.cloud.google.com > > Compute Engine > VM instances > Create instance
- Name it `lewagon-data-eng-vm-<github_username>`, replace `<github_username>` with your own, e.g. `krokrob`
- Region `europe-west1`, choose the closest one among the [available regions](https://cloud.google.com/compute/docs/regions-zones#available)

    <img alt="gcloud-console-vm-create-instance" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-create-instance.png" width=500>
- In the section `Machine configuration` under the sub-heading `Machine type`
- Select General purpose > PRESET > e2-standard-4

    <img alt="gcloud-console-vm-e2-standard4" src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/v9dv42llst8qjp2uj0d1yr00po1g" width=500>
- Boot disk > Change
  - Operating system > Ubuntu
  - Version > Ubuntu 22.04 LTS x86/64
  - Boot disk type > Balanced persistent disk
  - Size > upgrade to 150GB

    <img alt="gcloud-console-vm-ubunt" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-ubunt.png" width=500>
- Open `Networking, Disks, ...` under `Advanced options`
- Open `Networking`

    <img alt="gcloud-console-vm-networking" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-networking.png" width=500>
- Go to `Network interfaces` and click on `default default (...)` with a downward arrow on the right.

    <img alt="gcloud-console-vm-network-interfaces" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-network-interfaces.png" width=500>
- This opened a box `Edit network interface`
- Go to the dropdown `External IPv4 address`, click on it, click on `RESERVE STATIC EXTERNAL IP ADDRESS`

    <img alt="gcloud-console-vm-create-static-ip" src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/1ax09j2zld7x0lsvpp9p8ld8u5vc" width=300>
- Give it a name, like "lewagon-data-eng-vm-ip-<github_username>" (replace `<github_username>` with your own) and description "Le Wagon - Data Engineering VM IP". This will take a few seconds.

    <img alt="gcloud-console-reserve-static-ip" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-reserve-static-ip.png" width=300>

- You will now have a public IP associated with your account, and later to your VM instance. Click on `Done` at the bottom of the section `Edit network interface` you were in.

    <img alt="gcloud-console-new-external-ip" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-new-external-ip.png" width=300>

### Public SSH key
- Open the `Security` section

    <img alt="gcloud-console-vm-security" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-security.png" width=300>
- Open the `Manage access` subsection

    <img alt="gcloud-console-manage-access" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-manage-access.png" width=200>
- Go to `Add manually generated SSH keys` and click `Add item`

    <img alt="gcloud-console-add-manual-ssh-key" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-add-manual-ssh-key.png" width=500>
- In your terminal display your public SSH key:
    - Windows: navigate to where you created your SSH key and open `id_ed25519.pub`

    - Mac/Linux users can use:
        ```bash
        cat ~/.ssh/id_ed25519.pub
        # OR cat ~/.ssh/de-bootcamp.pub if you created a unique key
        ```
- Copy your public SSH key and paste it:

    <img alt="gcloud-console-add-ssh-key-pub" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-add-ssh-key-pub.png" width=500>
- On the right hand side you should see

    <img alt="gcloud-console-vm-price-month" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-price-month.png" width=300>
- You should be good to go and click `CREATE` at the bottom

    <img alt="gcloud-console-vm-create" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-create.png" width=500>
- It will take a few minutes for your virtual machine (VM) to be created. Your instance will show up like below when ready, with a green circled tick, named `lewagon-data-eng-vm-krokrob` (`krokrob` being replaced by your GitHub username).

    <img alt="gcloud-console-vm-instance-running" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-instance-running.png" width=500>
- Click on your instance

    <img alt="gcloud-console-vm-running" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-running.png" width=500>
- Go down to the section `SSH keys`, and write down your username (you need it for the next section)

    <img alt="gcloud-console-vm-username" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-username.png" width=300>

Congrats, your virtual machine is up and running, it is time to connect it with VS Code!


## Visual Studio Code

### Installation

Let's install [Visual Studio Code](https://code.visualstudio.com) text editor.

- Go to [Visual Studio Code download page](https://code.visualstudio.com/download).
- Click on "Mac" button
- Uncompress the file you have just downloaded
- Move the VS Code file to your Applications

![VS Code to Application](images/osx_vscode.png)


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
- Type `ssh -i <path/to/your/private/key> <username>@<ip address>`, for instance, my username is `somedude`, my private SSH key is located at `~/.ssh/id_rsa` on my local computer, my VM has a public IP of `34.77.50.76`: I'll type `ssh -i ~/.ssh/id_rsa somedude@34.77.50.76`

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

❗️ It is important that the `Host` alias does not contain any whitespaces ❗️

```bash
# For instance
Host "de-bootcamp-vm"
  HostName 34.77.50.76 # replace with your VM's public IP address
  IdentityFile <file path for your ssh key>
  User <username>
```

**The setup of your local machine is over. All following commands will be run from within your 🚨 virtual machine**🚨 terminal (via VS code for instance)


## VS Code Extensions

Let's install some useful extensions to VS Code.

- Open your VS Code instance and make sure you're connected to the remote server. At the bottom left, you'll see:

<img alt="vscode-ssh" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/vscode-ssh.png" width=500>

- Open the VS Code terminal (`CMD` + `` ` `` or `CTRL` + `` ` ``) then run the following commands:

```bash
code --install-extension ms-vscode.sublime-keybindings
code --install-extension emmanuelbeziat.vscode-great-icons
code --install-extension ms-python.python
code --install-extension KevinRose.vsc-python-indent
code --install-extension ms-python.vscode-pylance
code --install-extension redhat.vscode-yaml
code --install-extension ms-azuretools.vscode-docker
code --install-extension tamasfe.even-better-toml
```

Here is a list of the extensions you are installing:
- [Sublime Text Keymap and Settings Importer](https://marketplace.visualstudio.com/items?itemName=ms-vscode.sublime-keybindings)
- [VSCode Great Icons](https://marketplace.visualstudio.com/items?itemName=emmanuelbeziat.vscode-great-icons)
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Python Indent](https://marketplace.visualstudio.com/items?itemName=KevinRose.vsc-python-indent)
- [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
- [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
- [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)


## Command line tools

### Zsh & Git

Instead of using the default `bash` [shell](https://en.wikipedia.org/wiki/Shell_(computing)), we will use `zsh`.

We will also use [`git`](https://git-scm.com/), a command line software used for version control.

Let's install them, along with other useful tools:
- Open an **VS Code terminal** connected to your VM
- Copy and paste the following commands:

```bash
sudo apt update
sudo apt install -y vim tmux tree git ca-certificates curl jq unzip zsh \
apt-transport-https gnupg software-properties-common direnv sqlite3 make \
postgresql postgresql-contrib build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
gcc default-mysql-server default-libmysqlclient-dev libpython3-dev openjdk-8-jdk-headless
```

These commands might ask for your password, if they do: type it in.

:warning: When you type your password, nothing will show up on the screen, **that's normal**. This is a security feature to mask not only your password as a whole but also its length. Just type in your password and when you're done, press `Enter`.

### GitHub CLI installation

Let's now install [GitHub official CLI](https://cli.github.com) (Command Line Interface). It's a software used to interact with your GitHub account via the command line.

In your terminal, copy-paste the following commands and type in your password if asked:

```bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install -y gh
```

To check that `gh` has been successfully installed on your machine, you can run:

```bash
gh --version
```

:heavy_check_mark: If you see `gh version X.Y.Z (YYYY-MM-DD)`, you're good to go :+1:

:x: Otherwise, please **contact a teacher**


## Oh-my-zsh

Let's install the `zsh` plugin [Oh My Zsh](https://ohmyz.sh/).

In a terminal execute the following command:

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

If asked "Do you want to change your default shell to zsh?", press `Y`

At the end your terminal should look like this:

![Ubuntu terminal with OhMyZsh](https://github.com/lewagon/setup/blob/master/images/oh_my_zsh.png)

:heavy_check_mark: If it does, you can continue :+1:

:x: Otherwise, please **ask for a teacher**


## GitHub CLI

CLI is the acronym of [Command-line Interface](https://en.wikipedia.org/wiki/Command-line_interface).

In this section, we will use [GitHub CLI](https://cli.github.com/) to interact with GitHub directly from the terminal.

It should already be installed on your computer from the previous commands.

First in order to **login**, copy-paste the following command in your terminal:

:warning: **DO NOT edit the `email`**

```bash
gh auth login -s 'user:email' -w
```

gh will ask you few questions:

`What is your preferred protocol for Git operations?` With the arrows, choose `SSH` and press `Enter`. SSH is a protocol to log in using SSH keys instead of the well known username/password pair.

`Generate a new SSH key to add to your GitHub account?` Press `Enter` to ask gh to generate the SSH keys for you.

If you already have SSH keys, you will see instead `Upload your SSH public key to your GitHub account?` With the arrows, select your public key file path and press `Enter`.

`Enter a passphrase for your new SSH key (Optional)`. Type something you want and that you'll remember. It's a password to protect your private key stored on your hard drive. Then press `Enter`.

`Title for your SSH key`. You can leave it at the proposed "GitHub CLI", press `Enter`.

You will then get the following output:

```bash
! First copy your one-time code: 0EF9-D015
- Press Enter to open github.com in your browser...
```

Select and copy the code (`0EF9-D015` in the example), then press `Enter`.

Your browser will open and ask you to authorize GitHub CLI to use your GitHub account. Accept and wait a bit.

Come back to the terminal, press `Enter` again, and that's it.

To check that you are properly connected, type:

```bash
gh auth status
```

:heavy_check_mark: If you get `Logged in to github.com as <YOUR USERNAME> `, then all good :+1:

:x: If not, **contact a teacher**.


## Google Cloud CLI

Install the `gcloud` CLI to communicate with [Google Cloud Platform](https://cloud.google.com/) through your terminal:
```bash
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
sudo apt-get install google-cloud-sdk-app-engine-python
```
👉 [Install documentation](https://cloud.google.com/sdk/docs/install#deb)

### Create a service account key 🔑

**👌 Note: Skip to the next section if you already have a service account key**

Now that you have created a `GCP account` and a `project` (identified by its `PROJECT_ID`), we are going to configure the actions (API calls) that you want to allow your code to perform.

<details>
  <summary>🤔 Why do we need a service account key ?</summary>


  You have created a `GCP account` linked to your credit card. Your account will be billed according to your usage of the ressources of the **Google Cloud Platform**. The billing will occur if you consume anything once the free trial is over, or if you exceed the amount of spending allowed during the free trial.

  In your `GCP account`, you have created a single `GCP project`, identified by its `PROJECT_ID`. The `GCP projects` allow you to organize and monitor more precisely how you consume the **GCP** ressources. For the purpose of the bootcamp, we are only going to create a single project.

  Now, we need a way to tell which ressources within a `GCP project` our code will be allowed to consume. Our code consumes GCP ressources through API calls.

  Since API calls are not free, it is important to define with caution how our code will be allowed to use them. During the bootcamp this will not be an issue and we are going to allow our code to use all the API of **GCP** without any restrictions.

  In the same way that there may be several projects associated with a GCP account, a project may be composed of several services (any bundle of code, whatever its form factor, that requires the usage of GCP API calls in order to fulfill its purpose).

  GCP requires that the services of the projects using API calls are registered on the platform and their credentials configured through the access granted to a `service account`.

  For the moment we will only need to use a single service and will create the corresponding `service account`.
</details>

Since the [service account](https://cloud.google.com/iam/docs/service-accounts) is what identifies your application (and therefore your GCP billing account and ultimately your credit card), you are going to want to be cautious with the next steps.

⚠️ **Do not share you service account json file 🔑** ⚠️ Do not store it on your desktop, do not store it in your git codebase (even if your git repository is private), do not let it by the coffee machine, do not send it as a tweet.

- Go to the [service accounts page](https://console.cloud.google.com/apis/credentials/serviceaccountkey)
- Select your project in the list of recent projects if asked to
- Create a service account:
  - Click on **CREATE SERVICE ACCOUNT**:
  - Give a `Service account name` to that account
  - Click on **CREATE AND CONTINUE**
  - Click on **Select a role** and choose `Quick access/Basic` then **Owner**, which gives full access to all ressources
  - Click on **CONTINUE**
  - Click on **DONE**
- Download the service account json file 🔑:
  - Click on the newly created service account
  - Click on **KEYS**
  - Click on **ADD KEY** then **Create new key**
  - Select **JSON** and click on **CREATE**

![](images/gcp_create_key.png)

The browser has now saved the service account json file 🔑 in your downloads directory (it is named according to your service account name, something like `le-wagon-data-123456789abc.json`)


### Configure Cloud sdk

- Open the service account json file with any text editor and copy the key
    ```
    # It looks like:
    {
        "type": "service_account",
        "project_id": "kevin-bootcamp",
        "private_key_id": "1234567890",
        "private_key": "-----BEGIN PRIVATE KEY-----\nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n-----END PRIVATE KEY-----\n",
        "client_email": "bootcamp@kevin-bootcamp.iam.gserviceaccount.com",
        "client_id": "1234567890",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/bootcamp%40kevin-bootcamp.iam.gserviceaccount.com"
    }
    ```
- **on your Virtual Machine**, create a `~/.gcp_keys` directory, then create a json file in it:
    ``` bash
    mkdir ~/.gcp_keys
    touch ~/.gcp_keys/le-wagon-de-bootcamp.json
    ```
- Open the json file then store the service account json file pasting the key:
    ```bash
    code ~/.gcp_keys/le-wagon-de-bootcamp.json
    ```
    ![service account json key](images/service_account_json_key.png)

    ❗️Don't forget to **save** the file with `CMD` + `s` or `CTRL` + `s`

- Authenticate the `gcloud` CLI with the google account you used for GCP
    ```bash
    # Replace service_account_name@project_id.iam.gserviceaccount.com with your own
    SERVICE_ACCOUNT_EMAIL=service_account_name@project_id.iam.gserviceaccount.com
    KEY_FILE=$HOME/.gcp_keys/le-wagon-de-bootcamp.json
    gcloud auth activate-service-account $SERVICE_ACCOUNT_EMAIL --key-file=$KEY_FILE
    ```
- List your active account and check your email address you used for GCP is present
    ```bash
    gcloud auth list
    ```
- Set your current project
    ```bash
    # Replace `PROJECT_ID` with the `ID` of your project, e.g. `wagon-bootcamp-123456`
    gcloud config set project PROJECT_ID
    ```
- List your active account and current project and check your project is present
    ```bash
    gcloud config list
    ```


## Dotfiles

Let's pimp your zsh and and vscode by installing lewagon recommanded dotfiles **on your Virtual Machine**

There are three options, choose **one**:

<details>
    <summary>
        <strong>I already attended Web-Dev or Data-Science bootcamp at Le Wagon <em>🚨 on the same Virtual Machine (highly unlikely!🚨)</em></strong>
    </summary>

This means that you already forked the GitHub repo `lewagon/dotfiles`, but at that time the configuration was maybe not ready for the new Data Science bootcamp.

Open your terminal and go to your `dotfiles` project:

```bash
cd ~/code/<YOUR_GITHUB_NICKNAME>/dotfiles
code . # Open it in VS Code
```

In VS Code, open the `zshrc` file. Replace its content with the [newest version](https://raw.githubusercontent.com/lewagon/dotfiles/master/zshrc) of that file that we provide. Save to disk.

Back to the terminal, run a `git diff` and ask a TA to come and check about this configuration change. You should see stuff about Python and `pyenv`.

Once this is good, commit and push your changes:

```bash
git add zshrc
git commit -m "Update zshrc for Data Engineering bootcamp"
git push origin master
```

</details>

OR


<details>
    <summary>
        <strong>I did not attend the Web-Dev or Data-Science bootcamp at Le Wagon</strong>
    </summary>

Hackers love to refine and polish their shell and tools. We'll start with a great default configuration provided by [Le Wagon](http://github.com/lewagon/dotfiles), stored on GitHub. As your configuration is personal, you need your own repository storing it, so you first need to fork it to your GitHub account.

:arrow_right: [Click here to **fork**](https://github.com/lewagon/dotfiles/fork) the `lewagon/dotfiles` repository to your account (you'll need to click again on your picture to confirm _where_ you do the fork).

Forking means that it will create a new repo in your GitHub account, identical to the original one. You'll have a new repository on your GitHub account, `your_github_username/dotfiles`. We need to fork because each of you will need to put specific information (e.g. your name) in those
files.


Open your terminal and run the following command:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

You should see your GitHub username printed. If it's not the case, **stop here** and ask for help.
There seems to be a problem with the previous step (`gh auth`).

Time to fork the repo and clone it on your laptop:

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/dotfiles --clone
```

Run the `dotfiles` installer.

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh install.sh
```

Check the emails registered with your GitHub Account. You'll need to pick one
at the next step:

```bash
gh api user/emails | jq -r '.[].email'
```

Run the git installer:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh git_setup.sh
```

:point_up: This will **prompt** you for your name (`FirstName LastName`) and your email.

:warning: You **need** to put one of the emails listed above thanks to the previous `gh api ...` command.
If you don't do that, Kitt won't be able to track your progress. 💡 Select the `@users.noreply.github.com` address if
you don't want your email to appear in public repositories you may contribute to.

Please now **quit** all your opened terminal windows.
</details>


OR

<details>
    <summary>
        <strong>I already attended Web-Dev or Data-Science bootcamp at Le Wagon <em>but not on this VM</em></strong>
    </summary>


Open your terminal and run the following command:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

You should see your GitHub username printed. If it's not the case, **stop here** and ask for help.
There seems to be a problem with the previous step (`gh auth`).

Time to fork the repo and clone it on your laptop:

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/dotfiles --clone
```

Run the `dotfiles` installer.

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh install.sh
```

Check the emails registered with your GitHub Account. You'll need to pick one
at the next step:

```bash
gh api user/emails | jq -r '.[].email'
```

Run the git installer:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh git_setup.sh
```

:point_up: This will **prompt** you for your name (`FirstName LastName`) and your email.

:warning: You **need** to put one of the emails listed above thanks to the previous `gh api ...` command.
If you don't do that, Kitt won't be able to track your progress. 💡 Select the `@users.noreply.github.com` address if
you don't want your email to appear in public repositories you may contribute to.

Please now **quit** all your opened terminal windows.
</details>


### zsh default terminal

Set `zsh` as your default VS Code terminal.

- Open terminal default profile settings

    <img alt="Terminal profile settings" src="images/terminal_profile_settings.png" width=500>
- Select `zsh /usr/bin/zsh`

    <img alt="Terminal zsh profile" src="images/terminal_zsh_profile.png" width=300>


## Disable SSH passphrase prompt

You don't want to be asked for your passphrase every time you communicate with a distant repository. So, you need to add the plugin `ssh-agent` to `oh my zsh`:

First, open the `.zshrc` file:

```bash
code ~/.zshrc
```

Then:
- Spot the line starting with `plugins=`
- Add `ssh-agent` at the end of the plugins list

:heavy_check_mark: Save the `.zshrc` file with `Ctrl` + `S` and close your text editor.


## Docker 🐋

Docker is an open platform for developing, shipping, and running applications.

### Install Docker and Docker Compose

Setup the dock apt repo

```bash
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

```bash
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install the right packages

```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Finally give your user permission to use `docker`

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

Run `docker run hello-world`, you should see something like:

<details>
  <summary markdown='span'>❗️ Permission denied while trying to connect to the Docker daemon socket. ❗️ </summary>

If you receive an error similar to the one below, navigate to the [GCP Compute Engine Console](https://console.cloud.google.com/compute/instances) and shut down your VM by selecting the tick box next to your VM instance and clicking STOP (closing and reopening VSCode is not enough).

![](images/docker_permission_denied_socket.png)

It will take a few minutes for your VM to turn off. Once it's fully off, turn your VM on again by checking the box next to the VM instance and clicking START. Give the VM a few minutes to fully start up and connect through VSCode. Once connected try `docker run hello-world` again. If you don't get an output similar to the below image, raise a ticket with a teacher.
</details>

![](images/docker_hello.png)

### Enable Artifact Registry API

**👌 Note: Skip to the next section if you already have an Artifact Registry repository**

[Artifact Registry](https://cloud.google.com/artifact-registry) is a GCP service you will use to store artifacts such as Docker images. The storage units are called repositories.

- Enable the service within your project using the `gcloud` CLI:
    ```bash
    gcloud services enable artifactregistry.googleapis.com
    ```
- Create a new Docker repository:
    ```bash
    # Set the repository name
    REPOSITORY=docker-hub
    # Set the location of the repository. Available locations: gcloud artifacts locations list
    LOCATION=europe-west1
    gcloud artifacts repositories create $REPOSITORY \
    --repository-format=docker \
    --location=$LOCATION \
    --description="Docker images storage"
    ```

### Gcloud authentication for Docker

You need to grant Docker access to push artifacts to (and pull from) your repository. There are different authentication methods, [gcloud credentials helper](https://cloud.google.com/artifact-registry/docs/docker/authentication#gcloud-helper) being the easiest.

- Define the repository hostname matching the repository `$LOCATION`:
    ```bash
    # If $LOCATION is "europe-west1"
    HOSTNAME=europe-west1-docker.pkg.dev
    ```
- Configure gcloud credentials helper:
    ```bash
    gcloud auth configure-docker $HOSTNAME
    ```
- Type `y` to accept the configuration
- Check your credentials helper is set:
    ```bash
    cat ~/.docker/config.json
    ```
    You should get:
    ```bash
    {
      "credHelpers": {
        "europe-west1-docker.pkg.dev": "gcloud"
      }
    }%
    ```


## Kubernetes
Kubernetes (K8s) is a system designed to make deploying auto-scaling containerized applications easily.

### Install kubectl
Kubectl is the cli for interacting with k8s!

https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

kubectl version --client
kubectl version --client --output=yaml
```

### Install minikube

Minikube is a way to quickly spin up a local kubernetes cluster!

https://minikube.sigs.k8s.io/docs/start/

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

### Test installation
To test that you can launch a cluster run:
```bash
minikube start
```
you should see your cluster booting up :

![](images/minikube_start.png)

Then to check the cluster run:
```bash
kubectl get po -A
```
you should be able to see your cluster running! :

![](images/minikube_base.png)

To tear it all down for now:

```bash
minikube delete --all
```


## Terraform

Terraform is a tool for infrastructure as code (IAC) to define resources to create in the cloud!

### Install terraform

Install some basic requirements
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

Terraform is not avaliable to apt by default so we need to make it avaliable!
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

```bash
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
```

```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
```

Now we can install terraform directly with apt 👇
```bash
sudo apt update
sudo apt-get install terraform
```

Verify the installation with:

```bash
terraform --version
```



## Spark

Spark is a data processing framework:

Move to your home directory:

```bash
cd ~
```

Download spark:

```bash
wget https://downloads.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz
```

Open the tarball:

```
mkdir -p ~/spark && tar -xvzf spark-3.5.1-bin-hadoop3.tgz -C ~/spark
```

Set the environment variables needed by spark:

```bash
echo "export SPARK_HOME=$HOME/spark/spark-3.5.1-bin-hadoop3" >> .zshrc
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> .zshrc
```

Test it works by running:

```bash
exec zsh
spark-shell
```


## Python & Pip

Ubuntu 22.04 has Python 3.8 pre-installed, but we want to have the latest security release of python 3.8 ([3.8.14](https://www.python.org/downloads/release/python-3814/))

Lets install pyenv to manage our python versions:

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
source ~/.zprofile
exec zsh
```
Now install 3.8.14:
```bash
pyenv install 3.8.14
pyenv global 3.8.14
```
Now `python --version` should return `3.8.14`

We'll also install a useful `pyenv` plugin called [`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv). Although we will be using `poetry` for package and virtual environment management, `pyenv-virtualenv` is useful for controlling python versions locally.

```bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
exec zsh
```

## Pipx

Next we are going to install [pipx](https://pypa.github.io/pipx/) to install python packages we want globally available while still using virtual environments

```bash
pip install --upgrade pip
python -m pip install --user pipx # --user so that each ubuntu user can have his own 'pipx'
python -m pipx ensurepath
exec zsh
```

Lets install a [tldr](https://github.com/tldr-pages/tldr) with pipx

```bash
pipx install tldr
```

Now `tldr` should be globally available (for the current user), test it out with:

```bash
tldr ls
```

Much more readable than the classic `man ls` (although sometimes you will still need to delve into the man pages to get all of the details!) and it even has pages not included in man such as `tldr gh`:

<img alt="tldr" src="images/tldr.png" width=500>


Lets add a few more packages we want globally available

### black

[black](https://black.readthedocs.io/en/stable/) for helping to format code

```bash
pipx install black
```

### Poetry

[Poetry](https://python-poetry.org/) is a modern Python package manager we will use throughout the bootcamp.

Install Poetry running the following command in your VS Code terminal:

```bash
pipx install poetry
```

Then, let's update default poetry behavior so that virtual envs are always created where `poetry install` is run.
During the bootcamp, you'll see a `.venv` folder being created inside each challenge folder.

```bash
poetry config virtualenvs.in-project true
```

Finally, update your VScode settings to tell it that this `.venv` relative folder path will be your default interpreter !

(Command Palette - **Preference: Open Remote Settings (JSON)**, then add the following line to the panel that opens on the right)
```yml
"python.defaultInterpreterPath": ".venv/bin/python",
```

## Direnv

[Direnv](https://direnv.net/) is a great utility that will look for `.envrc` files in your directories. When you `cd` into directories with a `.envrc` files, paths will automatically be updated. In our case, this will simplify our workflow and allow us to not have to worry about Poetry managed Python virtual environments.

1. First, setup the *direnv hook* to your zsh shell so that direnv gets activated anytime a `.envrc` file exists in current working directory.

```bash
code ~/.zshrc
```

```bash
plugins=(... direnv) # add this direnv to the existing list of plugins
```

2. Second, let's configure what will happens anytime `.envrc` file is found

```bash
code ~/.direnvrc
```
- Paste the following lines
    ```bash
    layout_poetry() {
      if [[ ! -f pyproject.toml ]]; then
          log_error 'No pyproject.toml found. Use `poetry new` or `poetry init` to create one first.'
          exit 2
      fi
      # create venv if it doesn't exist
      poetry run true

      export VIRTUAL_ENV=$(poetry env info --path)
      export POETRY_ACTIVE=1
      PATH_add "$VIRTUAL_ENV/bin"
    }
    ```
- Save and close the file

😎 Now, **anytime you `cd` into a challenge folder which contains a `.envrc` file which contains `layout_poetry()` command inside, the function will get executed and your virtual env will switch to the poetry one that is defined by the `pyproject.toml` !**
- No need to prefix all commands by `poetry run <my_command>`, but simply `<my_command>`
- Each challenge will have its own virtual env, and it will be seemless for you to switch between challenges/envs


## Let's Make!

Lets clone the challenges onto your **virtual machine**

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

Then

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/data-engineering-challenges --clone
```
You want this setup:

<img src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/W0D1/repo-setup.png" width=700 />

Check your remotes match `origin` your data engineering challenges and `upstream` lewagon's!
```bash
cd data-engineering-challenges
git remote -v
# origin          git@github.com:your_github_username/data-engineering-challenges.git (fetch)
# origin          git@github.com:your_github_username/data-engineering-challenges.git (push)
# upstream        git@github.com:lewagon/data-engineering-challenges.git (fetch)
# upstream        git@github.com:lewagon/data-engineering-challenges.git (push)
```

From challenge folder root **on the vm**, we'll run `make install`, which triggers 3 operations:

- `make install-poetry`: `cd` inside each challenge folders, and `poetry install` inside each! (takes a while)
- `make allow-envrc`: allow direnv to execute inside each folder (otherwise you have to manually "allow" it)
- `make own-repo`: allows your user to be the linux "owner" of all files in this challenge folder

Let's make! (You've got time for a coffee ☕️, or start next step during the install)

```bash
make install
```

⚠️ If at the very end of this process you get 3-4 errors like: `direnv: error .envrc file not found` - that is normal and nothing to worry about.



## DBeaver

Download and install [DBeaver](https://dbeaver.io/) on your local machine, a free and open source powerful tool to connect to any database, explore the schema and even **run SQL queries**.


## Kitt

:warning: If you have received an email from Le Wagon inviting you to sign up on Kitt (our learning platform), you can safely skip this step. Instead, please follow the instructions in the email you received if you haven't done so already.

If you are unsure about what to do, you can follow [this link](https://kitt.lewagon.com/). If you are already logged in, you can safely skip this section. If you are not logged in, click on `Enter Kitt as a Student`. If you manage to login, you can safely skip this step. Otherwise ask a teacher whether you should have received an email or follow the instructions below.

Register as a Wagon alumni by going to [kitt.lewagon.com/onboarding](http://kitt.lewagon.com/onboarding). Select your batch, sign in with GitHub and enter all your information.

Your teacher will then validate that you are indeed part of the batch. You can ask them to do it as soon as you completed the registration form.

Once the teacher has approved your profile, go to your email inbox. You should have 2 emails:

- One from Slack, inviting you to the Le Wagon Alumni slack community (where you'll chat with your buddies and all the previous alumni). Click on **Join** and fill the information.
- One from GitHub, inviting you to `lewagon` team. **Accept it** otherwise you won't be able to access the lecture slides.


