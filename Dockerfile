FROM php:7.4-cli

LABEL maintainer="oroessner@gmail.com"

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/
# composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# wait-for-it
COPY --from=djbasster/wait-for-it /usr/bin/wait-for-it /usr/bin/wait-for-it

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    git \
    chromium \
    default-mysql-client \
    && install-php-extensions gd pdo_mysql intl zip exif opcache xsl bcmath gmagick apcu xdebug redis \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y \
        yarn \
        nodejs \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY custom.ini /usr/local/etc/php/conf.d/zz_custom.ini
