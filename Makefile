build:
	docker build -t dev-tools .

shell:
	docker run --rm -it dev-tools /bin/sh

docker-pull:
	docker pull ghcr.io/avolent/dev-tools:latest
