TAG ?= latest
IMAGE := lucacri/docker-laravel-alpine

VMAJOR=`semver get major ${TAG}`
VMINOR=`semver get minor ${TAG}`
VPATCH=`semver get patch ${TAG}`
THIS_FILE := $(lastword $(MAKEFILE_LIST))

build:
	@echo "------------------"
	@echo "BUILDING: "
	@echo "${IMAGE}:${TAG}"
	@echo "------------------"
	@echo ""
	@echo ""
	@docker build --pull -t ${IMAGE}:${TAG} .
	@docker tag ${IMAGE}:${TAG} ${IMAGE}:latest

push:
	@echo "------------------"
	@echo "PUSHING: "
	@echo "${IMAGE}:latest"
	@echo "${IMAGE}:${TAG}"
	@echo "${IMAGE}:${VMAJOR}"
	@echo "${IMAGE}:${VMAJOR}.${VMINOR}"
	@echo "${IMAGE}:${VMAJOR}.${VMINOR}.${VPATCH}"
	@echo "------------------"
	@echo ""
	@echo ""
	@docker push ${IMAGE}:${TAG}
	@docker push ${IMAGE}:${VMAJOR}
	@docker push ${IMAGE}:${VMAJOR}.${VMINOR}
	@docker push ${IMAGE}:${VMAJOR}.${VMINOR}.${VPATCH}
	@docker push ${IMAGE}:latest

tag:
	@echo "------------------"
	@echo "TAGGING: "
	@echo "${IMAGE}:latest"
	@echo "${IMAGE}:${TAG}"
	@echo "${IMAGE}:${VMAJOR}"
	@echo "${IMAGE}:${VMAJOR}.${VMINOR}"
	@echo "${IMAGE}:${VMAJOR}.${VMINOR}.${VPATCH}"
	@echo "------------------"
	@echo ""
	@echo ""
	@docker tag ${IMAGE}:${TAG} ${IMAGE}:latest
	@docker tag ${IMAGE}:${TAG} ${IMAGE}:${VMAJOR}
	@docker tag ${IMAGE}:${TAG} ${IMAGE}:${VMAJOR}.${VMINOR}
	@docker tag ${IMAGE}:${TAG} ${IMAGE}:${VMAJOR}.${VMINOR}.${VPATCH}

all:
	@$(MAKE) -f $(THIS_FILE) build
	@$(MAKE) -f $(THIS_FILE) tag
	@$(MAKE) -f $(THIS_FILE) push