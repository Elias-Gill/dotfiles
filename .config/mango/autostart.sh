# monitores
bash ~/.config/mango/auto_monitor.sh &
# systray
nm-applet >/dev/null 2>&1 &
blueman-applet >/dev/null 2>&1 &
# cosito de contrasenas
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null 2>&1 &
# notificaciones
swaync &
# Autosuspend y demas
swayidle -w \
    timeout 600 'swaylock --image "$(cat ~/.config/swaybg)"' \
    timeout 900 'systemctl suspend' \
    timeout 3600 'systemctl hibernate' \
    before-sleep 'swaylock --image "$(cat ~/.config/swaybg)"' &
# bar
waybar -c ~/.config/mango/config.jsonc -s ~/.config/mango/style.css >/dev/null 2>&1 &
# fondo de pantalla
swaybg -i $(cat ~/.config/swaybg) >/dev/null 2>&1 &
