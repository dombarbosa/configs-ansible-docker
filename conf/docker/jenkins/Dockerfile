FROM jenkins/jenkins:jdk11
ENV DEBIAN_FRONTEND noninteractive
USER root
EXPOSE 8080
WORKDIR  /var/jenkins_home
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN apt update
RUN apt install -y curl gettext-base apt-utils telnet maven ansible vim apt-transport-https ca-certificates gnupg-agent software-properties-common python-pip openssh-client
RUN apt clean
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN curl -fsSL get.docker.com | bash
RUN usermod -aG docker jenkins
RUN pip install docker-py
COPY ./id_rsa.pub ~/.ssh/
COPY ./id_rsa ~/.ssh/
RUN echo "ask_pass = false" >> /etc/ansible/ansible.cfg
RUN echo "host_key_checking = false" >> /etc/ansible/ansible.cfg