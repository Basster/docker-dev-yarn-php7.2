FROM debian:stretch-slim

LABEL maintainer="oroessner@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget curl \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    git \
    bzip2

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
  && apt-get install -y \
        php7.2-apcu \
        php7.2-bcmath \
        php7.2-common \
        php7.2-readline \
        php7.2-fpm \
        php7.2-cli \
        php7.2-mysql \
        php7.2-sqlite \
        php7.2-curl \
        php7.2-intl \
        php7.2-mbstring \
        php7.2-opcache \
        php7.2-json \
        php7.2-pdo \
        php7.2-memcached \
        php7.2-zip \
        php7.2-xsl \
        php7.2-gmagick \
        php7.2-xdebug \
        yarn \
        nodejs \
  && apt-get autoremove -y \
  && apt-get clean

# composer
RUN cd /tmp \
  && curl -sS https://getcomposer.org/installer -o composer-setup.php \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
