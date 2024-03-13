FROM debian:buster

RUN		apt-get update && apt-get install -y nginx \
    openssl

COPY    conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/ssl/motroian.42.fr.pem  \
    -keyout /etc/ssl/motroian.42.fr.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=motroian/CN=motroian.42.fr"

RUN mkdir -p /run/nginx

EXPOSE  443

CMD     ["nginx", "-g", "daemon off;"]
