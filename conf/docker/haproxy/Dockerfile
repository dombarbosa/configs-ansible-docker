FROM haproxy:latest
# ENV DEBIAN_FRONTEND noninteractive
RUN apk update
RUN apk add -y curl busybox-extras curl
COPY haproxy.cfg /usr/local/etc/haproxy/