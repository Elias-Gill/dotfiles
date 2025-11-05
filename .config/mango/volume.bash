#!/bin/bash
v=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+%' | head -1 | tr -d '%')
if [ "$v" -lt 100 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +2%
fi
