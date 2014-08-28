#!/bin/bash

# Create SSL certificates if they don't exist
if [ ! -f /etc/apache2/ssl/server.key ]; then
	mkdir -p /etc/apache2/ssl
	KEY=/etc/apache2/ssl/server.key
	DOMAIN=$(hostname)
	export PASSPHRASE=$(head -c 128 /dev/urandom  | uuencode - | grep -v "^end" | tr "\n" "d")
	SUBJ="
C=CL
ST=Valparaiso
O=datactil
localityName=Valparaiso
commonName=$DOMAIN
organizationalUnitName=
emailAddress=contacto@datactil.com
"
	openssl genrsa -des3 -out /etc/apache2/ssl/server.key -passout env:PASSPHRASE 2048
	openssl req -new -batch -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key $KEY -out /tmp/$DOMAIN.csr -passin env:PASSPHRASE 
	cp $KEY $KEY.orig
	openssl rsa -in $KEY.orig -out $KEY -passin env:PASSPHRASE
	openssl x509 -req -days 365 -in /tmp/$DOMAIN.csr -signkey $KEY -out /etc/apache2/ssl/server.crt
fi

/usr/bin/mysqld_safe &
/usr/sbin/apache2ctl -D FOREGROUND
