FROM haproxy:1.6
# ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install -y curl telnet
# RUN apk update
# RUN apk add -y curl busybox-extras curl
COPY haproxy.cfg /usr/local/etc/haproxy/