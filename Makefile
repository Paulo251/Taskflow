.PHONY: up down bash console logs db-create db-migrate

up:
	docker compose up -d

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

perm:
	sudo chown -R $USER:$USER .

db-fresh:
	docker compose exec db psql -U taskflow -d postgres -c "DROP DATABASE IF EXISTS taskflow_development WITH (FORCE);"
	docker compose exec db psql -U taskflow -d postgres -c "CREATE DATABASE taskflow_development;"
	docker compose exec app bin/rails db:migrate
