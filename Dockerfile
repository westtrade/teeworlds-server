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
	

RUN apk update && \
	apk add --virtual .build-dependencies --no-cache --update git wget tar make gcc alpine-sdk \
	curl readline readline-dev freetype-dev sdl2 sdl2-dev \
	freeglut freeglut-dev glew-dev glm-dev \
	build-base python-dev

RUN cd /tmp && \
	curl -R -O http://www.lua.org/ftp/lua-5.3.3.tar.gz && \
	tar zxf lua-5.3.3.tar.gz && \
	cd lua-5.3.3 && \
	make linux && \
	make install

RUN cd /tmp && \
	wget https://github.com/matricks/bam/archive/v0.5.0.tar.gz && \
	tar -zxvf v0.5.0.tar.gz && \
	cd bam-0.5.0 && ./make_unix.sh && \
	ln -s "$PWD/bam" /usr/bin

WORKDIR /opt/teeworlds

RUN git clone https://github.com/teeworlds/teeworlds ./src && \
	git clone https://github.com/teeworlds/teeworlds-maps ./maps

RUN cd ./src && bam config && bam && ln -s "$PWD/build/x86_64/debug/teeworlds_srv" /usr/bin

RUN rm -rvf /tmp/*


COPY server-sample.cfg ./server-sample.cfg
COPY storage-sample.cfg storage.cfg
COPY entrypoint.sh ./entrypoint.sh

RUN mkdir ./data

EXPOSE 8303/udp

ENTRYPOINT ./entrypoint.sh
