export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

all: down build up

build:
	docker-compose build

up:
	docker-compose up -d app

down:
	docker-compose down --remove-orphans

logs:
	docker-compose logs app | tail -120
