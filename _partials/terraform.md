## Terraform

Terraform is a tool for infrastructure as code (IAC) to create (and destroy) resources to create in the cloud.

$MAC_START
You can use `brew` to install terraform. In your terminal, run:

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```
$MAC_END
$WINDOWS_START
To install terraform, download the binary from the Terraform install page at this [link here 🔗](https://developer.hashicorp.com/terraform/install).

TODO: Unsure if anything needs to be added to PATH to get it to work
$WINDOWS_END
$LINUX_START
Install some basic requirements:
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

Terraform is not available to **apt** by default so we need to make it available.
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
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

Now we can install terraform directly with **apt** 👇
```bash
sudo apt update
sudo apt-get install terraform
```
$LINUX_END

Verify the installation with:

```bash
terraform --version
```
