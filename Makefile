repo=fifos-connector
# repo=$(shell basename -s .git `git config --get remote.origin.url`)
branch=$(shell git rev-parse --abbrev-ref HEAD)
# tag=duckietown/$(repo):$(branch)
tag=courchesnea/$(repo):$(branch)


build:
	docker build --pull -t $(tag) .

run: build
	docker run -it $(tag) /bin/bash

build-no-cache:
	docker build --pull  -t $(tag)  --no-cache .

push: build
	docker push $(tag)
