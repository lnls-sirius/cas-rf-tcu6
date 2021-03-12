DOCKER_REGISTRY ?= docker.io
DOCKER_USER_GROUP ?= lnlscon
DOCKER_IMAGE_PREFIX = $(DOCKER_REGISTRY)/$(DOCKER_USER_GROUP)

EPICS_BASE_IMAGE ?= $(DOCKER_IMAGE_PREFIX)/epics-debian9-r3.15.8:2021-02-26
TCU6_IMAGE ?= $(DOCKER_IMAGE_PREFIX)/rf-tcu6

DATE = $(shell date -I)
COMMIT = $(shell git rev-parse --short HEAD)

TCU6_TAG ?= $(DATE)-$(COMMIT)

build: update-env
	docker build \
		--build-arg EPICS_BASE_IMAGE=$(EPICS_BASE_IMAGE)\
		--label br.com.lnls-sirius.device=TCU6\
		--label br.com.lnls-sirius.commit=$(COMMIT)\
		--label br.com.lnls-sirius.date=$(DATE)\
		--label br.com.lnls-sirius.repository=https://github.com/lnls-sirius/cas-rf-tcu6\
		--label maintainer="Claudio Carneiro <claudio.carneiro@lnls.br>"\
		--tag $(TCU6_IMAGE):$(TCU6_TAG)\
		.

push:
	docker push $(TCU6_IMAGE):$(TCU6_TAG)

update-env:
	@ > .env
	@ echo TCU6_TAG=$(TCU6_IMAGE)>>.env
	@ echo TCU6_TAG=$(TCU6_TAG)>>.env

