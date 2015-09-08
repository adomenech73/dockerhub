# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:latest
MAINTAINER Albert Domenech (adomenech@gmail.com)

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION v0.12.6
#ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR:$PATH
# ...put your own build instructions here...
RUN \
	apt-get update && \
	apt-get install -y wget build-essential libssl-dev && \
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash && \	
	rm /bin/sh && ln -s /bin/bash /bin/sh && \
	. $NVM_DIR/nvm.sh && \
	nvm install $NODE_VERSION && \
	echo prefix=`dirname $NVM_BIN` > ~/.npmrc

EXPOSE 3000

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT  ["node"]
# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]