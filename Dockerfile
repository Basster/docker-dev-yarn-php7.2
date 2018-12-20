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
        php7.3-apcu \
        php7.3-bcmath \
        php7.3-common \
        php7.3-readline \
        php7.3-fpm \
        php7.3-cli \
        php7.3-mysql \
        php7.3-sqlite \
        php7.3-curl \
        php7.3-intl \
        php7.3-mbstring \
        php7.3-opcache \
        php7.3-json \
        php7.3-pdo \
        php7.3-memcached \
        php7.3-zip \
        php7.3-xsl \
        php7.3-imagick \
        php7.3-xdebug \
        yarn \
        nodejs \
  && apt-get autoremove -y \
  && apt-get clean

# composer
RUN cd /tmp \
  && curl -sS https://getcomposer.org/installer -o composer-setup.php \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
