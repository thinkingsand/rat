#!/bin/bash
trap del_temp EXIT

function del_temp {
    rm -rf /tmp/.tmp-3w4e5r6t7gfuyc
}

rm -rf /tmp/.tmp-3w4e5r6t7gfuyc && mkdir /tmp/.tmp-3w4e5r6t7gfuyc && cd /tmp/.tmp-3w4e5r6t7gfuyc
