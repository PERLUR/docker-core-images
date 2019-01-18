#!/usr/bin/env bash
set -e
LARAVEL_DIRECTORY=" /var/www/default/html"
if [ -d $LARAVEL_DIRECTORY ]; then
    # the directory exists
    if [ "$(ls -A $LARAVEL_DIRECTORY)" ]; then
      echo "Directory not empty!"
      echo "Attempting to install Composer dependencies!"
      composer install --prefer-dist
    else
      composer create-project --prefer-dist laravel/laravel ./
    fi
fi
exec "$@"
