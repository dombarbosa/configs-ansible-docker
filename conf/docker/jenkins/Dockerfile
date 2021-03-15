FROM jenkins/jenkins:lts AS multistage
ENV DEBIAN_FRONTEND noninteractive
USER root
EXPOSE 8080
WORKDIR  /var/jenkins_home
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN apt-get remove docker docker-engine docker.io containerd runc
RUN apt update
RUN apt install -y curl gettext-base apt-utils maven ansible vim apt-transport-https ca-certificates gnupg-agent software-properties-common python-pip
RUN apt clean
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
# RUN curl -fsSL https://get.docker.com | bash
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   stretch \
   stable"
RUN apt-get update
RUN apt install -y docker-ce docker-ce-cli containerd.io
RUN usermod -aG docker jenkins
RUN pip install docker-py
RUN echo "ask_pass = false" >> /etc/ansible/ansible.cfg
RUN echo "host_key_checking = false" >> /etc/ansible/ansible.cfg


# FROM alpine:3.8
# COPY --from=multistage /var/jenkins_home .
# USER root
# EXPOSE 80   
# WORKDIR /var/jenkins_home