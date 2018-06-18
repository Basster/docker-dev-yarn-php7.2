# docker-dev-yarn

[![Docker Build Status](https://img.shields.io/docker/build/djbasster/dev-yarn-php.svg)](https://hub.docker.com/r/djbasster/dev-yarn-php/)

A docker image which includes:

- [PHP 7.2](http://php.net/) with following extensions
  - apcu
  - readline
  - mysql
  - sqlite
  - curl
  - intl
  - mbstring
  - opcache
  - json
  - pdo
  - memcached
  - zip
  - xsl
  - gmagick
  - xdebug
- [nodejs 8.x](https://nodejs.org)
- [yarn](https://yarnpkg.com)
- [composer](https://getcomposer.org/)

It also contains `curl`, `wget`, `gnupg2` and `git` for reasons.

You can find the image on the official [docker registry](https://hub.docker.com/r/djbasster/dev-yarn-php/)

```bash
docker pull djbasster/dev-yarn-php
```