all: up

up:
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up --build -d

down:
	@docker compose -f ./srcs/docker-compose.yml down -v

start:
	@docker compose -f ./srcs/docker-compose.yml start

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

status:
	@docker ps

fclean:
	@echo "🛑 Arrêt et suppression des conteneurs..."
	@docker compose -f ./srcs/docker-compose.yml down --volumes --remove-orphans
	@echo "🗑 Suppression des volumes Docker..."
	@docker volume prune -f
	@echo "🚀 Nettoyage complet de Docker..."
	@docker system prune -af --volumes
	@echo "🔓 Suppression manuelle du dossier ~/data/..."
	@sudo rm -rf ~/data/


re: fclean all
