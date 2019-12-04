#!/usr/bin/env bash

docker build --no-cache --pull . -t djbasster/dev-yarn-php:7.4
docker push djbasster/dev-yarn-php:7.4
