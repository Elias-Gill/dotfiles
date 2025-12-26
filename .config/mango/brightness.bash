#!/usr/bin/env bash
set -e

BL_DIR="/sys/class/backlight/intel_backlight"
CUR=$(cat "$BL_DIR/actual_brightness")
MAX=$(cat "$BL_DIR/max_brightness")

pct=$(( CUR * 100 / MAX ))

step=$(awk -v p="$pct" 'BEGIN {
    if (p < 12) {
        print 1
        exit
    }
    # log amplificado desde 15% para arriba
    # factor de crecimiento alto: 0 a 10
    v = log(1+p) / log(101)
    s = int(1 + v * 10)

    if (s < 2) s = 2
    if (s > 12) s = 10
    print s
}')

case "$1" in
    up)
        brightnessctl set +"${step}"% -q
        ;;
    down)
        brightnessctl set "${step}"%- -q
        ;;
esac

CUR=$(cat "$BL_DIR/actual_brightness")
pct=$(( CUR * 100 / MAX ))
ICON="brightness-high-symbolic"

notify-send "Brillo: $pct%" \
    -i "$ICON" \
    -h int:value:"$pct" \
    -h string:x-canonical-private-synchronous:brightness
