## Google Cloud Platform setup

[GCP](https://cloud.google.com/) is a cloud solution that you are going to use in order to work on a virtual machine.

### Project setup

- Browse to the [Google Cloud Console](https://console.cloud.google.com/) and login with your Google / Gmail account.
- In the Cloud Console, on the project list, select the Cloud project you were invited to.

![](images/gcp_project.png)

### Account language

In order to facilitate the following of the instructions during the bootcamp, open your GCP account preferences:

https://myaccount.google.com/language

If the *preferred language* is not:
- **English**
- **United States**

Then switch the language to english:
- Click on the edit pen logo
- Select **English**
- Select **United States**
- Click on **Select**

## GCP APIs

When you create a GCP Project, not every service is enabled by default. To enable a service (like using a VM or storing a Docker image in Artifact Registry) you have to enable the GCP API for that service.

### Default APIs

Go to your project [APIs dashboard 🔗](https://console.cloud.google.com/apis/dashboard), you can see a bunch of APIs are already enabled:

<img alt='GCP APIs dashboard' src="images/gcp_apis_dashboard.png" width=200>

### Enable additional APIs

You'll need to enable some additional API's so that Terraform can create cloud resources on your behalf.

**Cloud Resource Manager**

On the [APIs dashboard 🔗](https://console.cloud.google.com/apis/dashboard) page, click on [Enable APIs and services 🔗](https://console.cloud.google.com/apis/library) and make sure your project is selected in the box in the top left.

In the search box, search for: _cloud resource manager api_ and select the **Cloud Resource Manager API**. On the next page, click on **Enable**.

**Service Usage**

Navigate back to the [APIs and Services 🔗](https://console.cloud.google.com/apis/library) page and search for: _service usage api_ and select the top result: **Service Usage API**. On the next page, click on **Enable**. ❗ This API might already be enabled - not a problem if it is!

**Compute Engine**

Navigate back to the [APIs and Services 🔗](https://console.cloud.google.com/apis/library) page and search for: _compute engine api_ and select: **Compute Engine API**. On the next page, click on **Enable**. ❗ This API might already be enabled - not a problem if it is!
