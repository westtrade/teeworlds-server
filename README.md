# Docker Alpine image with Teeworlds server

It is a tiny and simple docker image for Teeworlds server, based on Alpine linux.

To run the server:

```bash
$ docker run -d -p 8303:8303/udp westtrade/docker-teeworlds-alpine 
```

You can start image with server configuration and logs access by adding a volume
```bash
$ docker run -d -p 8303:8303/udp westtrade/docker-teeworlds-alpine \
 -v ./my-teeworlds-conf:/opt/teeworlds/data
```

All server configuration settings you can find [https://www.teeworlds.com/?page=docs&wiki=server_settings](https://www.teeworlds.com/?page=docs&wiki=server_settings)

