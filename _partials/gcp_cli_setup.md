## Google Cloud CLI

The `gcloud` Command Line Interface (CLI) is used to communicate with Google Cloud Platform services through your terminal.

### Install gcloud

$MAC_START
Install with `brew`:

```bash
brew install --cask google-cloud-sdk
```

Then you can:

```bash
$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/install.sh
```

👉 [Install documentation 🔗](https://cloud.google.com/sdk/docs/install#)
$MAC_END
$WINDOWS_START

To install download the Google Cloud CLI installer from this [link here 🔗](https://cloud.google.com/sdk/docs/install#windows).

Once it's finished downloading, launch the installer and follow the prompts.

On the last screen of the installer there will be four check boxes. Makes sure that the box for `run gcloud init` is selected. On confirmation this should open a new command prompt and ask a series of questions like:
- **Do you want to log in?** - type `y` and hit enter and following the prompts
- **Select your region and zone?** - type `y` and hit enter and select the geographic **region** that is closest to you. Refer to the GCP Region and Zone documentation at this [link here 🔗](https://cloud.google.com/compute/docs/regions-zones). There may be multiple options for each **region**, denoted by `-a`, `-b`, or `-c`, it doesn't matter which one you choose.

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

👉 [Install documentation 🔗](https://cloud.google.com/sdk/docs/install#deb)
$LINUX_END

To test your install, run the following in your terminal:

```bash
gcloud --version
```
