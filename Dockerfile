FROM ubuntu:16.04

MAINTAINER Johan Meiring <johan@uafrica.com>

# Install PHP from PPA
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
  && add-apt-repository ppa:ondrej/php
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    php7.1-cli \
    php7.1-mysql \
    php7.1-intl \
    php7.1-mbstring \
    php7.1-bcmath \
    php7.1-curl \
    php7.1-simplexml \
    php7.1-zip \
    php7.1-json \
    php7.1-soap \
    php7.1-xmlreader \
    php7.1-xmlwriter \
    php-memcached \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install wktmltopdf and its dependencies
COPY wkhtmltox-0.12.2.1_linux-trusty-amd64.deb /wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y fontconfig libfontconfig1 libjpeg-turbo8 libx11-6 libxext6 libxrender1 xfonts-base xfonts-75dpi \
  && dpkg -i /wkhtmltox-0.12.2.1_linux-trusty-amd64.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
