FROM php:8.3-fpm

ARG USER_UID USER_GID TZ

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
        zlib1g-dev \
        libwebp-dev \
        libzip-dev \
        libicu-dev \
        sendmail && \
    pecl install mcrypt-1.0.7 && \
    docker-php-ext-install iconv && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install zip && \
    docker-php-ext-configure gd --enable-gd --prefix=/usr --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-configure opcache --enable-opcache && \
    docker-php-ext-install opcache && \
    docker-php-ext-enable mcrypt && \
	docker-php-ext-configure pcntl --enable-pcntl && \
	docker-php-ext-install pcntl && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl && \
    docker-php-ext-install exif

# Настраиваем sendmail
RUN echo "sendmail_path=/usr/sbin/sendmail -t -i -f postmaster@mydomen.ru" >> /usr/local/etc/php/conf.d/sendmail.ini 
RUN sed -i '/#!\/bin\/sh/aservice sendmail restart' /usr/local/bin/docker-php-entrypoint
RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint


# Устанавливаем композер
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Меняем uid и gid пользователя www-data(под ним запускается php-fpm)
RUN usermod  --uid $USER_UID www-data
RUN groupmod --gid $USER_GID www-data
