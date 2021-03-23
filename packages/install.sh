#JQ
echo "deb http://us.archive.ubuntu.com/ubuntu vivid main universe" > /etc/apt/sources.list

apt update -y

#Docker START--------------------------------------
if !command -v docker &> /dev/null
then
  apt install apt-transport-https ca-certificates curl gnupg lsb-release -y
  # Add docker GPG key
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt update -y
  apt install docker-ce docker-ce-cli containerd.io
else
  echo "Docker already installed"
fi

# Kubernetes START---------------------------------
if ! command -v kubectl &> /dev/null
then
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  # this command requires sudo
  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  # test installation
  kubectl version --client
fi

if kubectl krew &> /dev/null; then
  echo "kubectl krew already installed"
else
 (
    set -x; cd "$(mktemp -d)" &&
    OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
    ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
    tar zxvf krew.tar.gz &&
    KREW=./krew-"${OS}_${ARCH}" &&
    "$KREW" install krew
  )
  # test Krew
  kubectl krew

  # installing kubectl ctx and kubectl ns with krew
  kubectl krew install ctx
  kubectl krew install ns
fi


# Kubernetes END-----------------------------------


apt install vim -y
apt install git-all -y
apt install jq -y
apt install gawk -y


