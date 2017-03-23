FROM alpine

MAINTAINER Popov Gennadiy <me@westtrade.tk>

RUN apk update && \
	apk add --update git wget tar make gcc alpine-sdk \
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

COPY autoexec-sample.cfg config/autoexec.cfg
COPY storage-sample.cfg storage.cfg

RUN mkdir ./data

EXPOSE 8303 8303/tcp 8303/udp

CMD ["teeworlds_srv", "-f", "./config/autoexec.cfg"]
