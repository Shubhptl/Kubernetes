#!/bin/bash

set -e

echo "Enabling Istio sidecar injection for prod namespace..."
kubectl label namespace prod istio-injection=enabled --overwrite

echo "Restarting frontend and backend deployments..."
kubectl rollout restart deployment/frontend -n prod
kubectl rollout restart deployment/backend -n prod

echo "Waiting for rollouts..."
kubectl rollout status deployment/frontend -n prod
kubectl rollout status deployment/backend -n prod

echo "Checking pods..."
kubectl get pods -n prod