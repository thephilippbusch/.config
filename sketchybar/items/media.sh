#!/bin/bash

sketchybar --add item media q \
           --set media label=􀑪 \
                       label.color=$ACCENT_COLOR \
                       icon.max_chars=20 \
                       icon.color=$ACCENT_COLOR \
                       scroll_texts=on \
                       background.drawing=off \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
