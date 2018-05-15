IMAGE_TAG := 1.0.0
IMAGE_NAME := davidgasquez/dbt-project-test:$(IMAGE_TAG)

.PHONY: all build run dev

all: run

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run --env-file .env -it --rm $(IMAGE_NAME)

push: build
	docker push $(IMAGE_NAME)

dev:
	docker run -it -v $(PWD)/project-test:/dbt --env-file .env --rm $(IMAGE_NAME) bash

deploy:
	kubectl apply -f "dbt-cronjob.yaml"
