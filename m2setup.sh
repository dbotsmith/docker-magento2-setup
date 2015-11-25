#!/bin/sh
if [ -f /src/app/etc/config.php ] || [ -f /src/app/etc/env.php ]; then
  echo "app/etc/config.php or app/etc/env.php exist, assuming code already downloaded. Remove both files to re-download archive."
else
  echo "Downloading and untarring archive..."
  curl -L https://storage.googleapis.com/mageinferno-docker-magento2-setup/magento-ce-2.0.0.tar.gz | tar xzf - -o -C /src
  chmod +x /src/bin/magento
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
  --admin-password=$M2SETUP_ADMIN_PASSWORD

echo "Reindexing all indexes..."
/src/bin/magento indexer:reindex

echo "The setup script has completed execution."
