#!/bin/bash

read -e -p "Neuen Hostnamen angeben: " new_host

echo "neuer host $new_host wird erstellt"

cp -rp ./skel.host ./$new_host
echo "passe configs an..."
sed -i "s/__SKEL__/$new_host/g" ./$new_host/php-fcgi/php-fcgi-starter
sed -i "s/__SKEL__/$new_host/g" ./$new_host/conf/php.ini

echo "Estelle vHost"
cp -rp ./skel.host/vHost.file /etc/apache2/sites-available/$new_host.conf
sed -i "s/__SKEL__/$new_host/g" /etc/apache2/sites-available/$new_host.conf
rm -rf ./$new_host/vHost.file


host_ip=`ifconfig eth0 | grep 'inet Adresse:' | cut -d: -f2 | awk '{ print $1}'`

sed -i "s/__XIPNAME__/$new_host.$host_ip.xip.io/g" /etc/apache2/sites-available/$new_host.conf

echo "Ergaenze Hosts file"
echo "127.0.0.1 $new_host" >> /etc/hosts

a2ensite $new_host
service apache2 reload
