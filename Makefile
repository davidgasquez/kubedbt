IMAGE_TAG := 1.0.0
IMAGE_NAME := davidgasquez/dbt-project-test:$(IMAGE_TAG)
PROFILES_PATH := $(PWD)/.dbt_profiles.yml

.PHONY: all build run dev

all: run

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -v $(PROFILES_PATH):/home/dbt/.dbt/profiles.yml -it --rm $(IMAGE_NAME)

push: build
	docker push $(IMAGE_NAME)

bash:
	docker run -v $(PROFILES_PATH):/home/dbt/.dbt/profiles.yml -it --rm $(IMAGE_NAME) bash

dev:
	docker run -v $(PROFILES_PATH):/home/dbt/.dbt/profiles.yml-it -v $(PWD)/project-test:/dbt --rm $(IMAGE_NAME) bash

deploy:
	kubectl apply -f "dbt-cronjob.yaml"
