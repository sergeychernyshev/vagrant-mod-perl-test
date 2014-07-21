#!/usr/bin/env bash

apt-get update
apt-get install -y apache2 libapache2-mod-perl2 libdbi-perl vim mysql-client

# adding apache config for mod_perl
rm /etc/apache2/sites-available/default
ln -fs /vagrant/httpd.conf /etc/apache2/sites-available/default

service apache2 restart
