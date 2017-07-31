FROM ubuntu:16.04

# Install PHP from PPA
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
  && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated \
    php7.0-cli \
    php7.0-mysql \
    php7.0-intl \
    php7.0-mbstring \
    php7.0-bcmath \
    php7.0-curl \
    php7.0-simplexml \
    php7.0-zip \
    php7.0-json \
    php7.0-soap \
    php7.0-xmlreader \
    php7.0-xmlwriter \
    php-redis \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install wktmltopdf and its dependencies
COPY wkhtmltox-0.12.2.1_linux-trusty-amd64.deb /wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y fontconfig libfontconfig1 libjpeg-turbo8 libx11-6 libxext6 libxrender1 xfonts-base xfonts-75dpi \
  && dpkg -i /wkhtmltox-0.12.2.1_linux-trusty-amd64.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
