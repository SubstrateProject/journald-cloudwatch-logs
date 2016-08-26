TARGETS := docker-build
.PHONY: $(TARGETS)
.DEFAULT_GOAL := build/journald-cloudwatch-logs

build/journald-cloudwatch-logs: build/.build-image.log
	docker run --rm -v $(PWD):/usr/src/journald-cloudwatch-logs jcl go build -o $@

build:
	mkdir ./build

build/.build-image.log: build
	docker build -t jcl ./ &> $@

clean:
	rm -rf ./build
	docker rmi $(shell docker images -q jcl:latest)
