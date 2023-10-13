FROM serversideup/php:8.2-fpm-nginx

WORKDIR /var/www/html

# Copy the Laravel project into the container
COPY . /var/www/html

# Install dependencies
RUN composer install --no-interaction --optimize-autoloader --no-dev

# Correct permissions
RUN chown -R webuser:webgroup /var/www/html


CMD ["su", "webuser", "-c", "php artisan horizon"]
