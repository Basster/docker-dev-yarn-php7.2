#!/usr/bin/env bash

docker build . -t djbasster/dev-yarn-php:latest
docker push djbasster/dev-yarn-php:latest
