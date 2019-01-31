#! /bin/bash

if [[ -z "${DISPLAY}" ]]; then
  DISPLAY=:4721
fi

if [[ -z "${PULSE_SERVER}" ]]; then
  PULSE_SERVER=localhost:4721
fi

if [[ -z "${INITIAL_USERNAME}" ]]; then
  INITIAL_USERNAME="user"
fi

# keep creating twm processes until empty variable is set
until [[ ! -z $TWM_IN_PS ]]
do 
	twm & echo $! > /tmp/xsdl.pidfile
	# wait x seconds
	ps > /tmp/proc1.txt 
	sleep 5

	# assign variable to result of grep ps twm
	TWM_IN_PS = ps -c | grep "twm"
done
# end loop

ps > /tmp/proc2.txt 
su $INITIAL_USERNAME -c 'xterm -geometry 80x24+0+0 -e /bin/bash --login &'
ps > /tmp/proc3.txt 
