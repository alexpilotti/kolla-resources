#!/bin/bash
set -e

DOCKER_NAMESPACE="kolla"
NEW_NAMESPACE=""
TAG="4.0.0"
for repo in $(sudo docker images --format '{{.Repository}}' | grep $DOCKER_NAMESPACE ); do repo=`echo $repo | awk -F "/" '{print $2}'` && sudo docker tag kolla/$repo:$TAG $NEW_NAMESPACE/$repo:$TAG && sudo docker push $NEW_NAMESPACE/$repo; done
