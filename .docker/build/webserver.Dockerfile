ARG base_image_version=latest
ARG nginx_version=latest

FROM BASE_IMAGE:$base_image_version as base

FROM nginx:$nginx_version

COPY .docker/build/nginx/conf.d /etc/nginx/conf.d

COPY --from=base /var/www/html /var/www/html
