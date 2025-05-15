#!/bin/bash

echo "[+] Stopping all Vagrant VMs..."
vagrant halt

echo "[+] Destroying all Vagrant VMs..."
vagrant destroy -f

echo "[+] Removing Vagrant state folder..."
rm -rf .vagrant

echo "[+] Cleaning old kube configs (local PC)..."
rm -f ~/.kube/config

echo "[+] Cleaning shared K3s config inside the project (if exists)..."
rm -f ./k3s.yaml

echo "[+] Reset done!"
echo "You can now relaunch everything with: ./start.sh"
