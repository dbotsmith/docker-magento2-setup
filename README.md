# Versions

- [`2.0.0`, `2.0`, `latest` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/blob/master/Dockerfile)
- [`1.1.0`, `1.1`, (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/blob/1.1.0/Dockerfile)
- [`1.0.1`, `1.0` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/blob/1.0.1/Dockerfile)

# Description

This image is built from [`mageinferno/magento2-php`](https://hub.docker.com/r/mageinferno/magento2-php/) repository and installs Magento 2.

# What's in this image?

This image contains a custom installer script which downloads Magento 2 source code from GitHub, installs composer dependencies, and runs the CLI installer.

# How to use this image?

We recommend configuring your setup using our [`docker-compose`](https://github.com/mageinferno/magento2-docker-compose) config. This allows easy configuration and installation setup with our other Docker images.

Once your docker-compose.yml file is all setup, you can execute setup by running:

`docker-compose run --rm setup`

This will execute a one-off container that runs the setup script included in this Docker image. Note that setup will take around 30 minutes to complete. A vast majority of this time is from downloading Composer dependencies, and installing sample data (configurable products, specifically). Setting `M2SETUP_USE_SAMPLE_DATA` to false will expedite the install process by skipping the installation of sample data.

# Additional Info

For additional info, please see the extended docker-compose README at [https://github.com/mageinferno/magento2-docker-compose](https://github.com/mageinferno/magento2-docker-compose).
