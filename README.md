# Docker tiny (Alpine based) image of Teeworlds server

[![](https://images.microbadger.com/badges/image/westtrade/teeworlds-server.svg)](https://microbadger.com/images/westtrade/teeworlds-server "Get your own image badge on microbadger.com")

It is a tiny and simple docker image of Teeworlds server, based on Alpine linux.

Run server with default configuration:

```bash

$ docker run -d -p 8303:8303/udp westtrade/teeworlds-server

```

Runned server with default configuration appear on your LAN as Teeworlds Server on port 8303. Default password of server is **teeworlds**. The default password for remote console access is **rconadmin**. 


You can start server image with custom configuration and logs access by adding a volume

```bash

$ docker run -d -p 8303:8303/udp westtrade/teeworlds-server \
 -v ./my-teeworlds-conf:/opt/teeworlds/exposed

```

Full list of server configuration options you can find at [https://www.teeworlds.com/?page=docs&wiki=server_settings](https://www.teeworlds.com/?page=docs&wiki=server_settings)

Or you can start with docker-compose

```bash

```

