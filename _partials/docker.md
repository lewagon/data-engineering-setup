## Docker 🐋

Docker is an open platform for developing, shipping, and running applications.

_if you already have Docker installed on your machine please update with the latest version_

### Install Docker

Go to [Docker](https://docs.docker.com/get-docker/) website and choose your operating system:

![](images/docker.png)

Then follow the setup instructions, you are going to install a desktop application.

Once done and launched, check Docker is up and running:

```bash
docker info
```

You should get:

<details>
  <summary markdown='span'>❗️ I received a permission denied when trying to connect to the Docker Daemon socket. </summary>

If you recieved an error similar to the one below. navigate to the (GCP Compute Engine Console)[https://console.cloud.google.com/compute/instances] and STOP your VM (closing VSCode is not enough).

![](images/docker_permission_denied_socket.png)

It will take a few minutes for your VM to turn off. Once it's fully off, turn your VM on again (check the box and click START) and try `docker run hello-world` again. If this doesn't work, raise a ticket with a teacher.

</details>

![](images/docker_info.png)
