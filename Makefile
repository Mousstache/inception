# Variables
DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yml
DATA_DIR := /home/motroian/data
MARIADB_DATA_DIR := $(DATA_DIR)/mariadb
WORDPRESS_DATA_DIR := $(DATA_DIR)/wordpress

# Commandes
up:
	mkdir -p $(MARIADB_DATA_DIR)
	mkdir -p $(WORDPRESS_DATA_DIR)
	docker compose -f $(DOCKER_COMPOSE_FILE) up --build -d

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down

clean:
	docker system prune

show:
	docker ps
	docker volume ls -q
	docker container ls -q

renew:
	make down
	-docker volume rm $(DOCKER_COMPOSE_FILE)_mariadb-vol
	-docker volume rm $(DOCKER_COMPOSE_FILE)_wordpress-vol
	sudo rm -rf $(DATA_DIR)
	make up

see:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

restart:
	make down
	make up

.PHONY: up down clean show renew see restart
