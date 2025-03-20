## Provisioning your Virtual Machine with Terraform

You can create Cloud Resources like Virtual Machines in different ways:
- Through the Google Cloud [Compute Engine Console 🔗](https://console.cloud.google.com/compute/overview)
- Using `gcloud`
- With **Infrastructure as Code** tools like Terraform

We'll be creating our Virtual Machine with Terraform

We're almost at the point of creating your Virtual Machine.

The specifications of the Virtual Machine and Network Settings you'll use for the bootcamp are:
- Operation System: Ubuntu 22.04 LTS
- CPU: 4 Virtual CPU cores (2 physical CPU cores)
- RAM: 16 GB
- Storage (Persistent Disk): 100 GB balanced
- Static External IP address - so it's easier to login.

### Cost 💸

Creating and running a Virtual Machine on Google Cloud Platform costs money!

If you have created a new Google Cloud Platform account, the cost of the Virtual machine will be covered by the $300 USD credit for the first 90 days if you are diligent with turning off your Virtual Machine (or finish the _Linux and Bash_ challenge today 😎).

❗ **The cost of running a Virtual Machine with our configuration 24 hours a day, 7 days a week is ~$150 USD per month.** ❗

You can massively reduce the cost by only running the Virtual Machine when you use it. You will _NOT_ be charged for the vCPU's and RAM while the Virtual Machine is off!

You will always pay for the Storage (equivalent of your hard-drive on your local computer). It's ~$10 USD per month for 100 GB.

The rule of thumb is: if Google can rent the resource out to someone else when your not using it, you only pay for it when you are using the resource. That's why you don't pay for the CPU and RAM when you are not using it, Google can rent it out to someone else, but always pay for Storage, Google can't rent it out to someone else because it has your data on it.

### Download terraform files

We almost have all the necessary parts to create your VM using **terraform**. We need to download the terraform files and change a few values.

First we'll create a folder and download the terraform files with:

$MAC_START
```bash
mkdir -p ~/wagon-de-bootcamp
curl -L -o ~/wagon-de-bootcamp/main.tf https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/main.tf
curl -L -o ~/wagon-de-bootcamp/provider.tf https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/provider.tf
curl -L -o ~/wagon-de-bootcamp/variables.tf https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/variables.tf
curl -L -o ~/wagon-de-bootcamp/terraform.tfvars https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/terraform.tfvars
curl -L -o ~/wagon-de-bootcamp/.terraform.lock.hcl https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/.terraform.lock.hcl
```
$MAC_END
$WINDOWS_START
Using the Command Prompt (cmd), run the following:

```cmd
mkdir %USERPROFILE%\wagon-de-bootcamp

curl -L -o "%USERPROFILE%\wagon-de-bootcamp\main.tf" https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/main.tf

curl -L -o "%USERPROFILE%\wagon-de-bootcamp\provider.tf" https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/provider.tf

curl -L -o "%USERPROFILE%\wagon-de-bootcamp\variables.tf" https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/variables.tf

curl -L -o "%USERPROFILE%\wagon-de-bootcamp\terraform.tfvars" https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/terraform.tfvars

curl -L -o "%USERPROFILE%\wagon-de-bootcamp\.terraform.lock.hcl" https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/.terraform.lock.hcl
```
$WINDOWS_END
$LINUX_START
```bash
mkdir -p ~/code/wagon-de-bootcamp
curl -L -o ~/wagon-de-bootcamp/main.tf https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/main.tf
curl -L -o ~/wagon-de-bootcamp/provider.tf https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/provider.tf
curl -L -o ~/wagon-de-bootcamp/variables.tf https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/variables.tf
curl -L -o ~/wagon-de-bootcamp/terraform.tfvars https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/terraform.tfvars
curl -L -o ~/wagon-de-bootcamp/.terraform.lock.hcl https://raw.githubusercontent.com/lewagon/data-engineering-setup/lorcanrae/automated-setup/automation/infra/.terraform.lock.hcl
```
$LINUX_END


### Set variables

$MAC_START
Open up the file `~/wagon-de-bootcamp/terraform.tfvars` in VS Code or any other code editor.
$MAC_END
$WINDOWS_START
Open up the file `C:\Users\<YOUR_USERNAME>\wagon-de-bootcamp\terraform.tfvars` in VS Code or any other code editor.
$WINDOWS_END
$LINUX_START
Open up the file `~/wagon-de-bootcamp/terraform.tfvars` in VS Code or any other code editor.
$LINUX_END

It should look like:

```bash
project_id    = "<YOUR_GCP_PROJECT>"
region        = "<YOUR_GCP_REGION>"
zone          = "<YOUR_GCP_ZONE>"
instance_name = "<YOUR_GCP_INSTANCE_NAME>"
instance_user = "<YOUR_COMPUTER_USER_NAME>"
```

We'll need to change some values in this file. Here's were you can find the required values:
- **project_id:** from the GCP Console at this [link here](https://console.cloud.google.com).
- **region:** take a look at the GCP Region and Zone documentation at this [link here](https://cloud.google.com/compute/docs/regions-zones). We strongly recommend you choose the closest geographical region.
- **zone:** Zone is a subset of region. it is almost always the same as **region** appended with `-a`, `-b`, or `-c`.
- **instance_name:** we recommend naming your VM: `lw-de-vm-<YOUR_GITHUB_USERNAME>`. Replacing `<YOUR_GITHUB_USERNAME>` with your GitHub username.
$MAC_START
- **instance_user:** in your terminal, run `whoami`
$MAC_END
$WINDOWS_START
- **instance_user:** in Command Prompt, run `echo %username%`
$WINDOWS_END
$LINUX_START
- **instance_user:** in your terminal, run `whoami`
$LINUX_END

After completing this file, it should look similar to:

```bash
project_id    = "wagon-bootcamp"
region        = "europe-west1"
zone          = "europe-west1-b"
instance_name = "lw-de-vm-tswift"
instance_user = "taylorswift"
```

Make sure to save the `terraform.tfvars` file, nagivate into the directory with the terraform files with:

```
$MAC_START
cd ~/wagon-de-bootcamp
$MAC_END
$WINDOWS_START
cd %USERPROFILE%\wagon-de-bootcamp
$WINDOWS_END
$LINUX_START
cd ~/wagon-de-bootcamp
$LINUX_END
```

And initialise and test the files with:

```bash
terraform init

terraform plan
```

And check the output. Towards the bottom there should be a line:

```
Plan: 2 to add, 0 to change, 0 to destroy
```

We'll be adding:
- A compute engine instance
- A static external IP address

❗ If you have any errors, read the error and debug. If you need some help, raise a ticket with a teacher.

If everything was successful, create your VM with:

```bash
terraform apply -auto-approve
```

It might take a while for Terraform to create the cloud resources. Once you see:

```
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

Your Virtual Machine should be up and running! Check the GCP Compute Engine console at this [link here](https://console.cloud.google.com/compute/instances) to confirm.
