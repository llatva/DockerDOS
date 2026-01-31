IMAGE_NAME ?= dockerdos:latest
ALPINE_VERSION ?= 3.20

.PHONY: build run update

build:
	docker build --tag $(IMAGE_NAME) --build-arg ALPINE_VERSION=$(ALPINE_VERSION) .

run:
	IMAGE_NAME=$(IMAGE_NAME) ./run-dosbox.sh

update:
	docker pull alpine:$(ALPINE_VERSION)
	$(MAKE) build
