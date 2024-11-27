up:
	docker compose up -d

build:
	docker compose build --no-cache

down:
	docker compose down

stop:
	docker compose stop

in:
	docker compose exec julia bash

log:
	docker compose logs -f julia
