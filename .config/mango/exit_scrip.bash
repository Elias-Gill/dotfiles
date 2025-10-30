#!/bin/bash

# Custom Rofi power menu
options="Hibernate\nSuspend\nExit\nShutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    Hibernate)
        systemctl hibernate
        ;;
    Suspend)
        systemctl suspend
        ;;
    Exit)
        killall mango
        ;;
    Shutdown)
        systemctl poweroff
        ;;
esac
