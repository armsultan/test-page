#!/bin/bash

# Log into Docker first
docker login

for filename in html-solar-system/*.html
do
  NAME="$(basename $filename .html)"
  echo "Building $NAME"
  sed -i "s/_PLACEHOLDER_NAME_/$NAME/g" DockerfileHtmlSolarSystem
  sed -i "s/_PLACEHOLDER_NAME_/$NAME/g" DockerfileHtmlSolarSystemNonRoot
  # Build root and nonroot images
  docker build --no-cache -t solar-system:$NAME -f DockerfileHtmlSolarSystem .
  docker build --no-cache -t solar-system:$NAME-nonroot -f DockerfileHtmlSolarSystemNonRoot .
  # Tag and Push root and nonroot images
  docker tag solar-system:$NAME armsultan/solar-system:$NAME
  docker push armsultan/solar-system:$NAME 
  docker tag solar-system:$NAME-nonroot armsultan/solar-system:$NAME-nonroot
  docker push armsultan/solar-system:$NAME-nonroot 
  # Set file back to placeholder values
  sed -i "s/$NAME/_PLACEHOLDER_NAME_/g" DockerfileHtmlSolarSystem
  sed -i "s/$NAME/_PLACEHOLDER_NAME_/g" DockerfileHtmlSolarSystemNonRoot
  # Delete docker images
  docker image rm solar-system:$NAME
  docker image rm solar-system:$NAME-nonroot
done;