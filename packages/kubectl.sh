#!/usr/bin/env bash

kubernetes-install() {
    section "KUBERNETES START"
    kubectl-install
    kubectl-krew-install
    section "KUBERNETES END"
}

kubectl-install() {
    if ! command -v kubectl &> /dev/null; then
        part "Fetching kubectl"
        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        part "Installing kubectl"
        # this command requires sudo
        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
        # test installation
        part "Kubectl installed, verifying"
        kubectl version --client
    else
        part "Kubectl already installed"
    fi
}

kubectl-krew-install() {
    if kubectl krew &> /dev/null; then
        part "Kubectl krew already installed"
    else
        part "Installing kubectl krew"
        (
            set -x; cd "$(mktemp -d)" &&
            OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
            ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
            curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
            tar zxvf krew.tar.gz &&
            KREW=./krew-"${OS}_${ARCH}" &&
            "$KREW" install krew
        )

        part "Krew installed, verifying"
        # test Krew
        kubectl krew

        # installing kubectl ctx and kubectl ns with krew
        part "Installing kubectl ctx with krew"
        kubectl krew install ctx
        part "Installing kubectl ns with krew"
        kubectl krew install ns
    fi
}
