# Architecture

## Current Local Architecture

Developer Machine
    |
    |-- Docker
    |
    |-- Minikube Kubernetes Cluster
            |
            |-- prod namespace
            |     |
            |     |-- frontend deployment
            |     |-- backend deployment
            |     |-- frontend service
            |     |-- backend service
            |
            |-- istio-system namespace
            |     |
            |     |-- istiod
            |     |-- istio-ingressgateway
            |
            |-- monitoring namespace
                  |
                  |-- Prometheus
                  |-- Grafana