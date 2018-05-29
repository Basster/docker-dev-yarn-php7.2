# docker-dev-yarn

A docker image which includes:

- [PHP 7.2](http://php.net/) with following extensions
  - apcu
  - readline
  - mysql
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