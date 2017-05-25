REPO=ryanlett/jupyter-docker
TAG=latest
NAME="${REPO}:${TAG}"

.PHONY: shell
shell:
	docker run -it ${NAME} sh

.PHONY: build
build:
	docker build -t ${NAME} .

.PHONY: run
run:
	docker run -i -p 8888:8888 ${NAME}
