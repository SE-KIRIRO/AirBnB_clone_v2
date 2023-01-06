#!/usr/bin/env bash
# setup server for deployment web_static
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo mkdir -p /data/web_static
sudo mkdir -p /data/web_static/releases
sudo mkdir -p /data/web_static/shared
sudo mkdir -p /data/web_static/releases/test
sudo echo "test deploying web_static" > /data/web_static/releases/test/index.html
sudo ln -fs /data/web_static/releases/test /data/web_static/current
sudo chown -R ubuntu:ubuntu /data
sudo sed -i '/^\tserver_name/ a\\tlocation /hbnb_static \{\n\t\talias /data/web_static/current;\n\t\}\n' /etc/nginx/sites-available/default
sudo service nginx restart
