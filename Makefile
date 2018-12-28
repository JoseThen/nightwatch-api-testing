.PHONY: up down stop shell restart test 


	# Black        0;30     Dark Gray     1;30
	# Red          0;31     Light Red     1;31
	# Green        0;32     Light Green   1;32
	# Brown/Orange 0;33     Yellow        1;33
	# Blue         0;34     Light Blue    1;34
	# Purple       0;35     Light Purple  1;35
	# Cyan         0;36     Light Cyan    1;36
	# Light Gray   0;37     White         1;37


default: up

NOCOLOR ?= \033[0m
COLOR ?= \033[1;35m
CONTAINER_NAME ?= nitewatch-container
IMAGE_NAME ?= jose-nightwatch
IMAGE_ID=`docker images -q ${IMAGE_NAME}`

up:
	@echo "Creating $(COLOR) $(CONTAINER_NAME) $(NOCOLOR) Docker container"
	@docker-compose up -d

down:
	@echo "Shutting Down $(COLOR) $(CONTAINER_NAME) $(NOCOLOR) container"
	@docker-compose down

stop:
	@echo "Stopping  the $(COLOR) $(CONTAINER_NAME) $(NOCOLOR) container"
	@docker-compose stop

shell:
	@echo "Connecting to $(COLOR) $(CONTAINER_NAME) $(NOCOLOR)"
	@docker exec -it $(CONTAINER_NAME) sh

restart:
	@echo "Shutting down $(COLOR) $(CONTAINER_NAME) $(NOCOLOR)"
	$(MAKE) down
	@echo "$(COLOR) the following ID will be deleted:$(NOCOLOR) $(IMAGE_ID)"
	@docker rmi $(IMAGE_ID)
	$(MAKE) up

test:
	@echo "$(COLOR)Running Frontend Tests$(NOCOLOR)"
	@docker exec -it $(CONTAINER_NAME) npm run test