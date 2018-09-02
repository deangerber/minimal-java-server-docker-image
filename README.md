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

### Single layer instructions

Run the container so that it can be used by the next instruction.

~~~ bash
docker run -t deangerber/minimal-java /bin/true
~~~

Export and re-import the container to only have one layer.

~~~ bash
docker export `docker ps -q -n=1` | docker import --change "ENV JAVA_HOME /opt/jdk" --change "ENV PATH ${PATH}:${JAVA_HOME}/bin" - deangerber/minimal-java:stripped
~~~

## References

* [Docker](https://www.docker.com)
* [Docker for Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac)
* [Alpine Linux](https://alpinelinux.org)
* [Server JRE (Java SE Runtime Environment) 10](http://www.oracle.com/technetwork/java/javase/downloads/index.html)