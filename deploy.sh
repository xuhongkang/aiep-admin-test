#!/bin/bash

# Install needed dependencies
sudo yum update
sudo yum install -y git docker
sudo service docker start
sudo git clone https://github.com/xuhongkang/aiep-admin-test.git
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Build and run the Docker containers
cd ./aiep-admin-test
sudo docker-compose up --build -d

## To rebuild
sudo docker-compose down
sudo git pull
sudo docker-compose up --build -d

# Optionally, renew Let's Encrypt certificates
# sudo apt-get install -y certbot
# sudo certbot --nginx -d a-iep-dev.com -d www.a-iep-dev.com
