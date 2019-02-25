launch:
	docker-compose -f docker-compose-dev.yml up -d

down:
	docker-compose -f docker-compose-dev.yml down

build:
	docker build -t athena-dev -f development/Dockerfile .
