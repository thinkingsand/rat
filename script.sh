#!/bin/sh

trap ctrl_c INT

ctrl_c () {
        rm *.txt
        rm *.sh
        exit 0
}

clear
while true
do
i=1
while [ $i -ne 31 ]
        do
                i=$(($i+1))
                cat $i.txt
                sleep 0.1
                clear
        done
done
