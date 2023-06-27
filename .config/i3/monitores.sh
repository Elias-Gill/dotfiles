#!/usr/bin/env bash

con_monitors=$(echo $(xrandr) | grep -c "HDMI-1 connected")
rep=1
rep2=1

if [[ $con_monitors == 1 ]]; then
    ~/.config/screenlayout/redragon.sh
    rep=0
else
    ~/.config/screenlayout/single.sh
    rep2=0
fi

while [[ 1 ]]; do
    aux=$(echo $(xrandr) | grep -c "HDMI-1 connected")

    if [[ $aux == 1 ]]; then
        # solo correr si es que rep = 1
        if [[ $rep == 1 ]]; then
            ~/.config/screenlayout/redragon.sh
            rep=0
            rep2=1
        fi

    else
        # solo correr una vez
        if [[ $rep2 == 1 ]]; then
            ~/.config/screenlayout/single.sh
            rep=1
            rep2=0
        fi
    fi
    sleep 5
done
