# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:latest
MAINTAINER Albert Domenech (adomenech@gmail.com)

RUN \
  apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates software-properties-common \
    python-django-tagging python-simplejson \
    python-memcache python-ldap python-cairo \
    python-pysqlite2 python-support python-pip \
    gunicorn nginx-light nodejs git curl \
    openjdk-7-jre build-essential python-dev \
    adduser libfontconfig

WORKDIR /opt
RUN \
  curl -s -o /opt/grafana_latest_amd64.deb https://grafanarel.s3.amazonaws.com/builds/grafana_latest_amd64.deb && \
  curl -s -o /opt/influxdb_latest_amd64.deb http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb && \
  dpkg -i grafana_latest_amd64.deb && \
  dpkg -i influxdb_latest_amd64.deb && \
  echo "influxdb soft nofile unlimited" >> /etc/security/limits.conf && \
  echo "influxdb hard nofile unlimited" >> /etc/security/limits.conf

ADD config/grafana/config.js /etc/grafana/config.js
ADD config/nginx/nginx.conf /etc/nginx/nginx.conf
#ADD types.db /opt/influxdb/current/types.db
ADD config/influxdb/config.toml /etc/influxdb/current/config.toml

VOLUME ["/opt/influxdb/shared/data"]

RUN mkdir /etc/service/influxdb
ADD init/influxdb.sh /etc/service/influxdb/run

RUN mkdir /etc/service/grafana
ADD init/grafana.sh /etc/service/grafana/run

RUN mkdir /etc/service/nginx
ADD init/nginx.sh /etc/service/nginx/run


#RUN \
#	which influxdb && \
#	which grafana-server

EXPOSE 80 8083 8086 8096

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]