#!/usr/bin/env bash
set -e
LARAVEL_DIRECTORY=" /var/www/default/html"
if [ -d $LARAVEL_DIRECTORY ]; then
    # the directory exists
    if [ "$(ls -A $LARAVEL_DIRECTORY)" ]; then
      echo "Directory not empty!"
      if [ $CI = true ];
        echo "Running in CI environment, skipping installation of Composer dependencies!"
        exec "$@"
      fi
      echo "Attempting to install Composer dependencies!"
      composer self-update
      composer install --no-interaction --prefer-dist --no-dev
    else
      composer create-project --prefer-dist laravel/laravel ./
    fi
fi
exec "$@"
