FROM php:8.0-fpm

ARG USER_NAME USER_UID USER_GID TZ

# Устанавливаем временной пояс
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
		iputils-ping \
        curl \
        wget \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        mc \
        libwebp-dev \
        libzip-dev && \
    pecl install mcrypt-1.0.5 && \
    docker-php-ext-install iconv && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install zip && \
    docker-php-ext-configure gd --enable-gd --prefix=/usr --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-enable mcrypt

# Устанавливаем композер
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Меняем uid и gid пользователя www-data(под ним запускается php-fpm)
RUN usermod  --uid $USER_UID www-data
RUN groupmod --gid $USER_GID www-data
