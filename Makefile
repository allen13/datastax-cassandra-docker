.PHONY: build deploy destroy shell test

IMAGE_NAME := datastax-cassandra

default: build
build:
	docker build -t $(IMAGE_NAME) .
shell:
	docker run --rm -p 9160:9160 -t -i $(IMAGE_NAME) /bin/bash
