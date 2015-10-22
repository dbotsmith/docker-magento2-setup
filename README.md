# Versions

- [`1.0.0`, `1.0`, `latest` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/blob/master/Dockerfile)

# Description

This image is built from [`mageinferno/magento2-php`](https://hub.docker.com/r/mageinferno/magento2-php/) repository and installs Magento 2.

# What's in this image?

This image contains a custom installer script which downloads Magento 2 source code from GitHub, installs composer dependencies, and runs the CLI installer.

# How to use this image?

We recommend configuring your setup using our [`docker-compose`](https://github.com/mageinferno/magento2-docker-compose) config. This allows easy configuration and installation setup with our other Docker images.

Once your docker-compose.yml file is all setup, you can execute setup by running:

`docker-compose run --rm setup`

This will execute a one-off container that runs the setup script included in this Docker image.

# Running Setup

Before running Magento 2, you must download the source code, install composer dependencies, and execute the Magento installer script. Luckily, Mage Inferno makes this easy for you.

The following environment variables can be set for setup:
```
      - M2SETUP_DB_HOST=db
      - M2SETUP_DB_NAME=magento2
      - M2SETUP_DB_USER=magento2
      - M2SETUP_DB_PASSWORD=magento2
      - M2SETUP_BASE_URL=http://mysite.docker/
      - M2SETUP_ADMIN_FIRSTNAME=Admin
      - M2SETUP_ADMIN_LASTNAME=User
      - M2SETUP_ADMIN_EMAIL=dummy@gmail.com
      - M2SETUP_ADMIN_USER=magento2
      - M2SETUP_ADMIN_PASSWORD=magento2
      - M2SETUP_USE_SAMPLE_DATA=true
      - M2SETUP_PULL_GITHUB=true
      - M2SETUP_PULL_COMPOSER=true
      - M2SETUP_PULL_NODE_MODULES=true
      - M2SETUP_INSTALL=true
```

Our setup script uses these variables to determine how to setup your store. Everything is pretty self-explanatory, except the following:

- `M2SETUP_PULL_GITHUB`: Setting this to `true` will download the latest stable Magento 2 code from the `master` branch, and check it out to your projects `src` directory. If you already have the code checked out from your host machine, set this to `false`.
- `M2SETUP_PULL_COMPOSER`: Setting this to `true` will page through `composer.json` and install all composer dependencies to `src/vendor`. If you already have these installed, set this to `false`.
- `M2SETUP_PULL_NODE_MODULES`: Setting this to `true` will page through `package.json` and install all node module dependencies to `src/node_modules`. If you already have these installed, set this to `false`.
- `M2SETUP_INSTALL`: Setting this to `true` will install Magento 2 by the command line tool. If you already have Magento 2 installed, set this to `false`.

To run setup, execute the following command from your project directory (`~/Sites/mysite`), which creates a one-off throw away container that sets up Magento 2 for you.

`docker-compose run --rm setup`

Note that setup will take between 30 and 40 minutes to complete. A vast majority of this time is from downloading Composer dependencies, and installing sample data (configurable products, specifically). Setting `M2SETUP_USE_SAMPLE_DATA` to false will expedite the install process by skipping the installation of sample data.

# Additional Info

For additional info, please see the extended Readme at [https://github.com/mageinferno/magento2-docker-compose](https://github.com/mageinferno/magento2-docker-compose).
