## Google Authentication

Since we're now on a Virtual Machine, it is like a fresh, new computer, we need to re-authenticate some services with Google. Luckily for us, `gcloud` comes pre-installed.

### Application Default Credentials

Application Default Credentials are for authenticating our **code** (the Python 🐍 code we will write in the future) to interact with Google services and resources. It's a small distinction between `gcloud` and **code**, but an important one.

To authenticate your Application Default Credentials, in your terminal run:

```bash
gcloud auth application-default login
```

And follow the prompts.
