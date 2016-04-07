.PHONY: build tag push clean all

IMAGE = jfusterm/php-fpm
VERSION = 7.0.5

default: build

build:
	docker build -t $(IMAGE):$(VERSION) .

tag: 
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker tag $(IMAGE):$(VERSION) $(IMAGE):7.0	

push: 
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest
	docker push $(IMAGE):7.0

clean:
	docker rmi $(IMAGE):$(VERSION)
	docker rmi $(IMAGE):latest
	docker rmi $(IMAGE):7.0

all: build tag push clean
