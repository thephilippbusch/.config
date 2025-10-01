#!/bin/sh

sketchybar --add item toggl e \
           --set toggl icon.color=$ACCENT_COLOR \
                       icon=󰄉 \
                       label.max_chars=20 \
                       label.color=$ACCENT_COLOR \
                       scroll_texts=on \
                       background.drawing=off \
                       update_freq=10 \
                       updates=on \
                       drawing=off \
                       script="$PLUGIN_DIR/toggl.sh" \
                       click_script="open -a 'Toggl Track'"
