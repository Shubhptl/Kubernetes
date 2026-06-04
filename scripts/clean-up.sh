#!/bin/bash

set -e

echo "Deleting local Kubernetes resources..."

kubectl delete namespace prod --ignore-not-found=true
kubectl delete namespace istio-system --ignore-not-found=true
kubectl delete namespace monitoring --ignore-not-found=true

echo "Cleanup completed."