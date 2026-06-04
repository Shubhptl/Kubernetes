#!/bin/bash

set -e

echo "Applying Kubernetes manifests..."

kubectl apply -f k8s/namespaces/
kubectl apply -f k8s/deployments/
kubectl apply -f k8s/services/

echo "Waiting for backend rollout..."
kubectl rollout status deployment/backend -n prod

echo "Waiting for frontend rollout..."
kubectl rollout status deployment/frontend -n prod

echo "Application deployed successfully."

kubectl get pods -n prod
kubectl get svc -n prod