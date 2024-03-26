FROM debian:bullseye

RUN apt-get update && apt-get install -y curl \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-common \
    mariadb-client \
    sendmail \
    wget

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
        && chmod +x wp-cli.phar \
        && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html \
        && chown -R www-data:www-data /var/www/html

RUN chmod -R 755 /var/www/html

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY tools/wpscript.sh /var/www/wpscript.sh

RUN chmod +x /var/www/wpscript.sh

RUN mkdir -p /run/php

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/var/www/wpscript.sh"]