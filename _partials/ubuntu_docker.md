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

### Install Docker Compose

```bash
# Download docker-compose standalone
sudo curl -SL https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

# Apply executable permissions
sudo chmod +x /usr/local/bin/docker-compose

# Link
sudo rm /usr/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

Check your installation with:
```bash
docker-compose -v
```
It should print a Docker Compose version >=2.6.

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

