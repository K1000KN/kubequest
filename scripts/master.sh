#!/bin/bash
#
# Setup for Control Plane (Master) servers

set -euxo pipefail

NODENAME=$(hostname -s)

# Pull required images

sudo kubeadm config images pull

# Initialize kubeadm based on PUBLIC_IP_ACCESS
MASTER_PUBLIC_IP=$(curl ifconfig.me && echo "")
sudo kubeadm init --control-plane-endpoint="$MASTER_PUBLIC_IP" --node-name "$NODENAME"

kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
