#!/bin/bash

function startup {
    printf '\e[?1049h'  # save user's current terminal (XTerm specific)
    printf '\e[?25l'    # hide cursor
    printf '\e[?7l'     # disable line wrap
    stty -echo          # hide user input
    clear
    play -q audio.opus repeat 9999999 </dev/null &>/dev/null & # play audio
}
function wrapup {
    clear
    printf '\e[?25h'    # show cursor
    printf '\e[?7h'     # enable line wrap
    stty echo           # show user input
    printf '\e[?1049l'  # restore user's terminal (if successfully saved previously)
    printf '\e[A'       # move cursor up one line
}
trap wrapup EXIT;


function drawBar {
    printf '\e[2;58H'   # move cursor to line 2, col 58
    echo "You have been blessed with $spins spins of the rat."
}
function drawArt {
    printf '\e[3H'      # move cursor to line 3
    cat $index.txt
}

function fixDamage {
    clear
    drawBar
    drawArt
}
trap fixDamage WINCH    # activate on window resize

startup
spins=0
while true; do
    drawBar
    index=1
    while [ $index -le 31 ]; do
        drawArt
        index=$((index+1))
        sleep 0.1
    done
    spins=$(($spins+1));
done
