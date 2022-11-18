## Kubernetes
Kubernetes (K8s) is a system designed to make deploying auto-scaling containerized applications easily.

### Install kubectl
Kubectl is the cli for interacting with k8s!

https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

kubectl version --client
kubectl version --client --output=yaml
```

### Install minikube

Minikube is a way to quickly spin up a local kubernetes cluster!

https://minikube.sigs.k8s.io/docs/start/

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

### Test installation
To test that you can launch a cluster run:
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
