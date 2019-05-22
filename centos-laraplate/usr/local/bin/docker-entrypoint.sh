#!/usr/bin/env bash
set -e
LARAVEL_DIRECTORY=" /var/www/default/html"
if [ -d $LARAVEL_DIRECTORY ]; then
    # the directory exists
    if [ "$(ls -A $LARAVEL_DIRECTORY | grep -v .gitkeep)" ]; then
      echo "Directory not empty!"
      if [ "$CI" == "true" ]; then
        echo "Running in a CI environment; skipping installation of Composer and NPM dependencies!"
        exec "$@"
      fi
      echo "Attempting to install Composer and NPM dependencies!"
      composer self-update
      if [ "$PRODUCTION" == "true" ]; then
        echo "Deploying to production environment!"
        composer install --no-interaction --prefer-dist --no-dev
        npm install --production
        npm run production
        exec "$@"
      fi
      composer install --no-interaction --prefer-dist
      npm install
      npm run dev
    else
      echo "Removing .gitkeep and attempting to create Laravel project!"
      rm ./.gitkeep
      composer create-project --prefer-dist laravel/laravel ./
    fi
fi
exec "$@"
