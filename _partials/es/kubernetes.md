## Kubernetes
Kubernetes (K8s) is a system designed to make deploying auto-scaling containerized applications easily.

### Install kubectl
```bash
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

### Install minikube
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

### Test installation
To test you can launch a cluster run:
```bash
minikube start
```
you should see your cluster booting up :

![](images/minikube_start.png)

Then to check the cluster run:
```bash
kubectl get po -A
```
you should be able to see your cluster running! :

![](images/minikube_base.png)

To tear it all down for now:

```bash
minikube delete --all
```
