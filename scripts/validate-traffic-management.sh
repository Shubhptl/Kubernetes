#!/bin/bash

set -e

echo "Checking backend pods..."
kubectl get pods -n prod -l app=backend --show-labels

echo ""
echo "Checking DestinationRule..."
kubectl get destinationrule -n prod

echo ""
echo "Checking VirtualService..."
kubectl get virtualservice -n prod

echo ""
echo "Running traffic split test using frontend-sa..."
kubectl run frontend-test-client -n prod \
  --image=curlimages/curl \
  --overrides='{"spec":{"serviceAccountName":"frontend-sa"}}' \
   -it --rm --restart=Never -- sh -c 'for i in $(seq 1 30); do curl -s http://backend-service:8080/api/version; echo; done'

echo ""
echo "Running beta tester header test..."
kubectl run frontend-beta-test-client -n prod \
  --image=curlimages/curl \
  --serviceaccount=frontend-sa \
  --restart=Never \
  --rm -i -- \
  curl -s -H "user-type: beta-tester" http://backend-service:8080/api/version

echo ""
echo "Traffic management validation completed."