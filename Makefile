.PHONY: up down bash console logs db-create db-migrate

up:
	docker compose up

down:
	docker compose down

bash:
	docker compose exec app bash

console:
	docker compose exec app bin/rails console

logs:
	docker compose logs -f app

db-create:
	docker compose exec app bin/rails db:create

db-migrate:
	docker compose exec app bin/rails db:migrate
