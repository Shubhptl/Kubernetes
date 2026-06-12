# Istio Setup with Helm

## Goal

Install Istio locally on Minikube using Helm and enable sidecar injection for the application namespace.

## Components Installed

### istio-base

Installs Istio Custom Resource Definitions.

Examples:

- VirtualService
- DestinationRule
- Gateway
- PeerAuthentication
- AuthorizationPolicy

### istiod

Istio control plane.

Responsibilities:

- Certificate authority
- Sidecar injection
- Service discovery
- Configuration distribution
- Policy management

### istio-ingress

Gateway for external traffic entering the service mesh.

## Install Commands

```bash
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

kubectl create namespace istio-system

helm install istio-base istio/base -n istio-system --wait
helm install istiod istio/istiod -n istio-system --wait
helm install istio-ingress istio/gateway -n istio-system --wait