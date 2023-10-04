FROM serversideup/php:8.2-fpm-nginx

ENV SSL_MODE=off

WORKDIR /var/www

COPY . /var/www

RUN composer install --no-interaction --optimize-autoloader --no-dev \
  && php artisan config:cache \
  && php artisan route:cache \
  && chown -R www-data:www-data /var/www
