#!/bin/bash
#
# Setup for Control Plane (Master) servers

# Pull required images

sudo kubeadm config images pull

# Initialize kubeadm based on PUBLIC_IP_ACCESS

MASTER_PUBLIC_IP=$(curl ifconfig.me && echo "")
sudo kubeadm init --apiserver-advertise-address="$MASTER_PUBLIC_IP"

# Deploy Weave network
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
