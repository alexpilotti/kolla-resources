#!/bin/bash

# This script pulls OpenStack images from Clodbase repo and pushes them to a local registry server

# pull images
for image in `docker search cloudbaseit | awk '{print $1}'| sed -n '/cloudbaseit/p'`; do echo $image; done

# push images
docker images | sed -n '/cloudbaseit/p' | while read -r line
do
	NAME=`echo $line | awk '{print $1}'`
	ID=`echo $line | awk '{print $3}'`

	# do note that the default ports were changed to 4000
	docker tag $ID localhost:4000/$NAME
	docker push localhost:4000/$NAME
done

