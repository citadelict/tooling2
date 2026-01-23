FROM php:7-apache
MAINTAINER Tool Tooling

RUN docker-php-ext-install mysqli
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN chmod +x /usr/local/bin/start-apache
RUN a2enmod rewrite

# Copy application source
COPY html /var/www/html
RUN chown -R www-data:www-data /var/www

CMD ["start-apache"]
