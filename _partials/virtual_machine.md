## Virtual Machine (VM)

**👌 Note: Skip to the next section if you already have a VM set up**

_Note: The following section requires you already have a [Google Cloud Platform](https://cloud.google.com/) account associated with an active [Billing account](https://console.cloud.google.com/billing)._

- Go to console.cloud.google.com > VM instances > Create instance
- Name it `lewagon-data-eng-vm-<github_username>`, replace `<github_username>` with your own, e.g. `krokrob`
- Region `europe-west1`, choose the closest one among the [available regions](https://cloud.google.com/compute/docs/regions-zones#available)

    <img alt="gcloud-console-vm-create-instance" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-create-instance.png" width=500>
- In the section `Machine configuration`
- Select General purpose > e2-standard-4

    <img alt="gcloud-console-vm-e2-standard4" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-e2-standard4.png" width=500>
- Boot disk > Change
  - Operating system > Ubuntu
  - Version > Ubuntu 20.04 LTS
  - Boot disk type > Balanced persistent disk
  - Size > upgrade to 150GB

    <img alt="gcloud-console-vm-ubunt" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-ubunt.png" width=500>
- Open `Networking, Disks, ...`
- Open `Networking`

    <img alt="gcloud-console-vm-networking" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-networking.png" width=500>
- Go to `Network interfaces` and click on `default default (...)` with a downward arrow on the right.

    <img alt="gcloud-console-vm-network-interfaces" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-network-interfaces.png" width=500>
- This opened a box `Edit network interface`
- Go to the dropdown `External IPv4 address`, click on it, click on `CREATE IP ADDRESS`

    <img alt="gcloud-console-vm-create-static-ip" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-create-static-ip.png" width=300>
- Give it a name, like "lewagon-data-eng-vm-ip" and description "Le Wagon - Data Engineering VM IP". This will take a few seconds.

    <img alt="gcloud-console-reserve-static-ip" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-reserve-static-ip.png" width=300>
- You will now have a public IP associated with your account, and later to your VM instance. Click on `Done` at the bottom of the section `Edit network interface` you were in.

    <img alt="gcloud-console-new-external-ip" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-new-external-ip.png" width=300>
- Open the `Security` section

    <img alt="gcloud-console-vm-security" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-security.png" width=300>
- Open the `Manage access` subsection

    <img alt="gcloud-console-manage-access" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-manage-access.png" width=200>
- Go to `Add manually generated SSH keys` and click `Add item`

    <img alt="gcloud-console-add-manual-ssh-key" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-add-manual-ssh-key.png" width=500>
- In your terminal display your public SSH key:
    ```bash
    cat ~/.ssh/id_ed25519.pub
    ```
- Copy your public SSH key and paste it:

    <img alt="gcloud-console-add-ssh-key-pub" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-add-ssh-key-pub.png" width=500>
- On the right hand side you should see

    <img alt="gcloud-console-vm-price-month" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-price-month.png" width=300>
- You should be good to go and click `CREATE` at the bottom

    <img alt="gcloud-console-vm-create" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-create.png" width=500>
- It will take a few minutes for your virtual machine (VM) to be created. Your instance will show up like below when ready, with a green circled tick, named `lewagon-data-eng-vm`.

    <img alt="gcloud-console-vm-instance-running" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-instance-running.png" width=500>
- Click on your instance

    <img alt="gcloud-console-vm-running" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-running.png" width=500>
- Go down to the section `SSH keys`, and write down your username

    <img alt="gcloud-console-vm-username" src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/setup/gcloud-console-vm-username.png" width=300>

Congrats, your virtual machine is up and running, it is time to connect it with VS Code!
