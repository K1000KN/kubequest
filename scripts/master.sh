#!/bin/bash
#
# Setup for Control Plane (Master) servers
#
# If you need public access to API server using the servers Public IP adress, change PUBLIC_IP_ACCESS to true.

PUBLIC_IP_ACCESS="true"
NODENAME=$(hostname -s)
POD_CIDR="10.244.0.0/16"

# Pull required images

sudo kubeadm config images pull

# Initialize kubeadm based on PUBLIC_IP_ACCESS

MASTER_PUBLIC_IP=$(curl ifconfig.me && echo "")
sudo kubeadm init --apiserver-advertise-address="$MASTER_PUBLIC_IP" --pod-network-cidr="$POD_CIDR"

# Configure kubeconfig

mkdir -p "$HOME"/.kube
sudo cp -i /etc/kubernetes/admin.conf "$HOME"/.kube/config
sudo chown "$(id -u)":"$(id -g)" "$HOME"/.kube/config

# Install flannel Plugin Network

kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
