REPO=ryanlett/jupyter-docker
TAG=latest
NAME="${REPO}:${TAG}"

.PHONY: shell
shell:
	docker-compose run jupyter sh

.PHONY: build
build:
	docker-compose build

.PHONY: run
run:
	docker-compose up
