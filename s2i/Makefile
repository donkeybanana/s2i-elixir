IMAGE_NAME = s2i-elixir
VERSION = 1.10

REGISTRY=172.30.1.1:5000
NAMESPACE=elixir

.PHONY: build
build:
	docker build -t $(NAMESPACE)/$(IMAGE_NAME):$(VERSION) -t $(NAMESPACE)/$(IMAGE_NAME):latest .

.PHONY: publish
publish: build
	docker tag $(NAMESPACE)/$(IMAGE_NAME):$(VERSION) $(REGISTRY)/$(NAMESPACE)/$(IMAGE_NAME):$(VERSION)
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE_NAME):$(VERSION)
