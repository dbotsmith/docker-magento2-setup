#!/bin/sh
echo "Initializing setup..."

if [ "$M2SETUP_PULL_GITHUB" = true ]; then
  echo "Pulling latest stable Magento 2 code from GitHub, this may take a few moments..."
  git clone -b master https://github.com/magento/magento2.git /src
fi

if [ "$M2SETUP_PULL_COMPOSER" = true ]; then
  if [ "$M2SETUP_USE_SAMPLE_DATA" = true ]; then
    echo "Installing composer dependencies with sample data..."
    cd /src && composer config repositories.magento composer http://packages.magento.com
    cd /src && composer require magento/sample-data:~1.0.0-beta
  else
    echo "Installing composer dependencies without sample data..."
    cd /src && composer install
  fi
fi

if [ "$M2SETUP_USE_SAMPLE_DATA" = true ]; then
  M2SETUP_USE_SAMPLE_DATA_STRING="--use-sample-data"
else
  M2SETUP_USE_SAMPLE_DATA_STRING=""
fi

if [ "$M2SETUP_INSTALL" = true ]; then
  if [ -f /src/app/etc/config.php ] || [ -f /src/app/etc/env.php ]; then
    echo "Already installed? Either app/etc/config.php or app/etc/env.php exist, please remove both files to continue setup."
    exit
  fi

  if [ "$M2SETUP_PULL_GITHUB" = false ] && [ "$M2SETUP_PULL_COMPOSER" = false ]; then
    # Wait a few for mysql container initialization...
    /bin/sleep 10
  fi

  echo "Running Magento 2 setup script..."
  /src/bin/magento setup:install \
    --db-host=$M2SETUP_DB_HOST \
    --db-name=$M2SETUP_DB_NAME \
    --db-user=$M2SETUP_DB_USER \
    --db-password=$M2SETUP_DB_PASSWORD \
    --base-url=$M2SETUP_BASE_URL \
    --admin-firstname=$M2SETUP_ADMIN_FIRSTNAME \
    --admin-lastname=$M2SETUP_ADMIN_LASTNAME \
    --admin-email=$M2SETUP_ADMIN_EMAIL \
    --admin-user=$M2SETUP_ADMIN_USER \
    --admin-password=$M2SETUP_ADMIN_PASSWORD \
    $M2SETUP_USE_SAMPLE_DATA_STRING

  echo "Deploying static content..."
  rm -rf /src/var/cache /src/var/page_cache /src/var/view_preprocessed
  /src/bin/magento setup:static-content:deploy
fi

if [ "$M2SETUP_PULL_NODE_MODULES" = true ]; then
  echo "Installing node modules..."
  cp /src/package.json /root/
  cd /root && npm install -q
  echo "Node modules installed. Syncing back to /src/node_modules..."
  rsync -rlzuIO --ignore-errors /root/node_modules/ /src/node_modules > /dev/null 2>&1
  rm -rf /root/node_modules /root/package.json

  echo "Running initial grunt refresh..."
  # Run grunt refresh twice; first fails, second completes (GitHub issue #1732)
  cd /src && grunt refresh && grunt refresh
fi

echo "The setup script has completed execution."
