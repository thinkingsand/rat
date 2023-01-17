#!/bin/bash

function startup {
    printf '\e[?25l'    # hide cursor
    printf '\e[?7l'     # disable line wrap
    clear
    play -q audio.opus repeat 9999999 </dev/null &>/dev/null & # loop audio playback basically forever
    pid=!
}

function wrapup {
    printf '\e[?25h'    # show cursor
    printf '\e[?7h'     # enable line wrap
    clear
    kill $pid
}
trap wrapup EXIT;

startup
spins=0
while true
do
    printf '\e[2H'      # move cursor to line 2
    echo "                                                          You have been blessed with $spins spins of the rat."
    i=1
    while [ $i -le 31 ]
    do
        cat $i.txt
        i=$((i+1));
        printf '\e[3H'  # move cursor to line 3
        sleep 0.1
    done
    spins=$(($spins+1));
done
