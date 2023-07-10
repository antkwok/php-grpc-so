file := version.txt
include .env.developer

gen_changelog:
	@echo "generate changelog"
	git-chglog --sort semver > CHANGELOG.md

md2pdf:
	@echo "md 2 pdf"
	md-to-pdf CHANGELOG.md

build_prod:
	$(eval version=`cat ${file}`)
	@echo "Build production docker image for $(version)"
	docker build -f Dockerfile -t antkwok/php-grpc-so:latest -t antkwok/php-grpc-so:$(version) .

build_prod_m1:
	$(eval version=`cat ${file}`)
	@echo "Build production docker image for $(version)"
	docker buildx build --platform=linux/amd64 -f Dockerfile  -t antkwok/php-grpc-so:latest -t antkwok/php-grpc-so:$(version) .

push_prod:
	$(eval version=`cat ${file}`)
	@echo "Push image for $(version)"
	docker login --username=$(DOCKER_LOGIN_USERNAME) && \
	docker push antkwok/php-grpc-so:$(version)

push_prod_latest:
	@echo "Push image for latest"
	docker login --username=$(DOCKER_LOGIN_USERNAME) && \
	docker push antkwok/php-grpc-so:latest
