#!/bin/sh

echo "Installing php dependencies using composer"
composer install --ignore-platform-reqs --no-interaction --no-plugins --no-scripts --prefer-dist
