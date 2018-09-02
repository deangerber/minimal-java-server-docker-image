# Minimal Java Docker Image

Setup a minimal Java image based on the alpine linux docker image.

## Instructions

Build the image.

~~~ bash
docker build -t deangerber/minimal-java .
~~~

Start the container.

~~~ bash
docker run -ti --rm deangerber/minimal-java
~~~

## References

* [Docker](https://www.docker.com)
* [Docker for Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac)
* [Alpine Linux](https://alpinelinux.org)
* [Server JRE (Java SE Runtime Environment) 10](http://www.oracle.com/technetwork/java/javase/downloads/index.html)