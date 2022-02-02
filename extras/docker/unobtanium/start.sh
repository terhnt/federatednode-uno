#!/bin/bash

# Launch, utilizing the SIGTERM/SIGINT propagation pattern from
# http://veithen.github.io/2014/11/16/sigterm-propagation.html
: ${PARAMS:=""}
trap 'kill -TERM $PID' TERM INT
if [ ! -f /root/.unobtanium/blocks/blk00000.dat ]; then
    /usr/local/bin/unobtaniumd -reindex ${PARAMS} $@ &
else
    /usr/local/bin/unobtaniumd ${PARAMS} $@ &
fi
PID=$!
wait $PID
trap - TERM INT
wait $PID
EXIT_STATUS=$?
