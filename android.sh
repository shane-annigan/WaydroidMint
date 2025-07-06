#!/bin/bash 

echo "lancement de weston"
weston --width=1920 --height=1080 & 
echo "weston lancé"
 
for i in {1..20}; do
    SOCKET=$(ls -t /run/user/$(id -u)/wayland-* 2>/dev/null | head -n1)
    if [ -n "$SOCKET" ]; then
        break
    fi
    sleep 0.5
    echo "attente de wayland"
done
 
sleep 1
echo "session wayland trouvée"
 

export WAYLAND_DISPLAY=$(basename "$SOCKET" )
echo "session wayland exportée : $WAYLAND_DISPLAY"
 

waydroid session stop
waydroid session start &
waydroid show-full-ui
