#!/usr/bin/env bash
export PATH="$PATH:/usr/local/Cellar/go/1.19/bin"
export GO111MODULE="on"
export CGO_ENABLED="0"
export GOPATH="$(go env GOPATH)"
export GOBIN="$(go env GOPATH)/bin"
export PATH="$PATH:$GOBIN"
