IMAGE_NAME ?= dockerdos:latest

.PHONY: build run update

build:
	docker build --tag $(IMAGE_NAME) .

run:
	IMAGE_NAME=$(IMAGE_NAME) ./run-dosbox.sh

update:
	docker pull alpine:3.20
	$(MAKE) build
