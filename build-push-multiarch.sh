#!/bin/bash

# Log into Docker first
docker login
REPO_USERNAME=armsultan

# Create a builder first  
docker buildx create --use --name build --node build --driver-opt network=host  
docker buildx create --name mybuilder  
docker buildx use mybuilder  
docker buildx inspect --bootstrap

# PLAIN TEXT PAGE
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfilePlainText \
        --push -t $REPO_USERNAME/test-page:plain-text .  

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfilePlainTextNonRoot \
        --push -t $REPO_USERNAME/test-page:plain-text-nonroot .

# JSON PAGE
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileJSON \
        --push -t $REPO_USERNAME/test-page:json .  

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileJSONNonRoot \
        --push -t $REPO_USERNAME/test-page:json-nonroot .

# HTML SIMPLE PAGE
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileHtml \
        --push -t $REPO_USERNAME/test-page:html .  

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileHtmlNonRoot \
        --push -t $REPO_USERNAME/test-page:html-nonroot .

# HTML BLUE PAGE
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileBlue \
        --push -t $REPO_USERNAME/test-page:blue .  

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileBlueNonRoot \
        --push -t $REPO_USERNAME/test-page:blue-nonroot .

# HTML GREEN PAGE
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileGreen \
        --push -t $REPO_USERNAME/test-page:green .  

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileGreenNonRoot \
        --push -t $REPO_USERNAME/test-page:green-nonroot .

# HTML PLANET PAGES
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfilePlanets \
        --push -t $REPO_USERNAME/test-page:planets .  

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfilePlanetsNonRoot \
        --push -t $REPO_USERNAME/test-page:planets-nonroot .

# HTML MOON PAGES
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileMoons \
        --push -t $REPO_USERNAME/test-page:moons .  

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileMoonsNonRoot \
        --push -t $REPO_USERNAME/test-page:moons-nonroot .

# HTML SNAPT INC BRANDED PAGE
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileSnapt \
        --push -t $REPO_USERNAME/test-page:snapt .  

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
        -f DockerfileSnaptNonRoot \
        --push -t $REPO_USERNAME/test-page:snapt-nonroot .