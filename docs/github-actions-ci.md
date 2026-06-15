# Sprint 6: GitHub Actions CI Validation

## Goal

Add GitHub Actions workflows to validate the project automatically.

## Why CI Matters

In enterprise DevOps and SRE teams, code is not merged directly without validation.

CI helps catch problems early, such as:

- Broken Docker builds
- Invalid Kubernetes YAML
- Terraform formatting issues
- Missing project files
- Broken project structure

## Workflows Added

### Docker Build Validation

Builds:

- frontend Docker image
- backend Docker image

This ensures both application containers can be built successfully.

### Kubernetes Manifest Validation

Validates Kubernetes YAML files under:

- k8s/namespaces
- k8s/service-accounts
- k8s/deployments
- k8s/services
- k8s/istio

### Terraform Validation

Runs:

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate