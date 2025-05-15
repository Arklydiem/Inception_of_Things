#!/bin/sh

# Stop all VMs
vagrant halt

# Optional: clean the local Kubernetes config
# Uncomment this if you want to clean ~/.kube/config each time
# rm -f ~/.kube/config

echo "[+] All VMs stopped successfully!"
