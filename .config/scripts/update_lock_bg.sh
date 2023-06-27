#!/bin/bash
# revisar que nitrogen ya se cierra
while [[ $(xdotool search --class nitrogen) || $(xdotool search --class walldo) || $(xdotool search --class sxiv) ]]; do
    sleep 3
done

image=""
if [[ "$1" == "--walldo" ]]; then
    # walldo
    image=`fgrep "/home/elias/" ~/.fehbg | sed "s/feh --no-fehbg --bg-fill //"`
    image=${image#?}
    image=${image%?}
    image=${image%?}
else
    # nitrogen
    image=`fgrep "/home/elias/" ~/.config/nitrogen/bg-saved.cfg | sed "s/file=//"`
fi

betterlockscreen -u $image
# echo $image
