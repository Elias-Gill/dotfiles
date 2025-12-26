mmsg -d switch_keyboard_layout
if $(mmsg -g | grep 'kb_layout' | grep us --quiet); then
    notify-send "🇺🇸 Layout:US" -i input-keyboard
else
    notify-send "🇪🇸 Layout: ES" -i input-keyboard
fi
