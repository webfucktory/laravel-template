# Build

[build/README.md](build/README.md)

# Test

From `<project root>` path, run:

```shell
docker run \
  -p 8000:8000 \
  -v $(pwd)/.env:/var/www/html/.env:ro \
  BASE_IMAGE/app \
  php artisan serve --host 0.0.0.0
```

[127.0.0.1:8000](http://127.0.0.1:8000/)

# Deploy

<https://docs.docker.com/engine/swarm/>

<https://github.com/webfucktory/docker-web>

[swarm/README.md](swarm/README.md)
