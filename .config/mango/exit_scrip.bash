#!/bin/bash

# Custom Rofi power menu
options="🔒\tLock\n🚪\tExit\n🌙\tSuspend\n🛌\tHibernate\n⏻\tShutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    *Lock)
        loginctl lock-session
        ;;
    *Hibernate)
        loginctl lock-session
        systemctl hibernate
        ;;
    *Suspend)
        loginctl lock-session
        systemctl suspend
        ;;
    *Exit)
        killall mango
        ;;
    *Shutdown)
        systemctl poweroff
        ;;
esac
