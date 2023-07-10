FROM php:8.1-fpm-alpine

RUN apk update && apk add  --no-cache \
    git \
    mysql-client \
    curl \
    grpc-plugins \
    mc \
    libmcrypt \
    libmcrypt-dev \
    libxml2-dev \
    freetype \
    freetype-dev \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev g++ make autoconf curl-dev openssl-dev

# GRPC with protobuf
#ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions grpc

RUN pecl install protobuf && docker-php-ext-enable protobuf

ENTRYPOINT ["tail", "-f", "/dev/null"]
