#!/usr/bin/env bash

docker build . -t djbasster/dev-yarn-php:7.3-patternlab
docker push djbasster/dev-yarn-php:7.3-patternlab
