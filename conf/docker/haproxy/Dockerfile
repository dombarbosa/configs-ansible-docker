FROM haproxy:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install -y curl telnet apt-transport-https ca-certificates iputils-ping
COPY haproxy.cfg /usr/local/etc/haproxy/