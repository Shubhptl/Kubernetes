#!/bin/bash

set -e

echo "Building backend image..."
docker build -t zero-trust-backend:v1 ./apps/backend

echo "Building frontend image..."
docker build -t zero-trust-frontend:v1 ./apps/frontend

echo "Loading images into Minikube..."
minikube image load zero-trust-backend:v1
minikube image load zero-trust-frontend:v1

echo "Images built and loaded successfully."

minikube image ls | grep zero-trust || true