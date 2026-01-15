COMPOSE_FILE = srcs/docker-compose.yml
DATA_PATH = /home/$(USER)/data


all: build up

setup:
	@echo "Creating data directories..."
	@mkdir -p $(DATA_PATH)/mariadb
	@mkdir -p $(DATA_PATH)/wordpress
	@echo "Data directories created"
	

build: setup
	@echo "Building Docker images..."
	@docker compose -f $(COMPOSE_FILE) build
	@echo "Build complete!"

up:
	@echo "Starting containers..."
	@docker compose -f $(COMPOSE_FILE) up -d
	@echo "Containers started!"
	@echo "Access your site at: https://$(USER).42.fr"

down:
	@echo "Stopping containers..."
	@docker compose -f $(COMPOSE_FILE) down
	@echo "Containers stopped"

logs:
	@docker compose -f $(COMPOSE_FILE) logs -f

ps:
	@docker compose -f $(COMPOSE_FILE) ps

clean: down
	@echo "Cleaning containers, networks, and images..."
	@docker-compose -f $(COMPOSE_FILE) down -v --rmi all
	@echo "Cleanup complete"

fclean: clean
	@echo "Removing data directories..."
	@sudo rm -rf $(DATA_PATH)/mariadb
	@sudo rm -rf $(DATA_PATH)/wordpress
	@echo "Pruning Docker system..."
	@docker system prune -af --volumes
	@echo "Full cleanup complete"

re: fclean all

help:
	@echo "Available commands:"
	@echo "  make all      - Build and start all containers"
	@echo "  make build    - Build Docker images"
	@echo "  make up       - Start containers"
	@echo "  make down     - Stop containers"
	@echo "  make logs     - Show container logs"
	@echo "  make ps       - Show container status"
	@echo "  make clean    - Remove containers and images"
	@echo "  make fclean   - Full cleanup including data"
	@echo "  make re       - Rebuild everything from scratch"

.PHONY: all build up down clean fclean re logs ps
