#!/usr/bin/env bash
source ~/.dotfiles/bash/terminal.sh
source ~/.dotfiles/bash/k8s.sh
source ~/.dotfiles/bash/go.sh

recyclepods() {
  kubectl get pods | grep RunContainerError | awk '{print $1}' | xargs kubectl delete pod
  kubectl get pods | grep Evicted | awk '{print $1}' | xargs kubectl delete pod
  kubectl get pods | grep CrashLoop | awk '{print $1}' | xargs kubectl delete pod
  kubectl get pods | grep OOM | awk '{print $1}' | xargs kubectl delete pod
  kubectl get pods | grep Error | awk '{print $1}' | xargs kubectl delete pod
}
