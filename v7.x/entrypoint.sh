#/usr/bin/env sh

set -e
EXPOSED_PATH='/opt/teeworlds/exposed'

mkdir -p $EXPOSED_PATH

if [ ! -f "$EXPOSED_PATH/server.log" ]; then
	touch $EXPOSED_PATH/server.log
fi

if [ ! -f "$EXPOSED_PATH/server.cfg" ]; then
	TEEWORLDS_SERVER_NAME='Teeworlds [dckr-'$(pwgen)']'
	cp ./server-sample.cfg $EXPOSED_PATH/server.cfg
	echo 'sv_name ' $TEEWORLDS_SERVER_NAME >> $EXPOSED_PATH/server.cfg
	echo $TEEWORLDS_SERVER_NAME' server started!'
fi

exec teeworlds_srv -f $EXPOSED_PATH/server.cfg
