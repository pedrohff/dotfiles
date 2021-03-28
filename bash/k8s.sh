#!/usr/bin/env bash
alias k="kubectl"
alias ksvc="kubectl get svc -A | grep -v none | awk '{printf \"%-30s - %s:%.4s\\n\",$2,$5,$6}'| grep"
alias ksql="kubectl exec $(kubectl get pods -n processing | grep Running | grep ksqldb-server-0 | awk '{printf $1}') -n processing -i -t -- bash -c 'unset JMX_PORT && ksql'"
alias kns="kubectl ns"
alias kctx="kubectl ctx"
alias ksvc="kubectl get svc -A | grep -v none | awk '{printf \"%-30s - http://%s:%.4s\\n\",\$2,\$5,\$6}'| grep"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"