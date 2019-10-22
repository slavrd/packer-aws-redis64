#!/usr/bin/env bash
# Installs the latest redis-server package

sudo apt-get update
sudo apt-get install -y redis-server

sudo sed -i 's/^bind 127\.0\.0\.1.*$/bind 0\.0\.0\.0/' /etc/redis/redis.conf 
