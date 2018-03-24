FROM jsmigel/centos-epel:latest
MAINTAINER pietrovich@users.noreply.github.com

ADD https://getcomposer.org/composer.phar /usr/bin/composer
RUN chmod 775 /usr/bin/composer

RUN yum -y install https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

ADD https://rpm.nodesource.com/setup_9.x /root/setup-nodejs_9.x.sh
RUN chmod 770 /root/setup-nodejs_9.x.sh
RUN [ "/bin/bash", "-c", "/root/setup-nodejs_9.x.sh" ]

RUN yum -y update

RUN yum -y install \
    telnet \
    git \
    bash \
    gcc-c++ \
    make \
    nodejs \
    php71w-cli \
    php71w-fpm \
    php71w-opcache \
    php71w-common \
    php71w-mbstring \
    php71w-mcrypt \
    php71w-mysqlnd \
    php71w-pecl-apcu \
    php71w-pecl-redis \
    php71w-pecl-mongodb \
    php71w-xml \
    php71w-gd \
    php71w-pecl-imagick \
    php71w-phpdbg \
    php71w-pecl-xdebug \
    php71w-devel \
    which \
    psmisc \
    net-tools \
    sudo \
    mc

ADD templates/xdebug.ini /etc/php.d/xdebug.ini
RUN chown root:root /etc/php.d/xdebug.ini
RUN chmod 0644 /etc/php.d/xdebug.ini

RUN npm install -g \
    typescript@^2.7.2 \
    less \
    grunt-cli \
    gulp \
    bower \
    webpack@^2.0 \
    grunt \
    node-gyp

RUN npm install node-sass -g --unsafe-perm

RUN yum -y clean all
RUN rm -rf /var/cache/yum
