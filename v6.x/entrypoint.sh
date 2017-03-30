#/usr/bin/env sh

set -e
EXPOSED_PATH='/opt/teeworlds/exposed'

mkdir -p $EXPOSED_PATH

if [ ! -f "$EXPOSED_PATH/server.log" ]; then
	touch $EXPOSED_PATH/server.log
fi

if [ ! -f "$EXPOSED_PATH/serverconfig.cfg" ]; then
	cp ./server-sample.cfg $EXPOSED_PATH/server.cfg
fi

exec teeworlds_srv_d -f $EXPOSED_PATH/server.cfg