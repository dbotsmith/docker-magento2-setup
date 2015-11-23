FROM mageinferno/magento2-php:5.6-fpm
MAINTAINER Mark Shust <mark.shust@mageinferno.com>

RUN apt-get install -y unzip

COPY magento-ce-2.0.0.zip /usr/local/share/
COPY m2setup.sh /usr/local/bin/

CMD ["/usr/local/bin/m2setup.sh"]
