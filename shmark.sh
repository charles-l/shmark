#!/bin/sh
#Super minimal bookmarking
export MARKS="`[ -f $HOME/.shmarks ] && cat $HOME/.shmarks | tr '\n' ' '`"
_mark_completion() {
  if [[ -n "$BASH" ]]; then
    complete -W "$(for i in $MARKS ; do echo -n "${i%%:*} " ; done)" g
  fi
}
_mark() {
    MARKS="$MARKS $1:`pwd` "
}
_get_mark() {
    for i in $MARKS; do
        M=${i%%:*}
        P=${i#*:}
        [[ $1 = $M ]] && echo $P && return 0
    done
    return 1
}
_list_marks(){
    for i in $MARKS; do
        echo ${i%%:*} ${i#*:}
    done
}
_remove_mark() {
    MARKS=`echo $MARKS | sed "s|$1:.*||g"`
}
m() {
    if [[ -z "$1" ]]; then
        _list_marks | column -t
    else
        _m=`_get_mark $1`
        if [[ $? == 0 ]]; then
            echo "Remarking"
            _remove_mark $1
            _mark $1
        else
            _mark $1
        fi
    fi
    _mark_completion
}
g() {
    if [[ -z "$1" ]]; then
        _list_marks | column -t
    else
        _m=`_get_mark $(echo "$1" | cut -d '/' -f1)`
        if [[ $? == 0 ]]; then
            if [[ "$1" == *"/"* ]]; then
                cd "$_m/`echo "$1" | cut -d'/' -f2-`"
            else
                cd "$_m"
            fi
        else
            echo "Mark not set."
        fi
    fi
}
savemarks() {
    echo "$MARKS" | tr ' ' '\n' > $HOME/.shmarks
}
_mark_completion
