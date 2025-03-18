## Check your Virtual Machine Setup

We've used two ansible playbooks to configure our Virtual Machine. Let's run some manual checks to make sure that everything has installed correctly.

❗ If any of these checks error out, raise a ticket with a teacher.

#### Python

To test:

```bash
python --version
```

Should return:

```bash
Python 3.12.8
```

#### Pyenv

To test:

```bash
pyenv versions
```

Should return:

```bash
  system
* 3.12.8 (set by /home/<your_username>/.pyenv/version)
```

Note: There should be an `*` next to 3.12.8

#### Pipx

To test:

```bash
pipx list
```

Should return something similar too:

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

#### Data Engineering Challenges repo remotes

To test:

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

#### Docker

To test:

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

#### Kubernetes

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

And then make sure the kubernetes CLI utility, `kubectl`, works with:

```bash
# Get pods
kubectl get po -A
```

Should return something similar too:

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

#### Terraform

To test:

```bash
terraform --version
```

Should return:

```bash
Terraform v1.11.2
on linux_amd64
```

#### Spark

To test:

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

That's everything for now!
