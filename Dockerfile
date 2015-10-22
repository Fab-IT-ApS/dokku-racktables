##############################################################################
# Docker file to build Racktables
# Based on Debian
##############################################################################
FROM debian:latest
MAINTAINER claus@fab-it.dk

# Set the correct locale environment
ENV LC_ALL C

#RUN apt-cache search ruby
# Install necessary packages and clean up afterwards
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -yq \
        php5-common \
        php5-curl \
        php5-mysql \
        mysql-client \
        php5-cli \
        php5-readline \
        php5-snmp \
        php5-gd \
        php5-json \
        php5-fpm \
        snmp \
        libapache2-mod-php5 \
        curl \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install racktables
WORKDIR /tmp
RUN wget -O latest.tgz https://github.com/RackTables/racktables/archive/RackTables-0.20.10.tar.gz
RUN tar -zxf latest.tgz
RUN rm latest.tgz
RUN mv racktables* /app
WORKDIR /app
ADD secret.php wwwroot/inc/secret.php
RUN chown -R www-data:www-data /app

# Configure apache
ADD apache2-racktables.conf /etc/apache2/sites-available/0000racktables.conf
RUN a2dissite 000-default
RUN a2ensite 0000racktables
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
RUN a2enconf fqdn
RUN sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/g' /etc/php5/apache2/php.ini

EXPOSE 80
CMD apache2ctl -D FOREGROUND
