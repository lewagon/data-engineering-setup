## Google Cloud CLI

The `gcloud` Command Line Interface (CLI) is used to communicate with Google Cloud Platform services through your terminal.

### Install gcloud

$MAC_START
Install with `brew`:

```bash
brew install --cask google-cloud-sdk
```

Then install `gcloud` with:

```bash
$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/install.sh
```

To test your install, open a new terminal and run:

```bash
gcloud --version
```

👉 [Install documentation 🔗](https://cloud.google.com/sdk/docs/install#mac)
$MAC_END
$WINDOWS_START

To install, download the Google Cloud CLI installer from this [link here 🔗](https://cloud.google.com/sdk/docs/install#windows).

Once it's finished downloading, launch the installer and follow the prompts. You only need to install `gcloud` for the current user.

On the last screen of the installer there will be four check boxes. Makes sure that the boxes for `Start Google SDK Shell` and `Run gcloud init to configure the Google Cloud CLI` are selected then click **Finish**. This should open a new **Command Prompt** window and ask a series of questions like:
- **Do you want to log in?** - type `y` and hit enter and following the prompts. It should open a web-browser to log in to your Google account.
- **Pick cloud project to use** - Select your GCP Project ID that you want to connect with `gcloud`
- **Select your region and zone** - You can safely enter `n`. It's not important to us at the moment.

Once you've completed the `gcloud` setup, close **Command Prompt** and re-open it, then run:

```bash
gcloud config list
```

You should get an output similar to:

```
[accessibility]
screen_reader = True/False # depends on install options
[core]
account = your_email@domain.com
disable_usage_reporting = True/False # depends on install options
project = your_gcp_project

Your active configurations: [default]
```

Now `gcloud` is installed and authenticated 🚀
$WINDOWS_END
$LINUX_START
Add the `APT` repository and install with:

```bash
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
sudo apt-get install google-cloud-sdk-app-engine-python
```

To test your install, open a new terminal and run:

```bash
gcloud --version
```
👉 [Install documentation 🔗](https://cloud.google.com/sdk/docs/install#deb)
$LINUX_END
