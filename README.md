
# Test-page

Simple backends running on NGINX for proxy and load balancing demos 

NGINX webserver that serves a simple page containing its hostname, IP address
and port as wells as the request URI and the local time of the webserver.



## Screenshots

`armsultan/test-page:plain-text`

```bash
curl <ip>:<port>

Server name: 318f4b9d2b6b
Server address: 172.17.0.2:80
Status code: 200
URI: /
Cookies: 
User-Agent: curl/7.74.0
Date: 08/Dec/2021:20:17:06 +0000
Request ID: e51ab69a0c78cdec290affe3ce65d841
```

`armsultan/test-page:html`
![html-simple](media/html-simple.png)

`armsultan/test-page:html-blue`
![html-blue](media/html-blue.png)

`armsultan/test-page:html-green`
![html-green](media/html-green.png)

`armsultan/test-page:html-planets`
Test pages include:
 * `earth.html`
 * `jupiter.html`
 * `mars.html`
 * `mercury.html`
 * `neptune.html`
 * `saturn.html`
 * `sun.html`
 * `uranus.html`
 * `venus.html`

![html-green](media/html-planets.png)

`armsultan/test-page:html-snapt`
![html-snapt](media/html-snapt.png)

## How-to

### Pull and run from Docker Hub

```bash
# Plain text page
docker run -P -d armsultan/test-page:plain-text

# HTML Simple page
docker run -P -d armsultan/test-page:html

# HTML Blue page
docker run -P -d armsultan/test-page:blue

# HTML Green page
docker run -P -d armsultan/test-page:green

# HTML Snapt branded page
docker run -P -d armsultan/test-page:snapt
```

### Build and Run Docker images locally

```bash
# PLAIN TEXT PAGE
# Build 
docker build --no-cache -t test-page:plain-text -f DockerfilePlainText .
# Run
docker run -d -p 80:80 test-page:plain-text

# HTML SIMPLE PAGE
# Build 
docker build --no-cache -t test-page:html -f DockerfileHtml .
# Run
docker run -d -p 80:80 test-page:html

# HTML BLUE PAGE
# Build 
docker build --no-cache -t test-page:blue -f DockerfileBlue .
# Run
docker run -d -p 80:80 test-page:blue

# HTML GREEN PAGE
# Build 
docker build --no-cache -t test-page:green -f DockerfileGreen .
# Run
docker run -d -p 80:80 test-page:green

# HTML PLANET PAGES
docker build --no-cache -t test-page:planets -f DockerfilePlanets .
# Run
docker run -d -p 80:80 test-page:planets

# HTML SNAPT INC BRANDED PAGE
docker build --no-cache -t test-page:snapt -f DockerfileSnapt .
# Run
docker run -d -p 80:80 test-page:snapt
```

### Push to your own Docker Hub

```
# For example
docker tag test-page:plain-text armsultan/test-page:plain-text
docker push armsultan/test-page:plain-text
```