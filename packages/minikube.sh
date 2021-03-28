#!/usr/bin/env bash

minikube-install() {
  if command -v minikube &> /dev/null; then
    part "minikube already installed"
  else
    wget https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
    sudo dpkg -i minikube_latest_amd64.deb

    #start kubernetes cluster
    minikube start --driver=docker

    #test if cluster is ok
    kubectl get pod -A
  fi
}