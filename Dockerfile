FROM debian:jessie

RUN apt-get autoremove --purge -y php5*
RUN apt-get update && apt-get install -y wget
RUN echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list
RUN wget -O- https://www.dotdeb.org/dotdeb.gpg | apt-key add -
RUN apt-get update && apt-get install -y php7.0 php7.0-dev php7.0-fpm php7.0-mysql php7.0-curl php7.0-json php7.0-gd php7.0-mcrypt php7.0-opcache  apache2 libapache2-mod-php7.0
RUN wget -O xdebug-2.4.0rc4.tgz  https://xdebug.org/files/xdebug-2.4.0rc4.tgz 
RUN tar -xvzf xdebug-2.4.0rc4.tgz
RUN cd xdebug-2.4.0RC4 && phpize && ./configure && make && cp modules/xdebug.so /usr/lib/php/20151012
RUN rm -r xdebug-2.4.0RC4 && rm xdebug-2.4.0rc4.tgz
RUN echo "zend_extension = /usr/lib/php/20151012/xdebug.so" >> /etc/php/7.0/cli/php.ini
RUN echo "zend_extension = /usr/lib/php/20151012/xdebug.so" >> /etc/php/7.0/apache2/php.ini
COPY 000-default.conf /etc/apache2/sites-available/
COPY 20-xdebug.ini /etc/php/7.0/apache2/conf.d/
RUN usermod -u 1000 www-data
RUN a2enmod rewrite

COPY apache2-foreground /usr/local/bin/

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80
CMD ["apache2-foreground"]
