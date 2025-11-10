#!/usr/bin/env bash
set -e

# Obtener datos del sink por única vez
read v mute < <(pactl list sinks | awk '
/Volume:/ && !found { match($0, /([0-9]+)%/, m); vol=m[1]; found=1 }
/Mute:/ { mute=$2 }
END { print vol, mute }')

# Ajustar volumen con límites
case "$1" in
    up)
        if [ "$v" -lt 100 ]; then
            new=$((v + 2))
            [ "$new" -gt 100 ] && new=100
            pactl set-sink-volume @DEFAULT_SINK@ "${new}%"
            v=$new
        fi
        ;;
    down)
        new=$((v - 2))
        [ "$new" -lt 0 ] && new=0
        pactl set-sink-volume @DEFAULT_SINK@ "${new}%"
        v=$new
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
        ;;
esac

# Elegir ícono
if [ "$mute" = "yes" ]; then
    ICON="audio-volume-muted-symbolic"
elif [ "$v" -gt 70 ]; then
    ICON="audio-volume-high-symbolic"
elif [ "$v" -gt 30 ]; then
    ICON="audio-volume-medium-symbolic"
else
    ICON="audio-volume-low-symbolic"
fi

# Notificación
notify-send " Volumen: ${v}%" \
    -i "$ICON" \
    -h int:value:"$v" \
    -h string:x-canonical-private-synchronous:volume \
    -t 1200
