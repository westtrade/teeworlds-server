# Docker tiny (Alpine based) image of Teeworlds server

[![](https://images.microbadger.com/badges/image/westtrade/teeworlds-server.svg)](https://microbadger.com/images/westtrade/teeworlds-server "Get your own image badge on microbadger.com")

It is a tiny and simple docker image of Teeworlds server, based on Alpine linux.

![Start Teeworlds server](/assets/install.gif)

Run server with default configuration:

```bash

$ docker run -d -p 8303:8303/udp westtrade/teeworlds-server

```

Runned server with default configuration appear on your LAN as Teeworlds Server
on port 8303. The default password for remote console access is **rconadmin**.
ls

You can start server image with custom configuration and logs access by adding a volume

```bash

$ docker run -d -p 8303:8303/udp -v `pwd`/conf:/opt/teeworlds/exposed westtrade/teeworlds-server

```

Full list of server configuration options you can find at [https://www.teeworlds.com/?page=docs&wiki=server_settings](https://www.teeworlds.com/?page=docs&wiki=server_settings)

Or you can start with docker-compose

```bash
curl https://raw.githubusercontent.com/westtrade/docker-teeworlds-server/master/docker-compose.yml > docker-compose.yml
docker-compose up -d
```
