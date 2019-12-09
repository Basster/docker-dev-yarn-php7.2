FROM php:7.4-cli

LABEL maintainer="oroessner@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    git \
    libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libgraphicsmagick1-dev \
    libxslt-dev \
    chromium \
    default-mysql-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql intl zip exif opcache xsl bcmath \
    && pecl install gmagick-2.0.5RC1 \
    && pecl install apcu \
    && pecl install xdebug-2.9.0 \
    && docker-php-ext-enable gmagick apcu xdebug \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y \
        yarn \
        nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY custom.ini /usr/local/etc/php/conf.d/zz_custom.ini

# composer
COPY --from=composer:1.9 /usr/bin/composer /usr/bin/composer
# wait-for-it
COPY --from=djbasster/wait-for-it /usr/bin/wait-for-it /usr/bin/wait-for-it
