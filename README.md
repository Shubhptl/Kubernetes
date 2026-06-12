# Kubernetes
# Zero-Trust Service Mesh on Kubernetes using Istio

## Overview

This project demonstrates a local Kubernetes-based zero-trust service mesh implementation using Minikube, Docker, Terraform, Helm, Istio, Prometheus, Grafana, and GitHub Actions.

The goal is to learn DevOps and SRE concepts by building a real-world microservices platform with secure service-to-service communication, observability, traffic management, and reliability controls.

## Core Technologies

- Docker: Containerizes frontend and backend applications
- Kubernetes: Runs and manages containers
- Minikube: Provides a local Kubernetes cluster
- Terraform: Manages Kubernetes resources as code
- Helm: Installs Kubernetes platform tools
- Istio: Provides service mesh, mTLS, traffic routing, and authorization
- Prometheus: Collects metrics
- Grafana: Visualizes metrics
- GitHub Actions: Provides CI validation and automation

## Architecture

```text
Developer Machine
    ↓
Docker
    ↓
Minikube Kubernetes Cluster
    ↓
Frontend Service
    ↓
Backend API Service
    ↓
Istio Service Mesh
    ↓
Prometheus + Grafana

## Sprint 1: Basic Kubernetes Application

### Goal

Deploy a frontend and backend microservices application to local Kubernetes using Minikube.

### Completed Items

- Created frontend service
- Created backend Spring Boot API
- Dockerized frontend and backend
- Built Docker images locally
- Loaded images into Minikube
- Created Kubernetes Deployments
- Created Kubernetes Services
- Exposed frontend using NodePort
- Verified frontend to backend communication

### Architecture

```text
Browser
 ↓
frontend-service NodePort
 ↓
frontend pod
 ↓
backend-service ClusterIP
 ↓
backend pod

Commands
./scripts/build-images.sh
./scripts/deploy-app.sh
minikube service frontend-service -n prod



---

# Step 19 — Update README

Add this section to your `README.md`:

```markdown
## Sprint 2: Istio Installation and Sidecar Injection

### Goal

Install Istio using Helm and enable Envoy sidecar injection for the application namespace.

### Completed Items

- Installed Istio Helm repository
- Installed Istio base CRDs
- Installed Istiod control plane
- Installed Istio ingress gateway
- Enabled sidecar injection for prod namespace
- Restarted frontend and backend deployments
- Verified application pods changed from 1/1 to 2/2 containers
- Confirmed application still works after sidecar injection

### Commands

```bash
./scripts/install-istio.sh
./scripts/enable-sidecar-injection.sh
kubectl get pods -n prod
kubectl get pods -n istio-system


## Sprint 3: Zero-Trust Security

### Goal

Implement zero-trust service-to-service security using Istio.

### Completed

- Created dedicated ServiceAccounts for frontend and backend
- Updated backend deployment to use backend-sa
- Updated frontend deployment to use frontend-sa
- Enforced STRICT mTLS in the prod namespace
- Added default-deny AuthorizationPolicy
- Added allow policy for frontend-to-backend traffic only
- Validated unauthorized traffic is denied

### Security Model

```text
frontend-sa → backend-service:8080 = allowed
default service account → backend-service:8080 = denied
non-authorized workloads → backend-service:8080 = denied




## Sprint 4: Traffic Management and Canary Deployment

### Goal

Implement safe release and reliability controls using Istio traffic management.

### Completed

- Deployed backend v2
- Added Istio DestinationRule for backend v1/v2 subsets
- Added Istio VirtualService for canary routing
- Configured 90/10 traffic split
- Added header-based routing for beta testers
- Added retries and timeouts
- Added circuit breaker and outlier detection policy
- Added traffic validation script

### Traffic Policy

```text
Normal traffic:
90% → backend v1
10% → backend v2

Beta tester traffic:
100% → backend v2