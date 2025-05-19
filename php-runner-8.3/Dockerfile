FROM ghcr.io/laveracloudsolutions/php:8.3.13-apache-bookworm

RUN apt-get update  && \
    apt-get dist-upgrade -y && \
    apt-get install -qy \
    net-tools=2.* \
    ca-certificates=* \
    vim=2:9.* \
    dnsutils=1:9.18.33-1~deb12u2 \
    iputils-ping=3:* \
    git=1:2.39.5-0+deb12u2 \
    gnupg=2.* \
    libicu-dev=72.* \
    libzip-dev=1.* \
    libpq-dev=15.* \
    libxml2-dev=2.* \
    xfonts-75dpi=1:1.* \
    xfonts-base=1:1.* \
    fontconfig=2.* \
    libfreetype6=2.* \
    libjpeg62-turbo=1:2.* \
    libpng16-16=1.* \
    libxrender1=1:0* \
    unzip=6.* \
    zip=3.* \
    zlib1g-dev=1:1.* \
    xvfb=2:21.* \
    libapache2-mod-security2=2.* \
    curl=7.* \
    linux-libc-dev=6.* \
    expat=2.5.* \
    libgrpc++-dev=1.*

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#PHP Extensions
RUN docker-php-ext-configure zip && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install -j"$(nproc)" intl pgsql pdo pdo_pgsql opcache zip

RUN pecl install opentelemetry protobuf && docker-php-ext-enable opentelemetry protobuf

# Install GRPC
# PECL installation is far too long, so install manually
# @see https://stackoverflow.com/a/78683184
RUN git clone --depth 1 -b v1.51.x https://github.com/grpc/grpc /tmp/grpc \
    && cd /tmp/grpc/src/php/ext/grpc \
    && phpize && ./configure && make && make install \
    && rm -rf /tmp/grpc

RUN docker-php-ext-enable grpc

# Enable apache modules
RUN a2enmod headers
RUN a2enmod rewrite remoteip security2

# Set timezone to Paris
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

EXPOSE 8080
WORKDIR /var/www/html

# Copy config
COPY ./config/php/php.ini /usr/local/etc/php/php.ini
COPY ./config/apache/VirtualHost.conf /etc/apache2/sites-available/000-default.conf
COPY ./config/apache/apache2.conf /etc/apache2/apache2.conf
COPY ./config/apache/ports.conf /etc/apache2/ports.conf
COPY ./config/apache/mods-enabled/deflate.conf /etc/apache2/mods-enabled/deflate.conf
