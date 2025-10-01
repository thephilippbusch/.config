#!/bin/sh

sketchybar -m --add       item               network_up right                \
              --set       network_up         label.font="SF Pro:Heavy:9"     \
                                             icon.font="SF Pro:Heavy:9"      \
                                             icon=                           \
                                             icon.highlight_color=0xff8b0a0d \
                                             width=0                         \
                                             update_freq=2                   \
                                             script="$PLUGIN_DIR/network.sh" \
              --add       item               network_down right              \
              --set       network_down       label.font="SF Pro:Heavy:9"     \
                                             icon.font="SF Pro:Heavy:9"      \
                                             icon=                           \
                                             icon.highlight_color=0xff10528c
