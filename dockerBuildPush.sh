#!/bin/bash

set -e
set -o pipefail
version=$(git describe --long | sed 's/-g[a-f\d]*$//')
# Remove commit hash with leading "g"
version=$(sed 's/-g[A-Fa-f0-9]*$//' <<< "$version")

docker build -t $REGISTRY/$REPO/$version .
docker push $REGISTRY/$REPO/$version

