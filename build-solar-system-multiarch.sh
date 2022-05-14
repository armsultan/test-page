#!/bin/bash

# Log into Docker first
docker login
REPO_USERNAME=armsultan

# Create a builder first  
docker buildx create --use --name build --node build --driver-opt network=host  
docker buildx create --name mybuilder  
docker buildx use mybuilder  
docker buildx inspect --bootstrap

for filename in html-solar-system/*.html
do
  NAME="$(basename $filename .html)"
  echo "Building $NAME"
  sed -i "s/_PLACEHOLDER_NAME_/$NAME/g" DockerfileHtmlSolarSystem
  sed -i "s/_PLACEHOLDER_NAME_/$NAME/g" DockerfileHtmlSolarSystemNonRoot
  # Build root and nonroot images
  docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileHtmlSolarSystem \
        --push -t $REPO_USERNAME/solar-system:$NAME .  

  docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileHtmlSolarSystemNonRoot \
        --push -t $REPO_USERNAME/solar-system:$NAME-nonroot .  

  docker buildx imagetools inspect $REPO_USERNAME/solar-system:$NAME
  docker buildx imagetools inspect $REPO_USERNAME/solar-system:$NAME

  # Set file back to placeholder values
  sed -i "s/$NAME/_PLACEHOLDER_NAME_/g" DockerfileHtmlSolarSystem
  sed -i "s/$NAME/_PLACEHOLDER_NAME_/g" DockerfileHtmlSolarSystemNonRoot
  # Delete docker images
  docker image rm $REPO_USERNAME/solar-system:$NAME
  docker image rm $REPO_USERNAME/solar-system:$NAME-nonroot
done;