build:
	docker buildx build -t dev-tools .

shell:
	docker run --rm -it dev-tools

docker-pull:
	docker pull ghcr.io/avolent/dev-tools:latest
