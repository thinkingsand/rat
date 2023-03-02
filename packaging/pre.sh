#!/bin/bash
trap del_temp EXIT

function del_temp {
    rm -rf /tmp/.tmp-3w4e5r6t7gfuyc
}

rm -rf /tmp/.tmp-3w4e5r6t7gfuyc && mkdir /tmp/.tmp-3w4e5r6t7gfuyc && cd /tmp/.tmp-3w4e5r6t7gfuyc

if [ "$1" == "-r" ]; then
    if ! command -v lolcat &> /dev/null
    then
        echo "lolcat could not be found"
        exit
    else
        echo enabling rainbow mode
        RAINBOW_EN=1
    fi
fi

if [ "$1" == "-h" ]; then
  echo "-h, Help"
  echo "-r, Rainbow Rat"
  exit 
fi
