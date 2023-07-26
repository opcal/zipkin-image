#!/bin/sh

set -e

echo " "
echo " "
echo 'build zipkin start'

ZIPKIN_VERSION=$(curl https://api.github.com/repos/openzipkin/zipkin/releases/latest | jq | grep tag_name | cut -d '"' -f 4)

docker build \
    --build-arg ZIPKIN_VERSION=${ZIPKIN_VERSION} \
    -t ${CI_REGISTRY}/opcal/zipkin:${ZIPKIN_VERSION} \
    -t ${CI_REGISTRY}/opcal/zipkin:latest \
    -f ${PROJECT_DIR}/zipkin/Dockerfile . --no-cache

docker push ${CI_REGISTRY}/opcal/zipkin:${ZIPKIN_VERSION}
docker push ${CI_REGISTRY}/opcal/zipkin:latest

echo 'build zipkin finished'
echo " "
echo " "