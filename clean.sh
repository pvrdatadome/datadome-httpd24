#!/bin/sh

DOCKER_CONTAINER=httpd24
DOCKER_IMAGE=my-httpd-24

docker rm -f $DOCKER_CONTAINER
docker rmi $DOCKER_IMAGE
