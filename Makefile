.PHONY: all build push test version
include VERSION.txt

DOCKER_IMAGE_VERSION=$(VERSION)
DOCKER_IMAGE_NAME=hypriot/rpi-golang

all: build

build:
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION) .
	docker build -t $(DOCKER_IMAGE_NAME):latest .

push:
	docker push $(DOCKER_IMAGE_NAME)

test: version

version:
	docker run --rm $(DOCKER_IMAGE_NAME) go version
