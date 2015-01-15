#!/bin/sh
#Super minimal bookmarking
export MARKS="`[ -f $HOME/.shmarks ] && cat $HOME/.shmarks`"
_mark() {
    MARKS="$MARKS $1:`pwd` "
}
_get_mark() {
    for i in $MARKS; do
        M=${i%%:*}
        P=${i#*:}
        [ $1 = $M ] && echo $P && return 0
    done
    return 1
}
_remove_mark() {
    MARKS=`echo $MARKS | sed "s|$1:.*||g"`
}
m() {
    _m=`_get_mark $1`
    if [ $? == 0 ]; then
        echo "Remarking"
        _remove_mark $1
        _mark $1
    else
        _mark $1
    fi
}
g() {
    _m=`_get_mark $1`
    if [ $? == 0 ]; then
        cd "$_m"
    else
        echo "Mark not set."
    fi
}
savemarks() {
    echo "$MARKS" > $HOME/.shmarks
}
