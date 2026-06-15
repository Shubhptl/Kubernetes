#!/bin/bash

set -e

echo "Checking monitoring namespace pods..."
kubectl get pods -n monitoring

echo ""
echo "Checking monitoring services..."
kubectl get svc -n monitoring

echo ""
echo "Checking Prometheus targets using port-forward is manual:"
echo "Run: kubectl port-forward -n monitoring svc/prometheus-server 9090:80"
echo "Open: http://localhost:9090"

echo ""
echo "Checking Grafana access:"
echo "Run: kubectl port-forward -n monitoring svc/grafana 3000:80"
echo "Open: http://localhost:3000"
echo "Username: admin"
echo "Password: admin"

echo ""
echo "Generate traffic:"
echo "./scripts/generate-traffic.sh 200"

echo ""
echo "Useful PromQL:"
echo "sum(rate(istio_requests_total[1m])) by (destination_service)"
echo "sum(rate(istio_requests_total{destination_service_name=\"backend-service\"}[1m])) by (destination_version)"
echo "histogram_quantile(0.95, sum(rate(istio_request_duration_milliseconds_bucket[5m])) by (le, destination_service))"

echo ""
echo "Observability validation checklist completed."