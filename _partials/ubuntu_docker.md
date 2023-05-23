## Docker 🐋

Docker is an open platform for developing, shipping, and running applications.

### Install Docker and Docker Compose

Setup the dock apt repo

```bash
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

```bash
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install the right packages

```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Finally give your user permission to use `docker`

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

Run `docker run hello-world`, you should see something like:

![](images/docker_hello.png)

### Enable Artifact Registry API

**👌 Note: Skip to the next section if you already have an Artifact Registry repository**

[Artifact Registry](https://cloud.google.com/artifact-registry) is a GCP service you will use to store artifacts such as Docker images. The storage units are called repositories.

- Enable the service within your project using the `gcloud` CLI:
    ```bash
    gcloud services enable artifactregistry.googleapis.com
    ```
- Create a new Docker repository:
    ```bash
    # Set the repository name
    REPOSITORY=docker-hub
    # Set the location of the repository. Available locations: gcloud artifacts locations list
    LOCATION=europe-west1
    gcloud artifacts repositories create $REPOSITORY \
    --repository-format=docker \
    --location=$LOCATION \
    --description="Docker images storage"
    ```

### Gcloud authentication for Docker

You need to grant Docker access to push artifacts to (and pull from) your repository. There are different authentication methods, [gcloud credentials helper](https://cloud.google.com/artifact-registry/docs/docker/authentication#gcloud-helper) being the easiest.

- Define the repository hostname matching the repository `$LOCATION`:
    ```bash
    # If $LOCATION is "europe-west1"
    HOSTNAME=europe-west1-docker.pkg.dev
    ```
- Configure gcloud credentials helper:
    ```bash
    gcloud auth configure-docker $HOSTNAME
    ```
- Type `y` to accept the configuration
- Check your credentials helper is set:
    ```bash
    cat ~/.docker/config.json
    ```
    You should get:
    ```bash
    {
      "credHelpers": {
        "europe-west1-docker.pkg.dev": "gcloud"
      }
    }%
    ```
