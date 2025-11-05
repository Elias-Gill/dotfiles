# monitores
bash ~/.config/mango/auto_monitor.sh
# bar
waybar -c ~/.config/mango/config.jsonc -s ~/.config/mango/style.css >/dev/null 2>&1 &
# systray
nm-applet >/dev/null 2>&1 &
blueman-applet >/dev/null 2>&1 &
# cosito de contrasenas
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null 2>&1 &
# notificaciones
swaync &
# fondo de pantalla
swaybg -i $(cat ~/.config/swaybg) >/dev/null 2>&1 &
