## Provisioning your Virtual Machine with Terraform

We're almost at the point of creating your Virtual Machine.

The specifications of the machine you'll use for the bootcamp are:
- Operation System: Ubuntu 22.04 LTS
- CPU: 4 Virtual CPU cores
- RAM: 16 GB
- Storage: 100 GB
- Network: Static External IP address

### Cost 💸

Creating and running a Virtual Machine on Google Cloud Platform costs money.

If you have created a new Google Cloud Platform account, the cost of the Virtual machine will be covered by the $300 USD credit for the first 90 days if you are diligent with turning off your Virtual Machine (or finish the auto shutdown challenge 😎).

The cost of running a Virtual Machine with our configuration 24 hours a day, 7 days a week is ~$130 USD per month! But you can drastically reduce the cost by only running the Virtual Machine when you use it. You will not be charged for the CPU and RAM while the Virtual Machine is off!

You will always pay for the Storage (Hard Disk Drive) and Static IP. Google can't rent out stateful resources to other users without wiping your data.

### Download terraform files

We almost have all the necessary parts to create your VM using **terraform**. We just need to download the terraform files and change a few values.

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

TODO: Requires testing

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

Open up the file `terraform.tfvars` in VS Code or any other code editor. It should look like:

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
- **zone:** Zone is a subset of region. it is usually the same as region appended with a `-a`, `-b`, or `-c`.
- **instance_name:** we recommend naming this: `lw-de-vm-<YOUR_GITHUB_USERNAME>`. Replacing `<YOUR_GITHUB_USERNAME>`
- **instance_user:** in your terminal, run `whoami` and hit enter.

After completing this file, it should look similar to:

```bash
project_id    = "wagon-bootcamp"
region        = "europe-west1"
zone          = "europe-west1-b"
instance_name = "lw-de-vm-tswift"
instance_user = "taylorswift" # result of `whoami`
```

Make sure to save the `terraform.tfvars` file and then run:

```bash
cd ~/wagon-de-bootcamp

terraform init

terraform plan
```

And check the output, if you have any errors, raise a ticket with a teacher.

If everything was successful, create your VM with:

```bash
terraform apply -auto-approve
```

And your Virtual Machine should be up and running! Check the GCP Compute Engine console at this [link here](https://console.cloud.google.com/compute/instances) to confirm.
