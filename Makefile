BASE_IMAGE = elixir/s2i-elixir:latest
IMAGE_NAME = live
VERSION = 0.1

REGISTRY=172.30.1.1:5000
NAMESPACE=elixir

.PHONY: build
build:
	@make -C s2i
	s2i build . $(BASE_IMAGE) $(NAMESPACE)/$(IMAGE_NAME):$(VERSION)

.PHONY: publish
publish: build
	docker tag $(NAMESPACE)/$(IMAGE_NAME):$(VERSION) $(REGISTRY)/$(NAMESPACE)/$(IMAGE_NAME):$(VERSION)
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE_NAME):$(VERSION)
