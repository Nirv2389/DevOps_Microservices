#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# This is your Docker ID/path
dockerpath=nirv2389/prediction:1.0

# Run the Docker Hub container with kubernetes
kubectl run --image=$dockerpath prediction --port=8000

# List kubernetes pods
kubectl get pods

# Forward the container port to a host
kubectl port-forward pod/prediction 8000:80 

