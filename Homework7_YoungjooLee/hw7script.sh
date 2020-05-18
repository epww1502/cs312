#!/bin/bash

if [ -e ~/.ssh/id_rsa.pub ]
then
	echo -e "ssh key alreaday existed."
else
	echo -e "ssh key is generating..."
	ssh-keygen -t rsa 
fi

echo -e "Copy the SSH key"
ssh-copy-id root@192.168.1.20
ssh-copy-id root@192.168.1.21
ssh-copy-id root@192.168.1.22
ssh-copy-id root@192.168.1.23

ansible-playbook webserver.yaml -i hosts.ini

echo -e "Return contents of index.html"
curl 192.168.1.20
curl 192.168.1.21
curl 192.168.1.22
curl 192.168.1.23

