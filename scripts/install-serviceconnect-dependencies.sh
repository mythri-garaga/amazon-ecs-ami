#!/usr/bin/env bash
set -ex

if [ -n "$AIR_GAPPED" ]; then
    echo "Air-gapped region, exec feature is not supported"
    exit 0
fi

BINARY_PATH="/var/lib/ecs/deps/serviceconnect/"

systemctl status docker

sudo systemctl restart docker

docker pull 840364872350.dkr.ecr.us-west-2.amazonaws.com/aws-appmesh-envoy:v1.22.2.1-prod

docker save -o appmesh-envoy.tar 840364872350.dkr.ecr.us-west-2.amazonaws.com/aws-appmesh-envoy
