# 💻 Automated DE GCP VM Setup - Terraform + Ansible

This document contains instructions to set a largely automated VM setup on Google Cloud Platform.

This setup has three main components, with the second and third components being largely automated:

## Part 1: Setup of your local computer

In this section we'll setup your local computer with some required software. This will include:
1. Installing some communication tools: Zoom, Slack
1. Creating some accounts: Github, Google Cloud Platform
1. Installing Visual Studio Code (VS Code) and some useful VS Code extensions
1. Installing and authenticating the GCP Command Line Tool (CLI): `gcloud`. You'll be using `gcloud` to create the connection between your local machine and the virtual machine you'll be creating!
1. Installing **Terraform** on your local computer. Terraform is an **Infrastructure as Code** (IaC) tool that you'll use to automate the creation of your VM!
1. Connect VS Code to your VM!

## Part 2: Configuration of your Virtual Machine part 1

All parts of this section will happen on your VM.

In this section you will:
1. Authenticate your VM with `gcloud` and for code that interacts with GCP Services
1. Run an `ansible` playbook. Ansible is another **Infrastructure as Code** tool that is used to automate the configuration and installation of software on computers. Perfect for fine tuning your VM.
1. Login to the GitHub CLI tool on your VM
1. Copy some **dotfiles** provided. **Dotfiles** are more settings that will enhance your terminal and developer experience.

## Part 3: Configuration of your Virtual Machine part 2

All parts of this section will happen on your VM.

In this section you will:
1. Run a second `ansible` playbook. This playbook will:
    1. Install some tools and frameworks (like python)
    1. Fork a repository with content
    1. Install python virtual environment for every challenge using poetry
1. You'll test your setup to make sure everything is working as intended 👌

<br>

# 1️⃣ Local Machine Setup

We'll start with some communication tools that are widely used.

## 1.1. Zoom

Use existing fragment

## 1.2. Slack

Use existing fragment

## 1.3. Github

Use existing fragment

## 1.4. Google Cloud Platform Setup

Use existing fragment

## 1.5. GCP API's

Use existing fragment

## ✨ 1.6. Download `gcloud` locally


<details>
<summary markdown='span'>🪟 Windows</summary>

A note about using windows terminal vs powershell here.

Use the installer

</details>

<br>

<details>
<summary markdown='span'>🍎 MacOS</summary>

Use existing fragment from DS setup
</details>

<br>

<details>
<summary markdown='span'>🐧 Linux</summary>

Use existing fragment from DS setup
</details>

Cut Service account key here.

## 1.7. Authorize local `gcloud`

Use existing fragment from DS setup

Add something about Windows for the installer

- 🪟 Windows: TODO - unsure. I assume it's the same
- 🍎 MacOS and 🐧 Linux: `gcloud auth login`

## 1.8. Visual Studio Code

Use existing fragment

## ✨ 1.9. Install Terraform Locally

Terraform installer docs at this [link here](https://developer.hashicorp.com/terraform/install).

<details>
<summary markdown='span'>🪟 Windows</summary>

Download binary and run

</details>

<br>

<details>
<summary markdown='span'>🍎 MacOS</summary>

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```
</details>

<br>

<details>
<summary markdown='span'>🐧 Linux</summary>

```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
</details>

## ✨ 1.10. Create your VM with Terraform

Download files. This will be a `curl` from the repo or s3.

For testing, copy the terraform files from `infra/` in the repo into `~/code/<GH_USERNAME>/de-vm-setup`. Files to copy:
- `main.tf`
- `provider.tf`
- `variables.tf`
- `terraform.tfvars`

Start with finding the username of your LOCAL computer, this is important to know and set.
- 🪟 Windows: TODO - unsure.
- 🍎 MacOS: type `whoami` in the terminal
- 🐧 Linux: type `whoami` in the terminal

Update the values in `terraform.tfvars`:

```bash
project_id    = "<YOUR_GCP_PROJECT>"
region        = "<YOUR_GCP_REGION>"
zone          = "<YOUR_GCP_ZONE>"
instance_name = "<YOUR_GCP_INSTANCE_NAME>"
instance_user = "<YOUR_COMPUTER_USER_NAME>"
```

It should look something similar to:

```bash
project_id    = "my-gcp-project"
region        = "europe-west1"
zone          = "europe-west1-b"
instance_name = "de-bootcamp-vm"
instance_user = "taylorswift" # the result of `whoami`
```

Make sure to save the `terraform.tfvars` file and run:

```bash
terraform init

terraform apply -auto-approve
```

## ✨ 1.11. Connect to your VM

```bash
gcloud compute config-ssh
```

And connect via VS Code

<br>

# 2️⃣ Virtual Machine Part 1

## ✨ 2.1. Connect to VM and confirm `ansible` install

In your VM's terminal type:

```bash
ansible --version
```

Should look like:

TODO: Add image asset

## ✨ 2.2. Authenticate GCP CLI and ADC

Use existing fragment for bulk of this.

`gcloud` comes pre-installed on GCP Virtual Machines!

We need to authenticate `gcloud` on our virtual machine so we can interact with GCP services from the command line and in our code.

```bash
# gcloud login
gcloud auth login

# ADC login
gcloud auth application-default login
```

Set your GCP project in `gcloud`:

```bash
# Replace `PROJECT_ID` with the `ID` of your project
gcloud config set project PROJECT_ID
```

Confirm:

```bash
gcloud config list
```

## ✨ 2.3. Run Ansible playbook 1

Download the first ansible playbook with the following:

- `curl` from github or s3 to a specific target. Probably `~/playbooks`

For testing, copy from the repo.

Create the folder:

```bash
mkdir ~/playbooks
```

And run with:

```bash
cd ~/playbooks && ansible-playbook setup_vm_part1.yml
```

## 2.4. Github CLI Auth

Use existing fragment

Can't be easily automated without creating and copying SSH keys.

## 2.5. Copy LW Dotfiles

Use existing fragment

Can't be easily automated, needs student input.

Close all terminals and open a new terminal (I had to do it twice), it should look like:

TODO: Add image asset
(Imagine basic zsh + OMZ)

<br>

# 3️⃣ Virtual Machine Part 2

In this section we'll run a second `ansible` playbook and check our setup

## ✨ 3.1. Run Ansible playbook 2

Download the second ansible playbook with the following:

- `curl` from github or s3 to a specific target. Probably `~/playbooks`

For testing, copy and paste from repo.

And run with:

```bash
cd ~/playbooks && ansible-playbook setup_vm_part2.yml
```

Close all your terminals and open a new one. It should look like:

TODO: Add image assets

## ✨ 3.2. Check your Setup

Things to check:

Docker:
```bash
docker run hello-world
```

❗ If you get a permission error, SHUT DOWN your VM from the GCP console and turn it on again. Closing VS Code and opening it again is insufficient.

TODO: Add image assets from existing fragment

Minikube:

```bash
# Start
minikube start

# Get pods
kubectl get po -A

# Stop
minikube delete --all
```

TODO: Add image assets from existing fragment

Terraform:

```bash
terraform --version
```

TODO: Add image assets from existing fragment

Spark:

```bash
spark-shell
```

TODO: Add image assets from existing fragment

Pyenv:

```bash
pyenv virtualenvs
# 3.12.8
```

Python:

```bash
python --version
# 3.12.8
```

TODO: Add image assets from existing fragment

Pipx:

```bash
pipx list
```

TODO: Add image asset

Data Engineering Challenges repo remotes:

```bash
cd ~/code/<your_username>/data-engineering-challenges
git remote -v
```


## 3.3. Run make install

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME

cd ~/code/$GITHUB_USERNAME/data-engineering-challenges

make install
```
