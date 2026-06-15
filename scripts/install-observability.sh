#!/bin/bash

set -e

echo "Creating monitoring namespace..."
kubectl create namespace monitoring --dry-run=client -o yaml | kubectl apply -f -

echo "Adding Helm repositories..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts || true
helm repo add grafana https://grafana.github.io/helm-charts || true
helm repo update

echo "Installing Prometheus..."
helm upgrade --install prometheus prometheus-community/prometheus \
  --namespace monitoring \
  --set alertmanager.enabled=false \
  --set prometheus-pushgateway.enabled=false \
  --set server.persistentVolume.enabled=false

echo "Installing Grafana..."
helm upgrade --install grafana grafana/grafana \
  --namespace monitoring \
  --set persistence.enabled=false \
  --set adminPassword=admin \
  --set service.type=NodePort

echo "Waiting for Prometheus..."
kubectl rollout status deployment/prometheus-server -n monitoring

echo "Waiting for Grafana..."
kubectl rollout status deployment/grafana -n monitoring

echo "Observability stack installed."

kubectl get pods -n monitoring
kubectl get svc -n monitoring