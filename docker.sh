#!/bin/bash

echo "stopping all the container"
docker stop $(docker ps -aq)

echo "deleting all the container"
docker rm $(docker ps -aq)