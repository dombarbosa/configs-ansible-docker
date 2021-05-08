#!/bin/bash

echo "nameserver 10.230.10.14" > /etc/resolv.conf
echo "nameserver 10.230.10.13" >> /etc/resolv.conf
echo "ask_pass = false" >> /etc/ansible/ansible.cfg
echo "host_key_checking = false" >> /etc/ansible/ansible.cfecho "nameserver 10.230.10.13" >> /etc/resolv.conf
