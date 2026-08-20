## Check your Virtual Machine Setup

We've used two ansible playbooks to configure our Virtual Machine. Let's run some manual checks in the terminal to make sure that everything has installed correctly.

❗ If any of these checks error out, raise a ticket with a TA 🙋

#### Python

🧪 To test:

```bash
python --version
```

Should return:

```bash
Python 3.12.8
```

#### Pyenv

🧪 To test:

```bash
pyenv versions
```

Should return:

```
  system
* 3.12.8 (set by /home/<your_username>/.pyenv/version)
```

❗ Note: There should be a `*` next to 3.12.8

#### Pipx

🧪 To test:

```bash
pipx list
```

Should return something similar too:

```
venvs are in /home/<your_username>/.local/share/pipx/venvs
apps are exposed on your $PATH at /home/<your_username>/.local/bin
manual pages are exposed at /home/<your_username>/.local/share/man
   package poetry 2.3.1, installed using Python 3.12.8
    - poetry
   package ruff 0.14.13, installed using Python 3.12.8
    - ruff
   package tldr 3.4.3, installed using Python 3.12.8
    - tldr
    - man1/tldr.1
```

#### Docker

🧪 To test:

```bash
docker run hello-world
```

Should return:

```
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

#### Terraform

🧪 To test:

```bash
terraform --version
```

Should return:

```
Terraform v1.14.3
on linux_amd64
```

That's all the testing we'll do for now!
