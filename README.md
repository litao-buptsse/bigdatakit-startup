# BigDataKit-Startup

---

## Building


### 1. jar packaging

```
$ make
```

### 2. docker push

```
$ make docker-push
```

## Running

### 1. running by bigdatakit

```
$ bigdatakit <command> [options]
```

### 2. running by docker

```
$ docker run --rm --net=host -v /root/ugi_config:/root/ugi_config \
    registry.docker.dev.sogou-inc.com:5000/bigdatakitapp/<artifactId>:<version> \
    bigdatakit <command> [options]
```