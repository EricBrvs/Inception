all: up

up:
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d
down:
	@docker compose -f ./srcs/docker-compose.yml down -v
start:
	@docker compose -f ./srcs/docker-compose.yml start
stop:
	@docker compose -f ./srcs/docker-compose.yml stop
status:
	@docker ps
fclean :
		@docker system prune -af
		@docker volume rm mariadb wordpress
		@rm -rf ~/data/
re: stop fclean all