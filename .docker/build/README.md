From `<project root>` path, run:

### Base

```shell
docker build \
  -f .docker/build/Dockerfile \
  -t BASE_IMAGE \
  .
```

### App

```shell
docker build \
  -f .docker/build/app.Dockerfile \
  -t BASE_IMAGE/app \
  .
```

### Webserver

```shell
docker build \
  -f .docker/build/webserver.Dockerfile \
  -t BASE_IMAGE/webserver \
  .
```

### Queue Worker

```shell
docker build \
  -f .docker/build/queue.Dockerfile \
  -t BASE_IMAGE/queue \
  .
```

### Schedule Runner

```shell
docker build \
  -f .docker/build/schedule.Dockerfile \
  -t BASE_IMAGE/schedule \
  .
```
