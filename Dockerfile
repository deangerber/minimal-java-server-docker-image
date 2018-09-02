FROM alpine:3.8

# Install required packages
RUN apk --update --no-cache add curl ca-certificates tar xz

RUN cd /tmp

# Install JDK dependencies
RUN curl -so /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN curl -Lso /tmp/glibc-2.28-r0.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add /tmp/glibc-2.28-r0.apk

RUN curl -Lso /tmp/libz.tar.xz https://www.archlinux.org/packages/core/x86_64/zlib/download
RUN mkdir -p /tmp/libz
RUN tar -xf /tmp/libz.tar.xz -C /tmp/libz
RUN cp /tmp/libz/usr/lib/libz.so.* /usr/glibc-compat/lib

# Install and setup Server JRE 10.0.2
RUN mkdir /opt
RUN curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/serverjre-10.0.2_linux-x64_bin.tar.gz | tar -xzf - -C /opt
RUN ln -s /opt/jdk-10.0.2/ /opt/jdk

# Cleanup image
RUN rm /tmp/glibc-2.28-r0.apk
RUN rm /tmp/libz.tar.xz
RUN rm -rf /tmp/libz

# Set environment
ENV JAVA_HOME /opt/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin
