#!/bin/bash
set -e

DOCKER_NAMESPACE="kolla"
NEW_NAMESPACE="dardelean"
for repo in $(sudo docker images --format '{{.Repository}}' | grep $DOCKER_NAMESPACE ); do repo=`echo $repo | awk -F "/" '{print $2}'` && sudo docker tag kolla/$repo:4.0.0 $NEW_NAMESPACE/$repo:4.0.0 && sudo docker push $NEW_NAMESPACE/$repo; done
