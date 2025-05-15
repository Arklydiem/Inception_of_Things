#!/bin/bash
set -e

# Colors
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Update and install basic tools
echo -e "${BLUE}[INSTALL] Updating packages and installing curl...${NC}"
sudo apt-get update -y
sudo apt-get install -y curl

# Install K3s in server mode
echo -e "${BLUE}[INSTALL] Installing K3s server...${NC}"
curl -sfL https://get.k3s.io | sh -

# Wait for K3s to be ready
echo -e "${YELLOW}[WAIT] Waiting for K3s to be ready...${NC}"
sleep 30

# Verify K3s is running
echo -e "${BLUE}[CHECK] Verifying K3s installation...${NC}"
kubectl get nodes

# Create the namespace for applications
echo -e "${BLUE}[DEPLOY] Creating 'apps' namespace...${NC}"
kubectl create namespace apps || true

# Deploy ConfigMaps
echo -e "${PURPLE}[DEPLOY] Applying ConfigMaps...${NC}"
kubectl apply -f /vagrant/confs/app1-configmap.yaml
kubectl apply -f /vagrant/confs/app2-configmap.yaml
kubectl apply -f /vagrant/confs/app3-configmap.yaml

# Deploy Deployments and Services
echo -e "${PURPLE}[DEPLOY] Deploying Applications...${NC}"
kubectl apply -f /vagrant/apps/app1/confs/app1-deployment.yaml
kubectl apply -f /vagrant/apps/app1/confs/app1-service.yaml
kubectl apply -f /vagrant/apps/app2/confs/app2-deployment.yaml
kubectl apply -f /vagrant/apps/app2/confs/app2-service.yaml
kubectl apply -f /vagrant/apps/app3/confs/app3-deployment.yaml
kubectl apply -f /vagrant/apps/app3/confs/app3-service.yaml

# Deploy Ingress
echo -e "${PURPLE}[DEPLOY] Deploying Ingress...${NC}"
kubectl apply -f /vagrant/confs/ingress.yaml

echo -e "${GREEN}[DONE] All applications and ingress deployed successfully!${NC}"
