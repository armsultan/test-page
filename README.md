
# NGINX webserver and test page

Simple backends for proxy and load balancing demos using NGINX

NGINX webserver that serves a simple page containing its hostname, IP address
and port as wells as the request URI and the local time of the webserver.

Based on -- https://hub.docker.com/r/nginxdemos/hello/

### How to run

```bash
# HTML page
docker run -P -d armsultan/hello

# HTML Coffee page
docker run -P -d armsultan/hello:coffee

# HTML Tea page
docker run -P -d armsultan/hello:tea

# Plain text page
docker run -P -d armsultan/hello:plain-text
```

### Build Docker images locally

```bash
# HTML page
docker build --no-cache -t hello .

# HTML Coffee page
docker build --no-cache -t coffee -f DockerfileCoffee .

# HTML Tea page
docker build --no-cache -t tea -f DockerfileTea .

# Plain text page
docker build --no-cache -t plain-text -f DockerfilePlainText .
```

## Hello

Now, assuming we found out the IP address and the port that mapped to port 80 on the container, in a browser we can make a request to the webserver and get the page below:

![hello](images/hello.png)

## Coffee and Tea

Other HTML variations include a coffee and tea page:
![coffee](images/coffee.png)
![tea](images/tea.png)

## Plain Text

Lastly, a plain text version of the image is available as `armsultan/hello:plain-text`. This version returns the same information in the plain text format:

```bash
curl <ip>:<port>

Status code: 200
Server address: 172.17.0.5:80
Server name: 3431df587c68
Date: 06/Dec/2019:15:30:53 +0000
User-Agent: curl/7.65.3
Cookie:
URI: /
Request ID: 49141ee9a2a6a8e1f773996abc3f867a
```
