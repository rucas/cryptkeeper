USERNAME = rucas
IMAGE = cryptkeeper
SRCS = $(wildcard */Dockerfile)
SEMVERS = $(patsubst %/Dockerfile,%/VERSION,$(SRCS))

# External Executable Dependencies
EXECUTABLES = git yarn node docker
CHECK := $(foreach exec,$(EXECUTABLES),\
	$(if $(shell which $(exec)),,\
	$(error "No $(exec) in PATH")))

all: $(SEMVERS)

%/VERSION: %/Dockerfile 
	git pull
	$(eval $*_version := $(shell ./node_modules/.bin/semver -i patch `head -n 1 $@`))
	echo $($*_version) > $@
	docker build -t $(USERNAME)/$(IMAGE):$*-latest $*/
	# TODO: make this another step	
	# docker tag $(USERNAME)/$(IMAGE):$*-latest $(USERNAME)/$(IMAGE):$*-$($*_version)
	# docker push $(USERNAME)/$(IMAGE):$*-latest
	# docker push $(USERNAME)/$(IMAGE):$*-$($*_version) 

vars:
	@echo SRCS: $(SRCS) 
	@echo SEMVERS: $(SEMVERS)

.PHONY: vars 
