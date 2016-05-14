.PHONY: build tag test push clean all

IMAGE = jfusterm/nginx
VERSION = 1.10.0

default: build

build:
	docker build -t $(IMAGE):$(VERSION) .

tag: 
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker tag $(IMAGE):$(VERSION) $(IMAGE):1.10

test:
	sh test.sh

push: 
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest
	docker push $(IMAGE):1.10

clean:
	docker rmi $(IMAGE):$(VERSION)
	docker rmi $(IMAGE):latest
	docker rmi $(IMAGE):1.10

all: build tag test push clean
