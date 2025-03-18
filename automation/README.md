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

Use existing partial

## 1.2. Slack

Use existing partial

## 1.3. Github

Use existing partial

## 1.4. Google Cloud Platform Setup

Use existing partial

## 1.5. GCP API's

Use existing partial

## ✨ 1.6. Download `gcloud` locally

Link to `gcloud` CLI install docs at this [link here](https://cloud.google.com/sdk/docs/install).


<details>
<summary markdown='span'>🪟 Windows</summary>

A note about using windows terminal vs powershell here.

Use the installer

</details>

<br>

<details>
<summary markdown='span'>🍎 MacOS</summary>

Use existing partial from DS setup
</details>

<br>

<details>
<summary markdown='span'>🐧 Linux</summary>

Use existing partial from DS setup
</details>

Remove section on creating a service account. Or leave it in but don't create a key for it.

## 1.7. Authorize local `gcloud`

Use existing partial from DS setup

Add something about Windows for the installer

- 🪟 Windows: TODO - unsure. I assume it's the same
- 🍎 MacOS and 🐧 Linux: `gcloud auth login`

## 1.8. Visual Studio Code

Use existing partial. Modify for **Remote - SSH** connection.

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

Will require different instructions for Windows, MacOS, and Linux.

Download the `terraform` files needed to provision your VM. This will be a `curl` from the repo.

```bash
# MacOS & Linux. TODO: add Windows
# TODO: Change branch name if before merging
mkdir -p ~/wagon-de-bootcamp
curl -L -o ~/wagon-de-bootcamp/main.tf https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/main.tf
curl -L -o ~/wagon-de-bootcamp/provider.tf https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/provider.tf
curl -L -o ~/wagon-de-bootcamp/variables.tf https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/variables.tf
curl -L -o ~/wagon-de-bootcamp/terraform.tfvars https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/terraform.tfvars
curl -L -o ~/wagon-de-bootcamp/.terraform.lock.hcl https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/.terraform.lock.hcl
```

For testing, copy the terraform files from `infra/` in the repo into `~/code/<GH_USERNAME>/de-vm-setup`. Files to copy:
- `main.tf`
- `provider.tf`
- `variables.tf`
- `terraform.tfvars`

We'll need the username of your LOCAL computer, this is important to know and set.
- 🪟 Windows: TODO - unsure.
- 🍎 MacOS: type `whoami` in the terminal
- 🐧 Linux: type `whoami` in the terminal

Open up `terraform.tfvars` in VS Code and take a look at it, it should look like:

```bash
project_id    = "<YOUR_GCP_PROJECT>"
region        = "<YOUR_GCP_REGION>"
zone          = "<YOUR_GCP_ZONE>"
instance_name = "<YOUR_GCP_INSTANCE_NAME>"
instance_user = "<YOUR_COMPUTER_USER_NAME>"
```

You'll need to change some values in this file. A good reference is the GCP Console available at this [link here](console.cloud.google.com).

To determine your `region` and `zone`, take a look at the GCP Region and Zones documentation at this [link here](https://cloud.google.com/compute/docs/regions-zones). We strongly recommend that you select a region that is as close to you geographically.

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
# MacOS & Linux. TODO: add Windows
cd ~/wagon-de-bootcamp

terraform init

terraform apply -auto-approve
```

Your VM should now be up and running! Check the GCP Compute Engine Console at this [link here](console.cloud.google.com/compute/instances) to confirm.

## ✨ 1.11. Connect to your VM

In a terminal enter the following command:

```bash
gcloud compute config-ssh
```

And connect via VS Code.

TODO: Add image assets

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

Use existing partial for bulk of this.

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

```bash
# TODO: Update if merged
mkdir -p ~/vm-ansible-setup/playbooks
curl -L -o ~/vm-ansible-setup/ansible.cfg https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/vm-ansible-setup/ansible.cfg
curl -L -o ~/vm-ansible-setup/hosts https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/vm-ansible-setup/hosts
curl -L -o ~/vm-ansible-setup/playbooks/setup_vm_part1.yml https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/vm-ansible-setup/playbooks/setup_vm_part1.yml
```

And run with:

```bash
cd ~/vm-ansible-setup && ansible-playbook playbooks/setup_vm_part1.yml
```

❗ If any errors occur, contact a teacher. You can safely run the playbook again.

Close all your terminals and open a new one (you might have to do it a few times, it should go from `bash` to `zsh`). It should look like:

TODO: Add image assets
(Imagine basic zsh + OMZ)

## 2.4. Github CLI Auth

Use existing partial

Can't be easily automated without creating and copying SSH keys, and generating GitHub PAT tokens.

## 2.5. Copy LW Dotfiles

Use existing partial

Can't be easily automated, needs student input.

Close all terminals and open a new terminal, it should look like:

TODO: Add image asset
(Imagine LW zsh setup)

<br>

# 3️⃣ Virtual Machine Part 2

In this section we'll run a second `ansible` playbook and check our setup

## ✨ 3.1. Run Ansible playbook 2

Download the second ansible playbook with the following:

```bash
curl -L -o ~/vm-ansible-setup/playbooks/setup_vm_part2.yml https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/vm-ansible-setup/playbooks/setup_vm_part2.yml
```

And run with:

```bash
cd ~/vm-ansible-setup && ansible-playbook playbooks/setup_vm_part2.yml
```

❗ If any errors occur, contact a teacher. You can safely run the playbook again.

Once the playbook has finished, you need to completely SHUT DOWN your VM from the GCP console at [this link here](https://console.cloud.google.com/compute/instances). Closing your VS Code and opening it again is not sufficient.

TODO: add image assets

## ✨ 3.2. Check your Setup

Things to check:

Python:

```bash
python --version
```

Should return:
```bash
Python 3.12.8
```

TODO: Add image assets from existing partial

Pyenv:

```bash
pyenv versions
```

Should return:

```bash
  system
* 3.12.8 (set by /home/<your_username>/.pyenv/version)
```

Pipx:

```bash
pipx list
```

Should return:

```bash
venvs are in /home/<your_username>/.local/share/pipx/venvs
apps are exposed on your $PATH at /home/<your_username>/.local/bin
manual pages are exposed at /home/<your_username>/.local/share/man
   package poetry 2.1.1, installed using Python 3.12.8
    - poetry
   package ruff 0.11.0, installed using Python 3.12.8
    - ruff
   package tldr 3.3.0, installed using Python 3.12.8
    - tldr
    - man1/tldr.1
```

Data Engineering Challenges repo remotes:

```bash
cd ~/code/$(gh api user | jq -r '.login')/data-engineering-challenges
git remote -v
```

Should return:

```bash
origin  git@github.com:<your_github_username>/data-engineering-challenges.git (fetch)
origin  git@github.com:<your_github_username>/data-engineering-challenges.git (push)
upstream        git@github.com:lewagon/data-engineering-challenges.git (fetch)
upstream        git@github.com:lewagon/data-engineering-challenges.git (push)
```

Docker:
```bash
docker run hello-world
```

Should return:

```bash
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
e6590344b1a5: Pull complete
Digest: sha256:7e1a4e2d11e2ac7a8c3f768d4166c2defeb09d2a750b010412b6ea13de1efb19
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

TODO: Add image assets from existing partial

Kubernetes:

We can start by testing `minikube`:

```bash
# Start
minikube start
```

Should return:

```bash
😄  minikube v1.35.0 on Ubuntu 22.04 (amd64)
✨  Automatically selected the docker driver. Other choices: none, ssh
📌  Using Docker driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.46 ...
💾  Downloading Kubernetes v1.32.0 preload ...
    > gcr.io/k8s-minikube/kicbase...:  500.31 MiB / 500.31 MiB  100.00% 88.19 M
    > preloaded-images-k8s-v18-v1...:  333.57 MiB / 333.57 MiB  100.00% 32.20 M
🔥  Creating docker container (CPUs=2, Memory=3900MB) ...
🐳  Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

And then make sure the kubernetes CLI utility, `kubectl` works with:

```bash
# Get pods
kubectl get po -A
```

Should return:

```bash
NAMESPACE     NAME                               READY   STATUS    RESTARTS      AGE
kube-system   coredns-668d6bf9bc-mg7b6           1/1     Running   0             72s
kube-system   etcd-minikube                      1/1     Running   0             78s
kube-system   kube-apiserver-minikube            1/1     Running   0             76s
kube-system   kube-controller-manager-minikube   1/1     Running   0             76s
kube-system   kube-proxy-stk77                   1/1     Running   0             72s
kube-system   kube-scheduler-minikube            1/1     Running   0             76s
kube-system   storage-provisioner                1/1     Running   1 (41s ago)   75s
```

And because `minikube` is resource intensive, stop it for now with:

```bash
# Stop
minikube delete --all
```

Should return:

```bash
🔥  Deleting "minikube" in docker ...
🔥  Removing /home/<your_username>/.minikube/machines/minikube ...
💀  Removed all traces of the "minikube" cluster.
🔥  Successfully deleted all profiles
```

Terraform:

```bash
terraform --version
```

Should return:

```bash
Terraform v1.11.2
on linux_amd64
```

Spark:

```bash
spark-shell
```

Should take you into the spark shell that looks like:

```bash
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
25/03/18 08:54:55 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Spark context Web UI available at http://lw-de-vm.europe-north1-b.c.wagon-de.internal:4040
Spark context available as 'sc' (master = local[*], app id = local-1742288096829).
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 3.5.3
      /_/

Using Scala version 2.12.18 (OpenJDK 64-Bit Server VM, Java 1.8.0_442)
Type in expressions to have them evaluated.
Type :help for more information.

scala>
```

Type `:quit` and hit enter to exit the spark-shell and continue.

## 3.3. Run make install

Use existing partial

To create python venvs.

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME

cd ~/code/$GITHUB_USERNAME/data-engineering-challenges

make install
```
