## Docker 🐋

Docker is an open platform for developing, shipping, and running applications.

### Install Docker

```bash
sudo apt update -y
sudo apt install -y docker.io
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

Run `docker run hello-world`, you should see something like:

![](images/docker_hello.png)

