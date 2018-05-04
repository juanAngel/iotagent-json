###
# Copyright (c) Mainflux
#
# This file is part of iotagent-json and is published under GNU Affero General Public License
# See the included LICENSE file for more details.
###

FROM mhart/alpine-node:8

#ARG NODEJS_VERSION=4.8.4

RUN apk add --no-cache git

#RUN curl -s --fail http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz -o /tmp/node-v${NODEJS_VERSION}-linux-x64.tar.gz && \
#	tar zxf /tmp/node-v${NODEJS_VERSION}-linux-x64.tar.gz  -C /tmp && \
#	cd /tmp/node-v${NODEJS_VERSION}-linux-x64 && \
#	rm *.md LICENSE && \
#	rsync --links -r * /usr && \
#	ls -lh /usr/bin/node
	
COPY . /opt/iotajson/
WORKDIR /opt/iotajson

RUN npm install --production
  
EXPOSE 4041

ENTRYPOINT bin/iotagent-json config.js

 
