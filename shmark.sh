#!/bin/sh
#Super minimal bookmarking
export MARKS=""
_mark() {
    MARKS="$MARKS $1:`pwd`"
}
_get_mark() {
    for i in $MARKS; do
        M=${i%%:*}
        P=${i#*:}
        [ $1 = $M ] && echo $P && return 0
    done
    return 1
}
m() {
    _m=`_get_mark $1`
    if [ $? == 0 ]; then
        cd $_m
    else
        _mark $1
    fi
}
