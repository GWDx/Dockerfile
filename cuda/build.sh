#!/bin/bash
set -e

ALL_BASE=(
  12.4.1-devel-ubuntu20.04
)

for base in "${ALL_BASE[@]}"; do
  docker build -t ghcr.io/gwdx/${base}:latest \
    --build-arg CUDA_BASE=${base} \
    ./cuda

  docker push ghcr.io/gwdx/${base}:latest

  docker image rm ghcr.io/gwdx/${base}:latest
  docker system prune -f
done
