#!/bin/bash
#
#	Copyright (c) openheap, uplusware
#	uplusware@gmail.com
#
if [ `id -u` -ne 0 ]; then
        echo "You need root privileges to run this script"
        exit 1
fi

#
# install the eRisemail System
#
test -x /etc/init.d/erisemail && /etc/init.d/erisemail stop
killall erisemail 2> /dev/null
sleep 1

path=$(dirname $0)
oldpwd=$(pwd)
cd ${path}
path=$(pwd)

echo "Finding MySQL/MariaDB UDF plugin directory ..."
test -x /usr/lib/mysql/plugin || test -x /usr/lib64/mysql/plugin || test -x /usr/lib/x86_64-linux-gnu/mariadb18/plugin/ || (echo "Couldn't find MySQL/MariaDB UDF plugin directory." && exit -1)

echo "Copy the files to your system."

(test -x /usr/lib/mysql/plugin && cp -f ${path}/postudf.so /usr/lib/mysql/plugin) || (test -x /usr/lib64/mysql/plugin && cp -f ${path}/postudf.so /usr/lib64/mysql/plugin) || (test -x /usr/lib/x86_64-linux-gnu/mariadb18/plugin/ && cp -f ${path}/postudf.so /usr/lib/x86_64-linux-gnu/mariadb18/plugin/)

test -x /etc/erisemail || mkdir /etc/erisemail
test -x /var/erisemail || mkdir /var/erisemail
test -x /var/erisemail/html || mkdir /var/erisemail/html
test -x /var/erisemail/cert || mkdir /var/erisemail/cert
test -x /var/erisemail/cert/client || mkdir /var/erisemail/cert/client
test -x /var/erisemail/cert/client/smtp.fake.demo || mkdir /var/erisemail/cert/client/smtp.fake.demo
test -x /var/erisemail/private || mkdir /var/erisemail/private
test -x /var/erisemail/private/eml || mkdir /var/erisemail/private/eml
test -x /var/erisemail/private/tmp || mkdir /var/erisemail/private/tmp
test -x /var/erisemail/private/cal || mkdir /var/erisemail/private/cal
test -x /var/erisemail/private/box || mkdir /var/erisemail/private/box
test -x /var/erisemail/private/cache || mkdir /var/erisemail/private/cache

cp -rf ${path}/html/* /var/erisemail/html/ 

test -x /etc/erisemail/erisemail.conf && mv /etc/erisemail/erisemail.conf /etc/erisemail/erisemail.conf.$((`date "+%Y%m%d%H%M%S"`))
cp -f ${path}/erisemail.conf /etc/erisemail/erisemail.conf
chmod 600 /etc/erisemail/erisemail.conf

test -x /var/erisemail/cert/ca.crt || cp -f ${path}/ca.crt /var/erisemail/cert/ca.crt
chmod 600 /var/erisemail/cert/ca.crt

test -x /var/erisemail/cert/server.key || cp -f ${path}/server.key /var/erisemail/cert/server.key
chmod 600 /var/erisemail/cert/server.key

test -x /var/erisemail/cert/server.crt || cp -f ${path}/server.crt /var/erisemail/cert/server.crt
chmod 600 /var/erisemail/cert/server.crt

test -x /var/erisemail/cert/client.key || cp -f ${path}/client.key /var/erisemail/cert/client.key
chmod 600 /var/erisemail/cert/client.key
 
test -x /var/erisemail/cert/client.crt || cp -f ${path}/client.crt /var/erisemail/cert/client.crt
chmod 600 /var/erisemail/cert/client.crt

test -x /etc/erisemail/domain.list || cp -f ${path}/domain.list /etc/erisemail/domain.list
chmod a-x /etc/erisemail/domain.list

test -x /etc/erisemail/permit.list || cp -f ${path}/permit.list /etc/erisemail/permit.list
chmod a-x /etc/erisemail/permit.list

test -x /etc/erisemail/reject.list || cp -f ${path}/reject.list /etc/erisemail/reject.list
chmod a-x /etc/erisemail/reject.list

test -x /etc/erisemail/webadmin.list || cp -f ${path}/webadmin.list /etc/erisemail/webadmin.list
chmod a-x /etc/erisemail/webadmin.list

test -x /etc/erisemail/mfilter.xml || cp -f ${path}/mfilter.xml /etc/erisemail/mfilter.xml
chmod a-x /etc/erisemail/mfilter.xml

if [ -x /usr/lib64 ]; then 
    cp -f ${path}/liberisestorage.so /usr/lib64/liberisestorage.so
    cp -f ${path}/libldapasn1.so /usr/lib64/libldapasn1.so
    cp -f ${path}/liberiseantispam.so /usr/lib64/liberiseantispam.so
elif [ -x /usr/lib ]; then
    cp -f ${path}/liberisestorage.so /usr/lib/liberisestorage.so
    cp -f ${path}/libldapasn1.so /usr/lib/libldapasn1.so
    cp -f ${path}/liberiseantispam.so /usr/lib/liberiseantispam.so
else
    exit -1
fi
  
cp -f ${path}/erisemaild /usr/bin/erisemaild
chmod a+x /usr/bin/erisemaild

cp -f ${path}/eriseutil /usr/bin/eriseutil
chmod a+x /usr/bin/eriseutil

cp -f ${path}/erisemail.sh  /etc/init.d/erisemail
chmod a+x /etc/init.d/erisemail

cp -f ${path}/uninstall.sh  /var/erisemail/uninstall.sh
chmod a-x /var/erisemail/uninstall.sh

ln -s /etc/init.d/erisemail /etc/rc0.d/K60erisemail 2> /dev/null
ln -s /etc/init.d/erisemail /etc/rc1.d/S60erisemail 2> /dev/null
ln -s /etc/init.d/erisemail /etc/rc2.d/S60erisemail 2> /dev/null
ln -s /etc/init.d/erisemail /etc/rc3.d/S60erisemail 2> /dev/null
ln -s /etc/init.d/erisemail /etc/rc4.d/S60erisemail 2> /dev/null
ln -s /etc/init.d/erisemail /etc/rc5.d/S60erisemail 2> /dev/null
ln -s /etc/init.d/erisemail /etc/rc6.d/K60erisemail 2> /dev/null

echo "Done."
echo "Please reference the document named INSTALL to go ahead."
cd ${oldpwd}
