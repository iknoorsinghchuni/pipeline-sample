#!/bin/bash


npm install

# For the love of all that is good, don't use this in production
# This is only for a demonstration of how things work behind the scene

ssh devops@192.168.1.144 'sudo mkdir -p /app; sudo chown -R devops. /app'
rsync -avz ./ devops@192.168.1.144:/app/
ssh devops@192.168.1.144 "sudo systemctl restart nodeapp"
