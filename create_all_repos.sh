#!/bin/bash
set -e

DOCKER_NAMESPACE="kolla"

for repo in $(sudo docker images --format '{{.Repository}}' | grep $DOCKER_NAMESPACE | awk -F "/"  '{print $2}'); do ./create_repo.sh $repo; done
