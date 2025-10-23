.PHONY: host-bootstrap up up-core down logs ps restart

host-bootstrap:
	@./scripts/10-setup-host-elastic.sh

up-core:
	docker-compose up -d elasticsearch kibana

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f --tail=200

ps:
	docker-compose ps

restart:
	docker-compose down && docker-compose up -d
