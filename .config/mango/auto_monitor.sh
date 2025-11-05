#!/usr/bin/env bash
# auto_monitors_simple.sh
# Activa HDMI si está conectado, de lo contrario usa eDP.

set -euo pipefail

HDMI="HDMI-A-1"
INTERNAL="eDP-1"
HDMI_STATUS="/sys/class/drm/card1-${HDMI}/status"

command -v wlr-randr >/dev/null || { echo "wlr-randr no encontrado."; exit 1; }

apply_hdmi() {
    # No hace falta prender y configurar el hdmi, eso ya lo hace mango, solo necesito apagar el
    # monitor interno
    wlr-randr --output "$INTERNAL" --off
}

apply_internal() {
    wlr-randr --output "$INTERNAL" --on
}

LAST="disconnected"
while true; do
    STATUS=$(cat "$HDMI_STATUS" 2>/dev/null || echo "disconnected")
    if [[ "$STATUS" != "$LAST" ]]; then
        if [[ "$STATUS" == "connected" ]]; then
            apply_hdmi
        else
            apply_internal
        fi
        LAST="$STATUS"
    fi
    sleep 3
done
