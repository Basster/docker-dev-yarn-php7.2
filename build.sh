#!/usr/bin/env bash

docker build . -t djbasster/dev-yarn-php:7.2.4
docker push djbasster/dev-yarn-php:7.2.4
