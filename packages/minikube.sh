https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

#start kubernetes cluster
minikube start

#test if cluster is ok
kubectl get pod -A
