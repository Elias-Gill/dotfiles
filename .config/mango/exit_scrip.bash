#!/bin/bash

# Custom Rofi power menu
options="🔒\tLock\n🚪\tExit\n🌙\tSuspend\n🛌\tHibernate\n⏻\tShutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    *Lock)
        swaylock -l blur
        ;;
    *Hibernate)
        systemctl hibernate
        ;;
    *Suspend)
        systemctl suspend
        ;;
    *Exit)
        killall mango
        ;;
    *Shutdown)
        systemctl poweroff
        ;;
esac
