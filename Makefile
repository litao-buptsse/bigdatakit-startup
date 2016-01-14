PROJECT_NAME=$(shell cat pom.xml  | grep '<artifactId>' | head -n 1 | awk -F'<artifactId>' '{print $$2}' | awk -F'</artifactId>' '{print $$1}')
PROJECT_VERSION=$(shell cat pom.xml  | grep '<version>' | head -n 1 | awk -F'<version>' '{print $$2}' | awk -F'</version>' '{print $$1}')

IMAGE_MAIN_NAME='bigdatakitapp/$(PROJECT_NAME)'
IMAGE_VERSION=$(PROJECT_VERSION)
IMAGE=$(IMAGE_MAIN_NAME):$(IMAGE_VERSION)

REGISTRY='registry.docker.dev.sogou-inc.com:5000'

ifdef NO_CACHE
	BUILD_PARAM='--no-cache=true'
else
	BUILD_PARAM=
endif

all: build

clean:
	mvn clean

build:
	mvn package

docker-build: build
	mkdir -p .tmp
	cp target/*.jar .tmp
	docker build $(BUILD_PARAM) -t $(IMAGE_MAIN_NAME) .
	rm -fr .tmp

docker-push: docker-build
	docker tag -f $(IMAGE_MAIN_NAME) $(REGISTRY)/$(IMAGE) && docker push $(REGISTRY)/$(IMAGE)
