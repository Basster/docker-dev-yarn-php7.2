#!/usr/bin/env bash

docker build . -t djbasster/dev-yarn-php:7.2.1
docker push djbasster/dev-yarn-php:7.2.1
