FROM debian

# Installation de NGINX et OpenSSL
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Création du répertoire pour les certificats SSL
RUN mkdir -p /etc/nginx/ssl

# Copie de la configuration NGINX
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copie du script d'initialisation
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Exposition du port HTTPS
EXPOSE 443

# Lancement du script d'initialisation
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Démarrage de NGINX en premier plan
CMD ["nginx", "-g", "daemon off;"]
