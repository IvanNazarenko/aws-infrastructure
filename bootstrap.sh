#!/bin/bash
echo "---------------START------------"
mkdir /home/ubuntu/s3
aws s3 sync s3://var.bucket_name /home/ubuntu/s3
sudo apt-get update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo docker pull inazarenko/gold:latest
sudo docker run -id inazarenko/gold:latest
sudo docker run -id inazarenko/gold:latest
echo "UserData executed on $(date)" >> /var/www/html/log.txt
echo "--------------FINISH------------"