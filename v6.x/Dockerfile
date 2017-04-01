FROM alpine:latest

MAINTAINER Popov Gennadiy <me@westtrade.tk>

ARG BUILD_DATE
ARG VCS_REF

LABEL com.westtrade.build-date=$BUILD_DATE \
	com.westtrade.docker.dockerfile="/Dockerfile" \
	com.westtrade.license="MIT" \
	com.westtrade.name="Teeworlds server, based on Alpine docker image" \
	com.westtrade.vcs-ref=$VCS_REF \
	com.westtrade.vcs-type="Git" \
	com.westtrade.vcs-url="https://github.com/westtrade/docker-teeworlds-server"

WORKDIR /opt/teeworlds

RUN apk update && \
	apk --update add --no-cache --virtual .build-dependencies git wget tar make gcc alpine-sdk \
	curl readline readline-dev freetype-dev sdl sdl-dev \
	freeglut freeglut-dev glew-dev build-base glm-dev \
	python-dev bam && \
 	cd /tmp && \
	curl -R -O http://www.lua.org/ftp/lua-5.3.3.tar.gz && \
	tar zxf lua-5.3.3.tar.gz && \
	cd lua-5.3.3 && \
	make linux && \
	make install && \
	cd /opt/teeworlds && \
	git clone -b 0.6 https://github.com/teeworlds/teeworlds ./src && \
	git clone https://github.com/teeworlds/teeworlds-maps ./maps && \

	cd ./src && bam config && bam && cd ../ && \
	rm -rvf ./src/.git && \
	rm -rvf ./src/src && \
	rm -rvf ./src/docs && \
	rm -rvf ./maps/.git && \
	mv ./src game && \
	ln -s "$PWD/game/teeworlds_srv_d" /usr/bin && \
	rm -rvf /tmp/* && \
	apk del .build-dependencies build-base && \
	apk --update add --no-cache libstdc++

RUN apk add pwgen

COPY ./server-sample.cfg ./server-sample.cfg
COPY ./storage-sample.cfg storage.cfg
COPY ./entrypoint.sh ./entrypoint.sh

RUN mkdir ./data

EXPOSE 8303/udp

ENTRYPOINT ./entrypoint.sh
