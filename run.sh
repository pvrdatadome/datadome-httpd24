#!/bin/bash
DOCKER_CONTAINER=httpd24
DOCKER_IMAGE=my-httpd-24

DATADOME_KEY=YOURDATADOMEKEY

docker build -t $DOCKER_IMAGE .

if [ !"$(docker ps -q -f name=$DOCKER_CONTAINER)" ]; then
    if [ "$(docker ps -aq -f name=$DOCKER_CONTAINER)" ]; then
        # cleanup
        echo " ---> Remove and delete previous container version"
        docker rm -f $DOCKER_CONTAINER
    fi
    # run your container
    docker run -dit --name $DOCKER_CONTAINER --env DOMEKEY=$DATADOME_KEY -p 8080:80 $DOCKER_IMAGE
fi

docker logs -f $DOCKER_CONTAINER
