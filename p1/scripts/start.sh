#!/bin/sh

vagrant up --no-parallel

# Wait for the VMs to boot
sleep 60

# Copy kubeconfig from the server to the host
if [ ! -d "$HOME/.kube" ]; then
  mkdir -p $HOME/.kube
fi

vagrant ssh argomezS -c "cat /etc/rancher/k3s/k3s.yaml" > ~/.kube/config
sed -i 's/127\.0\.0\.1/192\.168\.56\.110/g' ~/.kube/config
