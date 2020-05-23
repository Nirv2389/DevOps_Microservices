#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Create dockerpath
dockerpath=nirv2389/prediction:1.0

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

# Push image to a docker repository
docker push nirv2389/prediction:1.0
