#!/usr/bin/env bash
alias k="kubecolor"
alias ksvc="kubectl get svc -A | grep -v none | awk '{printf \"%-30s - %s:%.4s\\n\",$2,$5,$6}'| grep"
alias kns="kubectl ns"
alias kctx="kubectl ctx"
alias ksvc="kubectl get svc -A | grep -v none | awk '{printf \"%-30s - http://%s:%.4s\\n\",\$2,\$5,\$6}'| grep"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"

kn () {
	ns=$(kubectl ns | grep $1)
	echo "Changing namespace to $ns"
	kubectl ns $ns
}

kpi() {
	kubectl describe pod $1 | grep Image: | awk '{ print $2 }'
}

recyclepods() {
  kubectl get pods | grep RunContainerError | awk '{print $1}' | xargs kubectl delete pod
  kubectl get pods | grep Evicted | awk '{print $1}' | xargs kubectl delete pod
  kubectl get pods | grep CrashLoop | awk '{print $1}' | xargs kubectl delete pod
  kubectl get pods | grep OOM | awk '{print $1}' | xargs kubectl delete pod
  kubectl get pods | grep Error | awk '{print $1}' | xargs kubectl delete pod
}

wp() {
    watch "kubectl get pod"
}

wpn() {
    watch "kubectl get pod | grep $1"
}
