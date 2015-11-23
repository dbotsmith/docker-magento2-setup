# Versions

- [`2.0`, `latest` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/blob/master/Dockerfile)
- [`2.0.0` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/blob/2.0.0/Dockerfile)
- [`2.0.0-sd` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/blob/2.0.0-sd/Dockerfile)

# Description

This image is built from [`mageinferno/magento2-php`](https://hub.docker.com/r/mageinferno/magento2-php/) repository and installs Magento 2.

# What's in this image?

- The `2.0` image installs Magento 2 and all dependencies with Composer, then runs the CLI installer.
- The `2.0.0` image installs Magento 2 from an archive (without sample data), then runs the CLI installer.
- The `2.0.0-sd` image installs Magento 2 from an archive (with sample data), then runs the CLI installer.

# How to use this image?

We recommend configuring your setup using our [`docker-compose`](https://github.com/mageinferno/magento2-docker-compose) config. This allows easy configuration and installation setup with our other Docker images.

Once your docker-compose.yml file is all setup, you can execute setup by running:

`docker-compose run --rm setup`

This will execute a one-off container that runs the setup script included in this Docker image. Note that composer setup will take around 30 minutes to complete (with sample data). A vast majority of this time is from downloading Composer dependencies, and installing sample data (configurable products, specifically). Setting `M2SETUP_USE_SAMPLE_DATA` to false will expedite the install process by skipping the installation of sample data.

Using the `2.0.x` or `2.0.x-sd` containers will have a much faster install time at around 3 minutes and 10 minutes, respectively.

# Additional Info

For additional info, please see the extended docker-compose README at [https://github.com/mageinferno/magento2-docker-compose](https://github.com/mageinferno/magento2-docker-compose).
