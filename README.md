# Versions

- [`2.0.0-sd` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/blob/2.0.0-sd/Dockerfile)

# Descriptioni

This image is built from [`mageinferno/magento2-php`](https://hub.docker.com/r/mageinferno/magento2-php/) repository and installs Magento 2.

# What's in this image?

This image contains an archive of the specified version of Magento 2 (with sample data) and runs the CLI installer. For a version without sample data, see `mageinferno/magento2-setup:2.0.0`.

# How to use this image?

We recommend configuring your setup using our [`docker-compose`](https://github.com/mageinferno/magento2-docker-compose) config. This allows easy configuration and installation setup with our other Docker images.

Once your docker-compose.yml file is all setup, you can execute setup by running:

`docker-compose run --rm setup`

This will execute a one-off container that runs the setup script included in this Docker image. Note that setup will take around 10 minutes to complete.

# Additional Info

For additional info, please see the extended docker-compose README at [https://github.com/mageinferno/magento2-docker-compose](https://github.com/mageinferno/magento2-docker-compose).
