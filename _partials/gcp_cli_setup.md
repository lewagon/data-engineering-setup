## Google Cloud CLI

The `gcloud` Command Line Interface (CLI) is used to communicate with Google Cloud Platform services through your terminal.

### Install gcloud

{% if os == "macos" %}

#### 1. Check to see if python 3 is available, otherwise install

If you don't know, run:

```bash
which -a python3
```

**If this only outputs one line containing `/usr/bin/python3`, then python 3 is NOT installed** - this is a placeholder that macOS has by default, if you run it, it will try to install xcode onto your computer.

If the output is more than one line, check the version of Python you have installed with:

```bash
python3 -v
```

❗ **The version installed must be greater than or equal to Python 3.10** ❗

If you do not have Python 3.10 or higher, install a newer Python version (any version between 3.10 - 3.14, inclusive) using your existing environment manager, or download from [https://www.python.org/downloads/macos/ 🔗](https://www.python.org/downloads/macos/)

#### 2. Download the gcloud sdk installer

Check if you have an M1 (or higher) or Intel processor by running:

```bash
uname -m

# M Chip: arm64
# Intel: x86_64
```

Only install **one of the following** based on your CPU type:

<details>
<summary>💡 I have an <strong>M chip (arm64)</strong> processor</summary>

Download the following `gcloud` sdk installer:

```bash
curl -o ~/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-darwin-arm.tar.gz
```
</details>

<br>

<details>
<summary>💡 I have an <strong>Intel (x86_64)</strong> processor</summary>

Download the following `gcloud` sdk installer:

```bash
curl -o ~/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-darwin-x86_64.tar.gz
```
</details>

#### 3. Install gcloud sdk

```bash
exec zsh
export CLOUDSDK_PYTHON=$(which python3)
cd ~
tar -xf google-cloud-sdk.tar.gz
./google-cloud-sdk/install.sh
```

You can accept all the default options by hitting enter.

❗ At a certain point (usually the 4th option), the installer will ask to download and install python3. You can say **no**.

Once the installer is finished, test the install by running:

```bash
gcloud --version
```

{% elsif os == "windows" %}

To install, download the Google Cloud CLI installer from this [link here 🔗](https://cloud.google.com/sdk/docs/install#windows).

Once it's finished downloading, launch the installer and follow the prompts. You only need to install `gcloud` for the current user.

On the last screen of the installer there will be four check boxes. Makes sure that the boxes for `Start Google SDK Shell` and `Run gcloud init to configure the Google Cloud CLI` are selected then click **Finish**. This should open a new **Command Prompt** window and ask a series of questions like:
- **Do you want to log in?** - type `y` and hit enter and following the prompts. It should open a web-browser to log in to your Google account.
    - Ensure you _'allow'_ Google Cloud to access different services
- **Pick cloud project to use** - Select your GCP Project ID that you want to connect with `gcloud`
- **Select your region and zone** - You can safely enter `n`. It's not important at the moment.

Once you've completed the `gcloud` setup, close **Command Prompt** and re-open it, then run:

```bash
gcloud config list
```

You should get an output similar to:

```bash
[accessibility]
screen_reader = True/False # depends on install options
[core]
account = your_email@domain.com
disable_usage_reporting = True/False # depends on install options
project = your_gcp_project

Your active configurations: [default]
```

Now `gcloud` is installed and authenticated 🚀

{% elsif os == "linux" %}

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

{% endif %}
