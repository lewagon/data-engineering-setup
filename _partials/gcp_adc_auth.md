### Application Default Credentials

Application Default Credentials are for authenticating our **code** (Terraform and Python 🐍) to interact with Google services and resources. It's a small distinction between `gcloud` and **code**, but an important one.

To authenticate your **Application Default Credentials**, in your terminal run:

```bash
gcloud auth application-default login
```

And follow the prompts. It should open a web-page to login to your Google account.
