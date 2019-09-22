FROM lucacri/alpine-base:3.10

LABEL maintainer="lucacri@gmail.com"

ARG CACHEBUST=20190411

ARG UID=501
ARG GID=501

ARG INSTALL_PHANTOMJS=1

RUN apk upgrade --update-cache && \
    apk add curl ca-certificates && \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "@edge http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk update && \
    apk add \
        php7 \
        php7-phar \
        php7-json \
        php7-openssl \
        php7-dom \
        php7-mysqlnd \
        php7-mysqli \
        php7-posix \
        php7-pcntl \
        php7-pdo \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-pdo_mysql \
        php7-common \
        php7-fpm \
        php7-bcmath \
        php7-zip \
        php7-bz2 \
        php7-curl \
        php7-gd \
        php7-intl \
        php7-sqlite3 \
        php7-ctype \
        php7-tidy \
        php7-pgsql \
        php7-xml \
        php7-mbstring \
        php7-session \
        php7-zlib \
        php7-opcache \
        php7-soap \
        php7-xdebug \
        php7-imagick \
        php7-exif \
        php7-tokenizer \
        php7-xmlwriter \
        php7-fileinfo \
        php7-simplexml \
        php7-xmlreader \
        php7-iconv \
        ghostscript \
        ghostscript-dev \
        nano \
        nodejs \
        npm \
        caddy \
        bzip2 \
        git \
        curl \
        fontconfig \
        openssh \
        bash \
        libpng-dev \
        ffmpeg \
        yarn \
        imagemagick \
        ghostscript-fonts \
        jpegoptim \
        optipng \
        pngquant \
        gifsicle \
        shadow \
        composer@community \
        caddy \
        rsync && \
    ln -sf /usr/bin/php7 /usr/bin/php && \
    mkdir -p /usr/share && \
    cd /usr/share && \
    if [ "$INSTALL_PHANTOMJS" = "0" ] ; then \
    echo "Skipping install of PhantomJs" ; else \ 
    curl -L https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar xj && \
    ln -s /usr/share/phantomjs/phantomjs /usr/bin/phantomjs && \
    ln -s /usr/share/phantomjs/phantomjs /usr/local/bin/phantomjs && \
    phantomjs --version ; fi && \
    cd /tmp && \
    composer selfupdate && \
    usermod -u ${UID} caddy && \
    groupmod -g ${GID} caddy && \
    mkdir /var/www-upload && \
    chmod 777 /var/www-upload && \
    mkdir -p /tmp/tmp && \
    touch /tmp/tmp.tmp && \
    rm -rf /var/cache/apk/*

ENV ENABLE_CRON=1 \
    ENABLE_HORIZON=0 \
    ENABLE_CADDY=1 \
    ENABLE_FPM=1 \
    ENABLE_LOGS=1 \
    ENABLE_XDEBUG=0 \
    STARTUP_MIGRATE=1 \
    STARTUP_CONFIG_CACHE=1 \
    STARTUP_ROUTE_CACHE=1 \
    STARTUP_OPTIMIZE=0 \
    PHP_MAX_CHILDREN=2 \
    DEVELOPMENT_WEBSERVER=0 \
    DEVELOPMENT_WEBSERVER_NO_SSL=0 \
    XDEBUG_IDE_KEY=PHPSTORM \
    XDEBUG_REMOTE_HOST=docker.for.mac.localhost \
    PHP_SERVER_NAME=docker


COPY root/ /

WORKDIR /var/www

EXPOSE 80
EXPOSE 443
