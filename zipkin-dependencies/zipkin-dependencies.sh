#!/bin/sh

set -e

echo " "
echo " "
echo 'build zipkin-dependencies start'

ZIPKIN_VERSION=$(curl https://api.github.com/repos/openzipkin/zipkin-dependencies/releases/latest | jq | grep tag_name | cut -d '"' -f 4)

docker build \
    --build-arg ZIPKIN_VERSION=${ZIPKIN_VERSION} \
    -t ${CI_REGISTRY}/opcal/zipkin-dependencies:${ZIPKIN_VERSION} \
    -t ${CI_REGISTRY}/opcal/zipkin-dependencies:latest \
    -f ${PROJECT_DIR}/zipkin-dependencies/Dockerfile . --no-cache

docker push ${CI_REGISTRY}/opcal/zipkin-dependencies:${ZIPKIN_VERSION}
docker push ${CI_REGISTRY}/opcal/zipkin-dependencies:latest

echo 'build zipkin-dependencies finished'
echo " "
echo " "