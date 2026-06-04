#!/bin/bash

set -e

echo "Starting Minikube..."

minikube start --cpus=4 --memory=8192

echo "Minikube started successfully."

kubectl get nodes