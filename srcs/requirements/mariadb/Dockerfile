FROM debian:buster

RUN apt-get update \
    && apt-get install -y mariadb-server \
    mariadb-client

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/init-mariadb.sh /
RUN chmod +x init-mariadb.sh

EXPOSE 3306

CMD ["/init-mariadb.sh"]
