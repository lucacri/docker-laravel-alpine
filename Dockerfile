FROM lucacri/alpine-base:3.7.0

MAINTAINER "Luca Critelli" <lucacri@gmail.com>

ARG UID=501
ARG GID=501



RUN apk --no-cache add curl && \
    curl https://php.codecasts.rocks/php-alpine.rsa.pub -o /etc/apk/keys/php-alpine.rsa.pub && \
    apk --no-cache --update add ca-certificates && \
    echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories && \
    apk --no-cache add \
        php7@php \
        php7-phar@php \
        php7-json@php \
        php7-openssl@php \
        php7-dom@php \
        php7-mysqlnd@php \
        php7-mysqli@php \
        php7-posix@php \
        php7-pcntl@php \
        php7-pdo@php \
        php7-pdo_pgsql@php \
        php7-pdo_sqlite@php \
        php7-pdo_mysql@php \
        php7-common@php \
        php7-fpm@php \
        php7-bcmath@php \
        php7-zip@php \
        php7-bz2@php \
        php7-curl@php \
        php7-gd@php \
        php7-intl@php \
        php7-sqlite3@php \
        php7-ctype@php \
        php7-tidy@php \
        php7-pgsql@php \
        php7-xml@php \
        php7-mbstring@php \
        php7-session@php \
        php7-zlib@php \
        php7-opcache@php \
        php7-soap@php \
        php7-imagick@php \
        php7-exif@php \
        ghostscript \
        ghostscript-dev \
        nano \
        nodejs \
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
        rsync && \
    ln -sf /usr/bin/php7 /usr/bin/php && \
    mkdir -p /usr/share && \
    cd /usr/share && \
    curl -L https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar xj && \
    ln -s /usr/share/phantomjs/phantomjs /usr/bin/phantomjs && \
    ln -s /usr/share/phantomjs/phantomjs /usr/local/bin/phantomjs && \
    phantomjs --version && \
    cd /tmp && \
    curl -L https://getcomposer.org/installer | php -- --quiet && \
    mv /tmp/composer.phar /usr/local/bin/composer && \
    chmod 777 /usr/local/bin/composer && \
    deluser caddy && \
    addgroup -g ${GID} caddy && \
    adduser -u ${UID} -h /var/www -H -G caddy -s /sbin/nologin -D caddy && \
    curl "https://caddyserver.com/download/linux/amd64?plugins=http.cache,http.cors,http.expires,http.forwardproxy,http.ipfilter,http.realip,http.upload&license=" \
        | tar --no-same-owner -C /usr/sbin/ -xz caddy && \
    mkdir /var/www-upload && \
    chmod 777 /var/www-upload && \
    mkdir -p /tmp/tmp && \
    touch /tmp/tmp.tmp

ENV ENABLE_CRON=1 \
    ENABLE_HORIZON=0 \
    ENABLE_CADDY=1 \
    ENABLE_FPM=1 \
    ENABLE_LOGS=1 \
    STARTUP_MIGRATE=1 \
    STARTUP_CONFIG_CACHE=1 \
    STARTUP_ROUTE_CACHE=1 \
    STARTUP_OPTIMIZE=0 \
    DEVELOPMENT_WEBSERVER=0 \
    DEVELOPMENT_WEBSERVER_NO_SSL=0

COPY root/ /

WORKDIR /var/www

EXPOSE 80
EXPOSE 443
