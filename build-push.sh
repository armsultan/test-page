#!/bin/bash

# Log into Docekr first
docker login

# PLAIN TEXT PAGE
docker build --no-cache -t test-page:plain-text -f DockerfilePlainText .
docker build --no-cache -t test-page:plain-text-nonroot -f DockerfilePlainTextNonRoot .

# JSON PAGE
# Build 
docker build --no-cache -t test-page:json -f DockerfileJSON .
docker build --no-cache -t test-page:json-nonroot -f DockerfileJSONNonRoot .

# HTML SIMPLE PAGE
# Build 
docker build --no-cache -t test-page:html -f DockerfileHtml .
docker build --no-cache -t test-page:html-nonroot -f DockerfileHtmlNonRoot .

# HTML BLUE PAGE
# Build 
docker build --no-cache -t test-page:blue -f DockerfileBlue .
docker build --no-cache -t test-page:blue-nonroot -f DockerfileBlueNonRoot .

# HTML GREEN PAGE
# Build 
docker build --no-cache -t test-page:green -f DockerfileGreen .
docker build --no-cache -t test-page:green-nonroot -f DockerfileGreenNonRoot .

# HTML PLANET PAGES
docker build --no-cache -t test-page:planets -f DockerfilePlanets .
docker build --no-cache -t test-page:planets-nonroot -f DockerfilePlanetsNonRoot .

# HTML MOON PAGES
docker build --no-cache -t test-page:moons -f DockerfileMoons .
docker build --no-cache -t test-page:moons-nonroot -f DockerfileMoonsNonRoot .

# HTML SUN SINGLE PAGE
docker build --no-cache -t test-page:sun-single-page -f DockerfileHtmlSunSinglePage .
docker build --no-cache -t test-page:sun-single-page-nonroot -f DockerfileHtmlSunSinglePageNonRoot .

# HTML MOON SINGLE PAGE
docker build --no-cache -t test-page:moon-single-page -f DockerfileHtmlMoonSinglePage .
docker build --no-cache -t test-page:moon-single-page-nonroot -f DockerfileHtmlMoonSinglePageNonRoot .

# HTML SNAPT INC BRANDED PAGE
docker build --no-cache -t test-page:snapt -f DockerfileSnapt .
docker build --no-cache -t test-page:snapt-nonroot -f DockerfileSnaptNonRoot .

## Tage and Push to your own Docker Hub
docker tag test-page:plain-text armsultan/test-page:plain-text
docker push armsultan/test-page:plain-text

docker tag test-page:plain-text-nonroot armsultan/test-page:plain-text-nonroot
docker push armsultan/test-page:plain-text-nonroot

docker tag test-page:json armsultan/test-page:json
docker push armsultan/test-page:json

docker tag test-page:json-nonroot armsultan/test-page:json-nonroot
docker push armsultan/test-page:json-nonroot

docker tag test-page:html armsultan/test-page:html
docker push armsultan/test-page:html

docker tag test-page:html-nonroot armsultan/test-page:html-nonroot
docker push armsultan/test-page:html-nonroot

docker tag test-page:blue armsultan/test-page:blue
docker push armsultan/test-page:blue

docker tag test-page:blue-nonroot armsultan/test-page:blue-nonroot
docker push armsultan/test-page:blue-nonroot

docker tag test-page:green armsultan/test-page:green
docker push armsultan/test-page:green

docker tag test-page:green-nonroot armsultan/test-page:green-nonroot
docker push armsultan/test-page:green-nonroot

docker tag test-page:planets armsultan/test-page:planets
docker push armsultan/test-page:planets

docker tag test-page:planets-nonroot armsultan/test-page:planets-nonroot
docker push armsultan/test-page:planets-nonroot

docker tag test-page:moons armsultan/test-page:moons
docker push armsultan/test-page:moons

docker tag test-page:moons-nonroot armsultan/test-page:moons-nonroot
docker push armsultan/test-page:moons-nonroot

docker tag test-page:snapt armsultan/test-page:snapt
docker push armsultan/test-page:snapt

docker tag test-page:snapt-nonroot armsultan/test-page:snapt-nonroot
docker push armsultan/test-page:snapt-nonroot
