#!/bin/bash
tail -n 0 -F /tmp/claude.log | while read -r window event; do
    case "$event" in
        "notification")
            kitty @ set-tab-color "--match=id:$window" inactive_bg=\#902020 inactive_fg=black active_bg=\#ff0000 active_fg=black
            ;;
        "permission")
            kitty @ set-tab-color "--match=id:$window" inactive_bg=\#917023 inactive_fg=black active_bg=\#ffc53c active_fg=black
            ;;
        "stop")
            kitty @ set-tab-color "--match=id:$window" inactive_bg=\#6d8731 inactive_fg=black active_bg=\#c2f252 active_fg=black
            ;;
        "clear")
            kitty @ set-tab-color "--match=id:$window" inactive_bg=NONE inactive_fg=NONE active_bg=NONE
            ;;
    esac
done
