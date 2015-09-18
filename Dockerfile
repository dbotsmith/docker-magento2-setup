FROM mageinferno/magento2-php:5.6-fpm
MAINTAINER Mark Shust <mark.shust@mageinferno.com>

ADD ./m2setup.sh /usr/local/bin/

CMD ["/usr/local/bin/m2setup.sh"]
