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

Now we can install terraform directly with apt 👇
```bash
sudo apt update
sudo apt-get install terraform
```

Verify the installation with:

```bash
terraform --version
```
