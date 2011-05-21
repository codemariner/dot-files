#!/bin/bash

# simple script that will execute a given command and kill the process if
# the specified time out is reached.
#
# timeout 120 some_command to execute


if [ $# -lt 2 ]; then
    echo "usage: $0 timeout command" && exit 1
fi


# my pid
export PID=$$

TIMEOUT=$1; shift;
export TIMEOUT

# execute the rest of the arguments as a command
$@ &
CMDPID=$!
export CMDPID



exit_timeout() {
    # use ps to find the process
    ps -p $CMDPID | grep -v "PID TTY"
    # if the ps command was successful, then we found the process by pid
    # so kill it
    if [ $? == 0 ]; then
        echo "Sending SIGTERM to process $CMDPID"
        kill $CMDPID

        # wait for it to die off
        # TODO: this should be configurable
        sleep 5
        ps -p $CMDPID | grep -v "PID TTY"
        if [ $? == 0 ]; then
            echo "Process did not die gracefully.  Forcing it to die..."
            kill -9 $CMDPID
        fi
    fi 
    exit
}


# Handler for signal USR1 for the timer
trap exit_timeout SIGUSR1


# starting timer then send a SIGUSR1 to the father if it timeouts
(sleep $TIMEOUT ; kill -SIGUSR1 $PID) &

# record PID of timer
TPID=$!
echo "timer pid $TPID"


# wait for all production processes to finish
wait $CMDPID

# Normal exit
echo "All processes ended normal"

# kill timer
kill $TPID
