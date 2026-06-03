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