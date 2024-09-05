build:
	docker build -t dev-tools .

shell:
	docker run --rm -it dev-tools /bin/sh
