```shell
export BASE_IMAGE=ghcr.io/{owner}/{repository}
```

### Base

```shell
docker build \
  -f Dockerfile \
  -t $BASE_IMAGE \
  ../..
```

### App

```shell
docker build \
  -f app.Dockerfile \
  -t $BASE_IMAGE/app \
  ../..
```

### Webserver

```shell
docker build \
  -f webserver.Dockerfile \
  -t $BASE_IMAGE/webserver \
  ../..
```

### Queue Worker

```shell
docker build \
  -f queue.Dockerfile \
  -t $BASE_IMAGE/queue \
  ../..
```

### Schedule Runner

```shell
docker build \
  -f schedule.Dockerfile \
  -t $BASE_IMAGE/schedule \
  ../..
```
