#!/usr/bin/env bash
set -e

# Ruta base
BL_DIR="/sys/class/backlight/intel_backlight"
CUR=$(cat "$BL_DIR/actual_brightness")
MAX=$(cat "$BL_DIR/max_brightness")

# Ajustar brillo si se pide
case "$1" in
    up)
        brightnessctl set +4% -q
        ;;
    down)
        brightnessctl set 4%- -q
        ;;
esac

# Recalcular después del cambio
CUR=$(cat "$BL_DIR/actual_brightness")
MAX=$(cat "$BL_DIR/max_brightness")
PCT=$(( CUR * 100 / MAX ))

# Elegir ícono según nivel
ICON="brightness-high-symbolic"

notify-send "Brillo: $PCT%" \
    -i "$ICON" \
    -h int:value:"$PCT" \
    -h string:x-canonical-private-synchronous:brightness
