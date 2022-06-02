#!/usr/bin/env bash
export GO111MODULE="on"
export CGO_ENABLED="0"
export GOPATH="$(go env GOPATH)"
export GOBIN="$(go env GOPATH)/bin"
