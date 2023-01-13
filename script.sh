#!/bin/bash

trap ctrl_c INT

ctrl_c () {
        rm *.txt
        rm *.sh
        kill $pid
        exit 0
}

spins=0
play audio.opus repeat 9999 </dev/null &>/dev/null &
pid=$!
clear
while true
do
i=1
while [ $i -ne 31 ]
        do
                echo
                echo "                                                          You have been blessed with $spins spins of the rat."
                i=$(($i+1))
                cat $i.txt
                sleep 0.1
                clear
        done
spins=$(($spins+1))
done
