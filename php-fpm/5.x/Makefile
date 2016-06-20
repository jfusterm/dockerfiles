.PHONY: build tag push clean all

IMAGE = jfusterm/php-fpm
VERSION = 5.6.22

default: build

build:
	docker build -t $(IMAGE):$(VERSION) .

tag: 
	docker tag $(IMAGE):$(VERSION) $(IMAGE):5.6
	docker tag $(IMAGE):$(VERSION) $(IMAGE):5

push: 
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):5.6
	docker push $(IMAGE):5

clean:
	docker rmi $(IMAGE):$(VERSION)
	docker rmi $(IMAGE):5.6
	docker rmi $(IMAGE):5

all: build tag push clean
