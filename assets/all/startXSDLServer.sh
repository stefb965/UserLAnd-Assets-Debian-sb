#! /bin/bash

if [[ -z "${DISPLAY}" ]]; then
  DISPLAY=:4721
fi

if [[ -z "${PULSE_SERVER}" ]]; then
  PULSE_SERVER=localhost:4721
fi

if [[ -z "${INITIAL_USERNAME}" ]]; then
  INITIAL_USERNAME="luongt"
fi

until env DISPLAY=:4721 ; do sleep 1 ; done

twm & 
ps > /tmp/proc1.txt 
xterm -geometry 1x1+0+0 & echo $! > /tmp/xsdl.pidfile
ps > /tmp/proc2.txt 
su $INITIAL_USERNAME -c 'xterm -geometry 80x24+0+0 -e /bin/bash --login &'
ps > /tmp/proc3.txt 
