FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
	curl \
	wget \
	git \
	libxml2-dev \
	libzip-dev \
	zlib1g-dev \
	libpng-dev \
	&& docker-php-ext-configure gd --enable-gd \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install zip \
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR /var/www
CMD ["php-fpm"]
