#!/bin/sh

spins=0
play -q audio.opus repeat 9999 </dev/null &>/dev/null &
clear
while true
do
i=1
while [ $i -le 30 ]
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
