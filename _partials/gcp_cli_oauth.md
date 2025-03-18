### Authenticate gcloud

We need to authenticate the `gcloud` CLI tool and set the project so it can interact with google services.

To authenticate `gcloud`, run:

```bash
gcloud auth login
```

And following the prompts. For pasting into the terminal, your might need to use CTRL + SHIFT + V

You also need to set the GCP project that your are working in. For this section, you'll need your GCP Project ID, which can be found on the GCP Console at this [link here](https://console.cloud.google.com). Makes sure you copy the _Project ID_ and **not** the _Project number_.

To set your project, replace `<YOUR_PROJECT_ID>` with your GCP Project ID and run:

```bash
gcloud config set project <YOUR_PROJECT_ID>
```

To confirm your setup, run:

```bash
gcloud config list
```

You should get an output similar to:

```bash
[core]
account = taylorswift@domain.com # Should be your GCP email
disable_usage_reporting = True
project = my-gcp-project # Should be your GCP Project ID

Your active configuration is: [default]
```
