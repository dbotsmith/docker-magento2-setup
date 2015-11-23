# Description

This image is built from [`mageinferno/magento2-php`](https://hub.docker.com/r/mageinferno/magento2-php/) repository and installs Magento 2.

# What's in this image?

This image contains an archive of the specified version of Magento 2 (with sample data) and runs the CLI installer.

# How to use this image?

We recommend configuring your setup using our [`docker-compose`](https://github.com/mageinferno/magento2-docker-compose) config. This allows easy configuration and installation setup with our other Docker images.

Once your docker-compose.yml file is all setup, you can execute setup by running:

`docker-compose run --rm setup`

This will execute a one-off container that runs the setup script included in this Docker image. Note that setup will take around 20 minutes to complete. A vast majority of this time is from installing sample data (configurable products, specifically).

# Additional Info

For additional info, please see the extended docker-compose README at [https://github.com/mageinferno/magento2-docker-compose](https://github.com/mageinferno/magento2-docker-compose).
