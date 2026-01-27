## Terraform

Terraform is a tool for [Infrastructure as Code (IaC) 🔗](https://en.wikipedia.org/wiki/Infrastructure_as_code) to create, destroy, and manage resources in the cloud.

$MAC_START

You can use `brew` to install terraform. In your terminal, run:

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

$MAC_END

$WINDOWS_START

### Download

To install terraform, download the **zip archive** from the Terraform install page at this [link here 🔗](https://developer.hashicorp.com/terraform/install).

❗ If you are using Windows 10 or 11, download the **AMD64** version (64 bit version). ❗

1. Using file explorer to go to the location you downloaded the **terraform zip archive**

2. **Unzip** the archive and two files should appear: `terraform.exe` and `license.txt`.

3. Copy `terraform.exe`

4. Navigate to your home directory (`C:\Users\<YOUR_USERNAME>\`) and create a directory named `terraform_cli`

5. Paste `terraform.exe` in the `terraform_cli` directory

### Add terraform to PATH

We need to manually add **Terraform** to the `PATH` environment variable. The `PATH` variable contains a list of directories that your computer looks in for programs that we run from the command prompt.

To update your path:
1. Open Windows Search and search for: **Environment variables**

2. Select and open **Edit environment variables for your account**

3. Under **User variables for <YOUR_USERNAME>** click on the variable named: `Path` to select it, then click on **Edit**

3. In the new pop out window, click **New** on the top right

4. Into the empty box that was just created, enter: `%USERPROFILE%\terraform_cli`

5. Click **Ok** to close the `Path` variable window, and click **Ok** again to close the Environment Variable window.

6. Close **Command Prompt** and open it again

$WINDOWS_END

$LINUX_START

Install some system requirements requirements:
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

Terraform is not available on **apt** by default, so we need to manually add the repository.
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

Now we can install terraform directly with **apt** using:
```bash
sudo apt update
sudo apt-get install terraform
```

$LINUX_END

Verify the installation with:

```bash
terraform --version
```

The output should look similar to:

```bash
Terraform v1.14.3
on <your_operating_system>_<your_cpu_architecture>

$MAC_START
# macOS (M chip) example
# Terraform 1.14.3
# on darwin_arm64
$MAC_END
$WINDOWS_START
# Windows example
# Terraform v1.14.3
# on windows_amd64
$WINDOWS_END
$LINUX_START
# Linux example
# Terraform v1.14.3
# on linux_amd64
$LINUX_END
```
