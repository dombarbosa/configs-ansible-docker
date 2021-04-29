# FROM ubuntu:bionic
FROM labbsr0x/dns-bind9

RUN apt-get update && apt-get install -y bind9 bind9utils bind9-doc telnet vim less ca-certificates curl iputils-ping apt-transport-https
RUN /etc/init.d/bind9 restart
CMD ["/bin/bash", "-c", "while :; do sleep 10; done"]





# Enable IPv4
# RUN sed -i 's/OPTIONS=.*/OPTIONS="-4 -u bind"/' /etc/default/bind9

# Copy configuration files
# COPY ./named_conf/named.conf.options /etc/bind/
# COPY ./named_conf/named.conf.local /etc/bind/
# COPY ./zones/pulse /etc/bind/zones/

# Run eternal loop
