FROM php:7.0-apache

# enable mod_rewrite
RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y libpng12-dev libjpeg-dev libxml2-dev libxslt-dev libgraphicsmagick1-dev graphicsmagick \
  && apt-get -y install libmagickwand-dev --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install gd json mysqli pdo pdo_mysql opcache gettext exif calendar soap xsl sockets wddx

# install APCu from PECL
RUN pecl install apcu && docker-php-ext-enable apcu

# install GMagick from PECL
RUN pecl install gmagick-beta && docker-php-ext-enable gmagick

# install Imagick from PECL
RUN pecl install imagick && docker-php-ext-enable imagick

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.interned_strings_buffer=8'; \
    echo 'opcache.max_accelerated_files=4000'; \
    echo 'opcache.revalidate_freq=60'; \
    echo 'opcache.fast_shutdown=1'; \
    echo 'opcache.enable_cli=1'; \
  } > /usr/local/etc/php/conf.d/opcache-recommended.ini

VOLUME /var/www/html