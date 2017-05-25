.PHONY: shell
shell:
	docker run -it ryanlett/jupyter:0.1 sh

.PHONY: build
build:
	docker build -t ryanlett/jupyter:0.1 .

.PHONY: run
run:
	docker run -i -p 8888:8888 ryanlett/jupyter:0.1	
