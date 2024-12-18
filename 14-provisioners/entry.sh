#!/bin/bash
sudo yum update -y
sudo yum install -y docker 
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo echo "Welcome to nginx container with terraform code" >> index.html
sudo docker container run --name c1 -d -p 8080:80 nginx
sudo docker cp index.html $(sudo docker ps -aq):/usr/share/nginx/html/index.html