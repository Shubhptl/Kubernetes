# Sprint 5: Observability with Prometheus and Grafana

## Goal

Add observability to the zero-trust service mesh project using Prometheus and Grafana.

## Tools Used

- Prometheus for metrics collection
- Grafana for visualization
- Istio telemetry for service mesh metrics

## Why Observability Matters

SRE teams need visibility into production systems.

Observability helps answer:

- Is the service healthy?
- How much traffic is flowing?
- Are errors increasing?
- Is latency increasing?
- Is the canary version behaving correctly?

## Golden Signals

This project monitors:

- Latency
- Traffic
- Errors
- Saturation

## Prometheus

Prometheus collects metrics from Kubernetes and Istio.

Useful PromQL queries:

```promql
sum(rate(istio_requests_total[1m])) by (destination_service)

sum(rate(istio_requests_total{destination_service_name="backend-service"}[1m])) by (destination_version)

sum(rate(istio_requests_total[1m])) by (response_code)
histogram_quantile(
  0.95,
  sum(rate(istio_request_duration_milliseconds_bucket[5m])) by (le, destination_service)
)

Grafana Dashboard Panels

Recommended panels:

Request Rate by Service
Backend Canary Traffic v1 vs v2
Response Codes
P95 Request Latency
Pod CPU Usage
Pod Memory Usage
Access Prometheus
kubectl port-forward -n monitoring svc/prometheus-server 9090:80

Open:

http://localhost:9090
Access Grafana
kubectl port-forward -n monitoring svc/grafana 3000:80

Open:

http://localhost:3000

Login:

admin / admin
Generate Traffic
./scripts/generate-traffic.sh 200