```shell
cp example.env .env
```

```shell
docker secret create laravel_env .env
```

```shell
export $(grep -v '^#' .env | xargs) && \
docker \
  stack deploy \
      -c app.yml \
      -c maria.yml \
      -c pma.remote.yml \
      -c queue.yml \
      -c schedule.yml \
      -c webserver.remote.yml \
    laravel
```

# (optional) DB

## Maria

```shell
export $(grep -v '^#' .env | xargs) && \
docker stack deploy -c maria.yml laravel
```

## (optional) PMA

```shell
export $(grep -v '^#' .env | xargs) && \
docker stack deploy -c pma.remote.yml laravel
```

# App

```shell
export $(grep -v '^#' .env | xargs) && \
docker stack deploy -c app.yml laravel
```

# (optional) Queue worker

```shell
export $(grep -v '^#' .env | xargs) && \
docker stack deploy -c queue.yml laravel
```

# (optional) Schedule runner

```shell
export $(grep -v '^#' .env | xargs) && \
docker stack deploy -c schedule.yml laravel
```

# Webserver

```shell
export $(grep -v '^#' .env | xargs) && \
docker stack deploy -c webserver.remote.yml laravel
```

```shell
docker secret rm laravel_env && \
docker secret create laravel_env .env
```

```shell
docker stack rm laravel
```
