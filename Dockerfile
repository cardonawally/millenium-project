# imagen de dockerhub que descargara
FROM php:7.4-fpm

# algunas configuraciones para que funcione el contenedor
# actualizacion de repositorios e intalacion de extensiones necesarias
RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get update -y && apt-get install -y sendmail libpng-dev
RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        zip zlib1g-dev libicu-dev g++
RUN docker-php-ext-install gd zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli

RUN apt-get update && apt-get install -y \
    imagemagick libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# instala composer en el contenedor
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer

# da permisos para editar los archivos en esta ruta del container
RUN chmod -R 755 /var/www/html

