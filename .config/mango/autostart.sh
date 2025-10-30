waybar -c ~/.config/mango/config.jsonc -s ~/.config/mango/style.css >/dev/null 2>&1 &
nm-applet >/dev/null 2>&1 &
blueman-applet >/dev/null 2>&1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null 2>&1 &
mako >/dev/null 2>&1 &
swaybg -i $(cat ~/.config/swaybg) >/dev/null 2>&1 &
