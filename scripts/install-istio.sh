#!/bin/bash

set -e

echo "Adding Istio Helm repository..."
helm repo add istio https://istio-release.storage.googleapis.com/charts || true
helm repo update

echo "Creating istio-system namespace..."
kubectl create namespace istio-system --dry-run=client -o yaml | kubectl apply -f -

echo "Installing Istio base CRDs..."
helm upgrade --install istio-base istio/base \
  -n istio-system \
  --wait

echo "Installing Istiod control plane..."
helm upgrade --install istiod istio/istiod \
  -n istio-system \
  --wait

echo "Installing Istio ingress gateway..."
helm upgrade --install istio-ingress istio/gateway \
  -n istio-system \
  --wait

echo "Istio installation completed."

echo "Current Istio pods:"
kubectl get pods -n istio-system

echo "Current Helm releases:"
helm list -n istio-system