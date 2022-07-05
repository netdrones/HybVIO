TAG = latest
ORG ?= ghcr.io/netdrones
IMAGE ?= hybvio
DOCKERFILE ?= Dockerfile

DOCKERNAME = "${ORG}/${IMAGE}:${TAG}"

.PHONY: build
build:
	docker build -t "${DOCKERNAME}" -f "${DOCKERFILE}" .

.PHONY: run
run:
	sudo sh +x run.sh

.PHONY: attach
attach:
	sudo docker exec -it dazzling_burnell bash
