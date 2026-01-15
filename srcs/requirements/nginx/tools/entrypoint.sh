#!/bin/bash

# Génération des certificats SSL auto-signés si ils n'existent pas
if [ ! -f /etc/nginx/ssl/nginx.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/nginx.key \
        -out /etc/nginx/ssl/nginx.crt \
        -subj "/C=FR/ST=State/L=City/O=Organization/CN=${DOMAIN_NAME}"
fi

# Remplacement de la variable DOMAIN_NAME dans la config
envsubst '${DOMAIN_NAME}' < /etc/nginx/nginx.conf > /tmp/nginx.conf
mv /tmp/nginx.conf /etc/nginx/nginx.conf

# Exécution de la commande passée en argument (CMD du Dockerfile)
exec "$@"
