# BigDataKit-Startup

---

## Building


### 1. jar packaging

```
$ make
```

### 2. docker build

```
$ make docker-build
```

### 3. docker push

```
$ make docker-push
```

### 4. clean

```
$ make clean
```

## Running

### 1. running by bigdatakit

```
$ bigdatakit <command> [options]
```

### 2. running by docker

```
$ docker run --rm --net=host -v /root/ugi_config:/root/ugi_config \
    registry.docker.dev.sogou-inc.com:5000/bigdatakit-app/<artifactId>:<version> \
    bigdatakit <command> [options]
```