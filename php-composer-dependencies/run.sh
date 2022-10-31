#!/bin/sh

echo "Changing directoty to $(INPUT_APPDIR)"
cd $(INPUT_APPDIR)

echo "Installing php dependencies using composer"
composer install --ignore-platform-reqs --no-interaction --no-plugins --no-scripts --prefer-dist
