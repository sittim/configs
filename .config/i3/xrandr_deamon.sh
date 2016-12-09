#!/bin/bash

onConnection() {
    echo onConnection
    xrandr --output eDP1 --auto
    xrandr --output DP1 --off
}
onDisconnection() {
    echo onDisconnection
    xrandr --output eDP1 --off
    xrandr --output DP1 --auto
}

#########################

statefile="`mktemp`"

quit() {
    rm "$statefile"
    exit 1
}
trap quit SIGINT SIGTERM

getstate() {
    state="`xrandr -q | wc -l`"
}
savestate() {
    echo "$state" > "$statefile"
}
getstate
savestate

xev -root -event randr | grep --line-buffered XRROutputChangeNotifyEvent | \
while IFS= read -r line; do
    getstate
    old="`cat "$statefile"`"
    if [ "$state" -gt "$old" ]; then
        onConnection
    elif [ "$state" -lt "$old" ]; then
        onDisconnection
    fi
    savestate
done
