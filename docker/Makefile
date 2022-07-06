TAG = latest
ORG ?= ghcr.io/netdrones
IMAGE ?= hybvio
DOCKERFILE ?= Dockerfile

DOCKERNAME = "${ORG}/${IMAGE}:${TAG}"
CONTAINER = "${IMAGE}_container"

.PHONY: build
build:
	docker build -t "${DOCKERNAME}" -f "${DOCKERFILE}" .

.PHONY: run
run:
	sh +x run.sh

.PHONY: attach
attach:
	docker exec -it "${CONTAINER}" bash

.PHONY: clean
clean:
	docker kill $$(docker ps -q)
