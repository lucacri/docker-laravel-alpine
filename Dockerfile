FROM lucacri/alpine-base:3.7.0

MAINTAINER "Luca Critelli" <lucacri@gmail.com>

ARG UID=501
ARG GID=501


RUN apk --no-cache add \
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
php7-common  \
php7-fpm \
php7-bcmath \
php7-zip \
php7-bz2 \
php7-curl \
php7-gd \
php7-intl \
php7-mcrypt \
php7-sqlite3 \
php7-ctype \
php7-tidy \
php7-pgsql \
php7-xml \
php7-mbstring \
php7-session \
php7-zlib \
php7-tokenizer \
php7-xmlwriter \
php7-simplexml \
php7-opcache \
nano \
nodejs \
caddy \
bzip2 \
git \
curl \
fontconfig \
openssh \
bash && \
ln -sf /usr/bin/php7 /usr/bin/php && \
cd /tmp && \
curl -L https://getcomposer.org/installer | php -- --quiet && \
mv /tmp/composer.phar /usr/local/bin/composer && \
chmod 777 /usr/local/bin/composer && \
deluser caddy && \
addgroup -g ${GID} caddy && \
adduser -u ${UID} -h /var/www -H -G caddy -s /sbin/nologin -D caddy && \
curl "https://caddyserver.com/download/linux/amd64?plugins=http.cache,http.cors,http.expires,http.forwardproxy,http.ipfilter,http.realip,http.upload&license=" \
    | tar --no-same-owner -C /usr/sbin/ -xz caddy

ENV ENABLE_CRON=1 \
ENABLE_HORIZON=0 \
ENABLE_CADDY=1 \
ENABLE_FPM=1 \
ENABLE_LOGS=1 \
STARTUP_MIGRATE=1 \
STARTUP_CONFIG_CACHE=1 \
STARTUP_ROUTE_CACHE=1 \
STARTUP_OPTIMIZE=1 \
DEVELOPMENT_WEBSERVER=0

COPY root/ /
