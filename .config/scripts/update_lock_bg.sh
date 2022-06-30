#!/bin/sh
while [[ $(xdotool search --class nitrogen) ]]; do
    sleep 3
done
eval "set -- $(sed 1d ~/.config/nitrogen/bg-saved.cfg | sed 's/file=//')"
betterlockscreen -u $1
