.PHONY: shell
shell:
	docker run -it ryanlett/jupyter-docker:0.1 sh

.PHONY: build
build:
	docker build -t ryanlett/jupyter-docker:0.1 .

.PHONY: run
run:
	docker run -i -p 8888:8888 ryanlett/jupyter-docker:0.1	
