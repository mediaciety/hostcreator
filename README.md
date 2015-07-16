# hostcreator
0. Download and unzip files to /var/www/

1. Install Apache2 and PHP:
aptitude install libapache2-mod-fcgid php5-cgi apache2 apache2-mpm-worker apache2-suexec

2. Enable Apache2 modules: suExec, fcgid
a2enmod suexec
a2enmod fcgid

3. Create User who runs the PHP files (if you like)
adduser <username>

4. Add user to www-data group
adduser <username> www-data

5. adjust ownership and permissions for "skel.host"

chmod 750 /var/www/skel.host
chown example:example /var/www/skel.host/*
chmod 750 /var/www/skel.host/*
chmod 550 /var/www/skel.host/conf
chown example:example /var/www/skel.host/conf/php.ini
chmod 440 /var/www/skel.host/conf/php.ini

chown example:example /var/www/skel.host/php-fcgi/php-fcgi-starter
chattr +i -V /var/www/skel.host/php-fcgi/php-fcgi-starter

6. Edit SuexecUserGroup vHost.file to suit your needs (shoud be the user and group from 3 or 4)

7. Make script executable
chmod +x ./hostcreator.sh

DONE!
