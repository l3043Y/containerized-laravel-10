FROM serversideup/php:8.2-fpm-nginx

ENV SSL_MODE=off

WORKDIR /var/www/html

COPY . /var/www/html
COPY docker/deployment/nginx/ /etc/nginx/
COPY docker/deployment/php/ /etc/php/current_version/
COPY --chmod=755 docker/deployment/etc/s6-overlay/ /etc/s6-overlay/

RUN composer install --no-interaction --optimize-autoloader --no-dev \
  && php artisan config:cache \
  && php artisan route:cache \
  && chown -R webuser:webgroup  /var/www
