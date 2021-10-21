#!/usr/bin/env bash
set -e

IMAGE_NAME="aws-terraform"
IMAGE_TAG="latest"
TF_VERSION="0.14.10"

# Build image
echo "Building images with TERRAFORM_VERSION=${TF_VERSION} Image: ${IMAGE_NAME}:${IMAGE_TAG}..."
docker build --build-arg TERRAFORM_VERSION=$TF_VERSION -t $IMAGE_NAME:$IMAGE_TAG .

echo "Image successfully builded!"