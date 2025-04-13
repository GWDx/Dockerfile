#!/bin/bash
set -e

TAGS=(
  12.4.1-cudnn-runtime-ubuntu20.04
)

for tag in "${TAGS[@]}"; do
  docker pull ghcr.io/tiankaima/cuda:${tag} || true

  docker build -t ghcr.io/gwdx/cuda:${tag} \
    --build-arg CUDA_BASE=${tag} \
    ./cuda

  docker push ghcr.io/gwdx/cuda:${tag}

  docker image rm ghcr.io/gwdx/cuda:${tag}
  docker system prune -f
done
